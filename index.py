from flask import Flask, render_template, request, url_for, flash
from flask_mysqldb import MySQL
from werkzeug.utils import redirect

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'gigo'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_CURSORCLASS'] = "DictCursor"
mysql = MySQL(app)


@app.route('/')
def login():
    return render_template("login.html")


@app.route("/", methods=["GET", "POSt"])
def validation():
    if request.method == 'POST':
        username = request.form["username"]
        password = request.form["password"]
        con = mysql.connection.cursor()
        sql = "SELECT*from admin where username = %s and password = %s "
        con.execute(sql, [username, password])
        data = con.fetchone()
        if data is None:
            flash("Username or password is worng")
            return render_template("login.html")
        else:
            return redirect(url_for("index"))


@app.route("/index")
def index():
    return render_template("index.html")


@app.route("/info")
def info():
    con = mysql.connection.cursor()
    sql = "Select customer.cus_id,customer.Name,customer.House_no,customer.street_id,details.capablecompost,details.ecobrick from customer inner join details on details.id=customer.cus_id "
    con.execute(sql)
    res = con.fetchall()
    return render_template("info.html", datas=res)


@app.route("/details")
def details():
    con = mysql.connection.cursor()
    sql = "Select * from lorry"
    con.execute(sql)
    res = con.fetchall()
    return render_template('details.html', datas=res)


@app.route("/update")
def update():
    con = mysql.connection.cursor()
    sql = "Select customer.cus_id,customer.Name,customer.contact_no,customer.House_no,customer.street_id,details.capablecompost,details.ecobrick from customer inner join details on details.id=customer.cus_id"
    con.execute(sql)
    res = con.fetchall()
    return render_template("update.html", datas=res)


@app.route("/showtable", methods=['POST', 'GET'])
def showtable():
    cus_id = request.form['cus_id']
    con = mysql.connection.cursor()
    sql = "Select customer.cus_id,customer.Name,customer.contact_no,customer.House_no,customer.street_id,details.capablecompost,details.ecobrick from customer inner join details on details.id=customer.cus_id where customer.cus_id=%s"
    con.execute(sql, [cus_id])
    res = con.fetchone()
    return render_template("showtable.html", datas=res)


@app.route("/addlorry", methods=['GET', 'POST'])
def addlorry():
    if request.method == 'POST':
        lorry_id = request.form['lorry_id']
        driver_name = request.form['driver_name']
        driver_id = request.form['driver_id']
        con = mysql.connection.cursor()
        sql = 'insert into lorry value (%s,%s,%s)'
        con.execute(sql, [lorry_id, driver_id, driver_name])
        mysql.connection.commit()
        con.close()
        return redirect(url_for("details"))
    return render_template("addlorry.html")


@app.route("/deletelorry/<string:l_id>", methods=['GET', 'POST'])
def deletelorry(l_id):
    con = mysql.connection.cursor()
    sql = "delete from lorry where lorry_id=%s"
    con.execute(sql, [l_id])
    mysql.connection.commit()
    con.close()
    return redirect(url_for("details"))


@app.route("/editlorry/<string:lorry_id>", methods=['GET', 'POST'])
def editlorry(lorry_id):
    con = mysql.connection.cursor()
    if request.method == 'POST':
        driver_name = request.form['driver_name']
        driver_id = request.form['driver_id']
        sql = "update lorry set Driver_id=%s,Driver_name=%s where lorry_id=%s"
        con.execute(sql, [driver_id, driver_name, lorry_id])
        mysql.connection.commit()
        con.close()
        return redirect(url_for("details"))
    con = mysql.connection.cursor()
    sql = "select * from lorry where lorry_id=%s"
    con.execute(sql, [lorry_id])
    res = con.fetchone()
    return render_template("editlorry.html", datas=res)


@app.route("/deletecust/<string:c_id>", methods=['GET', 'POST'])
def deletecust(c_id):
    con = mysql.connection.cursor()
    sql = "delete from customer where cus_id=%s"
    con.execute(sql, [c_id])
    mysql.connection.commit()
    con.close()
    return redirect(url_for("update"))


@app.route("/showinfo", methods=['POST', 'GET'])
def showinfo():
    street_id = request.form['street_id']
    con = mysql.connection.cursor()
    sql = "Select customer.cus_id,customer.Name,customer.House_no,customer.street_id,details.capablecompost,details.ecobrick from customer inner join details on details.id=customer.cus_id where customer.street_id=%s"
    con.execute(sql, [street_id])
    res = con.fetchall()
    return render_template("showinfo.html", datas=res)


if __name__ == "__main__":
    app.secret_key = 'Thanis'
    app.run(debug=True)
