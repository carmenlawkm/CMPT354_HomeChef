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


if __name__ == '__main__':
    app.run(debug=True)
