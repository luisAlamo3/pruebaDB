import psycopg2

DB__HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "productosBD"
DB_USER = "myuser"
DB_PASSWORD = "mypassword"

def conectar_db():
    try:
        conexion = psycopg2.connect(
            host=DB__HOST,
            port=DB_PORT,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD
        )
        print("Conexión exitosa a la base de datos")
        return conexion
    except Exception as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None
    
def obtener_productos():
    conexion = conectar_db()
    if conexion is None:
        return []

    try:
        cursor = conexion.cursor()
        query = """
                SELECT * FROM clientes;
                """
        cursor.execute(query)
        productos = cursor.fetchall()
        if productos:
            for p in productos:
                print(p)
        else:
            print("No se encontraron productos.")
        cursor.close()
        conexion.close()

    except Exception as e:
        print(f"Error al obtener productos: {e}")
        return []

obtener_productos()