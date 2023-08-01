from .db import get_connection

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
                 id_cliente = None):
        self.id_cliente = id_cliente
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

    def save(self):
        if self.id_cliente is None:
            with mydb.cursor() as cursor:
                sql = "INSERT INTO clientes (nombre, ape_pat, ape_mat, id_genero, fecha_nacimiento, id_nivelEdu, id_ocupacion, ingresos_mensuales, curp, tel_cel, tel_casa) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                val = (self.nombre, self.ape_pat, self.ape_mat, self.id_genero, self.fecha_nacimiento, self.id_nivelEdu, self.id_ocupacion, self.ingresos_mensuales, self.curp, self.tel_cel, self.tel_casa)
                cursor.execute(sql, val)
                mydb.commit()
                self.id_cliente = cursor.lastrowid
                return self.id_cliente
