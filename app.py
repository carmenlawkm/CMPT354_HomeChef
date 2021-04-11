
from flask import Flask, render_template, request, url_for, flash, redirect, session, jsonify
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

foodList = []
@app.route('/home', methods=['GET', 'POST'])
def home_load():
    cur1 = mysql.connection.cursor()
    cur2 = mysql.connection.cursor()
    cur1.execute("SELECT * FROM food, publicprofileinfo, foodreviewaverage WHERE food.PUserID = publicprofileinfo.UserID AND foodreviewaverage.foodID = food.foodID")
    cur2.execute("SELECT * FROM foodingredients")
    fetch = cur1.fetchall()
    fetch2 = cur2.fetchall()
    mysql.connection.commit()
    cur1.close()
    cur2.close()
    if request.method == 'POST':
        headings = ("#", "Food", "Quantity", "Price")
        data = request.form['data']
        print(data)
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM food WHERE food.FoodID = %s", (data,))
        datalist = cur.fetchall()
        foodList.append(datalist)
        return render_template("cart.html", headings=headings, data=foodList)
    return render_template("home.html", foodInfo = fetch, foodIngredients = fetch2)

@app.route('/')
@app.route('/about')
def about_load():
    return render_template("about.html")


@app.route('/login', methods=["POST", "GET"])
def login_load():
    if request.method == "POST":
        user_email = request.form["email"]
        user_pass = request.form["password"]

        cur = mysql.connection.cursor()
        cur.execute("SELECT UserID FROM profile WHERE email = %s AND Password = %s", (user_email, user_pass))
        user_ID = cur.fetchall()
        mysql.connection.commit()
        cur.close()
        if user_ID:
            valid = 1
            session["user"] = user_ID
            print(user_ID)

            #for uid in user_ID:
               # print(uid)
            return profile_load()
        else:
            valid = 0
        return render_template("login.html", info = valid)
    return render_template("login.html")

@app.route('/logout')
def logout_load():
    session.pop("user", None)
    return about_load()


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
        region = request.form['region']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO profile (FirstName, LastName, email, UserName, password, Phone, Location, Region) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)", (firstName, lastName, email, userName, password, phone, address, region))
        mysql.connection.commit()
        cur.close()
        return render_template('profile.html') #should bring them to their profile page.
    return render_template("register.html")


@app.route('/profile')
def profile_load():
    if "user" in session:
        #cur1 = mysql.connection.cursor()
        #cur1.execute("SELECT * FROM publicprofileinfo WHERE UserID = %s", session["user"])
        #fetch = cur1.fetchall()
        #print(fetch)
        #mysql.connection.commit()
        #cur1.close()
        return render_template("profile.html", user_ID = session["user"] )
    else:
        return redirect("/login")

@app.route('/settings')
def settings_load():
    return render_template("settings.html")



# This is code for filling the cart table


# datalist = [(1, "Pizza", 2, 27.89),
#     (2, "Caramel Cake", 1, 12),
#     (3, "Pasta", 1, 13.99)
#             ]
#
# datalist.append( ("Total","","", 27.89 + 12 + 13.99) )

@app.route('/cart', methods=['GET', 'POST'])
def cart_load():
    headings = ("#", "Food", "Quantity", "Price")
    datalist = ("empty")
    if request.method == 'POST':
        # # data = request.data
        # # print(data)
        # data = request.form['data']
        # # data = 10000
        # cur = mysql.connection.cursor()
        # cur.execute("SELECT * FROM food WHERE food.FoodID = %d", data)
        # datalist = cur.fetchall()
        return render_template("cart.html", headings=headings, data=datalist)

    return render_template("cart.html", headings=headings, data=foodList)

# foodsArr = []

# @app.route('/foods')
# def foods_load():
#
#     headings = ("Food ID", "P user ID", "Name", "Price", "Availability", "Description", "Instructions")
#
#     cur = mysql.connection.cursor()
#     cur.execute("SELECT * FROM food")
#     datalist = cur.fetchall()
#     global foodsArr
#     foodsArr = datalist
#     return render_template("foods.html",headings=headings, data=datalist)

# @app.route('/', methods=['GET', 'POST'])
# def parse_request():
#     data = request.data  # data is empty
#     headings = ("#", "Food", "Quantity", "Pricepp")
#     foodsArr = data;
#     return render_template("cart.html", headings=headings, data=foodsArr)




if __name__ == '__main__':
    app.run(debug=True)
