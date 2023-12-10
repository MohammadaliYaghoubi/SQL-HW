import mysql.connector

#CONNECT TO DATABASE
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="******",
)
mycursor = mydb.cursor()

#CREATE DATABASE
sql = "CREATE DATABASE SHOP_MANAGEMENT"
mycursor.execute(sql)

#USE DATABASE
mydb = mysql.connemctor.connect(
    host="localhost",
    user="root",
    passwd="******",
    database="SHOP_MANAGEMENT"
)
mycursor = mydb.cursor()

#CREATE TABLES
sql = """
        CREATE TABLE Category(
            category_id INT auto_incerement,
            category_name VARCHAR(50),
            PRIMARY KEY(category_id)
        );
    """
mycursor.execute(sql)

sql = """
        CREATE TABLE Products(
            product_id INT auto_incerement,
            product_name VARCHAR(50),
            price INT,
            quantity INT,
            category_id INT,
            PRIMARY KEY(product_id),
            FOREIGN KEY(category_id) REFERENCES Category(category_id)
        );
    """
mycursor.execute(sql)

#Add New  Entries
#In sql means insert into table
sql = "INSRET INTO Category(category_id,category_name)"
sql += """
        VALUES
        (1,'Electronics'),
        (2,'Fashion'),
        (3,'Home Decor'),
        (4,'Kitchenware')

    """
mycursor.execute(sql)
mydb.commit()

sql = "INSERT INTO Products(product_id,product_name,category_id,price,quantity)"  
sql += """
        VALUES
        (1,'Laptop',1,1000,100),
        (2,'Smartphone',1,500,50),
        (3,'Television',2,1000,20),
        (4,'Dress',3,500,10),
        (5,'Kitchen Set',4,1000,15),
    """
mycursor.execute(sql)
mydb.commit()

#Remove Entries
#In sql means delete data
sql = "DELETE FROM Product WHERE product_name = Smartphone"
mycursor.execute(sql)

sql = "DELETE FROM Category WHERE category_id = 3"
mycursor.execute(sql)

#Edit Entries
#In sql means Update data
sql = "SELECT * FROM Products"
mycursor.execute(sql)
mycursor.fetchall()
#Apply 10% price increase
sql = "UPDAIE Products SET price = 0.1 * price + price"
mycursor.execute(sql)

#Search Entries
#In sql means select from table or join table
#select category from product table
sql = "SELECT * FROM Products WHERE name = Laptop"
mycursor.execute(sql)
mycursor.fetchall()

sql = """
        SELECT * FROM (SELECT * FROM Category INNER JOIN Products
        ON Category.category_id = Products.category_id) WHERE category_name = Electronics
    """
mycursor.execute(sql)

#Display Entries
#In sql means Show all Products or Categorys in tables
sql = "SELECT product_name FROM Products"
mycursor.execute(sql)
mycursor.fetchall()

sql = "SELECT category_name FROM Category"
mycursor.execute(sql)
mycursor.fetchall()
