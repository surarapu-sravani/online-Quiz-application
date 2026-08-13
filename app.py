from flask import Flask, render_template, request, redirect, session, url_for
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = os.environ.get("SECRET_KEY", "dev-secret-key")

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="quiz_db"
    )

@app.route("/")
def home():
    return redirect(url_for("login"))

# ---------------- REGISTER ----------------
@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form["username"]
        email = request.form["email"]
        password = generate_password_hash(request.form["password"])

        db = get_db_connection()
        cursor = db.cursor()
        cursor.execute("SELECT id FROM users WHERE username=%s OR email=%s", (username, email))
        if cursor.fetchone():
            cursor.close()
            db.close()
            return "User already exists"

        cursor.execute(
            "INSERT INTO users (username, email, password) VALUES (%s,%s,%s)",
            (username, email, password)
        )
        db.commit()
        cursor.close()
        db.close()
        return redirect(url_for("login"))

    return render_template("register.html")

# ---------------- LOGIN ----------------
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        db = get_db_connection()
        cursor = db.cursor()
        cursor.execute("SELECT id, password FROM users WHERE username=%s", (username,))
        user = cursor.fetchone()
        cursor.close()
        db.close()

        if user and check_password_hash(user[1], password):
            session["user_id"] = user[0]
            return redirect(url_for("quiz"))

        return "Invalid credentials"

    return render_template("login.html")

# ---------------- LOGOUT ----------------
@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("login"))

# ---------------- QUIZ ----------------
@app.route("/quiz")
def quiz():
    if "user_id" not in session:
        return redirect(url_for("login"))

    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM questions")
    questions = cursor.fetchall()
    cursor.close()
    db.close()

    return render_template("quiz.html", questions=questions)

# ---------------- RESULT ----------------
@app.route("/result", methods=["POST"])
def result():
    if "user_id" not in session:
        return redirect(url_for("login"))

    score = 0
    time_taken = request.form.get("time_taken", 0)

    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute("SELECT * FROM questions")
    questions = cursor.fetchall()

    for q in questions:
        if request.form.get(str(q[0])) == str(q[6]):
            score += 1

    cursor.execute(
        "INSERT INTO results (user_id, score, time_taken) VALUES (%s,%s,%s)",
        (session["user_id"], score, time_taken)
    )
    db.commit()
    cursor.close()
    db.close()

    return render_template("result.html", score=score, time=time_taken)

# ---------------- LEADERBOARD ----------------
@app.route("/leaderboard")
def leaderboard():
    db = get_db_connection()
    cursor = db.cursor()
    cursor.execute("""
        SELECT users.username, results.score, results.time_taken
        FROM results
        JOIN users ON users.id = results.user_id
        ORDER BY score DESC, time_taken ASC
        LIMIT 10
    """)
    data = cursor.fetchall()
    cursor.close()
    db.close()

    return render_template("leaderboard.html", data=data)

if __name__ == "__main__":
    app.run(debug=True, port=8000)
