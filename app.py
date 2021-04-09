
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


@app.route('/home')
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

    return render_template("home.html", foodInfo = fetch, foodIngredients = fetch2)

@app.route('/')
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
        region = request.form['region']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO profile (FirstName, LastName, email, UserName, password, Phone, Location, Region) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)", (firstName, lastName, email, userName, password, phone, address, region))
        mysql.connection.commit()
        cur.close()
        return render_template('profile.html') #should bring them to their profile page.
    return render_template("register.html")

@app.route('/profile')
def profile_load():
    return render_template("profile.html")

@app.route('/settings')
def settings_load():
    return render_template("settings.html")




if __name__ == '__main__':
    app.run(debug=True)
