from flask import Blueprint, render_template, flash, redirect, url_for

from models.users import User

from forms.user_forms import RegisterForm, LoginForm

user_views = Blueprint('user',__name__)

@user_views.route('/registro/', methods = ['GET', 'POST'])
def register():
    form = RegisterForm()

    if form.validate_on_submit():
        nombre = form.nombre.data
        ape_pat = form.ape_pat.data
        ape_mat = form.ape_mat.data
        id_genero = form.id_genero.data
        fecha_nacimiento = form.fecha_nacimiento.data
        id_nivelEdu = form.id_nivelEdu.data
        id_ocupacion = form.id_ocupacion.data
        ingresos_mensuales = form.ingresos_mensuales.data
        curp = form.curp.data
        tel_cel = form.tel_cel.data
        tel_casa = form.tel_casa.data
        email = form.email.data
        password = form.password.data
        calle = form.calle.data
        num_ext = form.num_ext.data
        num_int = form.num_int.data

        user = User(nombre, ape_pat, ape_mat, id_genero, fecha_nacimiento, id_nivelEdu, id_ocupacion, ingresos_mensuales, curp, tel_cel, tel_casa, email, password, calle, num_ext, num_int)
        user.save()
        flash ('Registro Exitoso')

        return redirect(url_for('home.loan'))
    
    return render_template('auth/register.html', form = form)


@user_views.route('/login/', methods = ['GET', 'POST'])
def login():
    form = LoginForm()
        
    if form.validate_on_submit():
        email = form.email.data
        password = form.password.data
        user = User.get_by_password(email, password)
        if not user:
            flash('Verifica tus Datos')
        else:
            return render_template('home/loan.html', user=user)
    return render_template('auth/login.html', form=form)


    
