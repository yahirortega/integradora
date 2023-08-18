from .db import get_connection
from werkzeug.security import generate_password_hash, check_password_hash

mydb = get_connection()

class User:

    def __init__(self,
                 nombre,
                 ape_pat,
                 ape_mat,
                 id_genero,
                 fecha_nacimiento,
                 id_nivelEdu,
                 id_ocupacion,
                 ingresos_mensuales,
                 curp,
                 tel_cel,
                 tel_casa,
                 email,
                 password,
                 rol='cliente',
                 id_usuario = None):
        self.id_usuario = id_usuario
        self.nombre = nombre
        self.ape_pat = ape_pat
        self.ape_mat = ape_mat
        self.id_genero = id_genero
        self.fecha_nacimiento = fecha_nacimiento
        self.id_nivelEdu = id_nivelEdu
        self.id_ocupacion = id_ocupacion
        self.ingresos_mensuales = ingresos_mensuales
        self.curp = curp
        self.tel_cel = tel_cel
        self.tel_casa = tel_casa
        self.email = email
        self.rol = rol
        self.password = password

    def save(self):
        if self.id_usuario is None:
            with mydb.cursor() as cursor:
                self.password = generate_password_hash(self.password)
                sql = "INSERT INTO clientes (nombre, ape_pat, ape_mat, id_genero, fecha_nacimiento, id_nivelEdu, id_ocupacion, ingresos_mensuales, curp, tel_cel, tel_casa, email, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                val = (self.nombre, self.ape_pat, self.ape_mat, self.id_genero, self.fecha_nacimiento, self.id_nivelEdu, self.id_ocupacion, self.ingresos_mensuales, self.curp, self.tel_cel, self.tel_casa, self.email, self.password)
                cursor.execute(sql, val)
                mydb.commit()
                self.id_usuario = cursor.lastrowid
                return self.id_usuario
        else:
            with mydb.cursor() as cursor:
                sql = 'UPDATE clientes SET nombre = %s, ape_pat = %s, ape_mat = %s, id_genero = %s, fecha_nacimiento = %s, id_nivelEdu = %s, id_ocupacion = %s, ingresos_mensuales = %s, curp = %s, tel_cel = %s, tel_casa = %s '
                sql += 'WHERE id_usuario = %s'
                val = (self.nombre, self.ape_pat, self.ape_mat, self.id_genero, self.fecha_nacimiento, self.id_nivelEdu, self.id_ocupacion, self.ingresos_mensuales, self.curp, self.tel_cel, self.tel_casa, self.id_usuario)
                cursor.execute(sql, val)
                mydb.commit()
                return self.id_usuario
            
    def delete(self):
        with mydb.cursor() as cursor:
            sql = f"DELETE FROM clientes WHERE id_usuario = { self.id_usuario }"
            cursor.execute(sql)
            mydb.commit()
            return self.id_usuario
        
    @staticmethod
    def __get__(id_usuario):
        with mydb.cursor(dictionary=True) as cursor:
            sql = f"SELECT * FROM clientes WHERE id_usuario = { id_usuario }"
            cursor.execute(sql)

            user = cursor.fetchone()

            if user:
                user = User(nombre=user["nombre"], 
                            ape_pat=user["ape_pat"], 
                            ape_mat=user["ape_mat"], 
                            id_genero=user["id_genero"], 
                            fecha_nacimiento=user["fecha_nacimiento"], 
                            id_nivelEdu=user["id_nivelEdu"], 
                            id_ocupacion=user["id_ocupacion"],
                            ingresos_mensuales=user["ingresos_mensuales"],
                            curp=user["curp"],
                            tel_cel=user["tel_cel"],
                            tel_casa=user["tel_casa"],
                            email=user["email"],
                            password=user["password"],
                            rol=user['rol'],
                            id_usuario=id_usuario)
                return user
            
            return None
        
    @staticmethod
    def check_email(email):
        with mydb.cursor(dictionary=True) as cursor:
            sql = f"SELECT * FROM clientes WHERE email = '{ email }'"
            cursor.execute(sql)

            user = cursor.fetchone()

            if user:
                return 'User exist'
            else:
                return None
            
    @staticmethod
    def get_by_password(email, password):
        with mydb.cursor(dictionary=True) as cursor:
            sql = "SELECT id_usuario, email, password FROM clientes WHERE email = %s"
            val = (email,)
            cursor.execute(sql, val)
            user = cursor.fetchone()
            
            if user != None:
                if check_password_hash(user["password"], password):
                    return User.__get__(user["id_usuario"])
            return None
        
    @staticmethod
    def get_all():
        with mydb.cursor(dictionary=True) as cursor:
            sql = f"SELECT * FROM vista_clientes"
            cursor.execute(sql)
            result = cursor.fetchall()
            return result
        
    @staticmethod
    def get_genero():
        with mydb.cursor() as cursor:
            sql = f"SELECT * FROM genero"
            cursor.execute(sql)
            result = cursor.fetchall()

            return result

    @staticmethod
    def get_nivelEdu():
        with mydb.cursor() as cursor:
            sql = f"SELECT * FROM nivel_educativo"
            cursor.execute(sql)
            result = cursor.fetchall()

            return result
        
    @staticmethod
    def get_ocupacion():
        with mydb.cursor() as cursor:
            sql = f"SELECT * FROM ocupacion"
            cursor.execute(sql)
            result = cursor.fetchall()

            return result

        
    
