
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext

from models import Alumno, Seccion

import random

def seccion(request, offset):


	s = Seccion.objects.get(numero=int(offset))

	
	secciones = Seccion.objects.all()
	alumnos = Alumno.objects.filter(seccion=s.id).order_by('nombre')

	for al in alumnos:
		al.asistencias_total = random.randrange(1,14)
		al.acum = int(al.asistencias_total*100 / 14)
		al.nota = int(al.asistencias_total*5/14)

	return render_to_response('base.html', {'alumnos': alumnos, 'seccion': s , 'secciones': secciones}, context_instance=RequestContext(request) )

