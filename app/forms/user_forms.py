from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, DateField, TelField
from wtforms.validators import DataRequired, Length

class RegisterForm(FlaskForm):
    nombre = StringField("Nombre: ", validators=[DataRequired(), Length(min=4, max=25)])
    ape_pat = StringField("Apellido Paterno: ", validators=[DataRequired(), Length(min=4, max=25)])      
    ape_mat = StringField("Apellido Materno: ", validators=[DataRequired(), Length(min=4, max=25)])
    id_genero = StringField("Genero: ", validators=[DataRequired()])
    fecha_nacimiento = DateField("Fecha de Nacimiento: ", validators=[DataRequired()])
    id_nivelEdu = StringField("Educación: ", validators=[DataRequired()])
    id_ocupacion = StringField("Ocupacion: ", validators=[DataRequired()])
    ingresos_mensuales = StringField("Ingresos Mensuales: ", validators=[DataRequired()])
    curp = StringField("Curp: ", validators=[DataRequired(), Length(min=18, max=18)])
    tel_cel = TelField("Tel Cel: ", validators=[DataRequired(), Length(min=10, max=10)])
    tel_casa = TelField("Tel Casa: ", validators=[Length(min=10, max=10)])
    submit = SubmitField("Registrar")

