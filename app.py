from flask import Flask, render_template, request, url_for, flash, redirect, session, jsonify
from flask_mysqldb import MySQL
from datetime import datetime
import sqlite3

app = Flask(__name__)
# the key for the session
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
    cur3 = mysql.connection.cursor()

    cur1.execute("SELECT * FROM foodandrating, publicprofileinfo WHERE foodandrating.PUserID = publicprofileinfo.UserID")
    cur2.execute("SELECT * FROM foodingredients")
    cur3.execute("SELECT * FROM foodtags")
    fetch = cur1.fetchall()
    fetch2 = cur2.fetchall()
    fetch3 = cur3.fetchall()
    mysql.connection.commit()
    cur1.close()
    cur2.close()
    cur3.close()
    if request.method == 'POST':
        if request.form.get("follow"):
            followcur = mysql.connection.cursor()
            followee = request.form['follow']
            if int(followee) == int(session["user"][0][0]):
                flash("You cannot follow yourself.")
            else:
                followcur.execute("INSERT IGNORE INTO follows (FollowerID, FolloweeID) VALUE (%s, %s)", (session["user"], followee))
                mysql.connection.commit()
                followcur.close()
                flash("You have successfully followed this user.")
                return redirect('/home')
        elif request.form.get("filterAvailable"):
            return "APPLY DIVISION TO FIND ALL AVAILABLE HERE"
        elif request.form.get("filterNotAvailable"):
            return "APPLY DIVISION HERE TO FIND NOT AVAILABLE HERE"
        elif  request.form.get("data"):
            headings = ("Food", "Quantity", "Price")
            data = request.form['data']
            datanum = request.form['datanum']

            if not datanum:
                flash("invalid quantity")
            else:
                cur = mysql.connection.cursor()
                cur.execute("SELECT * FROM food WHERE food.FoodID = %s", (data,))
                datalist = cur.fetchall()
                mysql.connection.commit()
                cur.close()
                foodTuple = cleanTuple(datalist, datanum, data)
                if checkSameId(foodTuple[1]) != 1:
                    flash("must choose foods from same seller as other items in cart!")
                    return redirect("/home")
                elif checkDupFood(data) != 0:
                    flash("This food is already in the cart!")
                    return redirect("/home")
                else:
                    foodList.append(foodTuple)
                    customercur = mysql.connection.cursor()
                    customercur.execute("INSERT IGNORE INTO customer (UserID, OverallCustomerRating, numberOfRatings) VALUES (%s, %s, %s)",
                                        (session["user"], 0, 0))
                    mysql.connection.commit()
                    return redirect("/cart")
    return render_template("home.html", foodInfo = fetch, foodIngredients = fetch2, foodtags = fetch3)


def calculatetotal(foodl):
    total = 0;

    for f in foodl:
        total = total + int(f[0][1]) * int(f[0][2])
    return total


def cleanTuple(datalist, datanum, foodid):
    cleaned = datalist[0]
    sellerId = cleaned[1]
    food = cleaned[2]
    quantity = datanum
    price = cleaned[3]
    foodTuple = ((food, quantity, price), sellerId, foodid)
    return foodTuple

def checkDupFood(foodId):
    for f in foodList:
        if foodId == f[2]:
            return 1
    return 0

def checkSameId(sellerid):
    for f in foodList:
        if f[1] != sellerid:
            return 0
    return 1


@app.route('/')
@app.route('/about')
def about_load():
    return render_template("about.html")


@app.route('/login', methods=["POST", "GET"])
def login_load():
    if "user" in session:
        return redirect("/profile")
    else:
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
                return redirect('/profile')
            else:
                valid = 0
            return render_template("login.html", info=valid)
        return render_template("login.html")


@app.route('/logout')
def logout_load():
    session.pop("user", None)
    return about_load()


@app.route('/register', methods=['GET', 'POST'])
def register_load():
    if "user" in session:
        return redirect("/profile")
    else:
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
            cur.execute(
                "INSERT INTO profile (FirstName, LastName, email, UserName, password, Phone, Location, Region) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                (firstName, lastName, email, userName, password, phone, address, region))
            mysql.connection.commit()
            cur.close()
            return redirect('/profile')
        return render_template("register.html")


@app.route('/profile', methods=['GET', 'POST'])
def profile_load():
    if "user" in session:
        cur = mysql.connection.cursor()
        cur2 = mysql.connection.cursor()
        cur3 = mysql.connection.cursor()
        cur4 = mysql.connection.cursor()
        cur.execute("SELECT * FROM publicprofileinfo WHERE UserID = %s", session["user"])
        cur2.execute("SELECT COUNT(*) FROM follows WHERE FollowerID = %s", session["user"])  # following ID
        cur3.execute("SELECT COUNT(*) FROM follows WHERE FolloweeID = %s", session["user"])  # followee ID
        cur4.execute("SELECT * FROM food WHERE PUserID = %s", session["user"])  # food items this user posted
        userData = cur.fetchall()
        userData = userData[0]  # take the first tuple in the 2d array.
        following = cur2.fetchall()
        followee = cur3.fetchall()
        foodList = cur4.fetchall()
        mysql.connection.commit()
        cur.close()
        cur2.close()
        cur3.close()
        cur4.close()
        if request.method == "POST":
            cur1 = mysql.connection.cursor()
            delete = request.form['delete']
            cur1.execute("DELETE FROM food WHERE FoodID = %s", [delete])
            mysql.connection.commit()
            cur1.close()
            return redirect("/profile")

        return render_template("profile.html", user_ID=session["user"], userData=userData, following=following,
                               followee=followee, foodList=foodList)
    else:
        return redirect("/login")


@app.route('/settings', methods=['GET', 'POST'])
def settings_load():
    if "user" in session:
            cur = mysql.connection.cursor()
            cur2 = mysql.connection.cursor()
            cur.execute("SELECT * FROM profile WHERE UserID = %s", session["user"])
            userData = cur.fetchall()
            userData = userData[0]  # take the first tuple in the 2d array.
            if request.method == "POST":
                userName = request.form['username']
                firstName = request.form['firstname']
                lastName = request.form['lastname']
                email = request.form['email']
                password = request.form['password']
                phone = request.form['phone']
                address = request.form['address']
                region = request.form['region']
                img_url = request.form['img_url']
                cur2.execute(
                    "UPDATE profile SET FirstName = %s, LastName = %s, email = %s, UserName = %s, password = %s, "
                    "Phone = %s, Location = %s, Region = %s, Img_url = %s WHERE UserID = %s",
                    (firstName, lastName, email, userName, password, phone, address, region, img_url, session["user"]))
                mysql.connection.commit()
                cur2.close()
            mysql.connection.commit()
            cur.close()
            return render_template("settings.html", userData=userData)
    else:
        return redirect("/login")


@app.route('/post', methods=["POST", "GET"])
def post_load():
    if "user" not in session:
        return redirect("/login")

    if request.method == "POST":
        food_name = request.form["food-name"]
        food_img_url = request.form["food-img-url"]
        availability = request.form["availability"]

        food_price = request.form["food-price"]
        description = request.form["description"]
        instructions = request.form["instructions"]

        cur = mysql.connection.cursor()
        cur1 = mysql.connection.cursor()
        cur2 = mysql.connection.cursor()
        cur3 = mysql.connection.cursor()
        insertSellerCur = mysql.connection.cursor()
        cur.execute(
            "INSERT INTO food (PUserID, FoodName, Img_url, availability, pricePerUnit, description, Instructions) "
            "VALUES (%s, %s, %s, %s, %s, %s, %s)",
            (session["user"], food_name, food_img_url, availability, int(food_price), description, instructions)
        )
        insertSellerCur.execute("INSERT IGNORE INTO seller (UserID) VALUES (%s)", (session["user"]))
        cur1.execute("SELECT LAST_INSERT_ID()")
        food_id = cur1.fetchone()

        ingredients = [(food_id, x.strip()) for x in request.form["ingredients"].split(',')]
        tags = [(food_id, y.strip()) for y in request.form["tags"].split(',')]
        cur2.executemany(
            "INSERT INTO foodingredients (FoodID, Ingredients) "
            "VALUES (%s, %s)", ingredients
        )
        cur3.executemany(
            "INSERT INTO foodtags (FoodID, Tags)"
            "VALUES (%s, %s)", tags
        )
        mysql.connection.commit()
        cur.close()
        cur1.close()
        cur2.close()
        return redirect("/home")
    cur4 = mysql.connection.cursor()
    cur4.execute("SELECT FirstName, LastName, Img_url "
                "FROM publicprofileinfo "
                "WHERE UserID = %s", session["user"])
    user_data = cur4.fetchone()
    mysql.connection.commit()
    cur4.close()
    first_name = user_data[0]
    last_name = user_data[1]
    img_url = user_data[2]
    return render_template("post.html", first_name=first_name, last_name=last_name, img_url=img_url)


@app.route('/checkout', methods=['GET', 'POST'])
def checkout_load():
    headings = ("Food", "Quantity", "Price")

    if "user" in session:
        total = calculatetotal(foodList)
        datalist = cleanfoodlist(foodList)
        sellerid = getSeller(foodList)
        cur = mysql.connection.cursor()
        cur.execute("SELECT FirstName, LastName FROM profile WHERE UserID = %s", (sellerid,))
        sellername = cur.fetchone()

        if request.method == "POST":
            orderinfocur = mysql.connection.cursor()
            orderidcur = mysql.connection.cursor()
            payMethod = request.form['pmethod']
            pick_up_time = request.form['date']
            contactInfo = request.form['contactinfo']
            region = request.form['region']
            orderTime = datetime.now()
            customerId = session["user"]
            if pick_up_time:
                orderinfocur.execute(
                    "INSERT INTO orderinfo (totalPrice, paymentMethod, pickUpTime, contactInfo, region, orderTime, customerID, sellerID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
                    (total, payMethod, pick_up_time, contactInfo, region, orderTime, customerId, sellerid))

                orderidcur.execute("SELECT LAST_INSERT_ID()")
                orderid = orderidcur.fetchone()

                foodarr = foodsArr(orderid, foodList)
                orderfoodcur = mysql.connection.cursor()
                querystmt = "INSERT INTO orderfoods (OrderID, FoodID, quantity) VALUES (%s, %s, %s)"
                orderfoodcur.executemany(querystmt, foodarr)

                orderplacementcur = mysql.connection.cursor()
                orderplacementcur.execute("INSERT INTO orderplacement (OrderID, CustomerID, SellerID) VALUES (%s, %s, %s)",
                                                            (orderid, customerId, sellerid))
                mysql.connection.commit()
                orderinfocur.close()
                orderfoodcur.close()
                flash("Order placed successfully!")
                return redirect("/home")
            else:
                flash("Invalid Date!")
                return redirect("/checkout")
        mysql.connection.commit()
        cur.close()

        return render_template("checkout.html", headings=headings, data=datalist, total=total, seller=sellername)
    else:
        return redirect("/login")


def foodsArr(orderid, foodlist):
    foodarr = []
    for f in foodlist:
        foodarr.append((orderid, f[2], f[0][1]))
    return foodarr


def getSeller(foodl):
    return foodl[0][1]


def getfoodIDs(foods):
    foodIDs = []
    for f in foods:
        foodIDs.append(f[0])
    return foodIDs

@app.route('/review', methods=['GET', 'POST'])
def review_load():
    if "user" not in session:
        return redirect("/login")
    if request.method == "POST":
        food = request.form["food"]
        rate = request.form["sellerRate"]
        comment = request.form["review"]
        cur3 = mysql.connection.cursor()
        cur3.execute("INSERT INTO review (CustomerUserID, FoodID, Rating, Comment) VALUES (%s, %s,%s,%s)",
                     (session["user"], food, rate, comment))
        mysql.connection.commit()
        cur3.close()
        return redirect("/purchasehistory")
    cur = mysql.connection.cursor()
    cur2 = mysql.connection.cursor()
    cur.execute("SELECT * FROM reviewFoods WHERE reviewFoods.CustomerUserID = %s", session["user"])
    cur2.execute("SELECT orderfoods.foodID, FoodName FROM orderfoods, food "
                 "WHERE orderfoods.OrderID = %s AND orderfoods.FoodID = food.FoodID", (reviewOrder,))
    reviewed = cur.fetchall()
    allreviewed = []
    for r in reviewed:
        allreviewed.append(r[2])
    else:
        foods = cur2.fetchall()
        foodIDs = getfoodIDs(foods)
        return render_template("review.html", reviewed=allreviewed, foods=foods, reviews=reviewed, foodIDs=foodIDs)


@app.route('/purchasehistory', methods=['GET', 'POST'])
def history_load():
    if "user" not in session:
        return redirect("/login")
    if request.method == "POST":
        orderID = request.form['orderID']
        global reviewOrder
        reviewOrder = orderID
        return redirect("/review")

    headings = ("#", "Seller", "Price", "Order Date", "Pickup Time", "Review Food")
    cur2 = mysql.connection.cursor()
    cur2.execute("SELECT * FROM History WHERE UserID = %s", session["user"])

    orderData = cur2.fetchall()

    mysql.connection.commit()

    cur2.close()
    return render_template("history.html", headings=headings, orderData=orderData)


@app.route('/cart', methods=['GET', 'POST'])
def cart_load():
    total = calculatetotal(foodList)

    if "user" in session:
        headings = ("Food", "Quantity", "Price")
        datalist = cleanfoodlist(foodList)
        if request.method == 'POST':
            btnoutput = request.form["btn"]
            if btnoutput == "Clear":
                foodList.clear()
                return redirect("/cart")
            if len(foodList) == 0:
                flash("Cart is empty")
                return redirect("/cart")
            return redirect("/checkout")

        return render_template("cart.html", headings=headings, data=datalist, total=total)
    else:
        return redirect("/login")

@app.route('/notification', methods=['GET', 'POST'])
def notification_load():
    if "user" in session:
        if request.method == "POST":
            cur1 = mysql.connection.cursor()
            accept = request.form['accept']
            cur1.execute("UPDATE orderinfo set processed=1 WHERE orderID = %s", [accept])
            mysql.connection.commit()
            cur1.close()
            return redirect("/notification")

        headings = ("#", "Buyer", "Contact","Food", "Payment", "Order Date", "Pickup Time","Pickup Address", "Process")
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM fullorderinfoforseller WHERE sellerID = %s", session["user"])
        orderInfo = cur.fetchall()
        mysql.connection.commit()
        cur.close()
        return render_template("notification.html", orderInfo = orderInfo, headings=headings)
    else:
        return redirect("/login")

def cleanfoodlist(foodList):
    datalist = []
    for f in foodList:
        datalist.append(f[0])
    return datalist
if __name__ == '__main__':
    app.run(debug=True)
