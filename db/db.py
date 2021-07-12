import psycopg2

class db:
  def Init_db():
    conn = psycopg2.connect(dbname="postgres", user="postgres", password="123456", host="localhost", port=5432)
    return conn

  def Close_db(cur, conn):
    cur.close()
    conn.close()
