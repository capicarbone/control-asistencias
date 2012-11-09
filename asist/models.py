#encoding:utf-8 

from django.db import models


class Clase(models.Model):

	"""Datos de una clase"""

	LUGARES = (
		('S', 'Salón de clases'),
		('L' , 'Laboratorio')
	)

	fecha = models.DateField(auto_now_add=True, help_text="Fecha de realización de la clase.")
	descripcion = models.TextField(blank=True, help_text="Cotenido visto en clase.")
	lugar = models.CharField(choices=LUGARES, help_text="Lugar de realización de la clase.")

class Alumno(models.Model):
	"""Datos de un alumno"""
	
	nombre = models.CharField(max_length=30, help_text="Nombre del alumno.")
	apellido = models.CharField(max_length=30, help_text="Apellido de la clase.")
	cedula = models.CharField(max_length=9, help_text="Cédula del Alumno")
	seccion = models.ForeignKey("Seccion")
	asistencias = models.ManyToManyField(Clase, through='Asistencia')

class Asistencia(models.Model):

	"""Una asistencia, especifica si logro puntuación en esa práctica."""
	
	alumno = models.ForeignKey('Alumno')
	clase = models.ForeignKey('Clase')
	punto = models.BooleanField()

class Seccion(models.Model):

	"""Sección de programación """

	PROFESORES = (
		('AL', 'Andrés Lillo'),
		('OS', 'Oscar Salazar')
	)

	MATERIA = (
		('PII', 'Programacion II' ),
		('PI', 'Programación I'),
		('ED', 'Estructura de datos')
	)

	PERIODOS = (
		('12II' , '2012-II'),
		('13I' , '2013-I')
	)

	profesor = models.CharField(choices=PROFESORES)
	materia = models.CharField(choices=MATERIA)
	numero = models.IntegerField()
	periodo = models.CharField(max_length=4, choices=PERIODOS)













