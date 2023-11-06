import psycopg2

243t432t23t32t4t3t


try:
    conn = psycopg2.connect(
        host='localhost',
        user='postgres',
        password='1234567'
    )
    conn.autocommit = True  
    cur = conn.cursor()
    cur.execute("CREATE DATABASE dtbs;")  
    cur.close()
    conn.close()

except psycopg2.Error as e:
    print("Error creating the database:", e)
    




try:
    conn = psycopg2.connect(
        host='localhost',
        database='dtbs',  
        user='postgres',
        password='1234567'
    )
    cur = conn.cursor()
   
 
    cur.execute("""
        CREATE TABLE Products (
            product_id serial PRIMARY KEY,
            product_name VARCHAR(255),
            price DECIMAL
        )
    """)


    cur.execute("""
        CREATE TABLE Customers (
            customer_id serial PRIMARY KEY,
            customer_name VARCHAR(255)
        )
    """)

    cur.execute("""
        CREATE TABLE Orders (
            order_id serial PRIMARY KEY,
            customer_id INT,
            product_id INT,
            count_or INT
        )
    """)
    
    
except psycopg2.Error as e:
    print("Error creating tables:", e)



try:
    
    conn.commit()

except psycopg2.Error as e:
    print("Error executing SQL queries:", e)

finally:
    if cur:
        cur.close()
    if conn:
        conn.close()