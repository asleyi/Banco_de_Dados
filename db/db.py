import psycopg2

class db:
  def Init_db():
    conn = psycopg2.connect(dbname="iFood", user="postgres", password="********", host="localhost", port=5433)
    return conn

  def Close_db(cur, conn):
    cur.close()
    conn.close()
