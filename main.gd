extends Node2D

# --- 1. REFERENCIAS DE INTERFAZ GENERAL ---

@onready var label_dia = $CapaUI/PanelStats/VBoxContainer/LabelDia
@onready var label_dinero = $CapaUI/PanelStats/VBoxContainer/LabelDinero
@onready var label_energia = $CapaUI/PanelStats/VBoxContainer/LabelEnergia
@onready var label_estres = $CapaUI/PanelStats/VBoxContainer/LabelEstres 
@onready var label_ego = $CapaUI/PanelStats/VBoxContainer/LabelEgo       
@onready var label_nivel = $CapaUI/PanelStats/VBoxContainer/LabelNivel
@onready var label_stats = $CapaUI/PanelStats/VBoxContainer/LabelStats
@onready var label_arquetipo = $CapaUI/PanelStats/VBoxContainer/LabelArquetipo
@onready var label_proyectos = $CapaUI/PanelStats/VBoxContainer/LabelProyectos # <--- NUEVO MEDIDOR
@onready var panel_level_up = $CapaUI/PanelLevelUp
# --- REFERENCIAS CARTAS / BALASIM ---
@onready var panel_app_mazo = $CapaUI/PanelSimPhone/PanelAppMazo
@onready var contenedor_lista_mazo = $CapaUI/PanelSimPhone/PanelAppMazo/VBoxContainer/ScrollContainer/ContenedorListaMazo
@onready var btn_trabajar = $CapaUI/PanelStats/VBoxContainer/BotonTrabajar
@onready var btn_ensayar = $CapaUI/PanelStats/VBoxContainer/BotonEnsayar
@onready var btn_llamado = $CapaUI/PanelStats/VBoxContainer/BtnLlamado
@onready var panel_info_stats = $CapaUI/PanelInfoStats
@onready var panel_game_over = $CapaUI/PanelGameOver
@onready var btn_reiniciar_juego = $CapaUI/PanelGameOver/VBoxContainer/BtnReiniciarJuego
# --- REFERENCIAS ACADEMIA ---
@onready var panel_app_academia = $CapaUI/PanelSimPhone/PanelAppAcademia
# --- REFERENCIAS DEL SIMPHONE ---
@onready var panel_simphone = $CapaUI/PanelSimPhone
@onready var contenedor_menu_inicio = $CapaUI/PanelSimPhone/ContenedorMenuInicio
@onready var panel_app_agenda = $CapaUI/PanelSimPhone/PanelAppAgenda
@onready var grid_calendario = $CapaUI/PanelSimPhone/PanelAppAgenda/VBoxContainer/GridCalendario
@onready var panel_app_castings = $CapaUI/PanelSimPhone/PanelAppCastings
@onready var contenedor_lista_castings = $CapaUI/PanelSimPhone/PanelAppCastings/VBoxContainer/ContenedorListaCastings
@onready var panel_confirmacion = $CapaUI/PanelSimPhone/PanelAppCastings/PanelConfirmacion
@onready var label_detalles_casting = $CapaUI/PanelSimPhone/PanelAppCastings/PanelConfirmacion/VBoxContainer/LabelDetallesCasting
@onready var grid_calendario_confirmacion = $CapaUI/PanelSimPhone/PanelAppCastings/PanelConfirmacion/VBoxContainer/GridCalendarioConfirmacion
@onready var btn_negociar_fechas = $CapaUI/PanelSimPhone/PanelAppCastings/PanelConfirmacion/VBoxContainer/BtnNegociarFechas
@onready var btn_confirmar_casting = $CapaUI/PanelSimPhone/PanelAppCastings/PanelConfirmacion/VBoxContainer/HBoxContainer/BtnConfirmarCasting

@onready var panel_app_tienda = $CapaUI/PanelSimPhone/PanelAppTienda
@onready var btn_comprar_cafe = $CapaUI/PanelSimPhone/PanelAppTienda/VBoxContainer/BtnComprarCafe

# --- REFERENCIAS REDES SOCIALES Y SEGUIDORES ---
@onready var panel_app_redes = $CapaUI/PanelSimPhone/PanelAppRedes
@onready var label_metricas_redes = $CapaUI/PanelSimPhone/PanelAppRedes/VBoxContainer/LabelMeticasRedes
@onready var btn_publicar_post = $CapaUI/PanelSimPhone/PanelAppRedes/VBoxContainer/BtnPublicarPost
@onready var btn_ir_networking = $CapaUI/PanelSimPhone/PanelAppRedes/VBoxContainer/BtnIrNetworking
@onready var panel_lista_seguidores = $CapaUI/PanelSimPhone/PanelAppRedes/PanelListaSeguidores
@onready var label_lista_seguidores = $CapaUI/PanelSimPhone/PanelAppRedes/PanelListaSeguidores/VBoxContainer/LabelListaSeguidores
@onready var contenedor_feed = $CapaUI/PanelSimPhone/PanelAppRedes/ScrollFeed/ContenedorFeed

# --- REFERENCIAS SELECCIÓN DE REELS ---
@onready var panel_seleccion_reel = $CapaUI/PanelSimPhone/PanelAppRedes/PanelSeleccionReel
@onready var contenedor_opciones_reel = $CapaUI/PanelSimPhone/PanelAppRedes/PanelSeleccionReel/VBoxContainer/ContenedorOpcionesReel
# --- REFERENCIAS MOTOR BALASIM ---
@onready var panel_balasim = $CapaUI/PanelBalasim
@onready var label_jefe = $CapaUI/PanelBalasim/LabelJefe
@onready var label_poder_jugador = $CapaUI/PanelBalasim/LabelPoderJugador
@onready var contenedor_mano = $CapaUI/PanelBalasim/ContenedorMano
@onready var btn_actuar = $CapaUI/PanelBalasim/BtnActuar
@onready var btn_mulligan = $CapaUI/PanelBalasim/BtnMulligan
var mulligans_restantes = 0
var poder_acumulado_turno = 0
var exigencia_director = 0
var cartas_jugadas_turno = 0
var max_cartas_jugables = 2
var cartas_jugadas_ids = [] # <--- NUEVO: Guarda el ID para buscar combos
# --- REFERENCIAS CONTACTOS Y BOOK ---
@onready var panel_app_contactos = $CapaUI/PanelSimPhone/PanelAppContactos
@onready var contenedor_lista_contactos = $CapaUI/PanelSimPhone/PanelAppContactos/VBoxContainer/ContenedorListaContactos

# --- REFERENCIAS BOOK ---
@onready var panel_app_book = $CapaUI/PanelSimPhone/PanelAppBook
@onready var contenedor_lista_book = $CapaUI/PanelSimPhone/PanelAppBook/VBoxContainer/ScrollContainer/ContenedorListaBook

# --- REFERENCIAS INMOBILIARIA (¡NUEVO!) ---
@onready var panel_app_inmobiliaria = $CapaUI/PanelSimPhone/PanelAppInmobiliaria
# --- REFERENCIAS PRODUCTORA (NUEVO) ---
@onready var panel_app_productora = $CapaUI/PanelSimPhone/PanelAppProductora
@onready var contenedor_lista_productora = $CapaUI/PanelSimPhone/PanelAppProductora/VBoxContainer/ScrollContainer/ContenedorListaProductora
@onready var input_nombre_compania = $CapaUI/PanelSimPhone/PanelAppProductora/VBoxContainer/HBoxContainer/InputNombreCompania
@onready var contenedor_lista_espacios = $CapaUI/PanelSimPhone/PanelAppInmobiliaria/VBoxContainer/ScrollContainer/ContenedorListaEspacios
# --- REFERENCIAS POP-UP EVENTOS Y MINIJUEGOS ---
@onready var panel_tecnicos = $CapaUI/PanelTecnicos
@onready var btn_tec_excelente = $CapaUI/PanelTecnicos/VBoxContainer/BtnTecExcelente
@onready var btn_tec_normal = $CapaUI/PanelTecnicos/VBoxContainer/BtnTecNormal
@onready var btn_tec_nada = $CapaUI/PanelTecnicos/VBoxContainer/BtnTecNada
@onready var panel_evento_matutino = $CapaUI/PanelEventoMatutino
@onready var label_titulo_evento = $CapaUI/PanelEventoMatutino/VBoxContainer/LabelTituloEvento
@onready var label_desc_evento = $CapaUI/PanelEventoMatutino/VBoxContainer/LabelDescEvento
@onready var btn_aceptar_evento = $CapaUI/PanelEventoMatutino/VBoxContainer/BtnAceptarEvento 

@onready var panel_rutina = $CapaUI/PanelRutina
@onready var label_titulo_rutina = $CapaUI/PanelRutina/LabelTituloRutina
@onready var cursor_barra = $CapaUI/PanelRutina/FondoBarra/CursorBarra
@onready var zona_exito = $CapaUI/PanelRutina/FondoBarra/ZonaExito

@onready var panel_minijuego = $CapaUI/PanelMinijuego
@onready var label_titulo_trabajo = $CapaUI/PanelMinijuego/VBoxContainer/LabelTituloTrabajo
@onready var label_tiempo = $CapaUI/PanelMinijuego/VBoxContainer/LabelTiempo
@onready var label_guion = $CapaUI/PanelMinijuego/VBoxContainer/LabelGuion
@onready var timer_minijuego = $CapaUI/PanelMinijuego/TimerMinijuego
@onready var btn_opcion_1 = $CapaUI/PanelMinijuego/VBoxContainer/ContenedorOpcionesMemoria/BtnOpcion1
@onready var btn_opcion_2 = $CapaUI/PanelMinijuego/VBoxContainer/ContenedorOpcionesMemoria/BtnOpcion2
@onready var btn_opcion_3 = $CapaUI/PanelMinijuego/VBoxContainer/ContenedorOpcionesMemoria/BtnOpcion3
@onready var panel_coach = $CapaUI/PanelSimPhone/PanelAppMazo/PanelCoach
@onready var cont_lista_coach = $CapaUI/PanelSimPhone/PanelAppMazo/PanelCoach/ScrollContainer/ContListaCoach
# --- VARIABLES GLOBALES ---
# --- VARIABLES DE ESTADO DE BATALLA ---
var poder_total_encuentro = 0   # Puntos acumulados entre rondas
var seleccion_actual_nodos = [] # Botones seleccionados ahora mismo
var seleccion_actual_ids = []   # IDs de las cartas seleccionadas
var rondas_restantes = 0        # Cuántos intentos te quedan
var tiempo_restante = 0.0 
var respuesta_correcta = ""
var casting_en_progreso = ""
var casting_seleccionado_temp = "" 
var desplazamiento_fechas = 0 # Cuántos días negociaste
var dias_propuestos_temp = [] # Las fechas exactas que parpadean
var casting_data_actual = {} 
var proyecto_a_ensayar = "" # Para saber qué obra elegiste estudiar
@onready var panel_seleccion_ensayo = $CapaUI/PanelSeleccionEnsayo
@onready var contenedor_opciones_ensayo = $CapaUI/PanelSeleccionEnsayo/VBoxContainer/ContenedorOpcionesEnsayo
var castings_de_hoy = [] 
var rutina_activa = false
var tipo_rutina = ""
var cursor_velocidad = 500 
var cursor_direccion = 1

var ha_trabajado_hoy = false
var ha_publicado_hoy = false
var ha_ido_mixer_hoy = false
var cafes_tomados_hoy = 0 # <--- NUEVA VARIABLE DE LÍMITE

var lineas_guion = [
	{"texto": "Ser o no ser, ahí está el [___].", "correcta": "detalle", "incorrectas": ["dilema", "problema"]},
	{"texto": "¡No puedes manejar la [___]!", "correcta": "verdad", "incorrectas": ["presión", "mentira"]},
	{"texto": "Luke, yo soy tu [___].", "correcta": "padre", "incorrectas": ["tío", "amigo"]},
	{"texto": "Siempre nos quedará [___].", "correcta": "París", "incorrectas": ["Londres", "Madrid"]}
]

# --- 2. INICIO DEL JUEGO ---
func _ready():
	panel_app_academia.visible = false
	panel_balasim.visible = false
	panel_app_mazo.visible = false
	panel_level_up.visible = false
	panel_simphone.visible = false 
	panel_app_agenda.visible = false
	panel_app_castings.visible = false
	panel_app_redes.visible = false
	panel_app_tienda.visible = false
	panel_evento_matutino.visible = false
	panel_minijuego.visible = false
	panel_confirmacion.visible = false
	panel_rutina.visible = false 
	panel_info_stats.visible = false
	panel_game_over.visible = false 
	panel_lista_seguidores.visible = false
	panel_app_contactos.visible = false
	panel_app_book.visible = false
	panel_tecnicos.visible = false 
	panel_seleccion_reel.visible = false # <--- OCULTAMOS SELECCION DE REEL
	panel_seleccion_ensayo.visible = false
	
	generar_castings_del_dia()
	recalcular_stats_pasivos()
	actualizar_interfaz()
	dibujar_feed_redes()

func _process(delta):
	if rutina_activa:
		cursor_barra.position.x += cursor_velocidad * cursor_direccion * delta
		if cursor_barra.position.x >= 290:
			cursor_barra.position.x = 290
			cursor_direccion = -1
		elif cursor_barra.position.x <= 0:
			cursor_barra.position.x = 0
			cursor_direccion = 1

# --- DIARIO Y FEED DE SIMGRAM ---
func publicar_auto(texto: String):
	var post = {"dia": Datos.tiempo["dia"], "mensaje": texto}
	Datos.historial_posts.push_front(post)
	if Datos.historial_posts.size() > 20:
		Datos.historial_posts.pop_back()
	dibujar_feed_redes()

func dibujar_feed_redes():
	for hijo in contenedor_feed.get_children(): hijo.queue_free()
	
	if Datos.historial_posts.is_empty():
		var lbl = Label.new()
		lbl.text = "Aún no has publicado nada."
		lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
		contenedor_feed.add_child(lbl)
		return
		
	for post in Datos.historial_posts:
		var lbl = Label.new()
		lbl.text = "Día " + str(post["dia"]) + " | Tú: \n" + post["mensaje"] + "\n---"
		lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
		lbl.modulate = Color(0.8, 0.8, 1.0)
		contenedor_feed.add_child(lbl)

# --- 3. ACTUALIZACIÓN DE ESTADO ---
func recalcular_stats_pasivos():
	var nueva_energia_max = 3 + (Datos.habilidades_actor["expresion_corporal"] - 1)
	
	# --- BUFF: ACTOR FÍSICO ---
	if obtener_arquetipo_dominante() == "fisico":
		nueva_energia_max += 1 
		
	if nueva_energia_max > Datos.stats_actor["energia_maxima"]:
		var diferencia = nueva_energia_max - Datos.stats_actor["energia_maxima"]
		Datos.stats_actor["energia_maxima"] = nueva_energia_max
		Datos.stats_actor["energia_actual"] += diferencia 
	var tamano_base = 40
	zona_exito.size.x = tamano_base + (Datos.habilidades_actor["tecnica_vocal"] * 8)
		
	

func actualizar_interfaz():
	label_dia.text = "Día: " + str(Datos.tiempo["dia"])
	label_dinero.text = "Dinero: $" + str(Datos.economia["dinero"])
	if Datos.economia["dinero"] < 0: label_dinero.modulate = Color(1.0, 0.2, 0.2)
	else: label_dinero.modulate = Color(1.0, 1.0, 1.0)
		
	label_energia.text = "Energía: " + str(Datos.stats_actor["energia_actual"]) + "/" + str(Datos.stats_actor["energia_maxima"])
	
	label_estres.text = "Estrés: " + str(Datos.stats_actor["estres"]) + "/100"
	if Datos.stats_actor["estres"] >= 80: label_estres.modulate = Color(1.0, 0.2, 0.2) # Rojo peligro
	else: label_estres.modulate = Color(1.0, 1.0, 1.0)
		
	label_ego.text = "Ego: " + str(Datos.stats_actor["ego"]) + "/100"
	if Datos.stats_actor["ego"] >= 60: label_ego.modulate = Color(1.0, 0.8, 0.2) # Dorado Divo
	else: label_ego.modulate = Color(1.0, 1.0, 1.0)
	
	label_nivel.text = "Nivel: " + str(Datos.habilidades_actor["nivel_general"]) + " (XP: " + str(Datos.habilidades_actor["xp_actual"]) + "/" + str(Datos.habilidades_actor["xp_requerida"]) + ")"
	# --- ACTUALIZAR TÍTULO DE ARQUETIPO ---
	var arq = obtener_arquetipo_dominante()
	var texto_arq = "Perfil: Versátil (Sin bonos)"
	if arq == "metodo": texto_arq = "Perfil: Método (+50% XP, +15 Estrés)"
	elif arq == "fisico": texto_arq = "Perfil: Físico (+1 Energía, -20% Pagos)"
	elif arq == "forma": texto_arq = "Perfil: Clásico (Anti-Sabotaje, -50% Fans)"
	elif arq == "comercial": texto_arq = "Perfil: Comercial (+50% Dinero, Ego x2)"
	elif arq == "instinto": texto_arq = "Perfil: Instintivo (+2s en Minijuegos, -50% XP)"
	label_arquetipo.text = texto_arq
	label_stats.text = "Voz: " + str(Datos.habilidades_actor["tecnica_vocal"]) + "\nCuerpo: " + str(Datos.habilidades_actor["expresion_corporal"]) + "\nCarisma: " + str(Datos.habilidades_actor["carisma"]) + "\nMemoria: " + str(Datos.habilidades_actor["memoria"])

	if ha_trabajado_hoy:
		btn_trabajar.text = "Mesero (Turno Completo) 🔒"
		btn_trabajar.disabled = true
	else:
		btn_trabajar.text = "Trabajar de Mesero (-2 E)"
		btn_trabajar.disabled = false
		
	# --- LÓGICA ENSAYO CONTEXTUAL Y BARRA DE PROGRESO ---
	var llaves_activas = Datos.proyectos_activos.keys()
	llaves_activas.erase("temp")
	
	if llaves_activas.size() > 0:
		var texto_medidor = "\n📋 PROYECTOS ACTIVOS:\n"
		
		for id_proy in llaves_activas:
			var proy = Datos.proyectos_activos[id_proy]
			var nombre = proy["titulo_unico"].split("\n")[1]
			
			# Calculamos el % de preparación
			var max_rend = float((proy["dias_de_trabajo"] - 1) + 2)
			var actual = float(proy["rendimiento_acumulado"])
			var porcentaje = clamp((actual / max_rend) * 100.0, 0.0, 100.0)
			
			# Calculamos las estrellas estimadas actuales
			var estrellas_est = clamp(int((actual / max_rend) * 5), 1, 5)
			var txt_est = ""
			for e in range(estrellas_est): txt_est += "⭐"
			
			texto_medidor += "🎬 " + nombre + "\n"
			texto_medidor += "   Preparación: " + str(snapped(porcentaje, 1)) + "% (" + txt_est + ")\n"
			
		label_proyectos.text = texto_medidor
		label_proyectos.visible = true
		
		# Modificamos el botón de ensayar
		btn_ensayar.text = "Repasar Guiones (-1 E)"
	else:
		label_proyectos.visible = false
		btn_ensayar.text = "Ensayar Monólogo Libre (-1 E)"
		
	if ha_publicado_hoy:
		btn_publicar_post.text = "Reel (Hecho hoy) 🔒"
		btn_publicar_post.disabled = true
	else:
		btn_publicar_post.text = "Subir Reel (-1 E)"
		btn_publicar_post.disabled = false
		
	if ha_ido_mixer_hoy:
		btn_ir_networking.text = "Networking (Hecho hoy) 🔒"
		btn_ir_networking.disabled = true
	else:
		btn_ir_networking.text = "Ir a Mixer (-2 E, -$20)"
		btn_ir_networking.disabled = false

	var dia_hoy = Datos.tiempo["dia"]
	if Datos.agenda.has(dia_hoy):
		var evento_hoy = Datos.agenda[dia_hoy]
		if evento_hoy.begins_with("Lectura_"):
			btn_llamado.text = "📖 LECTURA GUION (-1 E)"
			btn_llamado.visible = true; btn_trabajar.visible = false; btn_ensayar.visible = false
		elif evento_hoy.begins_with("Tecnico_"):
			btn_llamado.text = "💡 ENSAYO TÉCNICO (-1 E)"
			btn_llamado.visible = true; btn_trabajar.visible = false; btn_ensayar.visible = false
		elif evento_hoy.begins_with("EnsayoCast_"):
			btn_llamado.text = "🎭 ENSAYO GENERAL (-1 E)"
			btn_llamado.visible = true; btn_trabajar.visible = false; btn_ensayar.visible = false
		elif evento_hoy.begins_with("Grabacion_"):
			btn_llamado.text = "🎬 IR A FUNCIÓN/SET (-1 E)"
			btn_llamado.visible = true; btn_trabajar.visible = false; btn_ensayar.visible = false
		else:
			btn_llamado.visible = false; btn_trabajar.visible = true; btn_ensayar.visible = true
	else:
		btn_llamado.visible = false; btn_trabajar.visible = true; btn_ensayar.visible = true
		
	comprobar_bancarrota()

func comprobar_bancarrota():
	if Datos.economia["dinero"] <= -1000:
		panel_game_over.visible = true

func _on_btn_reiniciar_juego_pressed():
	Datos.reiniciar_datos() 
	get_tree().reload_current_scene() 

func mostrar_alerta(titulo, mensaje, texto_boton="Aceptar"):
	label_titulo_evento.text = titulo
	label_desc_evento.text = mensaje
	btn_aceptar_evento.text = texto_boton
	panel_evento_matutino.visible = true

func _on_btn_aceptar_evento_pressed():
	panel_evento_matutino.visible = false
	actualizar_interfaz()

func _on_btn_info_stats_pressed(): panel_info_stats.visible = true
func _on_btn_cerrar_info_pressed(): panel_info_stats.visible = false

# --- 4. MECÁNICAS DE RUTINA ---
func iniciar_skill_check(tipo):
	var costo_energia = 1
	if tipo == "trabajo": costo_energia = 2
	
	if Datos.stats_actor["energia_actual"] >= costo_energia:
		Datos.stats_actor["energia_actual"] -= costo_energia
		tipo_rutina = tipo
		panel_balasim.visible = true
		
		# --- 1. CONFIGURACIÓN DE BATALLA Y RONDAS ---
		poder_total_encuentro = Datos.habilidades_actor["carisma"] * 2 
		rondas_restantes = 3 # Base de 3 rondas
		if tipo == "trabajo": rondas_restantes = 2
		elif tipo == "funcion": rondas_restantes = 4
		
		var nombre_jefe = "Director General"
		if tipo == "trabajo":
			nombre_jefe = "Mesa 4: Cliente Problemático"
			exigencia_director = randi_range(6, 12) 
		elif tipo == "ensayo_casa":
			nombre_jefe = "El Espejo: Tu Propia Inseguridad"
			exigencia_director = randi_range(15, 25) 
		elif tipo == "casting_real":
			var nivel_req = casting_data_actual.get("nivel_minimo", 1)
			nombre_jefe = "Director de Casting: " + casting_data_actual.get("empresa", "Productora")
			exigencia_director = (nivel_req * 15) + randi_range(10, 20)
		elif tipo == "ensayo_cast" or tipo == "funcion":
			var nivel_req = casting_data_actual.get("nivel_minimo", 1)
			exigencia_director = (nivel_req * 25) + randi_range(20, 40)
			if tipo == "funcion": exigencia_director = int(exigencia_director * 2.5)

		# --- 2. RESET DE SELECCIÓN ---
		seleccion_actual_nodos.clear()
		seleccion_actual_ids.clear()
		max_cartas_jugables = 2 + int(Datos.habilidades_actor["expresion_corporal"] / 2) 
		mulligans_restantes = 1 + int(Datos.habilidades_actor["nivel_general"] / 5)
		
		actualizar_ui_balasim(nombre_jefe)
		repartir_mano_balasim()
			
	else:
		mostrar_alerta("¡Exhausto!", "No tienes energía suficiente.")

# Función auxiliar para refrescar la UI de la mesa
func actualizar_ui_balasim(nombre_jefe):
	label_jefe.text = "⚔️ " + nombre_jefe + "\nExigencia: " + str(poder_total_encuentro) + " / " + str(exigencia_director)
	label_poder_jugador.text = "Rondas: " + str(rondas_restantes) + " | Seleccionadas: " + str(seleccion_actual_nodos.size()) + "/" + str(max_cartas_jugables)
	btn_actuar.text = "🎭 ¡ACTUAR! (Ronda actual)"
	btn_mulligan.text = "🔄 Redibujar (" + str(mulligans_restantes) + " rest.)"
func _on_boton_trabajar_pressed(): 
	if not ha_trabajado_hoy: iniciar_skill_check("trabajo")
func _on_boton_ensayar_pressed():
	if Datos.stats_actor["energia_actual"] < 1:
		mostrar_alerta("¡Exhausto!", "No tienes energía para ensayar.")
		return
		
	var llaves_activas = Datos.proyectos_activos.keys()
	llaves_activas.erase("temp")
	
	if llaves_activas.size() > 0:
		panel_seleccion_ensayo.visible = true
		for hijo in contenedor_opciones_ensayo.get_children(): hijo.queue_free()
		
		# Opción 1: Monólogo (Solo XP, sin afectar proyectos)
		var btn_mono = Button.new()
		btn_mono.text = "🎭 Monólogo Libre (Solo XP)"
		btn_mono.pressed.connect(iniciar_ensayo_seleccionado.bind(""))
		contenedor_opciones_ensayo.add_child(btn_mono)
		
		# Opción 2: Los Proyectos Activos
		for id_proy in llaves_activas:
			var proy = Datos.proyectos_activos[id_proy]
			var nom = proy["titulo_unico"].split("\n")[1]
			var btn_proy = Button.new()
			btn_proy.text = "📖 Repasar: " + nom
			btn_proy.pressed.connect(iniciar_ensayo_seleccionado.bind(id_proy))
			contenedor_opciones_ensayo.add_child(btn_proy)
	else:
		iniciar_ensayo_seleccionado("")

func iniciar_ensayo_seleccionado(id_proy):
	panel_seleccion_ensayo.visible = false
	proyecto_a_ensayar = id_proy
	iniciar_skill_check("ensayo_casa")

func _on_btn_cancelar_ensayo_pressed():
	panel_seleccion_ensayo.visible = false

func resolver_rutina_general(fue_exito):
	rutina_activa = false
	panel_rutina.visible = false
	
	# --- LÓGICA DE AUDICIÓN REAL (BALASIM) ---
	if tipo_rutina == "casting_real":
		if fue_exito:
			# VICTORIA: Se agenda el proyecto (Tu lógica original de firma)
			var c = casting_data_actual
			var id_unico = c["id_unico"]
			Datos.proyectos_activos[id_unico] = c
			
			# Agendamos los días en el calendario
			var dias_totales = c["dias_de_trabajo"]
			for i in range(dias_totales):
				var dia_agendado = dias_propuestos_temp[i]
				if i == 0 and dias_totales > 1: Datos.agenda[dia_agendado] = "Lectura_" + id_unico
				elif i == dias_totales - 2 and dias_totales > 2: Datos.agenda[dia_agendado] = "Tecnico_" + id_unico
				elif i == dias_totales - 1: Datos.agenda[dia_agendado] = "Grabacion_" + id_unico
				else: Datos.agenda[dia_agendado] = "EnsayoCast_" + id_unico
			
			mostrar_alerta("✨ ¡CONTRATADO!", "Impresionaste al director. Estás dentro de: " + c["titulo_unico"].split("\n")[1])
			publicar_auto("¡Me dieron el papel! El casting fue intenso pero valió la pena. 🎭🎬")
			Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] + 10, 0, 100)
		else:
			# DERROTA: El proyecto se pierde y sube el estrés
			mostrar_alerta("❌ RECHAZADO", " 'Gracias por venir, nosotros te llamamos'. No lograste dar el perfil esta vez.")
			Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + 15, 0, 100)
		
		actualizar_interfaz()
		return # Salimos para que no intente ejecutar lógica de "Trabajo" o "Ensayo"
	
	if tipo_rutina == "trabajo":
		ha_trabajado_hoy = true
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + 15, 0, 100) # +15 Estrés
		if fue_exito:
			var pago = randi_range(60, 90) 
			if Datos.estado_actual == "suerte": pago += 30 
			elif Datos.estado_actual == "torpe": pago -= 20 
			Datos.economia["dinero"] += pago
			var hist = GestorTextos.obtener_texto("trabajo_exito")
			mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste: $" + str(pago))
		else:
			var pago = 30
			Datos.economia["dinero"] += pago
			var hist = GestorTextos.obtener_texto("trabajo_fallo")
			mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste solo: $" + str(pago))
			
	elif tipo_rutina == "ensayo_casa":
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + 5, 0, 100) # +5 Estrés
		
		# --- BOOST DE PROYECTO (El que elegiste en el menú) ---
		var texto_extra = ""
		
		if proyecto_a_ensayar != "" and Datos.proyectos_activos.has(proyecto_a_ensayar):
			var id_act = proyecto_a_ensayar
			if fue_exito:
				Datos.proyectos_activos[id_act]["rendimiento_acumulado"] += 0.5 # Medio punto de estrella
				texto_extra = "\n\n📈 Repasaste tu papel y mejoraste el rendimiento de tu obra."
			else:
				Datos.proyectos_activos[id_act]["rendimiento_acumulado"] += 0.1 
				texto_extra = "\n\n📉 Repasaste, pero te confundiste un poco con las líneas."
				
		# --- RECOMPENSA DE XP Y DROP DE CARTAS ---
		if fue_exito:
			var xp_ganada = 60
			if Datos.estado_actual == "inspirado": 
				xp_ganada *= 2 
				texto_extra += "\n✨ (XP Doble por Inspiración)"
				
			
				
			Datos.habilidades_actor["xp_actual"] += xp_ganada
			var hist = GestorTextos.obtener_texto("ensayo_casa_exito")
			mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste: +" + str(xp_ganada) + " XP" + texto_extra)
		else:
			var xp_ganada = 20
			Datos.habilidades_actor["xp_actual"] += xp_ganada
			var hist = GestorTextos.obtener_texto("ensayo_casa_fallo")
			mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste: +" + str(xp_ganada) + " XP" + texto_extra)
			
	elif tipo_rutina == "ensayo_cast":
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + 10, 0, 100) # +10 Estrés
		var titulo_obra = casting_data_actual["titulo_unico"].split("\n")[1]
		
		if fue_exito:
			var xp_ganada = 90
			if Datos.estado_actual == "inspirado": xp_ganada *= 2
			
			Datos.habilidades_actor["xp_actual"] += xp_ganada
			casting_data_actual["rendimiento_acumulado"] += 1 
			var hist = GestorTextos.obtener_texto("ensayo_cast_exito")
			mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste: +" + str(xp_ganada) + " XP")
			publicar_auto("Trabajando duro en el set de '" + titulo_obra + "'. Dando el 100%. ✨")
		else:
			Datos.habilidades_actor["xp_actual"] += 30
			var hist = GestorTextos.obtener_texto("ensayo_cast_fallo")
			mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste: +30 XP")
			publicar_auto("Días difíciles trabajando en '" + titulo_obra + "'. A repasar guion. 📖")
			
		Datos.agenda.erase(Datos.tiempo["dia"]) 
		
	comprobar_level_up()
	actualizar_interfaz()

func _on_btn_llamado_pressed():
	var dia_hoy = Datos.tiempo["dia"]
	var evento_hoy = Datos.agenda[dia_hoy]
	
	if evento_hoy.begins_with("Lectura_") or evento_hoy.begins_with("Tecnico_") or evento_hoy.begins_with("EnsayoCast_"):
		# Separamos el tipo de evento del ID usando split
		var partes = evento_hoy.split("_", false, 1) 
		var tipo = partes[0] # Ej: "Lectura"
		var id_unico = partes[1]
		
		casting_data_actual = Datos.proyectos_activos[id_unico]
		iniciar_skill_check("ensayo_cast")
		
		# Personalizamos el título del minijuego según el tipo
		if tipo == "Lectura": label_titulo_rutina.text = "¡Lectura de Mesa!\nSigue el tono del Director."
		elif tipo == "Tecnico": label_titulo_rutina.text = "¡Ensayo Técnico!\nEncuentra tus marcas de luz."
		
	elif evento_hoy.begins_with("Grabacion_"):
		var id_unico = evento_hoy.replace("Grabacion_", "")
		casting_data_actual = Datos.proyectos_activos[id_unico]
		
		if casting_data_actual.has("es_propia"): panel_tecnicos.visible = true
		else: iniciar_minijuego_memoria(id_unico)
	elif evento_hoy.begins_with("Grabacion_"):
		var id_unico = evento_hoy.replace("Grabacion_", "")
		casting_data_actual = Datos.proyectos_activos[id_unico]
		
		# Si la obra es de tu Compañía Teatral, ¡tienes que pagarle a los técnicos!
		if casting_data_actual.has("es_propia"):
			panel_tecnicos.visible = true
		else:
			# Si es un trabajo de empleado normal, vas directo a grabar
			iniciar_minijuego_memoria(id_unico)

func _on_boton_dormir_pressed():
	var dia_hoy = Datos.tiempo["dia"]
	if Datos.agenda.has(dia_hoy) and (Datos.agenda[dia_hoy].begins_with("Trabajo_") or Datos.agenda[dia_hoy].begins_with("EnsayoCast_") or Datos.agenda[dia_hoy].begins_with("Grabacion_")):
		mostrar_alerta("¡FALTA GRAVE!", "No fuiste a tu llamado. El director está furioso.")
		reducir_seguidores(10)
		publicar_auto("Cometí un error terrible en el trabajo hoy. Solo quiero dormir y desaparecer. 😞")
	# Chequeo de colapso mental antes de dormir
	if Datos.stats_actor["estres"] >= 100:
		aplicar_burnout()
		
	# Descanso natural (Baja el estrés pasivamente si no colapsaste)
	Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] - 10, 0, 100)
	ha_trabajado_hoy = false; ha_publicado_hoy = false; ha_ido_mixer_hoy = false
	cafes_tomados_hoy = 0 # El sueño resetea tu tolerancia a la cafeína
	Datos.estado_actual = "normal"
	Datos.tiempo["dia"] += 1
	Datos.stats_actor["energia_actual"] = Datos.stats_actor["energia_maxima"]
	Datos.economia["dinero"] -= 15 
	
	var mensaje_matutino = ""
	if Datos.economia["dinero"] < 0:
		var interes = int(abs(Datos.economia["dinero"]) * 0.1)
		if interes < 10: interes = 10
		Datos.economia["dinero"] -= interes
		mensaje_matutino = "⚠️ ALERTA BANCARIA:\nEl banco te cobró -$" + str(interes) + " por intereses."
	
	var ingresos_redes = 0
	if Datos.stats_actor["seguidores"] >= 100:
		ingresos_redes = int(Datos.stats_actor["seguidores"] / 10) 
		Datos.economia["dinero"] += ingresos_redes
	
	generar_castings_del_dia()
	
	var dia_nuevo = Datos.tiempo["dia"]
	if Datos.agenda.has(Datos.tiempo["dia"]) and Datos.agenda[Datos.tiempo["dia"]] == "Pago_Renta":
		# ¡NUEVA LÓGICA DE RENTA DOBLE!
		var espacio_id = Datos.mi_compania["id_espacio_actual"]
		var renta_espacio = Datos.espacios_disponibles[espacio_id]["renta_mensual"]
		var renta_total = 300 + renta_espacio
		
		var texto_renta = "Desglose de Renta Mensual:\n"
		texto_renta += "🏠 Departamento: -$300\n"
		texto_renta += "🏢 Local (" + Datos.espacios_disponibles[espacio_id]["nombre"] + "): -$" + str(renta_espacio) + "\n"
		texto_renta += "TOTAL PAGADO: -$" + str(renta_total) + "\n"
		
		if ingresos_redes > 0: texto_renta += "\n📱 Redes Sociales: +$" + str(ingresos_redes) + " hoy."
		if mensaje_matutino != "": texto_renta += "\n\n" + mensaje_matutino
		
		Datos.economia["dinero"] -= renta_total
		mostrar_alerta("Día de Renta", texto_renta)
		Datos.agenda[Datos.tiempo["dia"] + 30] = "Pago_Renta"
	else:
		# --- EVENTOS DINÁMICOS POR EGO Y ESTRÉS ---
		var evento_disparado = false
		
		# 1. Estrés Nivel Crítico (>= 80) - Enfermedad
		if Datos.stats_actor["estres"] >= 80 and randi_range(1, 100) <= 50:
			mostrar_alerta("🤒 Enfermedad por Estrés", "Tus defensas bajaron por tanta presión. Tienes fiebre y tuviste que comprar medicinas.\n\nPerdiste -$40 y amaneces con solo 1 de Energía.")
			Datos.economia["dinero"] -= 40
			Datos.stats_actor["energia_actual"] = 1
			evento_disparado = true
			
		# 2. Estrés Alto (>= 60) - Ansiedad Social
		elif Datos.stats_actor["estres"] >= 60 and randi_range(1, 100) <= 40 and not evento_disparado:
			mostrar_alerta("💢 Ataque de Ansiedad", "Tu estrés está muy alto. Le gritaste a un fan en la calle que te pidió una foto por culpa de los nervios.\n\nPerdiste -20 Seguidores.")
			reducir_seguidores(20)
			evento_disparado = true
			
		# 3. Estrés Medio (>= 40) - Insomnio
		elif Datos.stats_actor["estres"] >= 40 and randi_range(1, 100) <= 30 and not evento_disparado:
			mostrar_alerta("🥱 Insomnio Severo", "El estrés no te dejó dormir anoche. Estuviste repasando diálogos y pensando en el fracaso hasta las 4 AM.\n\nPierdes -1 de Energía para tu día de hoy.")
			Datos.stats_actor["energia_actual"] = max(0, Datos.stats_actor["energia_actual"] - 1)
			evento_disparado = true
			
		# 2. Chequeo de Ego Alto (Diva)
		elif Datos.stats_actor["ego"] >= 70 and randi_range(1, 100) <= 40 and not evento_disparado:
			mostrar_alerta("👑 Escándalo de Diva", "Tu ego te domina. Exigiste lujos ridículos en un evento y la prensa se enteró.\n\nPagaste -$80 en 'relaciones públicas' pero ganaste +10 de Seguidores por el morbo.")
			Datos.economia["dinero"] -= 80
			sumar_seguidores(10)
			evento_disparado = true
			
		# 3. Flujo Normal (Si no pasó nada malo)
		if not evento_disparado:
			if mensaje_matutino != "": mostrar_alerta("Buzón de Cobro", mensaje_matutino) 
			elif randi_range(1, 100) <= 30: disparar_evento_aleatorio()
			elif ingresos_redes > 0: mostrar_alerta("💸 Monetización SimGram", "Ganaste: +$" + str(ingresos_redes))
	
	actualizar_interfaz()

func comprobar_level_up():
	var subio_nivel = false
	while Datos.habilidades_actor["xp_actual"] >= Datos.habilidades_actor["xp_requerida"]:
		Datos.habilidades_actor["xp_actual"] -= Datos.habilidades_actor["xp_requerida"] 
		Datos.habilidades_actor["nivel_general"] += 1
		Datos.habilidades_actor["xp_requerida"] += 100 
		subio_nivel = true
	if subio_nivel: panel_level_up.visible = true

func aplicar_stat_y_cerrar():
	recalcular_stats_pasivos()
	panel_level_up.visible = false
	actualizar_interfaz()

func _on_btn_voz_pressed(): Datos.habilidades_actor["tecnica_vocal"] += 1; aplicar_stat_y_cerrar()
func _on_btn_cuerpo_pressed(): Datos.habilidades_actor["expresion_corporal"] += 1; aplicar_stat_y_cerrar()
func _on_btn_carisma_pressed(): Datos.habilidades_actor["carisma"] += 1; aplicar_stat_y_cerrar()
func _on_btn_memoria_pressed(): Datos.habilidades_actor["memoria"] += 1; aplicar_stat_y_cerrar()

func _on_boton_celular_pressed(): panel_simphone.visible = true
func _on_btn_cerrar_celular_pressed(): panel_simphone.visible = false

# --- AGENDA ---
func _on_btn_app_agenda_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_agenda.visible = true
	for hijo in grid_calendario.get_children(): hijo.queue_free()
	var dia_actual = Datos.tiempo["dia"]
	var bloque_mes = int((dia_actual - 1) / 30) * 30 
	var dia_inicio = bloque_mes + 1
	for i in range(dia_inicio, dia_inicio + 30):
		var btn_dia = Button.new() 
		btn_dia.text = str(i)
		btn_dia.custom_minimum_size = Vector2(45, 45)
		if i < dia_actual: btn_dia.modulate = Color(0.4, 0.4, 0.4) 
		elif i == dia_actual: btn_dia.modulate = Color(1.0, 0.9, 0.2) 
		elif Datos.agenda.has(i): 
			btn_dia.text += "\n!" 
			btn_dia.modulate = Color(0.2, 0.8, 0.2) 
		else: btn_dia.modulate = Color(1, 1, 1) 
		grid_calendario.add_child(btn_dia)

func _on_btn_volver_inicio_pressed():
	panel_app_agenda.visible = false
	contenedor_menu_inicio.visible = true

# --- CASTINGS ÚNICOS ---
func generar_castings_del_dia():
	castings_de_hoy.clear()
	var todas_las_llaves = Datos.castings_disponibles.keys()
	todas_las_llaves.shuffle()
	
	for i in range(3):
		var id_base = todas_las_llaves[i]
		var base_casting = Datos.castings_disponibles[id_base].duplicate()
		
		var titulo_especifico = GestorTextos.generar_titulo_produccion(id_base)
		base_casting["papel"] = GestorTextos.generar_papel_produccion(id_base) 
		base_casting["titulo_unico"] = base_casting["titulo"] + "\n" + titulo_especifico
		base_casting["id_unico"] = id_base + "_dia" + str(Datos.tiempo["dia"]) + "_" + str(i)
		base_casting["rendimiento_acumulado"] = 0
		base_casting["hype_generado"] = 0
		
		# --- ASIGNACIÓN DEFINITIVA DE ARQUETIPO (5 EJES) ---
		if "corto" in id_base or "pelicula" in id_base or "drama" in id_base:
			base_casting["arquetipo"] = "metodo"
		elif "extra" in id_base or "accion" in id_base or "danza" in id_base:
			base_casting["arquetipo"] = "fisico"
		elif "teatro" in id_base or "obra" in id_base or "doblaje" in id_base or "locutor" in id_base:
			base_casting["arquetipo"] = "forma"
		elif "comercial" in id_base or "conduccion" in id_base:
			base_casting["arquetipo"] = "comercial"
		elif "standup" in id_base or "animador" in id_base or "impro" in id_base:
			base_casting["arquetipo"] = "instinto"
		else:
			base_casting["arquetipo"] = "comercial" # Por defecto
			
		castings_de_hoy.append(base_casting)

func _on_btn_app_castings_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_castings.visible = true
	for hijo in contenedor_lista_castings.get_children(): hijo.queue_free()
	for index in range(castings_de_hoy.size()):
		var casting = castings_de_hoy[index]
		var btn_trabajo = Button.new()
		var texto_boton = casting["titulo_unico"] + "\n"
		texto_boton += "🎭 Papel: " + casting.get("papel", "Actor") + "\n" 
		texto_boton += "Pide: Nvl " + str(casting["nivel_minimo"]) + " " + casting["stat_requerido"].capitalize() + " | " + str(casting["seguidores_minimos"]) + " Seg.\n"
		texto_boton += "🎁 Recompensas: +" + str(casting.get("recompensa_xp", 0)) + " XP | +" + str(casting.get("recompensa_seguidores", 0)) + " Fans\n"
		
		if casting.has("tipo_pago") and casting["tipo_pago"] == "taquilla":
			texto_boton += "💸 Pago: % de Taquilla Final\n"
		else:
			texto_boton += "💰 Pago Fijo: $" + str(casting.get("paga", 0)) + "\n"
			
		if casting["dias_de_trabajo"] > 1: 
			texto_boton += "Ensayos: " + str(casting["dias_de_trabajo"] - 1) + " | Función: 1"
		else: 
			texto_boton += "Función: 1"
		
		btn_trabajo.text = texto_boton
		
		# --- LÓGICA DE BLOQUEO DE DUPLICADOS ---
		if Datos.proyectos_activos.has(casting["id_unico"]):
			btn_trabajo.text = "[ YA FIRMADO ]\n" + btn_trabajo.text
			btn_trabajo.disabled = true
			btn_trabajo.modulate = Color(0.5, 0.5, 0.5) # Color gris apagado
		else:
			btn_trabajo.pressed.connect(abrir_confirmacion_casting.bind(index))
			
		contenedor_lista_castings.add_child(btn_trabajo)

func _on_btn_volver_inicio_castings_pressed():
	panel_app_castings.visible = false
	contenedor_menu_inicio.visible = true

func abrir_confirmacion_casting(index):
	var c = castings_de_hoy[index]
	casting_seleccionado_temp = c["id_unico"]
	
	if Datos.stats_actor["seguidores"] < c["seguidores_minimos"]:
		mostrar_alerta("🎬 Perfil Insuficiente", "Necesitas tener al menos " + str(c["seguidores_minimos"]) + " Seguidores para audicionar.")
		return 
		
	# --- LÓGICA DE EGO (LA DIVA) ---
	if Datos.stats_actor["ego"] >= 60 and c.get("importancia", 1) == 1:
		mostrar_alerta("💅 Demasiado Famoso", "Tu Ego está por las nubes (" + str(Datos.stats_actor["ego"]) + "/100).\nTe niegas rotundamente a rebajarte a hacer proyectos de Nivel 1.")
		return
		
	Datos.proyectos_activos["temp"] = c
	panel_confirmacion.visible = true
	
	# Reiniciamos la negociación y dibujamos el calendario
	desplazamiento_fechas = 0
	actualizar_calendario_negociacion()

func _on_btn_cancelar_casting_pressed(): panel_confirmacion.visible = false

func _on_btn_confirmar_casting_pressed():
	panel_confirmacion.visible = false
	panel_app_castings.visible = false
	panel_simphone.visible = false
	contenedor_menu_inicio.visible = true
	
	# Guardamos el casting que estamos peleando en la variable del motor
	casting_data_actual = Datos.proyectos_activos["temp"]
	
	# Lanzamos el BALASIM con el tipo especial: "casting_real"
	iniciar_skill_check("casting_real")

# --- REDES SOCIALES Y CONTACTOS ---
func sumar_seguidores(cantidad):
	Datos.stats_actor["seguidores"] += cantidad
	for i in range(cantidad):
		if i > 10: break 
		var nuevo_user = GestorTextos.generar_usuario_aleatorio()
		Datos.ultimos_seguidores.push_front(nuevo_user)
	if Datos.ultimos_seguidores.size() > 10:
		Datos.ultimos_seguidores = Datos.ultimos_seguidores.slice(0, 10)

func reducir_seguidores(cantidad):
	Datos.stats_actor["seguidores"] -= cantidad
	if Datos.stats_actor["seguidores"] < 0: Datos.stats_actor["seguidores"] = 0

func comprobar_hitos_redes():
	if Datos.stats_actor["seguidores"] >= 100 and not Datos.hitos_redes["micro_influencer"]:
		Datos.hitos_redes["micro_influencer"] = true
		mostrar_alerta("🎉 ¡Micro-Influencer!", "Has superado los 100 seguidores.\nA partir de mañana ganarás dinero pasivo diario.")
		publicar_auto("¡Llegamos a los 100 seguidores! Gracias por tanto amor. ❤️🔥")
	elif Datos.stats_actor["seguidores"] >= 500 and not Datos.hitos_redes["verificado"]:
		Datos.hitos_redes["verificado"] = true
		mostrar_alerta("✅ ¡Cuenta Verificada!", "SimGram te ha dado la palomita azul.\nUna marca te pagó +$500.")
		Datos.economia["dinero"] += 500
		publicar_auto("¡Cuenta Verificada! ☑️ Gracias a mi mánager y a ustedes.")

func _on_btn_app_redes_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_redes.visible = true
	actualizar_metricas_redes()
	dibujar_feed_redes()

func _on_btn_volver_inicio_redes_pressed():
	panel_app_redes.visible = false
	contenedor_menu_inicio.visible = true

func actualizar_metricas_redes():
	label_metricas_redes.text = "Seguidores: " + str(Datos.stats_actor["seguidores"]) + " | Contactos: " + str(Datos.stats_actor["contactos"])

func _on_btn_ver_seguidores_pressed():
	panel_lista_seguidores.visible = true
	var texto_lista = "Últimos Seguidores:\n\n"
	for follower in Datos.ultimos_seguidores:
		texto_lista += "👤 " + follower + "\n"
	label_lista_seguidores.text = texto_lista

func _on_btn_cerrar_seguidores_pressed(): panel_lista_seguidores.visible = false

func _on_btn_publicar_post_pressed():
	if ha_publicado_hoy: return
	if Datos.stats_actor["energia_actual"] >= 1:
		# Abrimos el panel de selección en lugar de gastar energía de inmediato
		panel_seleccion_reel.visible = true
		for hijo in contenedor_opciones_reel.get_children(): hijo.queue_free()
		
		# 1. Opción de Reel Personal (Siempre disponible)
		var btn_personal = Button.new()
		btn_personal.text = "✨ Reel Personal (Tendencias / Comedia)"
		btn_personal.pressed.connect(publicar_reel_seleccionado.bind("personal"))
		contenedor_opciones_reel.add_child(btn_personal)
		
		# 2. Opciones de Proyectos Activos (Si tienes alguno)
		var llaves_activas = Datos.proyectos_activos.keys()
		llaves_activas.erase("temp") # Ignorar el proyecto en negociación
		
		for id_proy in llaves_activas:
			var proy = Datos.proyectos_activos[id_proy]
			var nom = proy["titulo_unico"].split("\n")[1]
			var btn_proy = Button.new()
			
			if proy.has("tipo_pago") and proy["tipo_pago"] == "taquilla":
				btn_proy.text = "🎟️ Promocionar Obra: " + nom + " (Genera Hype)"
			else:
				btn_proy.text = "🎥 Foto en el Set: " + nom + " (Genera Seguidores)"
				
			btn_proy.pressed.connect(publicar_reel_seleccionado.bind(id_proy))
			contenedor_opciones_reel.add_child(btn_proy)
			
	else:
		mostrar_alerta("¡Exhausto!", "No tienes energía.")

func _on_btn_cancelar_reel_pressed():
	panel_seleccion_reel.visible = false

func _on_btn_ir_networking_pressed():
	if ha_ido_mixer_hoy: return
	if Datos.stats_actor["energia_actual"] >= 2 and Datos.economia["dinero"] >= 20:
		Datos.stats_actor["energia_actual"] -= 2
		Datos.economia["dinero"] -= 20
		ha_ido_mixer_hoy = true
		
		var seguidores_actuales = Datos.stats_actor["seguidores"]
		var suerte = randi_range(1, 100)
		
		if seguidores_actuales <= 50:
			if suerte <= 40: 
				var hist = GestorTextos.obtener_texto("networking_inicio_fracaso")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nGastaste $20 y no lograste nada.")
				publicar_auto("A veces las fiestas son muy superficiales. Cero conexiones hoy.")
			else:
				Datos.stats_actor["contactos"] += 1
				var nuevo_contacto = GestorTextos.generar_contacto_nuevo(Datos.habilidades_actor["nivel_general"], Datos.habilidades_actor["carisma"])
				Datos.lista_contactos.append(nuevo_contacto)
				sumar_seguidores(1)
				var hist = GestorTextos.obtener_texto("networking_inicio_exito")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nObtuviste la tarjeta de:\n⭐ " + nuevo_contacto["nombre"] + " (" + nuevo_contacto["rol"] + ")")
				publicar_auto("Conocí gente increíble en el Mixer de hoy. Abriendo puertas 🏙️")
		else:
			if suerte <= 20: 
				var hist = GestorTextos.obtener_texto("networking_fama_fracaso")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nGastaste $20 y no lograste nada.")
				publicar_auto("Demasiado acoso en el evento de hoy. Hay que respetar el espacio.")
			else:
				Datos.stats_actor["contactos"] += 1
				var nuevo_contacto = GestorTextos.generar_contacto_nuevo(Datos.habilidades_actor["nivel_general"], Datos.habilidades_actor["carisma"])
				Datos.lista_contactos.append(nuevo_contacto)
				var bonus_seg = Datos.habilidades_actor["carisma"] * 10
				sumar_seguidores(bonus_seg)
				var hist = GestorTextos.obtener_texto("networking_fama_exito")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nObtuviste la tarjeta de:\n⭐ " + nuevo_contacto["nombre"] + " (" + nuevo_contacto["rol"] + ")")
				publicar_auto("Noche de networking con los grandes. Se vienen colaboraciones 🥂✨")
			
		actualizar_metricas_redes()
		comprobar_hitos_redes()
		actualizar_interfaz()
	else:
		mostrar_alerta("Sin recursos", "Necesitas al menos $20 y 2 de energía.")

func _on_btn_app_contactos_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_contactos.visible = true
	for hijo in contenedor_lista_contactos.get_children(): hijo.queue_free()
	
	if Datos.lista_contactos.is_empty():
		var label_vacio = Label.new()
		label_vacio.text = "Tu libreta está vacía. Ve a Mixers."
		contenedor_lista_contactos.add_child(label_vacio)
	else:
		for c in Datos.lista_contactos:
			var label_contacto = Label.new()
			if c["categoria"] == "Local": label_contacto.modulate = Color(0.8, 0.8, 0.8)
			elif c["categoria"] == "Indie": label_contacto.modulate = Color(0.4, 0.8, 1.0)
			elif c["categoria"] == "Profesional": label_contacto.modulate = Color(1.0, 0.8, 0.2)
			label_contacto.text = "👤 " + c["nombre"] + "\n  ↳ " + c["rol"] + " " + c["categoria"] + " (Poder: " + str(c["influencia"]) + ")"
			contenedor_lista_contactos.add_child(label_contacto)

func _on_btn_volver_inicio_contactos_pressed():
	panel_app_contactos.visible = false
	contenedor_menu_inicio.visible = true

# --- BOOK E IMDB (NUEVO) ---
func _on_btn_app_book_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_book.visible = true
	for hijo in contenedor_lista_book.get_children():
		hijo.queue_free()

	if Datos.historial_proyectos.is_empty():
		var lbl = Label.new()
		lbl.text = "Aún no tienes créditos en la industria."
		contenedor_lista_book.add_child(lbl)
	else:
		for proy in Datos.historial_proyectos:
			var lbl = Label.new()
			var estrellas = ""
			for e in range(proy["estrellas"]):
				estrellas += "⭐"
			var txt = "🎬 " + proy["titulo"] + "\n"
			txt += "🎭 Papel: " + proy.get("papel", "Desconocido") + "\n" # <--- MOSTRAMOS EL PAPEL
			txt += "Crítica: " + estrellas + "\n"
			if proy.has("audiencia"):
				txt += "Taquilla: " + str(proy["audiencia"]) + " espectadores\n"
			txt += "Recaudado: $" + str(proy["ganancia"]) + "\n---"
			lbl.text = txt
			contenedor_lista_book.add_child(lbl)

func _on_btn_volver_inicio_book_pressed():
	panel_app_book.visible = false
	contenedor_menu_inicio.visible = true


# --- TIENDA (SIMZON) ---
func _on_btn_app_tienda_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_tienda.visible = true

func _on_btn_volver_inicio_tienda_pressed():
	panel_app_tienda.visible = false
	contenedor_menu_inicio.visible = true

func _on_btn_comprar_cafe_pressed():
	var limite_cafes = 2 + int(Datos.habilidades_actor["nivel_general"] / 3) 
	if cafes_tomados_hoy >= limite_cafes:
		mostrar_alerta("¡Taquicardia!", "Ya tomaste demasiado café por hoy. Te tiemblan las manos. Ve a dormir.")
		return
		
	if Datos.economia["dinero"] >= 15:
		if Datos.stats_actor["energia_actual"] < Datos.stats_actor["energia_maxima"]:
			Datos.economia["dinero"] -= 15
			Datos.stats_actor["energia_actual"] += 1
			cafes_tomados_hoy += 1
			var historia = GestorTextos.obtener_texto("compra_cafe")
			mostrar_alerta(historia["titulo"], historia["desc"] + "\n\nRecuperaste +1 Energía.\n(Cafés hoy: " + str(cafes_tomados_hoy) + "/" + str(limite_cafes) + ")")
			actualizar_interfaz()
		else: mostrar_alerta("Energía a Tope", "Ya tienes toda tu energía.")
	else: mostrar_alerta("Sin Dinero", "No te alcanza.")

func _on_btn_comprar_libro_pressed():
	if Datos.economia["dinero"] >= 80:
		Datos.economia["dinero"] -= 80
		Datos.habilidades_actor["xp_actual"] += 50
		var historia = GestorTextos.obtener_texto("compra_libro")
		mostrar_alerta(historia["titulo"], historia["desc"] + "\n\nGanaste +50 XP.")
		comprobar_level_up(); actualizar_interfaz()
	else: mostrar_alerta("Sin Dinero", "No te alcanza.")

func _on_btn_comprar_traje_pressed():
	if Datos.economia["dinero"] >= 500:
		Datos.economia["dinero"] -= 500
		Datos.habilidades_actor["carisma"] += 1
		mostrar_alerta("👔 ¡Nuevo Look!", "Te ves increíble.\nGanaste +1 Carisma Permanente.")
		aplicar_stat_y_cerrar() 
	else: mostrar_alerta("Sin Dinero", "No te alcanza.")

# --- EVENTOS MATUTINOS ---
func disparar_evento_aleatorio():
	var lista_eventos = Datos.eventos_matutinos.keys()
	var evento_elegido = lista_eventos[randi() % lista_eventos.size()]
	
	# --- LÓGICA DE EVENTOS CONDICIONADOS POR ESTRÉS/EGO ---
	# Si tienes mucho estrés, forzamos que salga el evento de Insomnio frecuentemente
	if Datos.stats_actor["estres"] >= 60 and randi_range(1, 100) <= 60:
		evento_elegido = "insomnio" 
		
	# Si tu ego es muy alto, te vas de fiesta por creerte superior
	elif Datos.stats_actor["ego"] >= 60 and randi_range(1, 100) <= 60:
		evento_elegido = "resaca"
		
	var datos_evento = Datos.eventos_matutinos[evento_elegido]
	Datos.stats_actor["energia_actual"] += datos_evento["efecto_energia"]
	Datos.economia["dinero"] += datos_evento["efecto_dinero"]
	Datos.stats_actor["seguidores"] += datos_evento["efecto_seguidores"]
	Datos.estado_actual = datos_evento["estado_dia"]
	
	var aviso_extra = ""
	if Datos.estado_actual == "inspirado": aviso_extra = "\n\n✨ ESTADO: Inspirado (Doble XP hoy)."
	elif Datos.estado_actual == "torpe": aviso_extra = "\n\n🥀 ESTADO: Torpe (Menos propinas hoy)."
	elif Datos.estado_actual == "viral": aviso_extra = "\n\n🔥 ESTADO: Viral (Ganas doble seguidores hoy)."
	
	mostrar_alerta("🌅 " + datos_evento["titulo"], datos_evento["descripcion"] + aviso_extra)
	comprobar_hitos_redes()

# --- SET DE GRABACIÓN ---
func iniciar_minijuego_memoria(id_unico):
	casting_data_actual = Datos.proyectos_activos[id_unico]
	var casting = casting_data_actual
	
	if Datos.stats_actor["energia_actual"] > 0: Datos.stats_actor["energia_actual"] -= 1
	panel_minijuego.visible = true
	label_titulo_trabajo.text = "🎬 Grabando:\n" + casting["titulo_unico"].split("\n")[1]
	
	var guion = lineas_guion.pick_random()
	respuesta_correcta = guion["correcta"]
	var opciones = [guion["correcta"], guion["incorrectas"][0], guion["incorrectas"][1]]
	opciones.shuffle() 
	btn_opcion_1.text = opciones[0]
	btn_opcion_2.text = opciones[1]
	btn_opcion_3.text = opciones[2]
	var nivel_dificultad = casting["dificultad"]
	var tiempo_lectura = 4.0 - nivel_dificultad 
	var tiempo_respuesta_base = 4.0 - (nivel_dificultad * 0.5) 
	label_tiempo.text = "¡MEMORIZA!"
	label_guion.text = guion["texto"].replace("[___]", respuesta_correcta.to_upper()) 
	btn_opcion_1.visible = false; btn_opcion_2.visible = false; btn_opcion_3.visible = false
	await get_tree().create_timer(tiempo_lectura).timeout 
	label_guion.text = guion["texto"] 
	btn_opcion_1.visible = true; btn_opcion_2.visible = true; btn_opcion_3.visible = true
	tiempo_restante = tiempo_respuesta_base + (Datos.habilidades_actor["memoria"] * 1.5)
	
	# --- BUFF: ACTOR INSTINTIVO ---
	if obtener_arquetipo_dominante() == "instinto":
		tiempo_restante += 2.0 # Improvista excelente bajo presión
		
	label_tiempo.text = "⏳ Acción: %.1f s" % tiempo_restante
	timer_minijuego.wait_time = 0.1 
	timer_minijuego.start()

func _on_timer_minijuego_timeout():
	tiempo_restante -= 0.1 
	label_tiempo.text = "⏳ Acción: %.1f s" % tiempo_restante
	if tiempo_restante <= 0.01:
		timer_minijuego.stop()
		evaluar_respuesta("TIEMPO_AGOTADO")

func _on_btn_opcion_1_pressed(): evaluar_respuesta(btn_opcion_1.text)
func _on_btn_opcion_2_pressed(): evaluar_respuesta(btn_opcion_2.text)
func _on_btn_opcion_3_pressed(): evaluar_respuesta(btn_opcion_3.text)

func evaluar_respuesta(texto_elegido):
	timer_minijuego.stop()
	panel_minijuego.visible = false
	var c = casting_data_actual
	var nombre_proyecto = c["titulo_unico"].split("\n")[1]
	
	var arq_dom = obtener_arquetipo_dominante() # Leemos tu perfil ANTES de dar recompensas

	if texto_elegido == respuesta_correcta: c["rendimiento_acumulado"] += 2 
	var max_rendimiento = (c["dias_de_trabajo"] - 1) + 2
	var calificacion = float(c["rendimiento_acumulado"]) / float(max_rendimiento)
	var estrellas = clamp(int(calificacion * 5), 1, 5) 

	# --- SUBIDA DE PUNTOS DE ARQUETIPO (ADN) ---
	if estrellas >= 3:
		var arq_proyecto = c.get("arquetipo", "comercial")
		Datos.perfil_actor[arq_proyecto] += (estrellas * 2) # Da 6, 8 o 10 puntos

	# --- BUFF: ACTOR DE FORMA (ANTI-SABOTAJE) ---
	var alerta_sabotaje = ""
	if c.has("estado_tecnicos"):
		if c["estado_tecnicos"] == "sabotaje":
			if arq_dom == "forma":
				c["estado_tecnicos"] = "normal"
				alerta_sabotaje = "🛡️ Tu profesionalismo clásico (Actor de Forma) impidió el sabotaje.\n\n"
			else:
				estrellas = 1 
				alerta_sabotaje = "🚨 SABOTAJE: Los técnicos apagaron las luces y te arruinaron.\n\n"
		elif c["estado_tecnicos"] == "excelente":
			estrellas = clamp(estrellas + 1, 1, 5) 

	var ganancia_final = 0; var audiencia_final = 0

	if c.has("tipo_pago") and c["tipo_pago"] == "taquilla":
		var base_aud = c.get("importancia", 1) * 20
		var aforo_maximo = 1000 
		if c.has("es_propia"): 
			base_aud += (c["influencia_equipo"] * 3) 
			aforo_maximo = Datos.espacios_disponibles[Datos.mi_compania["id_espacio_actual"]]["capacidad_publico"]
			
		audiencia_final = base_aud + int(Datos.stats_actor["seguidores"] * 0.1) + c.get("hype_generado", 0)
		
		if c.get("estado_tecnicos") == "sabotaje": audiencia_final = int(audiencia_final * 0.3)
		elif estrellas <= 2: audiencia_final = int(audiencia_final * 0.5) 
		
		if audiencia_final >= aforo_maximo:
			audiencia_final = aforo_maximo
			c["hubo_sold_out"] = true 
		
		var ganancia_bruta = audiencia_final * c.get("corte_boleto", 5)
		if c.has("es_propia"): ganancia_final = int(ganancia_bruta * c["porcentaje_ganancia"])
		else: ganancia_final = ganancia_bruta
	else:
		ganancia_final = c.get("paga", 0)
		if estrellas <= 2: ganancia_final = int(ganancia_final / 2.0) 

	# --- MATEMÁTICA DE BUFFS Y DEBUFFS DE RECOMPENSA ---
	var multi_dinero = 1.0
	var multi_xp = 1.0
	var multi_seg = 1.0
	var multi_ego = 1
	
	if arq_dom == "comercial": 
		multi_dinero = 1.5
		multi_ego = 2 # Divo inestable
	elif arq_dom == "fisico": 
		multi_dinero = 0.8
	
	if arq_dom == "metodo": 
		multi_xp = 1.5
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + 15, 0, 100) # Penalty mental
	elif arq_dom == "instinto": 
		multi_xp = 0.5
		
	if arq_dom == "forma": 
		multi_seg = 0.5

	ganancia_final = int(ganancia_final * multi_dinero)
	var xp_final = int(c["recompensa_xp"] * multi_xp)
	var seg_final = int(c["recompensa_seguidores"] * multi_seg)

	Datos.economia["dinero"] += ganancia_final
	sumar_seguidores(seg_final)
	Datos.habilidades_actor["xp_actual"] += xp_final

	var registro_book = {
		"titulo": nombre_proyecto,
		"papel": c.get("papel", "Actor"),
		"estrellas": estrellas,
		"ganancia": ganancia_final
	}
	if audiencia_final > 0: registro_book["audiencia"] = audiencia_final
	Datos.historial_proyectos.push_front(registro_book)

	# --- CONSECUENCIAS (CON MULTIPLICADOR DE EGO) ---
	if c.get("estado_tecnicos") == "sabotaje":
		Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] - (15 * multi_ego), 0, 100) 
		mostrar_alerta("🍅 Humillación Técnica", alerta_sabotaje + "Crítica: " + str(estrellas) + "⭐\nGanancias: $" + str(ganancia_final))
		publicar_auto("Peor día de mi vida. Nunca hagan enojar a los técnicos de iluminación. 😭")
	elif estrellas >= 4:
		var titulo_alerta = "🏆 Gran Estreno"
		var txt = alerta_sabotaje + "¡Un éxito rotundo!\nCrítica: " + str(estrellas) + "⭐\n"
		if c.has("hubo_sold_out"):
			Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] + (20 * multi_ego), 0, 100) 
			titulo_alerta = "🔥 ¡SOLD OUT ABSOLUTO! 🔥"
			txt += "Taquilla: " + str(audiencia_final) + " (¡LLENO TOTAL!)\n"
			publicar_auto("¡HICIMOS SOLD OUT! No cabía un alfiler para ver '" + nombre_proyecto + "'. Los amo. 😭🎫")
		elif audiencia_final > 0: 
			Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] + (5 * multi_ego), 0, 100) 
			txt += "Taquilla: " + str(audiencia_final) + " personas\n"
			publicar_auto("Las críticas a '" + nombre_proyecto + "' son hermosas. Gracias a todos. ⭐⭐⭐⭐⭐")
		else:
			Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] + (2 * multi_ego), 0, 100)
			
		mostrar_alerta(titulo_alerta, txt + "Ganancias: $" + str(ganancia_final))
	else:
		Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] - (5 * multi_ego), 0, 100) 
		
		var multiplicador_fracaso = (3 - estrellas) 
		var fans_perdidos = c.get("importancia", 1) * 15 * multiplicador_fracaso
		reducir_seguidores(fans_perdidos)
		
		mostrar_alerta("🍅 Fracaso en Crítica", "Un desastre absoluto.\nTu mala actuación fue comentada en redes.\n\nCrítica: " + str(estrellas) + "⭐\nGanancias: $" + str(ganancia_final) + "\nSeguidores Perdidos: -" + str(fans_perdidos))
		publicar_auto("A veces las cosas no salen como uno quiere. Gracias a los que apoyaron el intento. Pasemos la página. 💔")

	Datos.proyectos_activos.erase(c["id_unico"]); Datos.agenda.erase(Datos.tiempo["dia"])
	comprobar_hitos_redes(); comprobar_level_up(); actualizar_interfaz()

# ==========================================
# 🏢 APP INMOBILIARIA (ESPACIOS DE ENSAYO)
# ==========================================
func _on_btn_app_inmobiliaria_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_inmobiliaria.visible = true
	actualizar_lista_espacios()

func _on_btn_volver_inicio_inmobiliaria_pressed():
	panel_app_inmobiliaria.visible = false
	contenedor_menu_inicio.visible = true

func actualizar_lista_espacios():
	for hijo in contenedor_lista_espacios.get_children():
		hijo.queue_free()
	
	var espacio_actual = Datos.mi_compania["id_espacio_actual"]
	
	for id_espacio in Datos.espacios_disponibles.keys():
		var espacio = Datos.espacios_disponibles[id_espacio]
		var btn = Button.new()
		
		var txt = "🏢 " + espacio["nombre"] + "\n"
		txt += "Renta: $" + str(espacio["renta_mensual"]) + "/mes\n"
		txt += "Permite Contactos: " + espacio["nivel_max_contactos"] + " | Aforo: " + str(espacio["capacidad_equipo"]) + " pers."
		btn.text = txt
		
		if id_espacio == espacio_actual:
			btn.text += "\n[ ESPACIO ACTUAL ]"
			btn.disabled = true
			btn.modulate = Color(0.5, 1.0, 0.5) # Verde para saber que es tuyo
		else:
			# Se usa .bind() para pasarle qué espacio queremos rentar al hacer clic
			btn.pressed.connect(rentar_espacio.bind(id_espacio))
			
		contenedor_lista_espacios.add_child(btn)

func rentar_espacio(id_espacio):
	var espacio = Datos.espacios_disponibles[id_espacio]
	# Regla de Bienes Raíces: Piden 2 meses por adelantado (Depósito + Renta)
	var costo_mudanza = espacio["renta_mensual"] * 2 
	
	if Datos.economia["dinero"] >= costo_mudanza:
		Datos.economia["dinero"] -= costo_mudanza
		Datos.mi_compania["id_espacio_actual"] = id_espacio
		
		mostrar_alerta("📦 Mudanza Exitosa", "Has rentado: " + espacio["nombre"] + "\nPagaste -$" + str(costo_mudanza) + " por el depósito de garantía y el primer mes.\n\n¡Ya puedes invitar a mejores contactos a ensayar!")
		
		# ¡Publicamos en redes el logro!
		publicar_auto("¡Nuevo espacio creativo! Oficialmente nos mudamos a " + espacio["nombre"] + ". Se vienen proyectos enormes. 🏢✨")
		
		actualizar_interfaz()
		actualizar_lista_espacios()
	else:
		mostrar_alerta("❌ Fondos Insuficientes", "La inmobiliaria pide 2 meses por adelantado (Depósito + Renta).\nNecesitas al menos $" + str(costo_mudanza) + " para mudarte aquí.")


# ==========================================
# 🎬 APP PRODUCTORA (CREAR OBRAS PROPIAS)
# ==========================================
func _on_btn_app_productora_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_productora.visible = true
	input_nombre_compania.text = Datos.mi_compania["nombre"] 
	
	# Bloqueamos el input si la empresa ya fue fundada legalmente
	if Datos.mi_compania["fundada"]:
		input_nombre_compania.editable = false
	else:
		input_nombre_compania.editable = true
	
	for hijo in contenedor_lista_productora.get_children(): hijo.queue_free()
	
	var espacio_actual = Datos.espacios_disponibles[Datos.mi_compania["id_espacio_actual"]]
	
	for id_formato in Datos.formatos_produccion.keys():
		var formato = Datos.formatos_produccion[id_formato]
		var btn = Button.new()
		
		# Validar si el espacio es suficientemente grande
		var espacio_ok = espacio_actual["capacidad_equipo"] >= formato["espacio_minimo"]
		
		# Buscar si tenemos un contacto que cumpla el rol necesario (Director, Productor, etc)
		var contacto_valido = null
		var mayor_influencia = -1
		for c in Datos.lista_contactos:
			if c["rol"] == formato["rol_necesario"]:
				if c["influencia"] > mayor_influencia:
					mayor_influencia = c["influencia"]
					contacto_valido = c
		
		var txt = "🎬 " + formato["titulo"] + "\n"
		txt += "Costo Montaje: $" + str(formato["costo_montaje"]) + " | Tu Ganancia: " + str(formato["porcentaje_ganancia"] * 100) + "% de Taquilla\n"
		txt += "Requiere Espacio Nivel " + str(formato["espacio_minimo"]) + " | Exige: " + formato["rol_necesario"]
		
		if not espacio_ok:
			txt += "\n❌ Tu local actual es muy pequeño."
			btn.disabled = true
		elif contacto_valido == null:
			txt += "\n❌ No tienes ningún " + formato["rol_necesario"] + " en tus contactos."
			btn.disabled = true
		else:
			txt += "\n✅ Contacto Asignado: " + contacto_valido["nombre"] + " (Poder: " + str(contacto_valido["influencia"]) + ")"
			btn.pressed.connect(lanzar_produccion_propia.bind(id_formato, contacto_valido))
			
		btn.text = txt
		contenedor_lista_productora.add_child(btn)

func _on_btn_volver_inicio_productora_pressed():
	panel_app_productora.visible = false
	contenedor_menu_inicio.visible = true

func lanzar_produccion_propia(id_formato, contacto):
	var formato = Datos.formatos_produccion[id_formato]
	
	if Datos.economia["dinero"] < formato["costo_montaje"]:
		mostrar_alerta("❌ Sin Presupuesto", "Necesitas $" + str(formato["costo_montaje"]) + " para pagar el montaje.")
		return
		
	# Te cobramos el montaje
	Datos.economia["dinero"] -= formato["costo_montaje"]
	
	# Creamos un "Proyecto Activo" pero con reglas especiales
	var id_unico = "prod_propia_" + str(Datos.tiempo["dia"])
	var titulo_obra = GestorTextos.generar_titulo_produccion("teatro")
	
	var mi_proyecto = {
		"id_unico": id_unico,
		"es_propia": true, # <-- La bandera mágica
		"titulo_unico": formato["titulo"] + "\n" + titulo_obra,
		"papel": "Productor y Protagonista",
		"tipo_pago": "taquilla",
		"corte_boleto": formato["corte_boleto"],
		"porcentaje_ganancia": formato["porcentaje_ganancia"],
		"influencia_equipo": contacto["influencia"], # Entre más poderoso el contacto, más gente irá
		"dias_de_trabajo": formato["dias_de_trabajo"],
		"dificultad": formato["dificultad"],
		"importancia": formato["importancia"],
		"recompensa_xp": 500,
		"recompensa_seguidores": 50,
		"rendimiento_acumulado": 0,
		"hype_generado": 0
	}
	
	# Lo metemos en el sistema como si fuera un casting normal
	Datos.proyectos_activos[id_unico] = mi_proyecto
	
	var d_ini = Datos.tiempo["dia"] + 2 # Empieza en 2 días para darte tiempo de marketing
	var dias_ocupados = []
	for i in range(formato["dias_de_trabajo"]):
		var d = d_ini + (i * 2)
		if Datos.agenda.has(d):
			mostrar_alerta("❌ Choque de Agenda", "Ya tienes eventos programados en los días requeridos. Limpia tu agenda primero.")
			return # ¡ESTO ARREGLA EL BUG DE SOBREPOSICIÓN!
		dias_ocupados.append(d)
		
	# Te cobramos el montaje (Lo movimos aquí para no cobrarte si choca la agenda)
	Datos.economia["dinero"] -= formato["costo_montaje"]
	Datos.proyectos_activos[id_unico] = mi_proyecto
	
	for i in range(formato["dias_de_trabajo"]):
		var d_age = dias_ocupados[i]
		if i == 0 and formato["dias_de_trabajo"] > 1: Datos.agenda[d_age] = "Lectura_" + id_unico
		elif i == formato["dias_de_trabajo"] - 2 and formato["dias_de_trabajo"] > 2: Datos.agenda[d_age] = "Tecnico_" + id_unico
		elif i == formato["dias_de_trabajo"] - 1: Datos.agenda[d_age] = "Grabacion_" + id_unico
		else: Datos.agenda[d_age] = "EnsayoCast_" + id_unico
		
	_on_btn_volver_inicio_productora_pressed()
	mostrar_alerta("🥂 ¡Producción en Marcha!", "Invertiste $" + str(formato["costo_montaje"]) + ".\nTus ensayos empiezan mañana. ¡Sube Reels para hacer Hype!")
	publicar_auto("¡" + Datos.mi_compania["nombre"] + " presenta oficialmente su nueva obra: '" + titulo_obra + "'! No se la pueden perder. 🎭🔥")
	actualizar_interfaz()


# ==========================================
# 🎭 SISTEMA DE TÉCNICOS Y SABOTAJE
# ==========================================

func _on_btn_tec_excelente_pressed():
	if Datos.economia["dinero"] >= 150:
		Datos.economia["dinero"] -= 150
		casting_data_actual["estado_tecnicos"] = "excelente"
		panel_tecnicos.visible = false
		iniciar_minijuego_memoria(casting_data_actual["id_unico"])
	else:
		mostrar_alerta("Sin Fondos", "No tienes $150 para este trato. Elige otra opción.")

func _on_btn_tec_normal_pressed():
	if Datos.economia["dinero"] >= 50:
		Datos.economia["dinero"] -= 50
		casting_data_actual["estado_tecnicos"] = "normal"
		panel_tecnicos.visible = false
		iniciar_minijuego_memoria(casting_data_actual["id_unico"])
	else:
		mostrar_alerta("Sin Fondos", "No tienes ni $50. Tendrás que no pagarles.")

func _on_btn_tec_nada_pressed():
	# Si no les pagas, hay un 60% de probabilidad de que te saboteen
	if randi_range(1, 100) <= 60:
		casting_data_actual["estado_tecnicos"] = "sabotaje"
	else:
		casting_data_actual["estado_tecnicos"] = "normal" # Tuviste suerte, no hicieron nada
		
	panel_tecnicos.visible = false
	iniciar_minijuego_memoria(casting_data_actual["id_unico"])


# ==========================================
# 📅 SISTEMA DE NEGOCIACIÓN DE FECHAS
# ==========================================
func _on_btn_negociar_fechas_pressed():
	desplazamiento_fechas += 1 # Empujamos el proyecto un día más
	actualizar_calendario_negociacion()

func actualizar_calendario_negociacion():
	var c = Datos.proyectos_activos["temp"]
	var dia_actual = Datos.tiempo["dia"]
	var dia_arranque_propuesto = dia_actual + 1 + desplazamiento_fechas
	
	# --- REQUISITO DE "ESTRELLA" PARA NEGOCIAR ---
	if Datos.habilidades_actor["carisma"] < 3:
		btn_negociar_fechas.text = "🔒 Negociar (Pide Nvl. 3 Carisma)"
		btn_negociar_fechas.disabled = true
	else:
		btn_negociar_fechas.text = "📅 Negociar Fechas (+1 Día)"
		btn_negociar_fechas.disabled = false
	
	# 1. Calculamos las fechas que tomará este proyecto
	dias_propuestos_temp.clear()
	for i in range(c["dias_de_trabajo"]):
		dias_propuestos_temp.append(dia_arranque_propuesto + (i * 2)) # Un día sí, un día no
		
	# 2. Verificamos si hay choques con la agenda existente
	var hay_choque = false
	for d in dias_propuestos_temp:
		if Datos.agenda.has(d): hay_choque = true
	
	# 3. Actualizamos los textos informativos
	var info = "¿Firmar contrato para:\n" + c["titulo_unico"] + "?\n\n"
	info += "🎭 Personaje: " + c["papel"] + "\n"
	
	if c.has("tipo_pago") and c["tipo_pago"] == "taquilla":
		info += "⚠️ Tu pago dependerá del HYPE y público que atraigas.\n"
	else: 
		info += "💰 Pago Final Fijo: $" + str(c.get("paga", 0)) + "\n"
		
	if hay_choque:
		if Datos.habilidades_actor["carisma"] < 3:
			info += "\n❌ CHOQUE DE AGENDA. Como eres novato (Carisma < 3), no puedes exigir que te muevan las fechas. Debes rechazar el papel."
		else:
			info += "\n❌ CHOQUE DE AGENDA. Presiona 'Negociar Fechas' para exigir otro día de arranque."
		btn_confirmar_casting.disabled = true
	else:
		info += "\n✅ Fechas Libres. Puedes firmar."
	btn_confirmar_casting.disabled = false
		
	label_detalles_casting.text = info
	
	# 4. Dibujamos el Mini-Calendario visual (Los próximos 21 días)
	for hijo in grid_calendario_confirmacion.get_children(): hijo.queue_free()
	
	for i in range(dia_actual, dia_actual + 21):
		var btn = Button.new()
		btn.text = str(i)
		btn.custom_minimum_size = Vector2(30, 30)
		btn.disabled = true # Solo es visual
		
		# Lógica de colores del calendario de negociación
		if i == dia_actual:
			btn.modulate = Color(1.0, 0.9, 0.2) # Amarillo: Hoy
		elif dias_propuestos_temp.has(i):
			if Datos.agenda.has(i):
				btn.modulate = Color(1.0, 0.2, 0.2) # ROJO: Choque!
			else:
				btn.modulate = Color(0.2, 1.0, 0.2) # VERDE: Proyecto propuesto (Libre)
		elif Datos.agenda.has(i):
			btn.modulate = Color(0.4, 0.6, 1.0) # AZUL: Tienes otra cosa agendada
		else:
			btn.modulate = Color(1.0, 1.0, 1.0) # BLANCO: Día vacío
			
		grid_calendario_confirmacion.add_child(btn)


# ==========================================
# 📱 LÓGICA DE SELECCIÓN DE REELS
# ==========================================
func publicar_reel_seleccionado(id_eleccion):
	panel_seleccion_reel.visible = false
	
	# Ahora sí, cobramos la energía
	Datos.stats_actor["energia_actual"] -= 1
	ha_publicado_hoy = true
	
	if id_eleccion == "personal":
		# LÓGICA REEL NORMAL
		var seguidores_actuales = Datos.stats_actor["seguidores"]
		var suerte = randi_range(1, 100)
		
		if seguidores_actuales <= 15:
			if suerte <= 40:
				var hist = GestorTextos.obtener_texto("redes_inicio_fracaso")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nNo ganaste seguidores.")
				publicar_auto("Un día lento hoy. Pero la creatividad no descansa... 😅")
			else:
				var nuevos = randi_range(1, 3) 
				sumar_seguidores(nuevos)
				var hist = GestorTextos.obtener_texto("redes_inicio_normal")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste +" + str(nuevos) + " Seguidores.")
				publicar_auto("Grabé un Reel súper divertido hoy. Ojalá el algoritmo haga lo suyo 🤞")
		else:
			if suerte <= 15:
				reducir_seguidores(5)
				var hist = GestorTextos.obtener_texto("redes_fracaso")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nPerdiste 5 seguidores.")
				publicar_auto("No dejen que los haters apaguen su luz. Yo sigo enfocado. 🛡️")
			elif suerte >= 85: 
				var nuevos = 50 + (Datos.habilidades_actor["carisma"] * 5)
				if Datos.estado_actual == "viral": nuevos *= 2 
				sumar_seguidores(nuevos)
				var hist = GestorTextos.obtener_texto("redes_viral")
				mostrar_alerta(hist.titulo, hist.desc + "\n\n¡Ganaste +" + str(nuevos) + " Seguidores!")
				publicar_auto("¡MI CELULAR NO DEJA DE SONAR! 🤯 Gracias a todos.")
			else:
				var nuevos = randi_range(2, 8) + (Datos.habilidades_actor["carisma"] * 2)
				if Datos.estado_actual == "viral": nuevos *= 2 
				sumar_seguidores(nuevos)
				var hist = GestorTextos.obtener_texto("redes_normal")
				mostrar_alerta(hist.titulo, hist.desc + "\n\nGanaste +" + str(nuevos) + " Seguidores.")
				publicar_auto("Nuevo video arriba. Vayan a darle amor ❤️")
				
	else:
		# LÓGICA DE MARKETING DE PROYECTO
		var proy = Datos.proyectos_activos[id_eleccion]
		var nom = proy["titulo_unico"].split("\n")[1]
		
		if proy.has("tipo_pago") and proy["tipo_pago"] == "taquilla":
			proy["hype_generado"] += (10 + Datos.habilidades_actor["carisma"] * 5)
			var bonus_fans = int((10 + Datos.habilidades_actor["carisma"] * 2) * 1.1) 
			sumar_seguidores(bonus_fans)
			
			mostrar_alerta("📸 Marketing Exitoso", "¡Generaste Hype para la taquilla de tu obra!\nAdemás atrajiste +" + str(bonus_fans) + " Seguidores.")
			publicar_auto("Ensayos a full de '" + nom + "'. ¡No olviden comprar sus boletos en taquilla! 🎭🎟️")
		else:
			var bonus_fans = 5 + (Datos.habilidades_actor["carisma"] * 2)
			sumar_seguidores(bonus_fans)
			mostrar_alerta("📸 En el Set", "Publicaste sobre tu día de rodaje.\nGanaste +" + str(bonus_fans) + " Seguidores.")
			publicar_auto("Día de llamado grabando '" + nom + "'. Amo mi trabajo 🎥✨")

	actualizar_metricas_redes()
	comprobar_hitos_redes() 
	actualizar_interfaz()


# ==========================================
# 🧘 SISTEMA DE SALUD MENTAL (ESTRÉS)
# ==========================================
func _on_btn_terapia_pressed():
	if Datos.economia["dinero"] >= 50:
		if Datos.stats_actor["estres"] > 0:
			Datos.economia["dinero"] -= 50
			Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] - 40, 0, 100)
			mostrar_alerta("🧘 Sesión de Terapia", "Hablaste de tus inseguridades actorales con un profesional.\nPagaste -$50 pero perdiste -40 de Estrés.")
			actualizar_interfaz()
		else:
			mostrar_alerta("Tranquilo", "Tu estrés ya está al mínimo. Guarda tu dinero.")
	else:
		mostrar_alerta("Sin Fondos", "No te alcanza ni para terapia online. Respira hondo gratis.")

func aplicar_burnout():
	# Si al ir a dormir tienes 100 de estrés, sufres un colapso
	Datos.stats_actor["estres"] = 0 # Te reinician a cero
	Datos.economia["dinero"] -= 150 # Gastos médicos
	
	# Faltas a TODOS tus llamados del día siguiente
	var dia_manana = Datos.tiempo["dia"] + 1
	if Datos.agenda.has(dia_manana):
		Datos.agenda.erase(dia_manana)
		reducir_seguidores(50)
		Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] - 20, 0, 100) # El escándalo baja tu ego
		
	mostrar_alerta("🚨 COLAPSO MENTAL (BURNOUT)", "Llegaste a 100 de Estrés.\nSufriste un ataque de pánico y terminaste en el hospital.\n\nConsecuencias:\n- Pagaste -$150 en médicos.\n- Faltaste a tus llamados de mañana (Si tenías).\n- Escándalo en redes (-50 Seguidores).")
	publicar_auto("Necesito un descanso de todo. Estaré desconectado un tiempo. Cuiden su salud mental. 🏥💔")


# ==========================================
# 🏢 CAMBIAR NOMBRE DE COMPAÑÍA
# ==========================================
func _on_btn_renombrar_compania_pressed():
	if Datos.mi_compania["fundada"]:
		mostrar_alerta("Trámite Finalizado", "Tu compañía ya está registrada en actas. No puedes cambiar el nombre otra vez.")
		return
		
	if Datos.mi_compania["id_espacio_actual"] == "sala_casa":
		mostrar_alerta("Sin Domicilio Fiscal", "No puedes registrar una empresa en la sala de tu casa. Ve a la App 'Espacios' y renta un local primero.")
		return
		
	if Datos.economia["dinero"] < 100:
		mostrar_alerta("Sin Fondos", "El trámite notarial cuesta $100 dólares. Ahorra un poco más.")
		return
		
	var nuevo_nombre = input_nombre_compania.text.strip_edges()
	if nuevo_nombre == "":
		mostrar_alerta("Nombre Inválido", "El nombre no puede estar vacío.")
	else:
		Datos.economia["dinero"] -= 100
		Datos.mi_compania["nombre"] = nuevo_nombre
		Datos.mi_compania["fundada"] = true # <--- ¡SE SELLA PARA SIEMPRE!
		input_nombre_compania.editable = false # Bloquea la edición visual
		
		mostrar_alerta("Trámite Legal Listo", "Pagaste -$100 al notario.\nTu compañía ahora está registrada legalmente como:\n\n" + nuevo_nombre)
		publicar_auto("¡Gente! Oficialmente he fundado y registrado mi propia compañía. Sigan a " + nuevo_nombre + " para próximos proyectos. 🥂🎬")
		actualizar_interfaz()
# ==========================================
# 🎭 MOTOR DE ARQUETIPOS DE ACTUACIÓN
# ==========================================
func obtener_arquetipo_dominante() -> String:
	var dom = "versatil"
	var max_p = 0
	for clave in ["metodo", "fisico", "forma", "comercial", "instinto"]:
		# .get() busca la llave. Si por algún error no existe, devuelve 0 y evita el crash.
		var puntos = Datos.perfil_actor.get(clave, 0) 
		
		if puntos > max_p:
			max_p = puntos
			dom = clave
			
	if max_p < 20: return "versatil" 
	return dom


# ==========================================
# 🃏 APP: MI MAZO DE ACTUACIÓN (BALASIM)
# ==========================================
func _on_btn_app_mazo_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_mazo.visible = true
	
	# Limpiar lista anterior
	for hijo in contenedor_lista_mazo.get_children(): 
		hijo.queue_free()
		
	if Datos.mazo_jugador.is_empty():
		var lbl = Label.new()
		lbl.text = "No tienes cartas. ¡Eres un actor de madera!"
		contenedor_lista_mazo.add_child(lbl)
		return
		
	# Contar cartas repetidas para no mostrar una lista gigante
	var conteo_cartas = {}
	for id_carta in Datos.mazo_jugador:
		if conteo_cartas.has(id_carta): conteo_cartas[id_carta] += 1
		else: conteo_cartas[id_carta] = 1
		
	# Dibujar las cartas en la UI
	for id_carta in conteo_cartas.keys():
		var cantidad = conteo_cartas[id_carta]
		var info_carta = Datos.catalogo_cartas[id_carta]
		
		var panel_carta = PanelContainer.new() # Un fondito bonito para la carta
		var vbox = VBoxContainer.new()
		
		var lbl_titulo = Label.new()
		lbl_titulo.text = info_carta["nombre"] + " (x" + str(cantidad) + ")"
		
		# Color según la rareza
		if info_carta["rareza"] == "Común": lbl_titulo.modulate = Color(0.8, 0.8, 0.8) # Gris
		elif info_carta["rareza"] == "Rara": lbl_titulo.modulate = Color(0.2, 0.5, 1.0) # Azul
		elif info_carta["rareza"] == "Épica": lbl_titulo.modulate = Color(0.8, 0.2, 1.0) # Morado
		
		var lbl_stats = Label.new()
		lbl_stats.text = "⭐ Poder: " + str(info_carta["poder"]) + " | Rareza: " + info_carta["rareza"]
		
		var lbl_desc = Label.new()
		lbl_desc.text = "«" + info_carta["desc"] + "»"
		lbl_desc.autowrap_mode = TextServer.AUTOWRAP_WORD
		lbl_desc.modulate = Color(1.0, 1.0, 0.6) # Letra amarilla o itálica para el chiste
		
		vbox.add_child(lbl_titulo)
		vbox.add_child(lbl_stats)
		vbox.add_child(lbl_desc)
		
		var separador = HSeparator.new()
		vbox.add_child(separador)
		
		panel_carta.add_child(vbox)
		contenedor_lista_mazo.add_child(panel_carta)

func _on_btn_volver_inicio_mazo_pressed():
	panel_app_mazo.visible = false
	contenedor_menu_inicio.visible = true


func _on_btn_fusionar_cartas_pressed():
	panel_coach.visible = true
	
	# Limpiamos la lista anterior
	for hijo in cont_lista_coach.get_children(): hijo.queue_free()
	
	var hay_opciones = false
	
	# Analizamos todas las recetas
	for id_resultado in Datos.recetas_crafteo.keys():
		var info_resultado = Datos.catalogo_cartas[id_resultado]
		var rareza = info_resultado["rareza"]
		
		# Definimos el costo
		var costo = 20
		if rareza == "Épica": costo = 150
		elif rareza == "Legendaria": costo = 1000
		
		var ingredientes = Datos.recetas_crafteo[id_resultado]
		var ing1 = ingredientes[0]
		var ing2 = ingredientes[1]
		
		# Comprobamos si tienes las cartas necesarias
		var tiene_ingredientes = false
		if ing1 == ing2:
			if Datos.mazo_jugador.count(ing1) >= 2: tiene_ingredientes = true
		else:
			if Datos.mazo_jugador.has(ing1) and Datos.mazo_jugador.has(ing2): tiene_ingredientes = true
			
		# Si tienes los ingredientes, creamos el botón visual
		if tiene_ingredientes:
			hay_opciones = true
			var btn_receta = Button.new()
			var n1 = Datos.catalogo_cartas[ing1]["nombre"]
			var n2 = Datos.catalogo_cartas[ing2]["nombre"]
			
			btn_receta.text = "Crear: " + info_resultado["nombre"] + " (" + rareza + ")\n" + n1 + " + " + n2 + "\nHonorarios: $" + str(costo)
			btn_receta.custom_minimum_size = Vector2(0, 90)
			
			# Conectamos el botón para que ejecute la fusión al darle clic
			btn_receta.pressed.connect(ejecutar_fusion_coach.bind(id_resultado, ing1, ing2, costo, info_resultado["nombre"]))
			cont_lista_coach.add_child(btn_receta)
			
	# Si no hay nada que puedas armar
	if not hay_opciones:
		var lbl = Label.new()
		lbl.text = "\nEl Coach te revisa de arriba a abajo...\n\nNo tienes los pares de cartas necesarios para aprender ninguna técnica nueva. ¡Ve a la Academia a conseguir más!"
		lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
		cont_lista_coach.add_child(lbl)
func ejecutar_fusion_coach(id_resultado, ing1, ing2, costo, nombre_resultado):
	if Datos.economia["dinero"] < costo:
		mostrar_alerta("Sin Fondos", "El Coach se ríe de ti. Sus honorarios son $" + str(costo) + " y no te alcanza.")
		return
		
	# Cobrar y fusionar
	Datos.economia["dinero"] -= costo
	Datos.mazo_jugador.erase(ing1)
	Datos.mazo_jugador.erase(ing2)
	Datos.mazo_jugador.append(id_resultado)
	
	mostrar_alerta("🧠 Sesión Exitosa", "El Coach conectó tus emociones.\nObtuviste:\n🎭 " + nombre_resultado)
	
	actualizar_interfaz()
	_on_btn_fusionar_cartas_pressed() # Refrescamos la lista del coach en vivo

func _on_btn_cerrar_coach_pressed():
	panel_coach.visible = false
	_on_btn_app_mazo_pressed() # Refrescamos tu mazo normal para ver la carta nueva

# ==========================================
# 🃏 LÓGICA DE CARTAS (BALASIM)
# ==========================================
func jugar_carta_balasim(boton_carta, id_carta, info_carta):
	# Si ya estaba seleccionada, la QUITAMOS
	if boton_carta in seleccion_actual_nodos:
		seleccion_actual_nodos.erase(boton_carta)
		seleccion_actual_ids.erase(id_carta)
		boton_carta.modulate = Color(1, 1, 1) # Color normal
	else:
		# Si no estaba, la AÑADIMOS (si hay cupo)
		if seleccion_actual_nodos.size() >= max_cartas_jugables:
			return # No hace nada si ya llegaste al límite
			
		seleccion_actual_nodos.append(boton_carta)
		seleccion_actual_ids.append(id_carta)
		boton_carta.modulate = Color(0.3, 1.0, 0.3) # Resaltado verde
	
	# Actualizar contador de selección
	label_poder_jugador.text = "Rondas: " + str(rondas_restantes) + " | Seleccionadas: " + str(seleccion_actual_nodos.size()) + "/" + str(max_cartas_jugables)

func _on_btn_actuar_pressed():
	if seleccion_actual_nodos.is_empty(): return
	
	var puntos_ronda = 0
	var multiplicador_ronda = 1.0
	
	# 1. Procesar poder y efectos de las cartas seleccionadas
	for nodo in seleccion_actual_nodos:
		# Recuperamos la info guardada en el botón (podemos buscarla en el catálogo)
		# Nota: Para esto es mejor que el botón guarde su ID. 
		# Como lo pasamos por bind, procesaremos los puntos usando los IDs guardados.
		pass 
	
	# Cálculo simplificado para esta inyección (recorremos los IDs seleccionados)
	for id_c in seleccion_actual_ids:
		var info = Datos.catalogo_cartas[id_c]
		puntos_ronda += info["poder"]
		if info.has("efecto") and info["efecto"] == "doblar_poder_actual": multiplicador_ronda *= 2
		# ... (puedes añadir aquí el resto de efectos como multiplicar_poder)
	
	# 2. Buscar Combos
	for id_combo in Datos.combos_balasim.keys():
		var combo = Datos.combos_balasim[id_combo]
		if seleccion_actual_ids.has(combo["cartas"][0]) and seleccion_actual_ids.has(combo["cartas"][1]):
			puntos_ronda = int(puntos_ronda * combo["multiplicador"])
			mostrar_alerta("🔥 COMBO!", combo["nombre_combo"])
	
	poder_total_encuentro += int(puntos_ronda * multiplicador_ronda)
	
	# 3. Comprobar Victoria
	if poder_total_encuentro >= exigencia_director:
		panel_balasim.visible = false
		resolver_rutina_general(true)
		return
		
	# 4. Acción del Jefe y Siguiente Ronda
	rondas_restantes -= 1
	if rondas_restantes <= 0:
		panel_balasim.visible = false
		resolver_rutina_general(false)
	else:
		ejecutar_accion_jefe()
		seleccion_actual_nodos.clear()
		seleccion_actual_ids.clear()
		repartir_mano_balasim() # Robamos cartas nuevas para la siguiente ronda
		actualizar_ui_balasim(label_jefe.text.split("\n")[0])

func ejecutar_accion_jefe():
	var azar = randi_range(1, 3)
	if azar == 1:
		# El jefe te quita una carta al azar de tu mazo este encuentro
		if Datos.mazo_jugador.size() > 5:
			var carta_borrada = Datos.mazo_jugador.pick_random()
			# (Lógica visual opcional)
			mostrar_alerta("🚫 CRÍTICA DURA", "El jefe odió tu técnica. No podrás usar '" + Datos.catalogo_cartas[carta_borrada]["nombre"] + "' en esta audición.")
	elif azar == 2:
		# El jefe te aumenta la exigencia
		exigencia_director += 5
		mostrar_alerta("📈 MÁS EXIGENCIA", "El director se puso de mal humor. (+5 puntos necesarios)")


func _on_btn_mulligan_pressed():
	if mulligans_restantes <= 0:
		return
		
	mulligans_restantes -= 1
	btn_mulligan.text = "🔄 Redibujar Mano (" + str(mulligans_restantes) + " rest.)"
	
	if mulligans_restantes == 0:
		btn_mulligan.disabled = true
		
	# Efecto de sonido/alerta visual (opcional)
	mostrar_alerta("🔄 Cambio de Táctica", "Tiraste tu mano actual a la basura. ¡Robando nuevas cartas!")
	
	# 1. Limpiamos la mesa actual (Solo las cartas, no tu poder ya acumulado)
	for hijo in contenedor_mano.get_children(): 
		hijo.queue_free()
		
	# 2. Volvemos a robar
	var mazo_temp = Datos.mazo_jugador.duplicate()
	mazo_temp.shuffle() 
	
	var tamano_mano = 3 + int(Datos.habilidades_actor["memoria"] / 2) 
	tamano_mano = clamp(tamano_mano, 3, 7) 
	
	for i in range(min(tamano_mano, mazo_temp.size())):
		var id_carta = mazo_temp[i]
		var info = Datos.catalogo_cartas[id_carta]
		
		var btn_carta = Button.new()
		
		var texto_extra = ""
		if info.has("efecto"):
			if info["efecto"] == "robar_carta": texto_extra = "\n🎴 +Cartas"
			elif info["efecto"] == "doblar_poder_actual": texto_extra = "\n💥 Poder x2"
			elif info["efecto"] == "mas_jugadas": texto_extra = "\n⚡ +1 Jugada"
			
		btn_carta.text = info["nombre"] + "\n⭐ Poder: " + str(info["poder"]) + texto_extra
		btn_carta.custom_minimum_size = Vector2(120, 160)
		btn_carta.pressed.connect(jugar_carta_balasim.bind(btn_carta, id_carta, info))
		contenedor_mano.add_child(btn_carta)


# ==========================================
# 🎓 APP ACADEMIA (COMPRA DE CARTAS)
# ==========================================
func _on_btn_app_academia_pressed():
	contenedor_menu_inicio.visible = false
	panel_app_academia.visible = true

func _on_btn_volver_inicio_academia_pressed():
	panel_app_academia.visible = false
	contenedor_menu_inicio.visible = true

func comprar_curso(tipo_curso):
	var costo = 0
	var costo_energia = 0
	var cartas_ganadas = []
	
	# 1. Separar el catálogo por rarezas para el RNG
	var cat_comunes = []; var cat_raras = []; var cat_epicas = []; var cat_legendarias = []
	for id in Datos.catalogo_cartas.keys():
		var rareza = Datos.catalogo_cartas[id]["rareza"]
		if rareza == "Común": cat_comunes.append(id)
		elif rareza == "Rara": cat_raras.append(id)
		elif rareza == "Épica": cat_epicas.append(id)
		elif rareza == "Legendaria": cat_legendarias.append(id)
		
	# 2. Definir Costos y Recompensas según el curso
	if tipo_curso == "basico":
		costo = 50; costo_energia = 1
		if comprobar_pago_clase(costo, costo_energia):
			cartas_ganadas.append(cat_comunes.pick_random())
			cartas_ganadas.append(cat_comunes.pick_random())
			cartas_ganadas.append(cat_comunes.pick_random())
			cartas_ganadas.append(cat_raras.pick_random())
			
	elif tipo_curso == "medio":
		costo = 250; costo_energia = 2
		if comprobar_pago_clase(costo, costo_energia):
			cartas_ganadas.append(cat_raras.pick_random())
			cartas_ganadas.append(cat_raras.pick_random())
			# 30% de Épica, si no, otra Rara
			if randi_range(1, 100) <= 30: cartas_ganadas.append(cat_epicas.pick_random())
			else: cartas_ganadas.append(cat_raras.pick_random())
			
	elif tipo_curso == "pro":
		costo = 1000; costo_energia = 3
		if comprobar_pago_clase(costo, costo_energia):
			cartas_ganadas.append(cat_epicas.pick_random())
			cartas_ganadas.append(cat_epicas.pick_random())
			# 10% de Legendaria directa, si no, otra Épica
			if randi_range(1, 100) <= 10: cartas_ganadas.append(cat_legendarias.pick_random())
			else: cartas_ganadas.append(cat_epicas.pick_random())
			
	# 3. Entregar las cartas al jugador
	if cartas_ganadas.size() > 0:
		var texto_alerta = "Has asistido a la clase y tu técnica mejoró. Aprendiste:\n\n"
		for id_carta in cartas_ganadas:
			Datos.mazo_jugador.append(id_carta)
			texto_alerta += "🎭 " + Datos.catalogo_cartas[id_carta]["nombre"] + " (" + Datos.catalogo_cartas[id_carta]["rareza"] + ")\n"
			
		mostrar_alerta("🎓 Clase Completada", texto_alerta)
		actualizar_interfaz()

func comprobar_pago_clase(costo, energia) -> bool:
	if Datos.stats_actor["energia_actual"] < energia:
		mostrar_alerta("¡Exhausto!", "No tienes energía para ir a clases (" + str(energia) + "E necesarias).")
		return false
	if Datos.economia["dinero"] < costo:
		mostrar_alerta("Sin Fondos", "El arte cuesta caro. Necesitas $" + str(costo) + " para este curso.")
		return false
		
	# Cobrar
	Datos.stats_actor["energia_actual"] -= energia
	Datos.economia["dinero"] -= costo
	return true
func repartir_mano_balasim():
	for hijo in contenedor_mano.get_children(): hijo.queue_free()
	
	var mazo_temp = Datos.mazo_jugador.duplicate()
	mazo_temp.shuffle()
	var tamano_mano = clamp(3 + int(Datos.habilidades_actor["memoria"] / 2), 3, 7)
	
	for i in range(min(tamano_mano, mazo_temp.size())):
		var id_c = mazo_temp[i]
		var info = Datos.catalogo_cartas[id_c]
		var btn_c = Button.new()
		btn_c.text = info["nombre"] + "\n⭐ " + str(info["poder"])
		btn_c.custom_minimum_size = Vector2(120, 160)
		btn_c.pressed.connect(jugar_carta_balasim.bind(btn_c, id_c, info))
		contenedor_mano.add_child(btn_c)
# --- CONEXIÓN DE BOTONES ---
func _on_btn_curso_basico_pressed(): comprar_curso("basico")
func _on_btn_curso_medio_pressed(): comprar_curso("medio")
func _on_btn_curso_pro_pressed(): comprar_curso("pro")
