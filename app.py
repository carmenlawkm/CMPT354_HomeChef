
from flask import Flask, render_template, request, url_for, flash, redirect, session
from flask_mysqldb import MySQL
import sqlite3

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
    return render_template("home.html")

@app.route('/about')
def about_load():
    return render_template("about.html")


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

# This is code for filling the cart table


# datalist = [(1, "Pizza", 2, 27.89),
#     (2, "Caramel Cake", 1, 12),
#     (3, "Pasta", 1, 13.99)
#             ]
#
# datalist.append( ("Total","","", 27.89 + 12 + 13.99) )

@app.route('/cart')
def cart_load():
    headings = ("#", "Food", "Quantity", "Price")

    return render_template("cart.html", headings=headings, data=foodsArr)

foodsArr = []

@app.route('/foods')
def foods_load():

    headings = ("Food ID", "P user ID", "Name", "Price", "Availability", "Description", "Instructions")

    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM food")
    datalist = cur.fetchall()
    global foodsArr
    foodsArr = datalist
    return render_template("foods.html",headings=headings, data=datalist)

if __name__ == '__main__':
    app.run(debug=True)
