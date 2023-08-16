from flask_wtf import FlaskForm
from wtforms import SubmitField, FloatField, RadioField, SelectField
from wtforms.validators import DataRequired, NumberRange

from models.loans import Loan

class LoanForm(FlaskForm):
    monto = FloatField("Monto:", validators=[
            DataRequired(message="Campo Obligatrio"),
            NumberRange(min=500, max=20000, message="Ingresa el monto entre $500 y $20,000")
    ])  
    periodo = RadioField("Periodo del Préstamo: ", 
                        choices=['2','4','6','8','10','12'],
                        validators=[DataRequired(message="Campo Obligatrio")
    ])
    modalidad_pago = Loan.get_modalidad
    modalidad_pago = SelectField("Modalidad de Pago: ",
                                 choices=modalidad_pago,
                                 coerce=int,
                                 validate_choice=False, 
                                 validators=[DataRequired(message="Campo Obligatrio")
    ])
    submit = SubmitField("Continuar")
  
   


