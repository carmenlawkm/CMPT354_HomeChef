
from flask import Flask, render_template, request, url_for, flash, redirect, session
from flask_mysqldb import MySQL


app = Flask(__name__)
#the key for the session
app.secret_key = "NoKey"

app.config['MYSQL_HOST'] = "localhost"
app.config['MYSQL_USER'] = "root"
app.config['MYSQL_PASSWORD'] = ""
app.config['MYSQL_DB'] = "homechef"

mysql = MySQL(app)

@app.route('/')
def home_load():
    return render_template("home_page.html")


@app.route('/login', methods=["POST", "GET"])
def login_load():
    if request.method == "POST":
        user_email = request.form["email"]
        session["user"] = user_email
        return
    return render_template("login.html")

@app.route('/logout')
def logout_load():
    return home_load()


@app.route('/register', methods = ['GET','POST'])
def register_load():
    if request.method == 'POST':
        userName = request.form['username']
        firstName = request.form['firstname']
        lastName = request.form['lastname']
        email = request.form['email']
        password = request.form['password']
        phone = request.form['phone']
        address = request.form['address']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO profile (FirstName, LastName, email, UserName, password, Phone, Location) VALUES (%s, %s, %s, %s, %s, %s, %s)", (firstName, lastName, email, userName, password, phone, address))
        mysql.connection.commit()
        cur.close()
        return "registration successful"

    return render_template("register.html")


@app.route('/profile')
def profile_load():
    return render_template("profile.html")


if __name__ == '__main__':
    app.run(debug=True)
