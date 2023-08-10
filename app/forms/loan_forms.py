from flask_wtf import FlaskForm
from wtforms import IntegerField, SubmitField, FloatField
from wtforms.validators import DataRequired, Length, NumberRange

class LoanForm(FlaskForm):
    monto = FloatField("Monto: ", validators=[DataRequired(), NumberRange(min=500, max=20000)])  
    periodo = IntegerField("Periodo: ", validators=[DataRequired(), NumberRange(min=2, max=12)])
    modalidad_pago = IntegerField("Modalidad Pago: ", validators=[DataRequired(), NumberRange(min=1, max=2)])
    submit = SubmitField("Continuar")
  
   


