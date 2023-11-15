import psycopg2
import csv




conn = psycopg2.connect(
    host='localhost',
    database='2',
    user='postgres',
    password='123',
    port='5432'
)

cur = conn.cursor()
cur.execute("SELECT * FROM college_teacher LIMIT 5;")
results = cur.fetchall()
print(results)
    

with open('результат5.csv', 'w', newline='', encoding='utf-8') as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerows(results)



cur.close()
conn.close()