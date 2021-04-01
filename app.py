from flask import Flask, redirect, render_template, request, session

app = Flask(__name__)
#the key for the session
app.secret_key = "NoKey"

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


@app.route('/register')
def register_load():
    return render_template("register.html")


@app.route('/profile')
def profile_load():
    return render_template("profile.html")

# This is code for filling the cart table
headings = ("#", "Food", "Quantity", "Price")
data = (
    (1, "Pizza", 2, 27.89),
    (2, "Caramel Cake", 1, 12),
    (3, "Pasta", 1, 13.99),
    ("Total","","", 27.89 + 12 + 13.99)
)

L1 = list(data)
L1.append((8, "joe", 1919, 12))
date = tuple(L1)

@app.route('/cart')
def cart_load():
    return render_template("cart.html", headings=headings, data=data)


if __name__ == '__main__':
    app.run(debug=True)
