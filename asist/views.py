
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext

from models import Alumno, Seccion

def seccion(request, offset):
	s = Seccion.objects.get(numero=int(offset))
	alumnos = Alumno.objects.filter(seccion=s.id)
	return render_to_response('base.html', {'alumnos': alumnos})

