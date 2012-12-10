from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'control_asistencias.views.home', name='home'),
    # url(r'^control_asistencias/', include('control_asistencias.foo.urls')),
    url(r'^$', 'asist.views.inicio'),   
    url(r'^seccion/(\d{1,2})/$', 'asist.views.seccion'),    
    url(r'^clases$', 'asist.views.consultar_clases'),
    url(r'^clases/(\d+)/asistencias/$', 'asist.views.registro_asistencias'),
    url(r'^clases/(\d+)', 'asist.views.consulta_clase'),
    url(r'^seccion/(\d+)/alumno/(\d+)$', 'asist.views.consulta_alumno'),
    url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    
    url(r'^admin/', include(admin.site.urls)),
)
