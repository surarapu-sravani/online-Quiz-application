# Online Quiz System

## 📌 Project Overview

The **Online Quiz System** is a web-based quiz application developed using **Python Flask and MySQL**. It allows users to register, log in, attend an online quiz, receive their score, and view the top performers on a leaderboard.

The application uses Flask for the web application and routing, MySQL for storing user, question, and result data, and password hashing for securely storing user passwords.

---

## ✨ Features

* 👤 User Registration
* 🔐 User Login and Logout
* 🔒 Password Hashing
* 📝 Online Quiz
* ⏱️ Quiz Time Tracking
* 📊 Automatic Score Calculation
* 💾 Result Storage
* 🏆 Top 10 Leaderboard
* 🗄️ MySQL Database Integration
* 🌐 Flask-based Web Application

---

## 🛠️ Technologies Used

* **Python**
* **Flask**
* **MySQL**
* **HTML**
* **CSS**
* **MySQL Connector/Python**
* **XAMPP**

## 🏗️ Application Workflow

```text
User Registration
       ↓
User Login
       ↓
Online Quiz
       ↓
Submit Answers
       ↓
Calculate Score
       ↓
Store Result in Database
       ↓
Display Result
       ↓
Leaderboard

## 📂 Project Structure

```text
online-quiz-system/
│
├── app.py
├── README.md
├── requirements.txt
├── .gitignore
│
├── templates/
│   ├── leaderboard.html
│   ├── login.html
│   ├── quiz.html
│   ├── register.html
│   └── result.html
│
├── static/
│   └── style.css
│
└── database/
    └── quiz_db.sql
```

---

## 🗃️ Database

The application uses a MySQL database named:

```text
quiz_db
```

The application works with the following tables:

```text
users
questions
results
```

### Users

Stores registered user information and hashed passwords.

### Questions

Stores the questions and their corresponding answer information used by the quiz.

### Results

Stores the user's quiz score and the time taken to complete the quiz.

The database SQL file can be found in:

```text
database/quiz_db.sql
```

---

## 🚀 Getting Started

### Prerequisites

Make sure the following are installed:

* Python 3.x
* XAMPP
* MySQL
* A web browser

---

## 1. Clone the Repository

```bash
git clone https://github.com/your-username/online-quiz-system.git
```

Navigate into the project directory:

```bash
cd online-quiz-system
```

---

## 2. Create a Virtual Environment

```bash
python -m venv venv
```

Activate it on Windows:

```bash
venv\Scripts\activate
```

---

## 3. Install Dependencies

```bash
pip install -r requirements.txt
```

---

## 4. Start XAMPP

Open XAMPP Control Panel and start:

```text
Apache
MySQL
```

MySQL should be running on the default port:

```text
3306
```

---

## 5. Create the Database

Open **phpMyAdmin** and create a database named:

```text
quiz_db
```

Import the SQL file:

```text
database/quiz_db.sql
```

This creates the required tables and database structure.

---

## 6. Configure the Application

The application connects to MySQL using the local XAMPP MySQL configuration.

The database configuration in `app.py` should match your local MySQL setup:

```python
mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="quiz_db"
)
```

If your MySQL installation has a password, update the `password` value accordingly.

---

## 7. Run the Application

Run:

```bash
python app.py
```

The Flask application runs on:

```text
http://127.0.0.1:8000
```

Open this address in your browser.

---

## 🔐 Authentication

The application provides separate registration and login functionality.

During registration:

1. The user provides a username, email, and password.
2. The password is hashed using Werkzeug.
3. The user information is stored in the MySQL database.

During login:

1. The entered username is checked against the database.
2. The password is verified against the stored password hash.
3. A Flask session is created for the authenticated user.

---

## 📝 Quiz System

After successful login, the user can access the quiz.

Questions are retrieved from the MySQL `questions` table and displayed through the Flask template.

When the quiz is submitted:

* The selected answers are evaluated.
* The score is calculated automatically.
* The time taken is recorded.
* The result is stored in the `results` table.
* The final score is displayed to the user.

---

## 🏆 Leaderboard

The application provides a leaderboard displaying the **top 10 results**.

Results are ordered based on:

1. Highest score
2. Lowest time taken when scores are equal

This allows users to compare their quiz performance with other participants.

---

## 📄 Main Application Routes

| Route          | Method    | Description                      |
| -------------- | --------- | -------------------------------- |
| `/`            | GET       | Redirects to login               |
| `/register`    | GET, POST | User registration                |
| `/login`       | GET, POST | User login                       |
| `/logout`      | GET       | Logs the user out                |
| `/quiz`        | GET       | Displays the quiz                |
| `/result`      | POST      | Calculates and stores the result |
| `/leaderboard` | GET       | Displays the top 10 leaderboard  |

---

## 🔒 Security Features

* Passwords are stored using password hashing rather than plain text.
* Login state is maintained using Flask sessions.
* SQL queries use parameterized values for user-provided data.

> For production deployment, sensitive configuration such as Flask secret keys and database credentials should be stored using environment variables rather than directly in the source code.

---

## 📦 Requirements

Example `requirements.txt`:

```text
Flask
mysql-connector-python
Werkzeug
```

Install them using:

```bash
pip install -r requirements.txt
```

---

## 🎯 Learning Outcomes

Through this project, the following concepts were implemented:

* Python programming
* Flask web development
* Routing and HTTP methods
* HTML templates and Jinja2
* Form handling
* Session management
* Password hashing
* MySQL database integration
* SQL queries
* CRUD-related database operations
* Web application development

---

## 🔮 Future Enhancements

Possible improvements include:

* Admin panel for managing questions
* Multiple quiz categories
* Different difficulty levels
* Question randomization
* User profile and quiz history
* Countdown timer
* Pagination
* More detailed performance analysis
* Responsive UI improvements
* Deployment to a cloud platform

---

## ⚠️ Disclaimer

This project was developed as an **academic mini project** for learning and demonstrating web development, Python Flask, and MySQL database integration.

---

## 👩‍💻 Author

**Sravani Surarapu**

B.Tech – Information Technology

Aditya Institute of Technology and Management, Tekkali
