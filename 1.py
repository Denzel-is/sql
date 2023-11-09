import psycopg2

conn = psycopg2.connect(
        host='localhost',
        database='W11',
        user='postgres',
        password='123',
        port='5432'
    )
cur = conn.cursor()
cur.execute("SELECT first_name FROM mock_data LIMIT 5;")
unames=[r[0] for r in cur.fetchall()]
uname = input("Enter ur login ")
founds = False
while not founds:
    if uname in unames:
        print("u have in the list")
        founds = True
    else:
        print("u have not in the list")
        founds = True

conn.commit()
cur.close()    
conn.close()