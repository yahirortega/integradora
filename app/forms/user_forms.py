from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, DateField, TelField, PasswordField, EmailField, SelectField, ValidationError, FloatField, IntegerField
from wtforms.validators import DataRequired, Length, Email, EqualTo, NumberRange

from models.users import User

class RegisterForm(FlaskForm):
    nombre = StringField("Nombre: ", validators=[DataRequired(), Length(min=4, max=25)])
    ape_pat = StringField("Apellido Paterno: ", validators=[DataRequired(), Length(min=4, max=25)])      
    ape_mat = StringField("Apellido Materno: ", validators=[DataRequired(), Length(min=4, max=25)])
    id_genero = StringField("Genero: ", validators=[DataRequired()])
    fecha_nacimiento = DateField("Fecha de Nacimiento: ", validators=[DataRequired()])
    id_nivelEdu = StringField("Educación: ", validators=[DataRequired()])
    id_ocupacion = StringField("Ocupacion: ", validators=[DataRequired()])
    ingresos_mensuales = FloatField("Ingresos Mensuales: ", validators={NumberRange(min=0.0, max=None)})
    curp = StringField("Curp: ", validators=[DataRequired(), Length(min=18, max=18)])
    tel_cel = TelField("Tel Cel: ", validators=[DataRequired(), Length(min=10, max=10)])
    tel_casa = TelField("Tel Casa: ", validators=[Length(min=10, max=10)])
    email = EmailField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired(),
                                                    Length(min=5, max=50), 
                                                    EqualTo('password_confirm', 
                                                            message='Las contraseñas deben coincidir')])
    password_confirm = PasswordField('Password Confirm', validators=[DataRequired()])
    calle = StringField("Calle: ", validators=[DataRequired(), Length(min=4, max=50)])
    num_ext = IntegerField("Número Exterior: ", validators=[DataRequired(), NumberRange(min=0, max=None)])
    num_int = IntegerField("Número Interior: ", validators=[DataRequired(), NumberRange(min=0, max=None)])
    submit = SubmitField("Registrar")

    ######## Validar Correo Unico #########
    def validate_email(self, field):
        ######## Consultar si el correo existe en la base de datos #######
        if User.check_email(field.data):
            raise ValidationError('El correo ya existe')

class LoginForm(FlaskForm):
    email = EmailField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Ingresar')

