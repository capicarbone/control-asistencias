
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, redirect
from django.template import RequestContext

from models import Alumno, Seccion, Clase, Asistencia

from forms import ClaseForm

import random

def seccion(request, offset):

	s = Seccion.objects.get(numero=int(offset))

	
	secciones = Seccion.objects.all()
	secciones.actual = s
	alumnos = Alumno.objects.filter(seccion=s.id).order_by('nombre')

	for al in alumnos:
		al.asistencias_total = random.randrange(1,14)
		al.acum = int(al.asistencias_total*100 / 14)
		al.nota = int(al.asistencias_total*5/14)

	return render_to_response('consulta_seccion.html', {'alumnos': alumnos,'secciones': secciones}, context_instance=RequestContext(request) )


def registro_asistencias(request):

	alumnosSeccion = []
	secciones = Seccion.objects.all()
	for s in secciones:
		a = Alumno.objects.filter(seccion=s.id).order_by('nombre')
		alumnosSeccion.append(a)
	
	return render_to_response('registro_clase.html', {'secciones' : secciones , 
		'alumnosSeccion': alumnosSeccion}, 
		context_instance=RequestContext(request))

def consultar_clases(request):

	if ( request.method == 'POST'):
		claseForm = ClaseForm(request.POST)		
		if claseForm.is_valid():
			nwClase = claseForm.save()		
			return redirect('clase/asistencias/' + str(nwClase.id) )	
			
	else:
		claseForm = ClaseForm()

	clases = Clase.objects.all()
	secciones = Seccion.objects.all()

	for c in clases:
		c.asistentes = Asistencia.objects.filter(clase=c.id).count()
	
	user = request.user	

	if user.is_superuser == True:
		admin = True
	else:
		admin = False

	return render_to_response('consulta_clases.html' , 
		{'clases': clases, 'secciones': secciones, 'admin': admin , 'claseForm' : claseForm },
		context_instance=RequestContext(request))

def registro_asistencias(request, clase_num):

	alumnos = Alumno.objects.all().order_by('nombre')
	clase = Clase.objects.get(pk=clase_num)
	secciones = Seccion.objects.all().order_by('numero')

	return render_to_response('registro_asistencia.html', 
		{'secciones': secciones, 'alumnos': alumnos, 'clase': clase},
		context_instance=RequestContext(request))








