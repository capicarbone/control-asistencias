
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, redirect
from django.template import RequestContext

from models import Alumno, Seccion, Clase, Asistencia

from forms import ClaseForm

import random

NUM_SEMANAS = 10

def seccion(request, offset):

	s = Seccion.objects.get(numero=int(offset))
	
	secciones = Seccion.objects.all()
	secciones.actual = s
	alumnos = Alumno.objects.filter(seccion=s.id).order_by('nombre')

	for al in alumnos:
		al.asistencias_total = Asistencia.objects.filter(alumno=al.id).filter(punto=True).count()
		al.acum = int(al.asistencias_total*100 / NUM_SEMANAS)
		al.nota = int(al.asistencias_total*5/ NUM_SEMANAS)

	return render_to_response('consulta_seccion.html', 
		{'alumnos': alumnos,'secciones': secciones, 'num_semanas': NUM_SEMANAS}, 
		context_instance=RequestContext(request) )


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
		{'clases': clases, 'secciones': secciones, 'admin': admin , 'claseForm' : claseForm, 'clases_pag': True },
		context_instance=RequestContext(request))

def registro_asistencias(request, clase_num):

	alumnos = Alumno.objects.all().order_by('nombre')

	if request.method == 'POST':
		form = request.POST
		clase_id = clase_num
		for alumno in alumnos:			
			if form.get('participacion_' + str(alumno.id)):							
				a = Asistencia(clase_id=clase_id, alumno_id=alumno.id, punto=True)
				a.save()
			elif form.get('asistencia_' + str(alumno.id)):
				a = Asistencia(clase_id=clase_id, alumno_id=alumno.id, punto=False)
				a.save()

		return redirect('/clases')

	clase = Clase.objects.get(pk=clase_num)
	secciones = Seccion.objects.all().order_by('numero')

	return render_to_response('registro_asistencia.html', 
		{'secciones': secciones, 'alumnos': alumnos, 'clase': clase, 'clases_pag': True },
		context_instance=RequestContext(request))








