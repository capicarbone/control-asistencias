

// Esta archivo requiere de Backbone.js
(function(){

	window.ca = {};

	var AlumnoModel = Backbone.Model.extend({

		defaults:{
			nombre: '',			
			apellido: '',
			cedula: '',
			seccion: ''
		}		
	});

	var AlumnoView = Backbone.View.extend({

		AlumnoModel: null,
		alumno: null,

		initialize: function(){
			this.AlumnoModel = this.options.ModelPrimario;
			this.alumno = new this.AlumnoModel();

			var nombre_completo = this.$('.alumno_nombre_completo')[0].innerText.split(" ")			
			this.alumno.set('nombre',nombre_completo[0])
			this.alumno.set('apellido', nombre_completo[1])			
		},

		auto_filtrar: function(busqueda){

			regex = "^\\D*" + busqueda + "\\D*";

			if (this.alumno.get('nombre').match(regex) || this.alumno.get('apellido').match(regex))
				console.log(this.alumno.get('nombre'));
		}

	});

	var BusquedaView = Backbone.View.extend({

		AlumnoView: null,
		alumnos: null,

		initialize: function(){

			this.AlumnoView = this.options.view
			alumnos = new this.AlumnoView({
				el: ".alumno",
				ModelPrimario: this.options.AlumnoModel
			});

		},

		events:{
			"change .form-search" : "filtar_alumnos"
		},

		filtar_alumnos: function(){

			//console.log(this.$(".search-query")[0].value)
			alumnos.auto_filtrar(this.$(".search-query")[0].value);
		}
	});

	window.ca.busqueda = new BusquedaView({
		el: ".container",
		AlumnoModel: AlumnoModel,
		view: AlumnoView
	});

}())