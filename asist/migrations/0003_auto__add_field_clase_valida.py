# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Clase.valida'
        db.add_column('asist_clase', 'valida',
                      self.gf('django.db.models.fields.BooleanField')(default=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Clase.valida'
        db.delete_column('asist_clase', 'valida')


    models = {
        'asist.alumno': {
            'Meta': {'object_name': 'Alumno'},
            'apellido': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'asistencias': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['asist.Clase']", 'through': "orm['asist.Asistencia']", 'symmetrical': 'False'}),
            'cedula': ('django.db.models.fields.CharField', [], {'max_length': '9'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'seccion': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['asist.Seccion']"})
        },
        'asist.asistencia': {
            'Meta': {'unique_together': "(('alumno', 'clase'),)", 'object_name': 'Asistencia'},
            'alumno': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['asist.Alumno']"}),
            'clase': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['asist.Clase']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'punto': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        },
        'asist.clase': {
            'Meta': {'object_name': 'Clase'},
            'descripcion': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'fecha': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lugar': ('django.db.models.fields.CharField', [], {'default': "'L'", 'max_length': '1'}),
            'valida': ('django.db.models.fields.BooleanField', [], {'default': 'True'})
        },
        'asist.seccion': {
            'Meta': {'object_name': 'Seccion'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'materia': ('django.db.models.fields.CharField', [], {'max_length': '3'}),
            'numero': ('django.db.models.fields.IntegerField', [], {}),
            'periodo': ('django.db.models.fields.CharField', [], {'max_length': '4'}),
            'profesor': ('django.db.models.fields.CharField', [], {'max_length': '2'})
        }
    }

    complete_apps = ['asist']