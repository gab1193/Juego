extends Node2D

# --- 1. REFERENCIAS DE INTERFAZ GENERAL ---
@onready var grafico_arquetipo = $CapaUI/PanelInfoStats/GraficoArquetipo # <--- AGREGA ESTA LÍNEA
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
@onready var contenedor_lista_castings = $CapaUI/PanelSimPhone/PanelAppCastings/VBoxContainer/ScrollContainer/ContenedorListaCastings
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
var resolviendo_balasim = false # Evita doble click / re-entradas en resolución de ronda
var mazo_combate_actual = []

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
var carta_entrenando_id = ""
@onready var panel_seleccion_ensayo = $CapaUI/PanelSeleccionEnsayo
@onready var contenedor_opciones_ensayo = $CapaUI/PanelSeleccionEnsayo/VBoxContainer/ContenedorOpcionesEnsayo
var castings_de_hoy = [] 
var rutina_activa = false
var tipo_rutina = ""
var cursor_velocidad = 500 
var cursor_direccion = 1
var monologo_activo = false
var monologo_tiempo = 0.0
var monologo_concentracion = 100.0
var monologo_estamina = 40.0
var monologo_xp_recolectada = 0
var monologo_spawn_acum = 0.0
var monologo_ui = {}
var monologo_dots = []
var tecnicas_monologo = [
	{"nombre": "Respiración", "costo": 14, "dps": 10.0, "dur": 3.5, "radio": 120.0, "color": Color(0.6, 0.9, 1.0)},
	{"nombre": "Leer en Voz Alta", "costo": 20, "dps": 16.0, "dur": 3.0, "radio": 160.0, "color": Color(1.0, 0.8, 0.4)},
	{"nombre": "Aislarse", "costo": 28, "dps": 26.0, "dur": 2.6, "radio": 220.0, "color": Color(0.8, 1.0, 0.6)}
]
var bonus_agentes_ronda = {}

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
	# --- SISTEMA DE CARGA AUTOMÁTICA ---
	var carga_exitosa = Datos.cargar_partida()
	
	if carga_exitosa:
		print("El jugador continuó su carrera.")
	else:
		print("Nueva partida iniciada.")
	# --- NORMALIZACIÓN DE CARTAS (balance + arquetipos) ---
	Datos.normalizar_catalogo_cartas()
		
	actualizar_interfaz() # Refrescamos la UI con los datos cargados
	# -----------------------------------
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
	panel_evento_matutino.z_as_relative = false
	panel_evento_matutino.z_index = 200
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
# Llenamos el mazo disponible si el juego acaba de abrir
	if Datos.mazo_disponible.is_empty() and not Datos.mazo_jugador.is_empty():
		Datos.mazo_disponible = Datos.mazo_jugador.duplicate()
func _process(delta):
	if rutina_activa:
		cursor_barra.position.x += cursor_velocidad * cursor_direccion * delta
		if cursor_barra.position.x >= 290:
			cursor_barra.position.x = 290
			cursor_direccion = -1
		elif cursor_barra.position.x <= 0:
			cursor_barra.position.x = 0
			cursor_direccion = 1
	if monologo_activo:
		_procesar_monologo(delta)

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
	var agentes_txt = "\n🎲 Agentes: "
	for i in range(Datos.agentes_slots.size()):
		var id_ag = str(Datos.agentes_slots[i])
		if id_ag == "":
			agentes_txt += "[Slot " + str(i + 1) + ": vacío] "
		else:
			var nom = Datos.catalogo_agentes.get(id_ag, {}).get("nombre", id_ag)
			agentes_txt += "[" + str(i + 1) + ": " + str(nom) + "] "
	texto_arq += agentes_txt
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
			
			var max_rend = float((proy["dias_de_trabajo"] - 1) + 2)
			var actual = float(proy["rendimiento_acumulado"])
			var porcentaje = clamp((actual / max_rend) * 100.0, 0.0, 100.0)
			
			var estrellas_est = clamp(int((actual / max_rend) * 5), 1, 5)
			var txt_est = ""
			for e in range(estrellas_est): txt_est += "⭐"
			
			texto_medidor += "🎬 " + nombre + "\n"
			texto_medidor += "   Preparación: " + str(snapped(porcentaje, 1)) + "% (" + txt_est + ")\n"
			
		label_proyectos.text = texto_medidor
		label_proyectos.visible = true
		
		# Modificamos el botón de ensayar
		if Datos.mazo_disponible.is_empty():
			btn_ensayar.text = "Repasar Guiones 🔒 (Cero Cartas)"
			btn_ensayar.disabled = true
		else:
			btn_ensayar.text = "Repasar Guiones (-1 E)"
			btn_ensayar.disabled = false
	else:
		label_proyectos.visible = false
		if Datos.mazo_disponible.is_empty():
			btn_ensayar.text = "Ensayo Libre 🔒 (Cero Cartas)"
			btn_ensayar.disabled = true
		else:
			btn_ensayar.text = "Ensayar Monólogo Libre (-1 E)"
			btn_ensayar.disabled = false
		
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

func _on_btn_info_stats_pressed(): 
	panel_info_stats.visible = true
	# Hacemos que la araña se actualice cada que abres la app
	if is_instance_valid(grafico_arquetipo):
		grafico_arquetipo.actualizar_grafico()
func _on_btn_cerrar_info_pressed(): panel_info_stats.visible = false

# --- 4. MECÁNICAS DE RUTINA ---
func iniciar_skill_check(tipo):
	if Datos.mazo_disponible.is_empty():
		mostrar_alerta("📭 Sin cartas disponibles", "Ya usaste todas tus cartas esta semana. Descansa hasta el lunes para reciclar tu mazo.")
		return

	var costo_energia = 1
	if tipo == "trabajo": costo_energia = 2
	
	if Datos.stats_actor["energia_actual"] >= costo_energia:
		Datos.stats_actor["energia_actual"] -= costo_energia
		tipo_rutina = tipo
		panel_balasim.visible = true
		
		# --- 1. JEFES CONTEXTUALES Y EXIGENCIA DINÁMICA ---
		var nombre_jefe = "Director General"
		var base_exigencia = 10
		rondas_restantes = 3 
		
		if tipo == "trabajo":
			casting_data_actual = {}
			nombre_jefe = "Mesa 4: Cliente Problemático"
			exigencia_director = randi_range(6, 12)
			rondas_restantes = 2
		elif tipo == "ensayo_casa":
			casting_data_actual = {}
			nombre_jefe = "Tu Propia Inseguridad"
			exigencia_director = randi_range(12, 20)
		elif tipo == "casting_real":
			var nivel_req = casting_data_actual.get("nivel_minimo", 1)
			nombre_jefe = "Casting: " + casting_data_actual.get("empresa", "Productora")
			var bal = _exigencia_casting_balance(casting_data_actual)
			exigencia_director = int(bal["exigencia"])
			rondas_restantes = int(bal["rondas"])
		elif tipo == "ensayo_cast" or tipo == "funcion":
			var nivel_req = casting_data_actual.get("nivel_minimo", 1)
			var arq = casting_data_actual.get("arquetipo", "comercial")
			var es_funcion = (tipo == "funcion")
			
			# ¡FÓRMULA INFINITA! Base 15 pts por cada nivel del casting
			base_exigencia = (nivel_req * 15) + randi_range(10, 25)
			
			if es_funcion: 
				base_exigencia = int(base_exigencia * 2.0)
				# Te damos 1 ronda extra por cada 5 niveles para compensar batallas largas
				rondas_restantes = 4 + int(nivel_req / 5.0) 
			
			exigencia_director = base_exigencia
			# (El resto de nombres de jefes por arquetipo déjalos igual...)
		elif tipo == "ensayo_cast" or tipo == "funcion":
			var nivel_req = casting_data_actual.get("nivel_minimo", 1)
			var arq = casting_data_actual.get("arquetipo", "comercial")
			var es_funcion = (tipo == "funcion")
			
			if nivel_req == 1: base_exigencia = randi_range(15, 25)
			elif nivel_req == 2: base_exigencia = randi_range(40, 60)
			elif nivel_req >= 3: base_exigencia = randi_range(100, 150)
			
			if es_funcion: 
				base_exigencia = int(base_exigencia * 2.5)
				rondas_restantes = 4
			
			exigencia_director = base_exigencia
			
			if arq == "fisico":
				if nivel_req == 1: nombre_jefe = "Niños de Fiesta Salvajes"
				elif nivel_req == 2: nombre_jefe = "Coreógrafo Estricto"
				else: nombre_jefe = "Director de Dobles de Acción de Hollywood"
			elif arq == "comercial":
				if nivel_req == 1: nombre_jefe = "Productor de Anuncios Locales"
				else: nombre_jefe = "Mesa de Ejecutivos de la Marca"
			elif arq == "metodo":
				if nivel_req == 1: nombre_jefe = "Director de Corto Universitario"
				elif nivel_req == 2: nombre_jefe = "Crítico de Teatro Local"
				else: nombre_jefe = "Cineasta de Culto Europeo"
			elif arq == "forma":
				if nivel_req == 1: nombre_jefe = "Ingeniero de Sonido Gruñón"
				else: nombre_jefe = "Director de la Royal Shakespeare Company"
			else:
				nombre_jefe = "Público Exigente"

		# --- 2. CONFIGURACIÓN DE BATALLA Y UI ---
		poder_acumulado_turno = Datos.habilidades_actor["carisma"] * 2 
		poder_total_encuentro = poder_acumulado_turno
		resolviendo_balasim = false
		btn_actuar.disabled = false
		seleccion_actual_nodos.clear()
		seleccion_actual_ids.clear()
		max_cartas_jugables = 2 + int(Datos.habilidades_actor["expresion_corporal"] / 2) 
		mulligans_restantes = 1 + int(Datos.habilidades_actor["nivel_general"] / 5)
		# --- ESCALADO DE MEMORIA (RECURSOS DE BATALLA) ---
		# Empiezas con 2 Mulligans base. Por cada 10 puntos de Memoria, ganas 1 extra.
		mulligans_restantes = 2 + int(Datos.habilidades_actor.get("memoria", 1) / 10.0)
		# --- 🌟 SUPERPODERES DE ARQUETIPO DOMINANTE (ESCALADO INFINITO) ---
		var mi_arquetipo = obtener_arquetipo_dominante()
		var nivel_arq = Datos.perfil_actor.get(mi_arquetipo, 0)
		var robar_extra_instinto = 0
		
		if mi_arquetipo == "comercial":
			var bono_fama = 10 + int(nivel_arq / 2.0)
			poder_acumulado_turno += bono_fama
			escribir_log_batalla("💸 Favoritismo (Comercial): Tu fama te precede. Empiezas con +" + str(bono_fama) + " Pts.")
			
		elif mi_arquetipo == "fisico":
			var bono_mull = 1 + int(nivel_arq / 20.0)
			mulligans_restantes += bono_mull
			escribir_log_batalla("💪 Inagotable (Físico): Tu condición física te da +" + str(bono_mull) + " Redibujos extra.")
			
		elif mi_arquetipo == "instinto":
			robar_extra_instinto = 1 + int(nivel_arq / 25.0)
			escribir_log_batalla("⚡ Mente Rápida (Instinto): Robarás " + str(robar_extra_instinto) + " carta(s) extra este turno.")
		if _agentes_activos().has("sponsor_fisico"):
			Datos.stats_actor["energia_actual"] = min(Datos.stats_actor["energia_maxima"], Datos.stats_actor["energia_actual"] + 1)
			escribir_log_batalla("💪 Sponsor Físico: +1 Energía al iniciar combate.")
		actualizar_ui_balasim(nombre_jefe)
		# 1. Repartimos la mano inicial normalmente
		repartir_mano_balasim(true)
		
		# --- 👑 CASTIGO DE EGO (Pérdida de opciones) ---
		var mi_ego = Datos.stats_actor.get("ego", 0)
		if mi_ego >= 60:
			var mulligans_perdidos = int(mi_ego / 20.0)
			mulligans_restantes = max(0, mulligans_restantes - mulligans_perdidos)
			escribir_log_batalla("👑 Actitud de Diva: Pierdes " + str(mulligans_perdidos) + " Redibujos.")
			mostrar_texto_flotante("👑 Diva: -" + str(mulligans_perdidos) + " Redibujos", btn_mulligan, Color.RED) # <--- NUEVO

		# --- 💥 CASTIGO DE ESTRÉS (El Jefe huele tu miedo) ---
		var mi_estres = Datos.stats_actor.get("estres", 0)
		if mi_estres >= 50:
			var cartas_panico_iniciales = int(mi_estres / 30.0) 
			escribir_log_batalla("💥 Mente Frágil: El estrés te sabotea desde el inicio.")
			mostrar_texto_flotante("💥 Mente Frágil: Sabotaje Inicial", label_jefe, Color.PURPLE) # <--- NUEVO
			
			var llaves_peligro = ["nervios", "panico"]
			for i in range(cartas_panico_iniciales):
				inyectar_carta_peligro(llaves_peligro.pick_random())
			
		
		# Aplicamos el poder de robo extra del Instinto
		if robar_extra_instinto > 0:
			for i in range(robar_extra_instinto):
				if Datos.mazo_disponible.size() > 0:
					var extra_id = Datos.mazo_disponible.pick_random()
					crear_boton_carta_en_mesa(extra_id)
					Datos.mazo_disponible.erase(extra_id)
		
		# --- GESTIÓN DEL LOG DE BATALLA ---
		var vbox_log = null
		if panel_balasim.has_node("CajaLogBatalla"):
			# Si ya existe, solo borramos los textos viejos
			var log_existente = panel_balasim.get_node("CajaLogBatalla")
			vbox_log = log_existente.find_child("VBoxLog", true, false)
			for hijo in vbox_log.get_children(): hijo.queue_free()
		else:
			# Si no existe, lo creamos desde cero una sola vez
			var panel_log = PanelContainer.new()
			panel_log.name = "CajaLogBatalla"
			panel_log.position = Vector2(10, 10)
			panel_log.size = Vector2(300, 150)
			panel_log.mouse_filter = Control.MOUSE_FILTER_IGNORE # Para que no bloquee clicks
			
			var scroll = ScrollContainer.new()
			scroll.name = "ScrollContainer"
			scroll.size = panel_log.size
			scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
			
			vbox_log = VBoxContainer.new()
			vbox_log.name = "VBoxLog"
			vbox_log.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			
			scroll.add_child(vbox_log)
			panel_log.add_child(scroll)
			panel_balasim.add_child(panel_log)
		
		escribir_log_batalla("🎬 Inicia la prueba contra: " + nombre_jefe)
	else:
		mostrar_alerta("¡Exhausto!", "No tienes energía suficiente (" + str(costo_energia) + "E necesarias).")
func escribir_log_batalla(texto):
	# Buscamos el VBoxLog de forma más segura
	if not panel_balasim.has_node("CajaLogBatalla"): return
	var vbox_log = panel_balasim.get_node("CajaLogBatalla").find_child("VBoxLog", true, false)
	if not vbox_log: return
	
	var lbl = Label.new()
	lbl.text = "> " + texto
	lbl.autowrap_mode = TextServer.AUTOWRAP_WORD
	lbl.add_theme_font_size_override("font_size", 12)
	vbox_log.add_child(lbl)
	
	# Buscamos el ScrollContainer para bajar la barrita
	var scroll = panel_balasim.get_node("CajaLogBatalla").find_child("ScrollContainer", true, false)
	
	# Auto-bajar el scroll con SEGURIDAD
	if is_instance_valid(scroll):
		await get_tree().process_frame
		# Aquí está el truco: verificamos OTRA VEZ después del await
		if is_instance_valid(scroll) and not scroll.is_queued_for_deletion():
			scroll.scroll_vertical = int(scroll.get_v_scroll_bar().max_value)
func actualizar_ui_balasim(nombre_jefe):
	var limite_visual = max_cartas_jugables
	for id in seleccion_actual_ids:
		var info_sel = Datos.obtener_info_carta(id)
		if info_sel.is_empty():
			continue
		if info_sel.has("efecto") and info_sel["efecto"] == "mas_jugadas":
			limite_visual += info_sel.get("valor", 0)
			
	# --- NUEVO: PREVISUALIZACIÓN ---
	var proyeccion = calcular_puntos_proyectados()
	var texto_proyeccion = ""
	if proyeccion.get("promedio", 0) > 0:
		if proyeccion.get("hay_rng_critico", false):
			texto_proyeccion = " (💥 " + str(proyeccion.get("minimo", 0)) + "-" + str(proyeccion.get("maximo", 0)) + " pts)"
		else:
			texto_proyeccion = " (💥 " + str(proyeccion.get("promedio", 0)) + " pts)"

	label_jefe.text = "⚔️ " + nombre_jefe + "\nExigencia: " + str(poder_acumulado_turno) + " / " + str(exigencia_director)
	label_poder_jugador.text = "Rondas: " + str(rondas_restantes) + " | Seleccionadas: " + str(seleccion_actual_nodos.size()) + "/" + str(limite_visual)
	btn_actuar.text = "🎭 ¡ACTUAR!" + texto_proyeccion
	btn_mulligan.text = "🔄 Redibujar (" + str(mulligans_restantes) + " rest.)"

func _on_boton_trabajar_pressed(): 
	if not ha_trabajado_hoy:
		if Datos.stats_actor["energia_actual"] >= 2:
			Datos.stats_actor["energia_actual"] -= 2
			tipo_rutina = "trabajo"
			panel_rutina.visible = true
			
			label_titulo_rutina.text = "☕ ¡Mesa 4!\nDetén la barra en lo verde (Click o Espacio) para no tirar la charola."
			
			rutina_activa = true
			# Entre más estrés tengas, más rápido tiembla tu pulso
			cursor_velocidad = 300 + (Datos.stats_actor["estres"] * 4) 
		else:
			mostrar_alerta("¡Exhausto!", "No tienes 2 de Energía para trabajar de mesero.")
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
	abrir_selector_carta_monologo()

func abrir_selector_carta_monologo():
	var opciones = Datos.mazo_disponible.duplicate()
	if opciones.is_empty():
		mostrar_alerta("📭 Sin cartas", "No tienes cartas disponibles esta semana para entrenar.")
		return
	var dialog = AcceptDialog.new()
	dialog.title = "🧠 El Monólogo Interior"
	dialog.dialog_text = "Elige una carta para entrenar su maestría (NO se consume)."
	dialog.ok_button_text = "Cancelar"
	var vb = VBoxContainer.new()
	var limite = min(8, opciones.size())
	for i in range(limite):
		var id_inst = opciones[i]
		var info = Datos.obtener_info_carta(id_inst)
		if info.is_empty():
			continue
		var btn = Button.new()
		btn.autowrap_mode = TextServer.AUTOWRAP_WORD
		btn.text = info.get("nombre", "Carta") + " | Niv " + str(Datos.obtener_nivel_carta(id_inst)) + " | Poder " + str(Datos.obtener_poder_carta(id_inst))
		btn.pressed.connect(func(id_sel = id_inst):
			carta_entrenando_id = id_sel
			dialog.queue_free()
			iniciar_monologo_interior(id_sel)
		)
		vb.add_child(btn)
	dialog.add_child(vb)
	add_child(dialog)
	dialog.popup_centered(Vector2(560, 500))

func iniciar_monologo_interior(id_carta_entrenada: String):
	if Datos.stats_actor["energia_actual"] < 1:
		mostrar_alerta("¡Exhausto!", "No tienes energía para trabajar mesa.")
		return
	Datos.stats_actor["energia_actual"] -= 1
	monologo_activo = true
	monologo_tiempo = 0.0
	monologo_concentracion = 100.0
	monologo_estamina = 40.0
	monologo_xp_recolectada = 0
	monologo_spawn_acum = 0.0
	monologo_dots.clear()
	panel_balasim.visible = false
	if monologo_ui.has("root") and is_instance_valid(monologo_ui["root"]):
		monologo_ui["root"].queue_free()
	var root = Control.new()
	root.name = "PanelMonologoInterior"
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	$CapaUI.add_child(root)
	monologo_ui = {"root": root, "enemigos": [], "carta": id_carta_entrenada}
	var lvl_c = max(1, Datos.obtener_nivel_carta(id_carta_entrenada))
	monologo_ui["dificultad"] = 1.0 + (lvl_c * 0.08)
	var lbl_top = Label.new(); lbl_top.position = Vector2(24, 18); root.add_child(lbl_top); monologo_ui["lbl_top"] = lbl_top
	var lbl_time = Label.new(); lbl_time.position = Vector2(24, 46); root.add_child(lbl_time); monologo_ui["lbl_time"] = lbl_time
	var carta = PanelContainer.new(); carta.custom_minimum_size = Vector2(300, 140); carta.position = Vector2(430, 260); root.add_child(carta); monologo_ui["carta"] = carta
	var info = Datos.obtener_info_carta(id_carta_entrenada)
	var lbl_carta = Label.new(); lbl_carta.autowrap_mode = TextServer.AUTOWRAP_WORD
	lbl_carta.text = "🎭 " + info.get("nombre", "Carta") + "\nNivel: " + str(Datos.obtener_nivel_carta(id_carta_entrenada)) + " | Poder: " + str(Datos.obtener_poder_carta(id_carta_entrenada))
	carta.add_child(lbl_carta)
	var lbl_est = Label.new(); lbl_est.position = Vector2(24, 520); root.add_child(lbl_est); monologo_ui["lbl_est"] = lbl_est
	for i in range(tecnicas_monologo.size()):
		var t = tecnicas_monologo[i]
		var btn = Button.new()
		btn.position = Vector2(24 + (i * 230), 560)
		btn.custom_minimum_size = Vector2(210, 80)
		btn.text = t["nombre"] + "\nCosto " + str(t["costo"]) + " | DoT " + str(snapped(t["dps"], 0.1)) + "/s"
		btn.modulate = t["color"]
		btn.pressed.connect(usar_tecnica_monologo.bind(i))
		root.add_child(btn)
		monologo_ui["btn_" + str(i)] = btn
	actualizar_ui_monologo()

func usar_tecnica_monologo(idx: int):
	if not monologo_activo:
		return
	if idx < 0 or idx >= tecnicas_monologo.size():
		return
	var t = tecnicas_monologo[idx]
	if monologo_estamina < float(t["costo"]):
		return
	monologo_estamina -= float(t["costo"])
	var tiempo_factor = 1.0 + min(1.5, monologo_tiempo / 50.0)
	var dot = {
		"tiempo": float(t["dur"]),
		"dps": float(t["dps"]) * tiempo_factor,
		"radio": float(t["radio"]),
		"color": t["color"],
		"nombre": t["nombre"]
	}
	monologo_dots.append(dot)
	mostrar_texto_flotante("🌀 " + t["nombre"], monologo_ui.get("carta"), t["color"], 1.0)
	actualizar_ui_monologo()

func _procesar_monologo(delta):
	if not monologo_ui.has("root") or not is_instance_valid(monologo_ui["root"]):
		monologo_activo = false
		return
	monologo_tiempo += delta
	monologo_estamina = min(100.0, monologo_estamina + (10.0 * delta))
	monologo_spawn_acum += delta
	var dificultad = float(monologo_ui.get("dificultad", 1.0))
	var presion_tiempo = 1.0 + min(1.6, monologo_tiempo / 35.0)
	if monologo_spawn_acum >= (1.65 / (dificultad * presion_tiempo)):
		monologo_spawn_acum = 0.0
		_spawn_enemigo_monologo(presion_tiempo)
	var centro = Vector2(580, 330)
	for i in range(monologo_dots.size() - 1, -1, -1):
		monologo_dots[i]["tiempo"] = float(monologo_dots[i]["tiempo"]) - delta
		var dps = float(monologo_dots[i]["dps"])
		var radio = float(monologo_dots[i]["radio"])
		for enemigo in monologo_ui.get("enemigos", []):
			if not is_instance_valid(enemigo):
				continue
			if enemigo.position.distance_to(centro) <= radio:
				var hp = float(enemigo.get_meta("hp", 10.0)) - (dps * delta)
				enemigo.set_meta("hp", hp)
				enemigo.text = str(enemigo.get_meta("tipo", "Distracción")) + " (" + str(max(0, int(hp))) + ")"
				if hp <= 0.0:
					monologo_xp_recolectada += 4
					enemigo.queue_free()
		if monologo_dots[i]["tiempo"] <= 0:
			monologo_dots.remove_at(i)
	for enemigo in monologo_ui.get("enemigos", []):
		if not is_instance_valid(enemigo):
			continue
		var dir = (centro - enemigo.position).normalized()
		enemigo.position += dir * (80.0 * dificultad * delta)
		if enemigo.position.distance_to(centro) < 55:
			var golpe = float(enemigo.get_meta("dmg", 9.0))
			monologo_concentracion = max(0.0, monologo_concentracion - golpe)
			mostrar_texto_flotante("💢 Distracción", monologo_ui.get("carta"), Color(1.0, 0.4, 0.4), 1.0)
			enemigo.queue_free()
	monologo_ui["enemigos"] = monologo_ui.get("enemigos", []).filter(func(e): return is_instance_valid(e) and not e.is_queued_for_deletion())
	actualizar_ui_monologo()
	if monologo_concentracion <= 0.0:
		finalizar_monologo_interior(false)
	elif monologo_tiempo >= 95.0:
		finalizar_monologo_interior(true)

func _spawn_enemigo_monologo(presion_tiempo: float = 1.0):
	if not monologo_ui.has("root"):
		return
	var e = Label.new()
	var t = ["Duda", "Ruido", "Inseguridad", "Miedo escénico"].pick_random()
	e.text = t + " (10)"
	e.set_meta("tipo", t)
	var dif = float(monologo_ui.get("dificultad", 1.0))
	e.set_meta("hp", 10.0 + (4.0 * dif * presion_tiempo))
	e.set_meta("dmg", 7.0 + (2.0 * dif * presion_tiempo))
	e.add_theme_color_override("font_color", Color(1.0, 0.5, 0.5))
	var lado = randi_range(0, 3)
	if lado == 0: e.position = Vector2(randf_range(0, 1160), 20)
	elif lado == 1: e.position = Vector2(randf_range(0, 1160), 630)
	elif lado == 2: e.position = Vector2(20, randf_range(0, 630))
	else: e.position = Vector2(1160, randf_range(0, 630))
	monologo_ui["root"].add_child(e)
	monologo_ui["enemigos"].append(e)

func actualizar_ui_monologo():
	if not monologo_ui.has("lbl_top"):
		return
	monologo_ui["lbl_top"].text = "🧠 Concentración: " + str(int(monologo_concentracion)) + "/100"
	monologo_ui["lbl_time"].text = "⏳ Tiempo sobrevivido: " + str(snapped(monologo_tiempo, 0.1)) + "s"
	monologo_ui["lbl_est"].text = "⚡ Estamina mental: " + str(int(monologo_estamina)) + " | XP acumulada carta: " + str(monologo_xp_recolectada) + " | Zonas activas: " + str(monologo_dots.size())

func finalizar_monologo_interior(fue_victoria: bool):
	monologo_activo = false
	var xp_por_tiempo = int(monologo_tiempo * 0.9)
	var bonus = 0
	if fue_victoria:
		bonus = 40
	var xp_total = monologo_xp_recolectada + xp_por_tiempo + bonus
	xp_total = int(clamp(xp_total, 12, 150))
	var xp_actor = 0
	var txt_carta = ""
	if carta_entrenando_id != "":
		var antes = _describir_xp_carta(carta_entrenando_id)
		Datos.otorgar_xp_carta(carta_entrenando_id, xp_total)
		var despues = _describir_xp_carta(carta_entrenando_id)
		txt_carta = "\nCarta: " + antes + " ➜ " + despues
		xp_actor = 8 + int(monologo_tiempo / 6.0) + int(xp_total / 12.0)
		Datos.habilidades_actor["xp_actual"] += xp_actor
	if monologo_ui.has("root") and is_instance_valid(monologo_ui["root"]):
		monologo_ui["root"].queue_free()
	monologo_ui.clear()
	monologo_dots.clear()
	var t = "Perdiste concentración tras " + str(snapped(monologo_tiempo, 0.1)) + "s."
	if fue_victoria:
		t = "Resististe " + str(snapped(monologo_tiempo, 0.1)) + "s y dominaste el monólogo."
	mostrar_alerta("🧠 Monólogo Interior", t + "\nXP Carta: +" + str(xp_total) + txt_carta + "\nXP Personaje: +" + str(xp_actor))
	comprobar_level_up()
	actualizar_interfaz()

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
	elif tipo_rutina == "funcion":
		var c = casting_data_actual
		var nombre_proyecto = c["titulo_unico"].split("\n")[1]
		var arq_dom = obtener_arquetipo_dominante() 

		# Balasim define el éxito de la crítica
		var estrellas = 1
		if fue_exito:
			c["rendimiento_acumulado"] += 2
			
			# ¡NUEVO: RECOMPENSA VARIABLE SEGÚN DESEMPEÑO EN COMBATE!
			var porcentaje_victoria = float(poder_total_encuentro) / float(exigencia_director)
			
			if porcentaje_victoria >= 1.5: 
				estrellas = 5 # Arrasaste
				c["recompensa_xp"] = int(c.get("recompensa_xp", 100) * 1.5)
			elif porcentaje_victoria >= 1.2: 
				estrellas = 4 # Muy bien
			else: 
				estrellas = 3 # Pasaste por los pelos
		else:
			estrellas = randi_range(1, 2)

		# --- SUBIDA DE PUNTOS DE ARQUETIPO (ADN) ---
		if estrellas >= 3:
			var arq_proyecto = c.get("arquetipo", "comercial")
			Datos.perfil_actor[arq_proyecto] += (estrellas * 2)

		# --- BUFF: ACTOR DE FORMA (ANTI-SABOTAJE) ---
		var alerta_sabotaje = ""
		if c.has("estado_tecnicos"):
			if c["estado_tecnicos"] == "sabotaje":
				if arq_dom == "forma":
					c["estado_tecnicos"] = "normal"
					alerta_sabotaje = "🛡️ Tu profesionalismo impidió el sabotaje.\n\n"
				else:
					estrellas = 1 
					alerta_sabotaje = "🚨 SABOTAJE: Los técnicos te arruinaron.\n\n"
			elif c["estado_tecnicos"] == "excelente":
				estrellas = clamp(estrellas + 1, 1, 5) 

		# --- CÁLCULO DE TAQUILLA Y PAGO ---
		var ganancia_final = 0; var audiencia_final = 0

		if c.has("tipo_pago") and c["tipo_pago"] == "taquilla":
			var base_aud = c.get("importancia", 1) * 20
			var aforo_maximo = 1000 
			if c.has("es_propia"): 
				base_aud += (c["influencia_equipo"] * 3) 
				aforo_maximo = Datos.espacios_disponibles[Datos.mi_compania["id_espacio_actual"]]["capacidad_publico"]
				
			audiencia_final = base_aud + int(Datos.stats_actor["seguidores"] * 0.1) + c.get("hype_generado", 0) + int(Datos.lista_contactos.size() * 2)
			
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

		# --- MULTIPLICADORES DE ARQUETIPO ---
		var multi_dinero = 1.0; var multi_xp = 1.0; var multi_seg = 1.0; var multi_ego = 1
		
		if arq_dom == "comercial": multi_dinero = 1.5; multi_ego = 2
		elif arq_dom == "fisico": multi_dinero = 0.8
		if arq_dom == "metodo": multi_xp = 1.5; Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + 15, 0, 100)
		elif arq_dom == "instinto": multi_xp = 0.5
		if arq_dom == "forma": multi_seg = 0.5

		ganancia_final = int(ganancia_final * multi_dinero)
		var xp_final = int(c["recompensa_xp"] * multi_xp)
		var seg_final = int(c["recompensa_seguidores"] * multi_seg)

		Datos.economia["dinero"] += ganancia_final
		sumar_seguidores(seg_final)
		Datos.habilidades_actor["xp_actual"] += xp_final

		# --- GUARDAR EN BOOK ---
		var registro_book = {"titulo": nombre_proyecto, "papel": c.get("papel", "Actor"), "estrellas": estrellas, "ganancia": ganancia_final, "nivel": c.get("nivel_minimo", 1), "sold_out": bool(c.get("hubo_sold_out", false))}
		if audiencia_final > 0: registro_book["audiencia"] = audiencia_final
		Datos.historial_proyectos.push_front(registro_book)

		# --- CONSECUENCIAS VISUALES Y REDES ---
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
				publicar_auto("¡HICIMOS SOLD OUT! No cabía un alfiler para ver '" + nombre_proyecto + "'. 😭🎫")
			elif audiencia_final > 0: 
				Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] + (5 * multi_ego), 0, 100) 
				txt += "Taquilla: " + str(audiencia_final) + " personas\n"
				publicar_auto("Las críticas a '" + nombre_proyecto + "' son hermosas. ⭐⭐⭐⭐⭐")
			else:
				Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] + (2 * multi_ego), 0, 100)
			mostrar_alerta(titulo_alerta, txt + "Ganancias: $" + str(ganancia_final))
		else:
			Datos.stats_actor["ego"] = clamp(Datos.stats_actor["ego"] - (5 * multi_ego), 0, 100) 
			var fans_perdidos = c.get("importancia", 1) * 15 * (3 - estrellas)
			reducir_seguidores(fans_perdidos)
			mostrar_alerta("🍅 Fracaso en Crítica", "Un desastre absoluto.\n\nCrítica: " + str(estrellas) + "⭐\nGanancias: $" + str(ganancia_final) + "\nFans Perdidos: -" + str(fans_perdidos))
			publicar_auto("A veces las cosas no salen como uno quiere. Pasemos la página. 💔")

		Datos.proyectos_activos.erase(c["id_unico"]); Datos.agenda.erase(Datos.tiempo["dia"])
		comprobar_hitos_redes(); comprobar_level_up(); actualizar_interfaz()
		return # Evita que se ejecute otro código de abajo
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
		
		var texto_extra = ""
		
		if proyecto_a_ensayar != "" and Datos.proyectos_activos.has(proyecto_a_ensayar):
			var id_act = proyecto_a_ensayar
			if fue_exito:
				Datos.proyectos_activos[id_act]["rendimiento_acumulado"] += 0.5 
				texto_extra = "\n\n📈 Repasaste tu papel y mejoraste el rendimiento."
			else:
				Datos.proyectos_activos[id_act]["rendimiento_acumulado"] += 0.1 
				texto_extra = "\n\n📉 Repasaste, pero te confundiste un poco con las líneas."
				
		# --- 🚨 ANTI-CRASH DE TEXTOS ---
		if fue_exito:
			var xp_ganada = 60
			if Datos.estado_actual == "inspirado": xp_ganada *= 2; texto_extra += "\n✨ (XP Doble por Inspiración)"
			Datos.habilidades_actor["xp_actual"] += xp_ganada
			
			var hist = GestorTextos.obtener_texto("ensayo_casa_exito")
			var t_tit = "Ensayo Terminado"; var t_desc = "Repasaste tus líneas a la perfección."
			if typeof(hist) == TYPE_DICTIONARY: t_tit = hist.get("titulo", t_tit); t_desc = hist.get("desc", t_desc)
			mostrar_alerta(t_tit, t_desc + "\n\nGanaste: +" + str(xp_ganada) + " XP" + texto_extra)
		else:
			var xp_ganada = 20
			Datos.habilidades_actor["xp_actual"] += xp_ganada
			
			var hist = GestorTextos.obtener_texto("ensayo_casa_fallo")
			var t_tit = "Ensayo Mediocre"; var t_desc = "Te distrajiste mucho, pero algo aprendiste."
			if typeof(hist) == TYPE_DICTIONARY: t_tit = hist.get("titulo", t_tit); t_desc = hist.get("desc", t_desc)
			mostrar_alerta(t_tit, t_desc + "\n\nGanaste: +" + str(xp_ganada) + " XP" + texto_extra)
			
	elif tipo_rutina == "ensayo_cast":
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + 10, 0, 100) 
		var titulo_obra = casting_data_actual["titulo_unico"].split("\n")[1]
		
		if fue_exito:
			var xp_ganada = 90
			if Datos.estado_actual == "inspirado": xp_ganada *= 2
			Datos.habilidades_actor["xp_actual"] += xp_ganada
			casting_data_actual["rendimiento_acumulado"] += 1 
			
			var hist = GestorTextos.obtener_texto("ensayo_cast_exito")
			var t_tit = "Buen Ensayo"; var t_desc = "El director amó tu propuesta."
			if typeof(hist) == TYPE_DICTIONARY: t_tit = hist.get("titulo", t_tit); t_desc = hist.get("desc", t_desc)
			mostrar_alerta(t_tit, t_desc + "\n\nGanaste: +" + str(xp_ganada) + " XP")
			publicar_auto("Trabajando duro en el set de '" + titulo_obra + "'. Dando el 100%. ✨")
		else:
			Datos.habilidades_actor["xp_actual"] += 30
			
			var hist = GestorTextos.obtener_texto("ensayo_cast_fallo")
			var t_tit = "Día Difícil"; var t_desc = "El director te gritó todo el ensayo."
			if typeof(hist) == TYPE_DICTIONARY: t_tit = hist.get("titulo", t_tit); t_desc = hist.get("desc", t_desc)
			mostrar_alerta(t_tit, t_desc + "\n\nGanaste: +30 XP")
			publicar_auto("Días difíciles trabajando en '" + titulo_obra + "'. A repasar guion. 📖")
			
		Datos.agenda.erase(Datos.tiempo["dia"])
		# --- 🌟 PODER FINAL DEL MÉTODO (VAMPIRISMO DE ESTRÉS) ---
	var mi_arq_final = obtener_arquetipo_dominante()
	var nivel_arq_final = Datos.perfil_actor.get(mi_arq_final, 0)

	if fue_exito and mi_arq_final == "metodo":
		var cura = 10 + int(nivel_arq_final / 2.0)
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] - cura, 0, 100)
		mostrar_alerta("🧠 Catarsis del Método", "Usaste la presión de la victoria a tu favor. Curaste -" + str(cura) + " de Estrés.")
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
		
		# Si la obra es tuya, pagas técnicos. Si no, vas directo a la batalla final.
		if casting_data_actual.has("es_propia"):
			panel_tecnicos.visible = true
		else:
			iniciar_skill_check("funcion")

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
	actualizar_temporada_si_aplica()
	
	# --- REINICIO SEMANAL DE CARTAS ---
	if Datos.tiempo["dia"] % 7 == 1: # Si es día 8, 15, 22, 29...
		Datos.mazo_disponible = Datos.mazo_jugador.duplicate()
		mostrar_alerta("🗓️ Inicio de Semana", "¡Has descansado y recuperado la inspiración!\nTodas las cartas que usaste la semana pasada han vuelto a tu Mazo Disponible.")
		
	# Actualizamos tu energía usando tu propia función base
	recalcular_stats_pasivos()
	Datos.stats_actor["energia_actual"] = Datos.stats_actor["energia_maxima"]
	
	# ==========================================
	# 📦 CREACIÓN DEL MENSAJE MATUTINO
	# ==========================================
	var mensaje_matutino = ""
	
	# --- COSTO DE ESTILO DE VIDA ---
	# Empieza en $15, pero sube $5 por cada nivel que tengas
	var costo_vida = 8 + (Datos.habilidades_actor["nivel_general"] * 3)
	Datos.economia["dinero"] -= costo_vida
	
	# Le avisamos al jugador si le cobraron mucho
	if Datos.habilidades_actor["nivel_general"] >= 5:
		mensaje_matutino += "Costo de Vida (Nivel " + str(Datos.habilidades_actor["nivel_general"]) + "): -$" + str(costo_vida) + "\n\n" 
	
	# --- ALERTA BANCARIA (Si estás en números rojos) ---
	if Datos.economia["dinero"] < 0:
		var interes = int(abs(Datos.economia["dinero"]) * 0.08)
		if interes < 5: interes = 5
		if Datos.temporada_actual.get("objetivo_id", "") == "supervivencia":
			interes = int(interes * 0.7)
		Datos.economia["dinero"] -= interes
		mensaje_matutino += "⚠️ ALERTA BANCARIA:\nEl banco te cobró -$" + str(interes) + " por intereses.\n"
	# ==========================================
	
	var ingresos_redes = 0
	if Datos.stats_actor["seguidores"] >= 100:
		ingresos_redes = int(Datos.stats_actor["seguidores"] / 10) 
		Datos.economia["dinero"] += ingresos_redes
	
	generar_castings_del_dia()
	generar_mercado_diario()
	
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
		
		if Datos.stats_actor["estres"] >= 80 and randi_range(1, 100) <= 50:
			mostrar_alerta("🤒 Enfermedad por Estrés", "Tus defensas bajaron por tanta presión. Tienes fiebre y tuviste que comprar medicinas.\n\nPerdiste -$40 y amaneces con solo 1 de Energía.")
			Datos.economia["dinero"] -= 40
			Datos.stats_actor["energia_actual"] = 1
			evento_disparado = true
		elif Datos.stats_actor["estres"] >= 60 and randi_range(1, 100) <= 40 and not evento_disparado:
			mostrar_alerta("💢 Ataque de Ansiedad", "Tu estrés está muy alto. Le gritaste a un fan en la calle que te pidió una foto por culpa de los nervios.\n\nPerdiste -20 Seguidores.")
			reducir_seguidores(20)
			evento_disparado = true
		elif Datos.stats_actor["estres"] >= 40 and randi_range(1, 100) <= 30 and not evento_disparado:
			mostrar_alerta("🥱 Insomnio Severo", "El estrés no te dejó dormir anoche. Estuviste repasando diálogos y pensando en el fracaso hasta las 4 AM.\n\nPierdes -1 de Energía para tu día de hoy.")
			Datos.stats_actor["energia_actual"] = max(0, Datos.stats_actor["energia_actual"] - 1)
			evento_disparado = true
		elif Datos.stats_actor["ego"] >= 70 and randi_range(1, 100) <= 40 and not evento_disparado:
			mostrar_alerta("👑 Escándalo de Diva", "Tu ego te domina. Exigiste lujos ridículos en un evento y la prensa se enteró.\n\nPagaste -$80 en 'relaciones públicas' pero ganaste +10 de Seguidores por el morbo.")
			Datos.economia["dinero"] -= 80
			sumar_seguidores(10)
			evento_disparado = true
			
		if not evento_disparado:
			if mensaje_matutino != "": mostrar_alerta("Buzón de Cobro", mensaje_matutino) 
			elif randi_range(1, 100) <= 30: disparar_evento_aleatorio()
			elif ingresos_redes > 0: mostrar_alerta("💸 Monetización SimGram", "Ganaste: +$" + str(ingresos_redes))
	
	actualizar_interfaz()
	
	# --- AUTO-GUARDADO AL FINALIZAR EL DÍA ---
	Datos.guardar_partida()
	mostrar_alerta("💤 Día Finalizado", "Has descansado. Tu progreso ha sido guardado automáticamente.")
	
func comprobar_level_up():
	var subio_nivel = false
	
	if Datos.habilidades_actor.get("xp_requerida", 0) <= 10:
		Datos.habilidades_actor["xp_requerida"] = 100
		
	# 🚨 SOLUCIÓN NUCLEAR: Máximo 50 vueltas de subida de nivel por golpe
	for i in range(50):
		if Datos.habilidades_actor["xp_actual"] < Datos.habilidades_actor["xp_requerida"]:
			break

		Datos.habilidades_actor["xp_actual"] -= Datos.habilidades_actor["xp_requerida"] 
		Datos.habilidades_actor["nivel_general"] += 1
		Datos.habilidades_actor["xp_requerida"] = int(Datos.habilidades_actor["xp_requerida"] * 1.4) 
		subio_nivel = true
		
	if subio_nivel: 
		panel_level_up.visible = true

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

func actualizar_temporada_si_aplica():
	if Datos.tiempo["dia"] <= 1:
		return
	if Datos.tiempo["dia"] % 14 != 1:
		return
	Datos.temporada_actual["numero"] += 1
	Datos.temporada_actual["objetivo_id"] = Datos.objetivos_temporada.keys().pick_random()
	Datos.temporada_actual["mutador_id"] = Datos.mutadores_temporada.keys().pick_random()
	var obj = Datos.objetivos_temporada[Datos.temporada_actual["objetivo_id"]]
	var mut = Datos.mutadores_temporada[Datos.temporada_actual["mutador_id"]]
	mostrar_alerta("🗓️ Nueva Temporada " + str(Datos.temporada_actual["numero"]), "Meta: " + obj["nombre"] + "\nMutador: " + mut["nombre"])

func obtener_stat_arquetipo(arq_carta: String) -> int:
	if arq_carta == "fisico":
		return Datos.habilidades_actor.get("expresion_corporal", 1)
	elif arq_carta == "forma" or arq_carta == "comercial":
		return Datos.habilidades_actor.get("tecnica_vocal", 1)
	elif arq_carta == "instinto":
		return Datos.habilidades_actor.get("carisma", 1)
	elif arq_carta == "metodo":
		return Datos.habilidades_actor.get("memoria", 1)
	return 1

func _formatear_arquetipo_carta(arq: String) -> String:
	match arq:
		"metodo": return "Método"
		"fisico": return "Físico"
		"forma": return "Forma"
		"comercial": return "Comercial"
		"instinto": return "Instinto"
		_: return "Versátil"

func obtener_penalizacion_repeticion_turno(arquetipos_usados: Dictionary, arq_carta: String) -> float:
	var repeticiones = arquetipos_usados.get(arq_carta, 0)
	if repeticiones <= 0:
		return 1.0
	return max(0.75, 1.0 - (0.1 * repeticiones))

func _book_stats() -> Dictionary:
	var tier3_4est = 0
	var sold_outs = 0
	for p in Datos.historial_proyectos:
		if int(p.get("nivel", 1)) >= 5 and int(p.get("estrellas", 0)) >= 4:
			tier3_4est += 1
		if bool(p.get("sold_out", false)):
			sold_outs += 1
	return {"tier3_4est": tier3_4est, "sold_outs": sold_outs}

func _validar_requisitos_book(casting: Dictionary) -> Dictionary:
	var req = casting.get("book_req", {})
	if req.is_empty():
		return {"ok": true, "faltan": ""}
	var stats = _book_stats()
	var faltantes = []
	var r_tier = int(req.get("tier3_4est", 0))
	var r_so = int(req.get("sold_outs", 0))
	if stats["tier3_4est"] < r_tier:
		faltantes.append("Tier 3 con 4⭐: " + str(stats["tier3_4est"]) + "/" + str(r_tier))
	if stats["sold_outs"] < r_so:
		faltantes.append("Sold Out: " + str(stats["sold_outs"]) + "/" + str(r_so))
	return {"ok": faltantes.is_empty(), "faltan": " | ".join(faltantes)}

func _describir_xp_carta(id_inst: String) -> String:
	if not Datos.cartas_instancia.has(id_inst):
		return ""
	var d = Datos.cartas_instancia[id_inst]
	return "Niv " + str(d.get("nivel", 1)) + " | XP " + str(d.get("xp_actual", 0)) + "/" + str(d.get("xp_requerida", 100))

func _factor_progreso_global() -> float:
	var nivel = float(Datos.habilidades_actor.get("nivel_general", 1))
	var semana = max(1.0, ceil(float(Datos.tiempo.get("dia", 1)) / 7.0))
	return 1.0 + ((nivel - 1.0) * 0.08) + ((semana - 1.0) * 0.03)

func _perfil_escalado_casting(id_base: String, base_casting: Dictionary, progreso: float) -> Dictionary:
	var imp = int(base_casting.get("importancia", 1))
	var dificultad_base = float(base_casting.get("dificultad", 1))
	var seg_base = int(base_casting.get("seguidores_minimos", 0))
	var paga_base = int(base_casting.get("paga", 0))
	var xp_base = int(base_casting.get("recompensa_xp", 40))
	var seg_reward_base = int(base_casting.get("recompensa_seguidores", 10))

	var dificultad_obj = dificultad_base + ((progreso - 1.0) * 0.8)
	var seg_obj = int(seg_base * (0.65 + (imp * 0.25) + ((progreso - 1.0) * 0.5)))
	var paga_obj = int(paga_base * (0.85 + (imp * 0.2) + ((progreso - 1.0) * 0.45)))
	var xp_obj = int(xp_base * (0.9 + (imp * 0.15) + ((progreso - 1.0) * 0.4)))
	var seg_reward_obj = int(seg_reward_base * (0.95 + (imp * 0.2) + ((progreso - 1.0) * 0.5)))

	# Ajustes por fantasía/tema (inmersión): fiesta infantil y extras no deben sentirse absurdos.
	if id_base == "animador_fiestas":
		dificultad_obj *= 0.8
		seg_obj = int(seg_obj * 0.35)
		paga_obj = max(40, int(paga_obj * 0.85))
		xp_obj = int(xp_obj * 0.8)
	elif id_base == "corto_estudiantil":
		dificultad_obj *= 0.75
		seg_obj = int(seg_obj * 0.25)
		xp_obj = int(xp_obj * 0.85)
	elif id_base == "extra_pelicula":
		dificultad_obj *= 0.85
		seg_obj = int(seg_obj * 0.4)
		xp_obj = int(xp_obj * 0.85)
	elif id_base.find("festival") != -1 or id_base.find("teatro_nacional") != -1:
		dificultad_obj *= 1.25
		xp_obj = int(xp_obj * 1.25)

	# Seguridad por tier
	if imp == 1:
		dificultad_obj = clamp(dificultad_obj, 1.0, 2.6)
		seg_obj = clamp(seg_obj, 0, 280)
	elif imp == 2:
		dificultad_obj = clamp(dificultad_obj, 2.0, 4.4)
		seg_obj = clamp(seg_obj, 60, 1200)
	else:
		dificultad_obj = clamp(dificultad_obj, 3.2, 6.8)
		seg_obj = clamp(seg_obj, 300, 6500)

	return {
		"dificultad": snapped(dificultad_obj, 0.1),
		"seguidores_minimos": seg_obj,
		"paga": max(0, paga_obj),
		"recompensa_xp": max(20, xp_obj),
		"recompensa_seguidores": max(5, seg_reward_obj)
	}

func _tier_casting_por_id(id_base: String, base_casting: Dictionary) -> int:
	if id_base in ["animador_fiestas", "extra_pelicula", "corto_estudiantil", "obra_universitaria", "microteatro_bar"]:
		return 1
	if id_base in ["doblaje_indie", "locutor_radio", "comercial_local", "obra_independiente", "standup_club"]:
		return 2
	if id_base in ["teatro_nacional", "serie_streaming", "campana_global", "pelicula_indie_festival"]:
		return 3
	return int(base_casting.get("importancia", 1))

func _rango_nivel_tier(tier: int) -> Vector2i:
	if tier <= 1:
		return Vector2i(1, 3)
	if tier == 2:
		return Vector2i(3, 6)
	return Vector2i(5, 9)

func _tier_maximo_por_nivel(nivel: int) -> int:
	if nivel < 4:
		return 1
	if nivel < 7:
		return 2
	return 3

func _exigencia_casting_balance(casting: Dictionary) -> Dictionary:
	var niv = max(1, int(casting.get("nivel_minimo", 1)))
	var tier = max(1, int(casting.get("importancia", 1)))
	var dif = max(1.0, float(casting.get("dificultad", 1.0)))
	var base = 10 + (niv * 5) + int(dif * 4.0) + (tier * 3)
	var variacion = randi_range(-3, 6)
	var exigencia = max(8, base + variacion)
	var rondas = 2
	if tier >= 2 or dif >= 3.0:
		rondas += 1
	if tier >= 3 and dif >= 4.0:
		rondas += 1
	return {"exigencia": exigencia, "rondas": rondas}

func _agentes_activos() -> Array:
	var act = []
	for a in Datos.agentes_slots:
		if str(a) != "":
			act.append(str(a))
	return act

func _aplicar_agentes_inicio_ronda():
	bonus_agentes_ronda = {"mult_arq": {}, "crit_bonus": 0.0}
	for id_ag in _agentes_activos():
		if id_ag == "mania_comedia":
			exigencia_director += 2
			bonus_agentes_ronda["mult_arq"]["comercial"] = 1.2
		elif id_ag == "amuleto_memoria":
			if seleccion_actual_ids.size() > 0:
				var prim = Datos.obtener_info_carta(seleccion_actual_ids[0])
				if prim.get("arquetipo", "") == "forma":
					mulligans_restantes += 1
		elif id_ag == "padrino_metodo":
			bonus_agentes_ronda["mult_arq"]["metodo"] = 1.15
			bonus_agentes_ronda["crit_bonus"] = float(bonus_agentes_ronda.get("crit_bonus", 0.0)) + 0.05
		elif id_ag == "sponsor_fisico":
			bonus_agentes_ronda["mult_arq"]["fisico"] = 1.12

func _mult_agente_arq(arq: String) -> float:
	var m = 1.0
	for id_ag in _agentes_activos():
		if id_ag == "mania_comedia" and arq == "comercial": m *= 1.2
		elif id_ag == "padrino_metodo" and arq == "metodo": m *= 1.15
		elif id_ag == "sponsor_fisico" and arq == "fisico": m *= 1.12
	return m

func generar_castings_del_dia():
	castings_de_hoy.clear()
	var todas_las_llaves = Datos.castings_disponibles.keys()
	var objetivo = Datos.temporada_actual.get("objetivo_id", "")
	var mutador = Datos.temporada_actual.get("mutador_id", "")
	var progreso = _factor_progreso_global()
	var mi_nivel = Datos.habilidades_actor["nivel_general"]
	var tier_max = _tier_maximo_por_nivel(mi_nivel)
	
	var por_tier = {1: [], 2: [], 3: []}
	for id_c in todas_las_llaves:
		var base = Datos.castings_disponibles[id_c]
		var t = _tier_casting_por_id(id_c, base)
		if not por_tier.has(t): por_tier[t] = []
		por_tier[t].append(id_c)
	for t in por_tier.keys():
		por_tier[t].shuffle()

	var plan_tiers = [1]
	plan_tiers.append(clamp(tier_max, 1, 3))
	if tier_max >= 2:
		plan_tiers.append(clamp(tier_max + randi_range(-1, 0), 1, 3))
	else:
		plan_tiers.append(1)
	
	var usados_ids = []
	for i in range(plan_tiers.size()):
		var tier_obj = plan_tiers[i]
		var candidatos = por_tier.get(tier_obj, []).duplicate()
		if candidatos.is_empty():
			continue
		var id_base = ""
		for cand in candidatos:
			if not usados_ids.has(cand):
				id_base = cand
				break
		if id_base == "":
			id_base = candidatos[0]
		usados_ids.append(id_base)
		var base_casting = Datos.castings_disponibles[id_base].duplicate()
		var tier = _tier_casting_por_id(id_base, base_casting)
		base_casting["importancia"] = tier
		var rango_tier = _rango_nivel_tier(tier)
		var min_rel = max(rango_tier.x, min(mi_nivel + tier - 2, rango_tier.y))
		var max_rel = clamp(mi_nivel + tier, min_rel, rango_tier.y + int(progreso))
		var nivel_generado = randi_range(min_rel, max_rel)
		
		base_casting["nivel_minimo"] = nivel_generado
		var perfil = _perfil_escalado_casting(id_base, base_casting, progreso)
		base_casting["seguidores_minimos"] = int(perfil["seguidores_minimos"])
		base_casting["paga"] = int(perfil["paga"])
		base_casting["recompensa_xp"] = int(perfil["recompensa_xp"])
		base_casting["recompensa_seguidores"] = int(perfil["recompensa_seguidores"])
		base_casting["dificultad"] = float(perfil["dificultad"])
		base_casting["volatilidad"] = randi_range(10, 40)

		var contrato = Datos.contratos_casting.pick_random().duplicate(true)
		base_casting["contrato"] = contrato
		base_casting["paga"] = int(base_casting["paga"] * contrato.get("multi_pago", 1.0))
		base_casting["recompensa_xp"] = int(base_casting["recompensa_xp"] * contrato.get("multi_xp", 1.0))
		base_casting["recompensa_seguidores"] = int(base_casting.get("recompensa_seguidores", 0) * contrato.get("multi_seguidores", 1.0))
		base_casting["penalidad_fracaso"] = int(contrato.get("penalidad_fracaso", 0))

		if objetivo == "prestigio":
			base_casting["recompensa_xp"] = int(base_casting["recompensa_xp"] * 1.2)
		elif objetivo == "fama":
			base_casting["recompensa_seguidores"] = int(base_casting["recompensa_seguidores"] * 1.25)
		elif objetivo == "caja":
			base_casting["paga"] = int(base_casting["paga"] * 1.2)

		if mutador == "industria_ajustada":
			base_casting["paga"] = int(base_casting["paga"] * 0.85)
			base_casting["recompensa_xp"] = int(base_casting["recompensa_xp"] * 1.15)
		elif mutador == "sponsors_agresivos":
			base_casting["paga"] = int(base_casting["paga"] * 1.3)
			base_casting["penalidad_fracaso"] += 6
		
		var titulo_especifico = GestorTextos.generar_titulo_produccion(id_base)
		base_casting["papel"] = GestorTextos.generar_papel_produccion(id_base) 
		base_casting["titulo_unico"] = base_casting["titulo"] + " [Nv." + str(nivel_generado) + "]\n" + titulo_especifico
		base_casting["id_unico"] = id_base + "_dia" + str(Datos.tiempo["dia"]) + "_" + str(i)
		base_casting["rendimiento_acumulado"] = 0
		base_casting["hype_generado"] = 0
		base_casting["book_req"] = {}
		if nivel_generado >= 6 and tier >= 3:
			base_casting["book_req"] = {"tier3_4est": 2, "sold_outs": 1}
		elif nivel_generado >= 5 and tier >= 2:
			base_casting["book_req"] = {"tier3_4est": 1, "sold_outs": 0}
		
		if "corto" in id_base or "pelicula" in id_base or "drama" in id_base: base_casting["arquetipo"] = "metodo"
		elif "extra" in id_base or "accion" in id_base or "danza" in id_base: base_casting["arquetipo"] = "fisico"
		elif "teatro" in id_base or "obra" in id_base or "doblaje" in id_base or "locutor" in id_base: base_casting["arquetipo"] = "forma"
		elif "comercial" in id_base or "conduccion" in id_base: base_casting["arquetipo"] = "comercial"
		elif "standup" in id_base or "animador" in id_base or "impro" in id_base: base_casting["arquetipo"] = "instinto"
		else: base_casting["arquetipo"] = "comercial" 

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
		texto_boton += "🏷️ Tier " + str(casting.get("importancia", 1)) + " | Dificultad " + str(snapped(float(casting.get("dificultad", 1.0)), 0.1)) + "\n"
		texto_boton += "Pide: Nvl " + str(casting["nivel_minimo"]) + " | " + str(casting["seguidores_minimos"]) + " Seg.\n"
		texto_boton += "🏁 Temporada: " + Datos.objetivos_temporada[Datos.temporada_actual.get("objetivo_id", "prestigio")]["nombre"] + "\n"
		
		var arq = casting.get("arquetipo", "comercial")
		var fuerte = ""; var debil = ""
		if arq == "metodo": fuerte = "Instinto"; debil = "Comercial"
		elif arq == "comercial": fuerte = "Método"; debil = "Físico"
		elif arq == "fisico": fuerte = "Comercial"; debil = "Forma"
		elif arq == "forma": fuerte = "Físico"; debil = "Instinto"
		elif arq == "instinto": fuerte = "Forma"; debil = "Método"
		texto_boton += "🧠 Jefe: " + arq.capitalize() + " (Usa " + fuerte + " | Evita " + debil + ")\n"
		
		texto_boton += "🎁 Recompensas Base: +" + str(casting.get("recompensa_xp", 0)) + " XP\n"
		var contrato = casting.get("contrato", {})
		if not contrato.is_empty():
			texto_boton += "📜 Contrato: " + contrato.get("nombre", "Estándar") + " | Riesgo: " + str(casting.get("volatilidad", 0)) + "%\n"
		
		if casting.has("tipo_pago") and casting["tipo_pago"] == "taquilla": texto_boton += "💸 Pago: % Taquilla\n"
		else: texto_boton += "💰 Pago Fijo: $" + str(casting.get("paga", 0)) + "\n"
		var val_book = _validar_requisitos_book(casting)
		if not val_book["ok"]:
			texto_boton += "📖 REQUISITO BOOK: " + str(val_book["faltan"]) + "\n"
			
		if casting["dias_de_trabajo"] > 1: 
			texto_boton += "Ensayos: " + str(casting["dias_de_trabajo"] - 1) + " | Función: 1"
		else: 
			texto_boton += "Función: 1"
		
		btn_trabajo.text = texto_boton
		
		# --- 🪄 AQUÍ ESTÁ LA MAGIA PARA DESAPLASTARLOS ---
		btn_trabajo.custom_minimum_size = Vector2(0, 180) # Altura forzada para que quepa todo
		btn_trabajo.autowrap_mode = TextServer.AUTOWRAP_WORD # Evita que el texto rompa los bordes
		
		# --- LÓGICA DE BLOQUEO DE DUPLICADOS ---
		if Datos.proyectos_activos.has(casting["id_unico"]):
			btn_trabajo.text = "[ YA FIRMADO ]\n" + btn_trabajo.text
			btn_trabajo.disabled = true
			btn_trabajo.modulate = Color(0.5, 0.5, 0.5) # Color gris apagado
		elif not val_book["ok"]:
			btn_trabajo.text = "[ BLOQUEADO POR BOOK ]\n" + btn_trabajo.text
			btn_trabajo.disabled = true
			btn_trabajo.modulate = Color(0.35, 0.35, 0.35)
		else:
			btn_trabajo.pressed.connect(abrir_confirmacion_casting.bind(index))
			
		contenedor_lista_castings.add_child(btn_trabajo)

func _on_btn_volver_inicio_castings_pressed():
	panel_app_castings.visible = false
	contenedor_menu_inicio.visible = true

func abrir_confirmacion_casting(index):
	var c = castings_de_hoy[index]
	casting_seleccionado_temp = c["id_unico"]
	var val_book = _validar_requisitos_book(c)
	if not val_book["ok"]:
		mostrar_alerta("📖 Book insuficiente", "No puedes audicionar aún.\nTe falta: " + str(val_book["faltan"]))
		return
	
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
				intentar_obtener_agente_por_contacto(nuevo_contacto)
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
				intentar_obtener_agente_por_contacto(nuevo_contacto)
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

func intentar_obtener_agente_por_contacto(contacto: Dictionary):
	var pool = []
	var rol = str(contacto.get("rol", ""))
	if rol == "Director": pool = ["padrino_metodo", "mania_comedia"]
	elif rol == "Productor": pool = ["mania_comedia", "sponsor_fisico"]
	elif rol == "Maestro de Actuación": pool = ["amuleto_memoria", "padrino_metodo"]
	else: pool = ["amuleto_memoria", "sponsor_fisico"]
	if pool.is_empty():
		return
	if randi_range(1, 100) > 35:
		return
	var id_ag = pool.pick_random()
	if Datos.agentes_poseidos.has(id_ag):
		return
	Datos.agentes_poseidos.append(id_ag)
	for i in range(Datos.agentes_slots.size()):
		if str(Datos.agentes_slots[i]) == "":
			Datos.agentes_slots[i] = id_ag
			break
	var info_ag = Datos.catalogo_agentes.get(id_ag, {})
	mostrar_alerta("🃏 Nuevo Agente", "Conseguiste: " + str(info_ag.get("nombre", id_ag)) + "\n" + str(info_ag.get("desc", "")))

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
			txt += "🏷️ Tier: " + str(proy.get("nivel", 1)) + "\n"
			txt += "Crítica: " + estrellas + "\n"
			if bool(proy.get("sold_out", false)): txt += "🔥 SOLD OUT\n"
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
			
		audiencia_final = base_aud + int(Datos.stats_actor["seguidores"] * 0.1) + c.get("hype_generado", 0) + int(Datos.lista_contactos.size() * 2)
		
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
		"ganancia": ganancia_final,
		"nivel": c.get("nivel_minimo", 1),
		"sold_out": bool(c.get("hubo_sold_out", false))
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
		fans_perdidos += c.get("penalidad_fracaso", 0)
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
		iniciar_skill_check("funcion")
	else:
		mostrar_alerta("Sin Fondos", "No tienes $150 para este trato. Elige otra opción.")

func _on_btn_tec_normal_pressed():
	if Datos.economia["dinero"] >= 50:
		Datos.economia["dinero"] -= 50
		casting_data_actual["estado_tecnicos"] = "normal"
		panel_tecnicos.visible = false
		iniciar_skill_check("funcion")
	else:
		mostrar_alerta("Sin Fondos", "No tienes ni $50. Tendrás que no pagarles.")

func _on_btn_tec_nada_pressed():
	# Si no les pagas, hay un 60% de probabilidad de que te saboteen
	if randi_range(1, 100) <= 60:
		casting_data_actual["estado_tecnicos"] = "sabotaje"
	else:
		casting_data_actual["estado_tecnicos"] = "normal" # Tuviste suerte, no hicieron nada
		
	panel_tecnicos.visible = false
	iniciar_skill_check("funcion")


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
		lbl.text = "No tienes cartas.\n¡Eres un actor de madera!"
		contenedor_lista_mazo.add_child(lbl)
		return
		
	# Contar cartas repetidas para no mostrar una lista gigante
	var conteo_cartas = {}
	for id_instancia in Datos.mazo_jugador:
		var id_carta = Datos.obtener_id_base_carta(id_instancia)
		if conteo_cartas.has(id_carta): conteo_cartas[id_carta] += 1
		else: conteo_cartas[id_carta] = 1
		
	# Dibujar las cartas en la UI
	for id_carta in conteo_cartas.keys():
		var cantidad = conteo_cartas[id_carta]
		var info_carta = Datos.catalogo_cartas[id_carta]
		
		var panel_carta = PanelContainer.new()
		var vbox = VBoxContainer.new()
		
		# --- NUEVA LÓGICA DE VISUALIZACIÓN DE CARTAS AGOTADAS ---
		var cant_disponible = Datos.obtener_instancias_por_base(id_carta, true).size()
		var lbl_titulo = Label.new()
		lbl_titulo.text = info_carta["nombre"] + " (Disp: " + str(cant_disponible) + " / Total: " + str(cantidad) + ")"
		
		# Color según la rareza (o gris si está agotada)
		if cant_disponible <= 0:
			lbl_titulo.modulate = Color(0.5, 0.5, 0.5) # Gris oscuro (Agotada)
			lbl_titulo.text += " [AGOTADA]"
		else:
			if info_carta["rareza"] == "Común": lbl_titulo.modulate = Color(0.8, 0.8, 0.8) 
			elif info_carta["rareza"] == "Rara": lbl_titulo.modulate = Color(0.2, 0.5, 1.0) 
			elif info_carta["rareza"] == "Épica": lbl_titulo.modulate = Color(0.8, 0.2, 1.0)
		
		var lbl_stats = Label.new()
		var arq_txt = _formatear_arquetipo_carta(info_carta.get("arquetipo", "versatil"))
		var nivel_prom = 1
		var lista_inst = Datos.obtener_instancias_por_base(id_carta, false)
		var xp_prom = 0
		var xp_req_prom = 100
		if lista_inst.size() > 0:
			var suma_niv = 0
			var suma_xp = 0
			var suma_req = 0
			for inst in lista_inst:
				suma_niv += Datos.obtener_nivel_carta(inst)
				if Datos.cartas_instancia.has(inst):
					suma_xp += int(Datos.cartas_instancia[inst].get("xp_actual", 0))
					suma_req += int(Datos.cartas_instancia[inst].get("xp_requerida", 100))
			nivel_prom = int(round(float(suma_niv) / float(lista_inst.size())))
			xp_prom = int(round(float(suma_xp) / float(lista_inst.size())))
			xp_req_prom = max(1, int(round(float(suma_req) / float(lista_inst.size()))))
		lbl_stats.text = "⭐ Poder Base: " + str(info_carta["poder"]) + " | Niv. Prom: " + str(nivel_prom) + " | Rareza: " + info_carta["rareza"] + " | Arquetipo: " + arq_txt
		lbl_stats.text += "\n📈 XP prom. carta: " + str(xp_prom) + "/" + str(xp_req_prom)
		
		var lbl_desc = Label.new()
		lbl_desc.text = "«" + info_carta["desc"] + "»"
		lbl_desc.autowrap_mode = TextServer.AUTOWRAP_WORD
		lbl_desc.modulate = Color(1.0, 1.0, 0.6) # Letra amarilla o itálica para el chiste
		
		vbox.add_child(lbl_titulo)
		vbox.add_child(lbl_stats)
		vbox.add_child(lbl_desc)
		
		var separador = HSeparator.new()
		vbox.add_child(separador)
		
		# --- BOTÓN DE OLVIDAR TÉCNICA ---
		var btn_vender = Button.new()
		var precio_reventa = Datos.calcular_precio_reventa_carta(id_carta)
		btn_vender.text = "🗑️ Olvidar Técnica (+$" + str(precio_reventa) + ")"
		btn_vender.modulate = Color(1.0, 0.5, 0.5) 
		btn_vender.pressed.connect(intentar_vender_carta.bind(id_carta))
		vbox.add_child(btn_vender)
		
		# ¡OJO AQUÍ! Estas dos líneas SOLO DEBEN ESTAR ESCRITAS UNA VEZ
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
			if Datos.contar_cartas_por_base(ing1) >= 2: tiene_ingredientes = true
		else:
			if Datos.contar_cartas_por_base(ing1) > 0 and Datos.contar_cartas_por_base(ing2) > 0: tiene_ingredientes = true
			
		# Si tienes los ingredientes, creamos el botón visual
		if tiene_ingredientes:
			hay_opciones = true
			var btn_receta = Button.new()
			var n1 = Datos.catalogo_cartas[ing1]["nombre"]
			var n2 = Datos.catalogo_cartas[ing2]["nombre"]
			var requiere_max = (rareza == "Épica" or rareza == "Legendaria")
			var max_ok = true
			if requiere_max:
				var l1 = 0
				for id_i in Datos.obtener_instancias_por_base(ing1, false): l1 = max(l1, Datos.obtener_nivel_carta(id_i))
				var l2 = 0
				for id_i in Datos.obtener_instancias_por_base(ing2, false): l2 = max(l2, Datos.obtener_nivel_carta(id_i))
				if ing1 == ing2:
					var niveles = []
					for id_i in Datos.obtener_instancias_por_base(ing1, false): niveles.append(Datos.obtener_nivel_carta(id_i))
					niveles.sort()
					if niveles.size() < 2 or niveles[niveles.size()-1] < 10 or niveles[niveles.size()-2] < 10:
						max_ok = false
				else:
					max_ok = (l1 >= 10 and l2 >= 10)
			
			btn_receta.text = "Crear: " + info_resultado["nombre"] + " (" + rareza + ")\n" + n1 + " + " + n2 + "\nHonorarios: $" + str(costo)
			if requiere_max and not max_ok:
				btn_receta.text += "\n🔒 Requiere Nivel 10 en ambas cartas"
				btn_receta.disabled = true
				btn_receta.modulate = Color(0.5, 0.5, 0.5)
			btn_receta.custom_minimum_size = Vector2(0, 90)
			
			# Conectamos el botón para que ejecute la fusión al darle clic
			if not (requiere_max and not max_ok):
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
	var rareza_obj = Datos.catalogo_cartas.get(id_resultado, {}).get("rareza", "Común")
	if rareza_obj == "Épica" or rareza_obj == "Legendaria":
		var lvl_ok = false
		if ing1 == ing2:
			var niveles = []
			for id_i in Datos.obtener_instancias_por_base(ing1, false): niveles.append(Datos.obtener_nivel_carta(id_i))
			niveles.sort()
			lvl_ok = niveles.size() >= 2 and niveles[niveles.size()-1] >= 10 and niveles[niveles.size()-2] >= 10
		else:
			var l1 = 0
			for id_i in Datos.obtener_instancias_por_base(ing1, false): l1 = max(l1, Datos.obtener_nivel_carta(id_i))
			var l2 = 0
			for id_i in Datos.obtener_instancias_por_base(ing2, false): l2 = max(l2, Datos.obtener_nivel_carta(id_i))
			lvl_ok = l1 >= 10 and l2 >= 10
		if not lvl_ok:
			mostrar_alerta("Coach exigente", "Para crear cartas " + rareza_obj + " necesitas Nivel 10 en ambas cartas ingrediente.")
			return
	Datos.economia["dinero"] -= costo
	var inst_1 = Datos.obtener_instancias_por_base(ing1, false)
	var inst_2 = Datos.obtener_instancias_por_base(ing2, false)
	if inst_1.is_empty() or inst_2.is_empty():
		mostrar_alerta("Error de fusión", "No se encontraron las cartas requeridas.")
		return
	var id_rem_1 = inst_1[0]
	var id_rem_2 = inst_2[0] if ing1 != ing2 else inst_1[min(1, inst_1.size() - 1)]
	Datos.mazo_jugador.erase(id_rem_1)
	Datos.mazo_jugador.erase(id_rem_2)
	Datos.mazo_disponible.erase(id_rem_1)
	Datos.mazo_disponible.erase(id_rem_2)
	var nueva_inst = Datos.crear_instancia_carta(id_resultado)
	if nueva_inst != "":
		Datos.mazo_jugador.append(nueva_inst)
		Datos.mazo_disponible.append(nueva_inst)
	mostrar_alerta("🧠 Sesión Exitosa", "El Coach conectó tus emociones.\nObtuviste:\n🎭 " + nombre_resultado)
	
	actualizar_interfaz()
	_on_btn_fusionar_cartas_pressed() # Refrescamos la lista del coach en vivo

func _on_btn_cerrar_coach_pressed():
	panel_coach.visible = false
	_on_btn_app_mazo_pressed() # Refrescamos tu mazo normal para ver la carta nueva

# ==========================================
# 🃏 LÓGICA DE CARTAS (BALASIM Y RONDAS)
# ==========================================
func jugar_carta_balasim(boton_carta, id_carta, info_carta):
	# DESELECCIONAR
	if boton_carta in seleccion_actual_nodos:
		seleccion_actual_nodos.erase(boton_carta)
		seleccion_actual_ids.erase(id_carta)
		boton_carta.modulate = Color(1, 1, 1)
		# FIX: Reactivar Mulligan si no hay nada seleccionado
		if seleccion_actual_nodos.is_empty() and mulligans_restantes > 0:
			if is_instance_valid(btn_mulligan): btn_mulligan.disabled = false
	# SELECCIONAR
	else:
		var limite_actual = max_cartas_jugables
		for id in seleccion_actual_ids:
			var info_sel = Datos.obtener_info_carta(id)
			if info_sel.is_empty():
				continue
			if info_sel.has("efecto") and info_sel["efecto"] == "mas_jugadas":
				limite_actual += info_sel.get("valor", 0)
				
		if seleccion_actual_nodos.size() >= limite_actual: return 
			
		seleccion_actual_nodos.append(boton_carta)
		seleccion_actual_ids.append(id_carta)
		boton_carta.modulate = Color(0.3, 1.0, 0.3) 
		if is_instance_valid(btn_mulligan): btn_mulligan.disabled = true

	actualizar_ui_balasim(label_jefe.text.split("\n")[0].replace("⚔️ ", ""))

func calcular_bono_ego_suavizado(mi_ego: int, nivel_actual: int) -> int:
	if mi_ego < 50:
		return 0
	var tramo_normal = max(0, min(mi_ego, 70) - 50)
	var tramo_suave = max(0, mi_ego - 70)
	var escala_nivel = 1.0 + (nivel_actual / 20.0)
	var bono_ego = int((tramo_normal + (tramo_suave * 0.3)) * escala_nivel)
	var cap_absoluto = int(12 + (nivel_actual / 2.0))
	return min(bono_ego, cap_absoluto)

func _hay_combo_seleccionado() -> bool:
	if seleccion_actual_ids.size() < 2:
		return false
	var bases_sel = []
	for id_sel in seleccion_actual_ids:
		bases_sel.append(Datos.obtener_id_base_carta(id_sel))
	for id_combo in Datos.combos_balasim.keys():
		var combo = Datos.combos_balasim[id_combo]
		if not combo.has("cartas") or combo["cartas"].size() < 2:
			continue
		var req1 = combo["cartas"][0]
		var req2 = combo["cartas"][1]
		if bases_sel.has(req1) and bases_sel.has(req2):
			if req1 == req2 and bases_sel.count(req1) < 2:
				continue
			return true
	return false

func calcular_puntos_proyectados() -> Dictionary:
	var puntos_proyectados = 0
	var multiplicador_proyectado = 1.0
	var min_rng = 0
	var max_rng = 0
	var hay_rng_critico = false
	var arq_jefe = casting_data_actual.get("arquetipo", "comercial")
	if tipo_rutina == "ensayo_casa":
		arq_jefe = "inseguridad"
	var mi_arq = obtener_arquetipo_dominante()
	var mi_estres = Datos.stats_actor.get("estres", 0)
	var nivel_actual = Datos.habilidades_actor.get("nivel_general", 1)
	var mi_ego = Datos.stats_actor.get("ego", 0)
	var hay_combo_activo = _hay_combo_seleccionado()
	var prob_critico_base = 0.0
	if mi_estres >= 40:
		prob_critico_base = clamp((mi_estres - 35) / 320.0, 0.0, 0.25)
	_aplicar_agentes_inicio_ronda()
	prob_critico_base += float(bonus_agentes_ronda.get("crit_bonus", 0.0))
	
	var arquetipos_usados = {}
	for id_c in seleccion_actual_ids:
		var info = Datos.obtener_info_carta(id_c)
		if info.is_empty():
			continue
		var poder_base = Datos.obtener_poder_carta(id_c)
		var arq_carta = info.get("arquetipo", "versatil")
		var penal_repeticion = obtener_penalizacion_repeticion_turno(arquetipos_usados, arq_carta)
		arquetipos_usados[arq_carta] = arquetipos_usados.get(arq_carta, 0) + 1
		
		# --- 1. BONO POR ESTADÍSTICAS DEL ACTOR ---
		var bono_stat = 0
		bono_stat = obtener_stat_arquetipo(arq_carta)
		
		# Balance: Cada 6 puntos en tu habilidad te da +1 de Poder Base a la carta
		var poder_escalado = poder_base + int(bono_stat / 6.0)
# --- 👑 EGO ESCALABLE INFINITO (Proyección) ---
		if mi_ego >= 50:
			var bono_ego = calcular_bono_ego_suavizado(mi_ego, nivel_actual)
			poder_escalado += bono_ego

		# --- 2. MULTIPLICADOR POR DEBILIDAD DEL JEFE ---
		var multi_tipo = _multiplicador_vs_jefe(arq_jefe, arq_carta)
		var m_ag = _mult_agente_arq(arq_carta)
		
		# Aplicamos el multiplicador al poder ya escalado por tus stats
		var poder_base_carta = int((poder_escalado * multi_tipo * m_ag) * penal_repeticion)
		puntos_proyectados += poder_base_carta

		var prob_critico = prob_critico_base
		var valor_min = poder_base_carta
		var valor_max = poder_base_carta
		if mi_arq == "metodo":
			prob_critico = min(prob_critico_base * 1.25, 0.38)
			valor_min = int(poder_base_carta * 0.85)
			valor_max = int(poder_base_carta * 1.3)
			hay_rng_critico = hay_rng_critico or prob_critico > 0.0
		elif mi_arq == "forma":
			prob_critico = prob_critico_base * 0.5
			var flat_forma = 2 + int(nivel_actual / 8.0)
			valor_max = poder_base_carta + flat_forma
			hay_rng_critico = hay_rng_critico or prob_critico > 0.0
		elif mi_arq == "instinto":
			if hay_combo_activo:
				prob_critico = 0.25
				var flat_instinto = 3 + int(nivel_actual / 6.0)
				valor_max = poder_base_carta + flat_instinto
				hay_rng_critico = true
			else:
				prob_critico = 0.0
		else:
			if prob_critico > 0.0:
				valor_max = int(poder_base_carta * 1.3)
				hay_rng_critico = true

		if prob_critico > 0.0:
			max_rng += valor_max
			min_rng += valor_min
		else:
			max_rng += poder_base_carta
			min_rng += poder_base_carta
		
		if info.has("efecto"):
			var ef = info["efecto"]
			var val = float(info.get("valor", 0))
			if ef == "doblar_poder_actual": multiplicador_proyectado *= 2.0
			elif ef == "multiplicar_poder": multiplicador_proyectado *= val
			elif ef == "escalar_carisma": puntos_proyectados += int(Datos.habilidades_actor["carisma"] * val)
			
	if seleccion_actual_ids.size() >= 2:
		for id_combo in Datos.combos_balasim.keys():
			var combo = Datos.combos_balasim[id_combo]
			var req1 = combo["cartas"][0]
			var req2 = combo["cartas"][1]
			var bases_sel = []
			for id_sel in seleccion_actual_ids: bases_sel.append(Datos.obtener_id_base_carta(id_sel))
			if bases_sel.has(req1) and bases_sel.has(req2):
				if req1 == req2 and bases_sel.count(req1) < 2: continue
				multiplicador_proyectado *= combo["multiplicador"]
				break
				
				# --- 🌟 PODER ACTIVO DEL MÉTODO (RIESGO/RECOMPENSA) ---
	#var mi_arq = obtener_arquetipo_dominante()
	if mi_arq == "metodo" and Datos.stats_actor["estres"] >= 50:
		var multiplicador_locura = 1.0 + (Datos.perfil_actor.get("metodo", 0) / 100.0)
		multiplicador_proyectado *= multiplicador_locura
	var promedio = int(puntos_proyectados * multiplicador_proyectado)
	return {
		"promedio": promedio,
		"minimo": int(min_rng * multiplicador_proyectado),
		"maximo": int(max_rng * multiplicador_proyectado),
		"hay_rng_critico": hay_rng_critico
	}

func _valor_entero_seguro(valor, por_defecto: int = 1) -> int:
	match typeof(valor):
		TYPE_INT:
			return valor
		TYPE_FLOAT:
			return int(valor)
		TYPE_STRING:
			var txt = str(valor).strip_edges()
			if txt.is_valid_int():
				return int(txt)
			if txt.is_valid_float():
				return int(float(txt))
	return por_defecto

func _multiplicador_vs_jefe(arq_jefe: String, arq_carta: String) -> float:
	if arq_jefe == "metodo" and arq_carta == "instinto": return 1.5
	elif arq_jefe == "metodo" and arq_carta == "comercial": return 0.5
	elif arq_jefe == "comercial" and arq_carta == "metodo": return 1.5
	elif arq_jefe == "comercial" and arq_carta == "fisico": return 0.5
	elif arq_jefe == "fisico" and arq_carta == "comercial": return 1.5
	elif arq_jefe == "fisico" and arq_carta == "forma": return 0.5
	elif arq_jefe == "forma" and arq_carta == "fisico": return 1.5
	elif arq_jefe == "forma" and arq_carta == "instinto": return 0.5
	elif arq_jefe == "instinto" and arq_carta == "forma": return 1.5
	elif arq_jefe == "instinto" and arq_carta == "metodo": return 0.5
	return 1.0

func _texto_efecto_carta(info: Dictionary) -> String:
	if not info.has("efecto"):
		return ""
	var ef = str(info.get("efecto", ""))
	var val = info.get("valor", 0)
	if ef == "bajar_exigencia": return "🎯 Baja Exigencia " + str(int(val))
	if ef == "curar_estres": return "💚 Cura Estrés " + str(int(val))
	if ef == "robar_carta": return "🃏 Roba " + str(int(val))
	if ef == "doblar_poder_actual": return "💥 x2 Poder"
	if ef == "multiplicar_poder": return "💥 x" + str(val) + " Poder"
	if ef == "escalar_carisma": return "✨ +Carisma x" + str(val)
	if ef == "restaurar_mulligan": return "🔄 +" + str(int(val)) + " Redibujos"
	if ef == "mas_jugadas": return "➕ +" + str(int(val)) + " jugadas"
	if ef == "sacrificar_energia": return "⚡ -" + str(int(val)) + " Energía"
	if ef == "basura": return "☠️ Carta de Peligro"
	return ""

func _on_btn_actuar_pressed():
	if resolviendo_balasim: return
	resolviendo_balasim = true
	btn_actuar.disabled = true
	if is_instance_valid(btn_mulligan): btn_mulligan.disabled = true

	var cartas_vivas = 0
	for hijo in contenedor_mano.get_children():
		if not hijo.is_queued_for_deletion() and hijo is Button:
			cartas_vivas += 1
			
	if seleccion_actual_nodos.is_empty() and cartas_vivas > 0: 
		btn_actuar.disabled = false
		if is_instance_valid(btn_mulligan) and mulligans_restantes > 0:
			btn_mulligan.disabled = false
		resolviendo_balasim = false
		return
		
	var puntos_ronda = 0
	var multiplicador_ronda = 1.0
	var robar_cartas_extra = 0
	
	var arq_jefe = casting_data_actual.get("arquetipo", "comercial")
	if tipo_rutina == "ensayo_casa":
		arq_jefe = "inseguridad"
	var mi_arq = obtener_arquetipo_dominante()
	var mi_estres = Datos.stats_actor.get("estres", 0)
	var nivel_actual = Datos.habilidades_actor.get("nivel_general", 1)
	var mi_ego = Datos.stats_actor.get("ego", 0)
	var hay_combo_activo = _hay_combo_seleccionado()
	var prob_critico_base = 0.0
	if mi_estres >= 40:
		prob_critico_base = clamp((mi_estres - 35) / 320.0, 0.0, 0.25)
	
	var arquetipos_usados = {}
	for id_c in seleccion_actual_ids:
		var info = Datos.obtener_info_carta(id_c)
		if info.is_empty():
			escribir_log_batalla("⚠️ Carta inválida detectada: " + str(id_c) + ". Se omitió para evitar crash.")
			continue
		var poder_base = Datos.obtener_poder_carta(id_c)
		var arq_carta = info.get("arquetipo", "versatil")
		var penal_repeticion = obtener_penalizacion_repeticion_turno(arquetipos_usados, arq_carta)
		arquetipos_usados[arq_carta] = arquetipos_usados.get(arq_carta, 0) + 1
		
		# --- 1. BONO POR ESTADÍSTICAS DEL ACTOR ---
		var bono_stat = 0
		bono_stat = obtener_stat_arquetipo(arq_carta)
		
		var poder_escalado = poder_base + int(bono_stat / 6.0)

		# --- 👑 EGO ESCALABLE INFINITO (Bono de Presencia) ---
		if mi_ego >= 50:
			var bono_ego = calcular_bono_ego_suavizado(mi_ego, nivel_actual)
			poder_escalado += bono_ego
			mostrar_texto_flotante("👑 Ego: +" + str(bono_ego), label_jefe, Color(1, 0.8, 0.2))
		
		# --- 💥 ESTRÉS (Crítico de Actuación Visceral) ---
		var prob_critico = prob_critico_base
		if mi_arq == "metodo":
			prob_critico = min(prob_critico_base * 1.25, 0.38)
			if randf() <= prob_critico:
				poder_escalado = int(poder_escalado * 1.3)
				escribir_log_batalla("💥 Método al límite: crítico x1.3 en " + info["nombre"])
				mostrar_texto_flotante("💥 CRÍTICO x1.3", label_jefe, Color(1, 0.2, 0.2), 1.4)
			else:
				poder_escalado = int(poder_escalado * 0.9)
				escribir_log_batalla("⚠️ Método inestable: " + info["nombre"] + " perdió potencia.")
		elif mi_arq == "forma":
			prob_critico = prob_critico_base * 0.5
			if randf() <= prob_critico:
				var flat_forma = 2 + int(nivel_actual / 8.0)
				poder_escalado += flat_forma
				escribir_log_batalla("🎯 Forma precisa: +" + str(flat_forma) + " poder en " + info["nombre"])
		elif mi_arq == "instinto":
			if hay_combo_activo and randf() <= 0.25:
				var flat_instinto = 3 + int(nivel_actual / 6.0)
				poder_escalado += flat_instinto
				escribir_log_batalla("⚡ Instinto conectado al combo: +" + str(flat_instinto) + " poder en " + info["nombre"])
				mostrar_texto_flotante("⚡ PROC INSTINTO", label_jefe, Color(0.6, 0.9, 1.0), 1.2)
		elif randf() <= prob_critico:
			poder_escalado = int(poder_escalado * 1.3)
			escribir_log_batalla("💥 ¡CRÍTICO! El estrés impulsó tu carta: " + info["nombre"])
			mostrar_texto_flotante("💥 ¡CRÍTICO!", label_jefe, Color(1, 0.2, 0.2), 1.5)
		
		# --- 2. MULTIPLICADOR POR DEBILIDAD DEL JEFE ---
		var multi_tipo = _multiplicador_vs_jefe(arq_jefe, arq_carta)
		var m_ag = float(bonus_agentes_ronda.get("mult_arq", {}).get(arq_carta, 1.0))
		
		puntos_ronda += int((poder_escalado * multi_tipo * m_ag) * penal_repeticion)
		if Datos.lista_contactos.size() >= 3 and arq_carta == mi_arq:
			puntos_ronda += 1
		
		if info.has("efecto"):
			var ef = info["efecto"]
			var val = float(info.get("valor", 0))
			
			if ef == "bajar_exigencia": exigencia_director = max(1, exigencia_director - int(val))
			elif ef == "curar_estres": Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] - int(val), 0, 100)
			elif ef == "robar_carta": robar_cartas_extra += int(val)
			elif ef == "doblar_poder_actual": multiplicador_ronda *= 2.0
			elif ef == "multiplicar_poder": multiplicador_ronda *= val
			elif ef == "escalar_carisma": puntos_ronda += int(Datos.habilidades_actor["carisma"] * val)
			elif ef == "restaurar_mulligan": mulligans_restantes += int(val)
			elif ef == "sacrificar_energia":
				if Datos.stats_actor["energia_actual"] >= val: Datos.stats_actor["energia_actual"] -= int(val)
				else: puntos_ronda -= info["poder"] 
				
	# --- 🌟 PODER ACTIVO DEL MÉTODO (RIESGO/RECOMPENSA) ---
	if mi_arq == "metodo" and Datos.stats_actor.get("estres", 0) >= 50:
		var multiplicador_locura = 1.0 + (Datos.perfil_actor.get("metodo", 0) / 100.0)
		multiplicador_ronda *= multiplicador_locura
	
	# 2. BUSCAR COMBOS (CON FRENO ANTI-CRASH)
	var texto_combo = ""
	if seleccion_actual_ids.size() >= 2:
		for id_combo in Datos.combos_balasim.keys():
			var combo = Datos.combos_balasim[id_combo]
			
			# 🚨 FRENO: Verificamos que el combo sea válido antes de leerlo
			if not combo.has("cartas") or combo["cartas"].size() < 2: 
				continue
				
			var req1 = combo["cartas"][0]
			var req2 = combo["cartas"][1]
			
			var bases_sel = []
			for id_sel in seleccion_actual_ids: bases_sel.append(Datos.obtener_id_base_carta(id_sel))
			if bases_sel.has(req1) and bases_sel.has(req2):
				if req1 == req2 and bases_sel.count(req1) < 2: continue
				multiplicador_ronda *= combo.get("multiplicador", 1.0)
				texto_combo += combo.get("nombre_combo", "Combo Secreto") + "\n"
				break
	
	var puntos_finales = int(puntos_ronda * multiplicador_ronda)
	poder_acumulado_turno += puntos_finales
	poder_total_encuentro = poder_acumulado_turno
	
	# --- SUPER FEEDBACK VISUAL ---
	var texto_daño = "🎭 +" + str(puntos_finales) + " Pts!"
	var color_daño = Color.GREEN
	var escala_daño = 1.0
	
	if texto_combo != "":
		color_daño = Color.CYAN
		escala_daño = 1.5
		mostrar_texto_flotante("🔥 ¡COMBO!", label_jefe, Color.ORANGE, 1.5)
		
	mostrar_texto_flotante(texto_daño, label_jefe, color_daño, escala_daño)
	
	# LOG DE BATALLA Y COMBOS
	escribir_log_batalla("🎭 Actuaste. Generaste " + str(puntos_finales) + " puntos.")
	if texto_combo != "": escribir_log_batalla("🔥 COMBO ACTIVADO: " + texto_combo.replace("\n", " "))
	
	# --- CASTIGO DE CARTAS DE PELIGRO EN MANO ---
	var panico_count = 0
	for hijo in contenedor_mano.get_children():
		if not hijo.is_queued_for_deletion() and not hijo in seleccion_actual_nodos:
			if "Pánico" in hijo.text or hijo.has_meta("es_peligro"):
				panico_count += 1
	if panico_count > 0:
		var dmg_panico = 15 * panico_count
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + dmg_panico, 0, 100)
		escribir_log_batalla("💥 Pánico acumulado: +" + str(dmg_panico) + " Estrés por " + str(panico_count) + " carta(s).")
		mostrar_texto_flotante("💥 +" + str(dmg_panico) + " Estrés", label_jefe, Color(1, 0.3, 0.3), 1.1)
				
	# 3. QUEMAR CARTAS Y LIMPIAR MESA
	for id_c in seleccion_actual_ids:
		Datos.otorgar_xp_carta(id_c, 8)
		Datos.mazo_disponible.erase(id_c) 
		
	for nodo in seleccion_actual_nodos:
		if is_instance_valid(nodo): nodo.queue_free()
	seleccion_actual_nodos.clear()
	seleccion_actual_ids.clear()
	
	# 4. RESOLUCIÓN DE LA RONDA
	if poder_acumulado_turno >= exigencia_director:
		_finalizar_balasim(true)
		return
		
	rondas_restantes -= 1
	if rondas_restantes <= 0:
		_finalizar_balasim(false)
	else:
		ejecutar_accion_jefe() 
		repartir_mano_balasim(false) 
		
		if robar_cartas_extra > 0: 
			mazo_combate_actual.shuffle()
			for i in range(min(robar_cartas_extra, mazo_combate_actual.size())):
				var id_extra = mazo_combate_actual.pop_back()
				crear_boton_carta_en_mesa(id_extra)

		if mulligans_restantes > 0: btn_mulligan.disabled = false
		actualizar_ui_balasim(label_jefe.text.split("\n")[0].replace("⚔️ ", ""))
		btn_actuar.disabled = false
		resolviendo_balasim = false

func _finalizar_balasim(fue_exito: bool):
	panel_balasim.visible = false
	# Limpieza defensiva para evitar referencias colgantes
	for nodo in seleccion_actual_nodos:
		if is_instance_valid(nodo) and not nodo.is_queued_for_deletion():
			nodo.queue_free()
	seleccion_actual_nodos.clear()
	seleccion_actual_ids.clear()
	if is_instance_valid(btn_mulligan): btn_mulligan.disabled = true
	btn_actuar.disabled = false
	resolviendo_balasim = false
	call_deferred("resolver_rutina_general", fue_exito)
# --- EL JEFE SE DEFIENDE (IA DINÁMICA + SABOTAJE MENTAL) ---
func ejecutar_accion_jefe():
	var jefe = "comercial"
	var nivel_casting = 1
	if tipo_rutina == "ensayo_casa":
		jefe = "inseguridad"
		nivel_casting = max(1, _valor_entero_seguro(Datos.habilidades_actor.get("nivel_general", 1), 1))
	elif tipo_rutina == "trabajo":
		jefe = "comercial"
		nivel_casting = max(1, _valor_entero_seguro(Datos.habilidades_actor.get("nivel_general", 1), 1))
	else:
		jefe = str(casting_data_actual.get("arquetipo", "comercial"))
		nivel_casting = max(1, _valor_entero_seguro(casting_data_actual.get("nivel_minimo", 1), 1))
	var accion_tomada = ""
	var color_accion = Color.WHITE
	
	# El aumento base ahora escala con el NIVEL DEL CASTING
	var aumento_base = randi_range(3, 8) + int(nivel_casting * 3.5)
	
	if jefe == "comercial" or jefe == "fisico":
		exigencia_director += aumento_base
		accion_tomada = "📈 ¡Corte! Ponle más energía (+ " + str(aumento_base) + " Exigencia)"
		color_accion = Color(1.0, 0.4, 0.4) # Rojo
		
	elif jefe == "metodo" or jefe == "instinto":
		var estres_dmg = randi_range(5, 10) + int(nivel_casting / 2.0)
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + estres_dmg, 0, 100)
		accion_tomada = "💢 ¡No me lo creo! (Daño mental: +" + str(estres_dmg) + " Estrés)"
		color_accion = Color(0.8, 0.2, 0.8) # Morado
		
	elif jefe == "forma":
		if mulligans_restantes > 0 and randi_range(1, 100) <= 50:
			mulligans_restantes -= 1
			accion_tomada = "🚫 ¡Te apegas al guion! (-1 Redibujar)"
			color_accion = Color(0.9, 0.9, 0.2) # Amarillo
		else:
			exigencia_director += aumento_base
			accion_tomada = "📉 ¡Más técnica! (+ " + str(aumento_base) + " Exigencia)"
			color_accion = Color(1.0, 0.4, 0.4)
			
	# --- VISUAL FEEDBACK Y SABOTAJES ---
	escribir_log_batalla("🎬 El Director (" + jefe.capitalize() + ") interviene: " + accion_tomada)
	mostrar_texto_flotante(accion_tomada, label_jefe, color_accion, 1.2)
	
	# Sabotajes escalares: En niveles altos, el jefe tira basura más seguido
	var prob_sabotaje = clamp(15 + (nivel_casting * 2), 15, 60)
	if randi_range(1, 100) <= prob_sabotaje:
		var llaves_peligro = ["nervios", "panico"]
		inyectar_carta_peligro(llaves_peligro.pick_random())
func inyectar_carta_peligro(id_peligro):
	# --- 🌟 ESCUDO CLÁSICO DE FORMA ---
	var mi_arquetipo = obtener_arquetipo_dominante()
	var nivel_arq = Datos.perfil_actor.get(mi_arquetipo, 0)

	if mi_arquetipo == "forma":
		var prob_bloqueo = clamp(25 + nivel_arq, 25, 90) 
		if randi_range(1, 100) <= prob_bloqueo:
			escribir_log_batalla("🛡️ Disciplina: ¡Bloqueaste el ataque mental (" + str(prob_bloqueo) + "%)!")
			return
			
	if contenedor_mano.get_child_count() >= 6:
		var victima = contenedor_mano.get_child(0)
		if is_instance_valid(victima): victima.queue_free()

	# 🚨 FRENO ANTI-CRASH: Si la carta no existe en tu Base de Datos, la crea mágicamente para no crashear
	var info = {"nombre": "Ataque de Pánico", "poder": 0}
	if Datos.catalogo_cartas.has(id_peligro):
		info = Datos.catalogo_cartas[id_peligro]
	elif id_peligro == "nervios":
		info = {"nombre": "Nerviosismo", "poder": 0}

	var btn_peligro = Button.new()
	btn_peligro.text = "⚠️ " + info["nombre"] + "\n(Click 4 veces para calmarte)"
	btn_peligro.custom_minimum_size = Vector2(120, 160)
	
	btn_peligro.set_meta("es_peligro", true)
	btn_peligro.set_meta("clicks", 4)
	btn_peligro.set_meta("estres_acumulado", 0)

	# Adiós animación problemática, hola color fijo seguro
	btn_peligro.modulate = Color(1.0, 0.3, 0.3) 

	btn_peligro.pressed.connect(func():
		var c = btn_peligro.get_meta("clicks") - 1
		if c <= 0:
			var estres_recuperado = int(btn_peligro.get_meta("estres_acumulado", 0) * 0.5)
			if estres_recuperado > 0:
				Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] - estres_recuperado, 0, 100)
				mostrar_texto_flotante("💚 -" + str(estres_recuperado) + " Estrés", btn_peligro, Color(0.3, 1.0, 0.3), 1.1)
			escribir_log_batalla("🌟 Dominaste tus nervios y destruiste: " + info["nombre"])
			btn_peligro.queue_free()
		else:
			btn_peligro.set_meta("clicks", c)
			btn_peligro.text = "⚠️ " + info["nombre"] + "\n(" + str(c) + " clicks más)"
			btn_peligro.position.x += randf_range(-5, 5)
			btn_peligro.position.y += randf_range(-5, 5)
	)

	var timer_panico = Timer.new()
	timer_panico.wait_time = 2.0
	timer_panico.one_shot = false
	timer_panico.autostart = true
	btn_peligro.add_child(timer_panico)
	timer_panico.timeout.connect(func():
		if not is_instance_valid(btn_peligro) or btn_peligro.is_queued_for_deletion() or not panel_balasim.visible:
			return
		var estres_tick = 2
		Datos.stats_actor["estres"] = clamp(Datos.stats_actor["estres"] + estres_tick, 0, 100)
		btn_peligro.set_meta("estres_acumulado", int(btn_peligro.get_meta("estres_acumulado", 0)) + estres_tick)
		mostrar_texto_flotante("💥 +" + str(estres_tick) + " Estrés", btn_peligro, Color(1.0, 0.35, 0.35), 1.0)
		escribir_log_batalla("⏱️ " + info["nombre"] + " te afecta: +" + str(estres_tick) + " Estrés.")
	)
	
	contenedor_mano.add_child(btn_peligro) 
	escribir_log_batalla("💥 El Jefe saboteó tu mente con: " + info["nombre"])
# --- REPARTIDOR DE CARTAS ---
# --- REPARTIDOR DE CARTAS ---
func repartir_mano_balasim(es_inicio):
	if es_inicio:
		for hijo in contenedor_mano.get_children():
			hijo.queue_free()
		mazo_combate_actual = Datos.mazo_disponible.duplicate()
		mazo_combate_actual.shuffle()
		
	var cartas_vivas = 0
	for hijo in contenedor_mano.get_children():
		if not hijo.is_queued_for_deletion():
			cartas_vivas += 1
			
	var total_disponible = mazo_combate_actual.size() + cartas_vivas
	var tope_mano = min(6, total_disponible)
	
	# 🚨 SOLUCIÓN NUCLEAR: Un bucle FOR no puede crashear Windows. Máximo 50 vueltas.
	for i in range(50):
		if cartas_vivas >= tope_mano:
			break
			
		if mazo_combate_actual.is_empty():
			break # Si el mazo de verdad no tiene nada, salimos

		var id_c = mazo_combate_actual.pick_random()
		crear_boton_carta_en_mesa(id_c)
		mazo_combate_actual.erase(id_c)
		cartas_vivas += 1

func crear_boton_carta_en_mesa(id_c):
	var info = Datos.obtener_info_carta(id_c)
	if info.is_empty():
		escribir_log_batalla("⚠️ No se pudo crear carta, ID inexistente: " + str(id_c))
		return
	var btn_c = Button.new()
	var arq_txt = _formatear_arquetipo_carta(info.get("arquetipo", "versatil"))
	var linea = "⭐ " + str(Datos.obtener_poder_carta(id_c)) + " | " + arq_txt + " | Niv " + str(Datos.obtener_nivel_carta(id_c))
	var arq_jefe = casting_data_actual.get("arquetipo", "comercial")
	if tipo_rutina == "ensayo_casa":
		arq_jefe = "inseguridad"
	var multi_vs_jefe = _multiplicador_vs_jefe(arq_jefe, info.get("arquetipo", "versatil"))
	var linea_efectividad = ""
	if multi_vs_jefe > 1.0:
		linea_efectividad = "✅ Efectiva vs jefe (x" + str(snapped(multi_vs_jefe, 0.1)) + ")"
		btn_c.modulate = Color(0.85, 1.0, 0.85)
	elif multi_vs_jefe < 1.0:
		linea_efectividad = "❌ Débil vs jefe (x" + str(snapped(multi_vs_jefe, 0.1)) + ")"
		btn_c.modulate = Color(1.0, 0.85, 0.85)
	else:
		linea_efectividad = "➖ Neutral vs jefe"
	var linea_efecto = _texto_efecto_carta(info)
	if info.has("efecto"): linea += " ✨"
	btn_c.text = info["nombre"] + "\n" + linea + "\n" + info.get("desc", "")
	if linea_efecto != "": btn_c.text += "\n" + linea_efecto
	btn_c.text += "\n" + linea_efectividad
	btn_c.custom_minimum_size = Vector2(170, 190)
	btn_c.autowrap_mode = TextServer.AUTOWRAP_WORD
	btn_c.pressed.connect(jugar_carta_balasim.bind(btn_c, id_c, info))
	contenedor_mano.add_child(btn_c)

func _on_btn_mulligan_pressed():
	if mulligans_restantes <= 0: return
	
	mulligans_restantes -= 1
	
	# Limpiamos si tenías alguna carta seleccionada (verde)
	seleccion_actual_nodos.clear()
	seleccion_actual_ids.clear()
	
	# Usamos la nueva función modular para limpiar la mesa y robar
	repartir_mano_balasim(true)
	
	# Actualizamos los textos de la interfaz
	actualizar_ui_balasim(label_jefe.text.split("\n")[0].replace("⚔️ ", ""))

# ==========================================
# 🎓 APP ACADEMIA (COMPRA DE CARTAS)
# ==========================================
func _obtener_pools_cartas_por_rareza() -> Dictionary:
	var pools = {"Común": [], "Rara": [], "Épica": [], "Legendaria": []}
	for id in Datos.catalogo_cartas.keys():
		var info = Datos.catalogo_cartas[id]
		if info.get("efecto", "") == "basura": continue
		var rareza = info.get("rareza", "Común")
		if pools.has(rareza):
			pools[rareza].append(id)
	return pools

func _pesos_base_por_nivel(nivel: int) -> Dictionary:
	var t = clamp((nivel - 1) / 20.0, 0.0, 1.0)
	return {
		"Común": lerp(70.0, 35.0, t),
		"Rara": lerp(25.0, 40.0, t),
		"Épica": lerp(5.0, 20.0, t),
		"Legendaria": lerp(0.0, 5.0, t)
	}

func _ajustar_pesos_por_curso(pesos_base: Dictionary, tipo_curso: String) -> Dictionary:
	var pesos = pesos_base.duplicate()
	if tipo_curso == "basico":
		pesos["Común"] *= 1.4
		pesos["Rara"] *= 0.9
		pesos["Épica"] *= 0.5
		pesos["Legendaria"] *= 0.2
	elif tipo_curso == "medio":
		pesos["Común"] *= 1.1
		pesos["Rara"] *= 1.0
		pesos["Épica"] *= 0.8
		pesos["Legendaria"] *= 0.4
	elif tipo_curso == "pro":
		pesos["Común"] *= 0.8
		pesos["Rara"] *= 1.1
		pesos["Épica"] *= 1.3
		pesos["Legendaria"] *= 0.7
	return pesos

func _elegir_rareza_por_pesos(pesos: Dictionary) -> String:
	var total = 0.0
	for v in pesos.values(): total += float(v)
	if total <= 0.0: return "Común"
	var r = randf() * total
	var acum = 0.0
	for rareza in ["Común", "Rara", "Épica", "Legendaria"]:
		acum += float(pesos.get(rareza, 0))
		if r <= acum: return rareza
	return "Común"

func _elegir_carta_por_rareza(pools: Dictionary, rareza: String) -> String:
	var orden_fallback = ["Legendaria", "Épica", "Rara", "Común"]
	var idx = orden_fallback.find(rareza)
	if idx == -1: idx = 3
	for i in range(idx, orden_fallback.size()):
		var r = orden_fallback[i]
		if pools.has(r) and not pools[r].is_empty():
			return pools[r].pick_random()
	return pools["Común"].pick_random()

func _on_btn_app_academia_pressed():
	# En lugar de abrir un panel, abrimos directamente la tienda de cartas del día
	abrir_tienda_cartas()

func _on_btn_volver_inicio_academia_pressed():
	panel_app_academia.visible = false
	contenedor_menu_inicio.visible = true

func comprar_curso(tipo_curso):
	var costo = 0
	var costo_energia = 0
	var cartas_ganadas = []
	# 1. Separar el catálogo por rarezas para el RNG (excluye basura)
	var pools = _obtener_pools_cartas_por_rareza()
	var nivel = Datos.habilidades_actor.get("nivel_general", 1)
	
	# 2. Definir Costos y Recompensas según el curso
	if tipo_curso == "basico":
		costo = 50; costo_energia = 1
		if comprobar_pago_clase(costo, costo_energia):
			var pesos = _ajustar_pesos_por_curso(_pesos_base_por_nivel(nivel), "basico")
			for i in range(4):
				var rareza = _elegir_rareza_por_pesos(pesos)
				cartas_ganadas.append(_elegir_carta_por_rareza(pools, rareza))
			
	elif tipo_curso == "medio":
		costo = 250; costo_energia = 2
		if comprobar_pago_clase(costo, costo_energia):
			var pesos = _ajustar_pesos_por_curso(_pesos_base_por_nivel(nivel), "medio")
			for i in range(3):
				var rareza = _elegir_rareza_por_pesos(pesos)
				cartas_ganadas.append(_elegir_carta_por_rareza(pools, rareza))
			
	elif tipo_curso == "pro":
		costo = 1000; costo_energia = 3
		if comprobar_pago_clase(costo, costo_energia):
			var pesos = _ajustar_pesos_por_curso(_pesos_base_por_nivel(nivel), "pro")
			for i in range(3):
				var rareza = _elegir_rareza_por_pesos(pesos)
				cartas_ganadas.append(_elegir_carta_por_rareza(pools, rareza))
			
	# 3. Entregar las cartas al jugador
	if cartas_ganadas.size() > 0:
		var texto_alerta = "Has asistido a la clase y tu técnica mejoró. Aprendiste:\n\n"
		for id_carta in cartas_ganadas:
			var id_inst = Datos.crear_instancia_carta(id_carta)
			if id_inst == "":
				continue
			Datos.mazo_jugador.append(id_inst)
			Datos.mazo_disponible.append(id_inst)
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

# --- CONEXIÓN DE BOTONES ---
func _on_btn_curso_basico_pressed(): comprar_curso("basico")
func _on_btn_curso_medio_pressed(): comprar_curso("medio")
func _on_btn_curso_pro_pressed(): comprar_curso("pro")
# ==========================================
# 🛠️ MODO DESARROLLADOR Y TRAMPAS
# ==========================================
var panel_admin_creado = false
var nodo_panel_admin = null

func _input(event):
	# F12: Bomba Nuclear (Borra progreso)
	if event is InputEventKey and event.pressed and event.keycode == KEY_F12:
		Datos.borrar_partida()
		get_tree().reload_current_scene()
		print("¡BOMBA NUCLEAR! Partida borrada.")
		
	# --- MINIJUEGO DE MESERO ---
	if rutina_activa:
		if (event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT) or (event is InputEventKey and event.pressed and event.keycode == KEY_SPACE):
			rutina_activa = false
			
			# Evaluamos si el cursor quedó dentro de la zona verde
			var cx = cursor_barra.position.x + (cursor_barra.size.x / 2.0)
			var zx_ini = zona_exito.position.x
			var zx_fin = zona_exito.position.x + zona_exito.size.x
			
			var fue_exito = (cx >= zx_ini and cx <= zx_fin)
			resolver_rutina_general(fue_exito)
			return # Evitamos que haga otras cosas
	# F11: Abrir/Cerrar Menú Admin
	if event is InputEventKey and event.pressed and event.keycode == KEY_F11:
		if not panel_admin_creado: crear_panel_admin()
		nodo_panel_admin.visible = not nodo_panel_admin.visible

func crear_panel_admin():
	panel_admin_creado = true
	nodo_panel_admin = PanelContainer.new()
	nodo_panel_admin.position = Vector2(10, 50) # Arriba a la izquierda
	nodo_panel_admin.z_index = 100 # Para que quede por encima de todo
	
	var vbox = VBoxContainer.new()
	var lbl = Label.new()
	lbl.text = "🔧 MODO DIOS"
	lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vbox.add_child(lbl)
	
	var btn_dinero = Button.new(); btn_dinero.text = "💰 +$1000"
	btn_dinero.pressed.connect(func(): Datos.economia["dinero"] += 1000; actualizar_interfaz())
	
	var btn_energia = Button.new(); btn_energia.text = "⚡ Energía Infinita"
	btn_energia.pressed.connect(func(): Datos.stats_actor["energia_actual"] = 999; actualizar_interfaz())
	
	var btn_xp = Button.new(); btn_xp.text = "🧠 +100 XP"
	btn_xp.pressed.connect(func(): Datos.habilidades_actor["xp_actual"] += 100; comprobar_level_up(); actualizar_interfaz())
	
	var btn_dia = Button.new(); btn_dia.text = "⏩ Saltar Día"
	btn_dia.pressed.connect(func(): _on_boton_dormir_pressed())

	var btn_cartas = Button.new(); btn_cartas.text = "🃏 Rellenar Mano"
	btn_cartas.pressed.connect(func(): Datos.mazo_disponible = Datos.mazo_jugador.duplicate(); mostrar_alerta("Admin", "Mazo Disponible recargado."))

	var btn_seguidores = Button.new(); btn_seguidores.text = "📣 +500 Seguidores"
	btn_seguidores.pressed.connect(func(): Datos.stats_actor["seguidores"] += 500; comprobar_hitos_redes(); actualizar_interfaz())

	var btn_contacto = Button.new(); btn_contacto.text = "🤝 +1 Contacto"
	btn_contacto.pressed.connect(func():
		var c = GestorTextos.generar_contacto_nuevo(Datos.habilidades_actor["nivel_general"], Datos.habilidades_actor["carisma"])
		Datos.lista_contactos.append(c)
		Datos.stats_actor["contactos"] += 1
		intentar_obtener_agente_por_contacto(c)
		actualizar_interfaz()
	)

	var btn_book = Button.new(); btn_book.text = "📖 Add crédito 5⭐"
	btn_book.pressed.connect(func():
		Datos.historial_proyectos.push_front({"titulo": "Admin Test", "papel": "Protagónico", "estrellas": 5, "ganancia": 999, "nivel": 6, "sold_out": true})
		actualizar_interfaz()
	)

	var btn_cartas_raras = Button.new(); btn_cartas_raras.text = "🧪 +3 Cartas Aleatorias"
	btn_cartas_raras.pressed.connect(func():
		var pools = _obtener_pools_cartas_por_rareza()
		var pesos = _pesos_base_por_nivel(max(8, Datos.habilidades_actor.get("nivel_general", 1)))
		for i in range(3):
			var rar = _elegir_rareza_por_pesos(pesos)
			var idc = _elegir_carta_por_rareza(pools, rar)
			if idc != "":
				var inst = Datos.crear_instancia_carta(idc)
				if inst != "":
					Datos.mazo_jugador.append(inst)
					Datos.mazo_disponible.append(inst)
		actualizar_interfaz()
	)

	var btn_lv10 = Button.new(); btn_lv10.text = "⬆️ Maxear 5 cartas"
	btn_lv10.pressed.connect(func():
		var limite = min(5, Datos.mazo_jugador.size())
		for i in range(limite):
			var id_i = Datos.mazo_jugador[i]
			if Datos.cartas_instancia.has(id_i):
				Datos.cartas_instancia[id_i]["nivel"] = Datos.NIVEL_MAX_CARTA
				Datos.cartas_instancia[id_i]["xp_actual"] = 0
				Datos.cartas_instancia[id_i]["xp_requerida"] = 100 + ((Datos.NIVEL_MAX_CARTA - 1) * 40)
		actualizar_interfaz()
	)

	vbox.add_child(btn_dinero); vbox.add_child(btn_energia); vbox.add_child(btn_xp)
	vbox.add_child(btn_dia); vbox.add_child(btn_cartas); vbox.add_child(btn_seguidores)
	vbox.add_child(btn_contacto); vbox.add_child(btn_book); vbox.add_child(btn_cartas_raras); vbox.add_child(btn_lv10)
	nodo_panel_admin.add_child(vbox)
	$CapaUI.add_child(nodo_panel_admin)
# ==========================================
# 🛒 MERCADO ROTATIVO ESCALABLE (NIVELES)
# ==========================================
func generar_mercado_diario():
	Datos.mercado_hoy.clear()
	var mi_nivel = Datos.habilidades_actor.get("nivel_general", 1)

	# 1. Pools por rareza (excluye basura)
	var pools = _obtener_pools_cartas_por_rareza()
	# 2. Pesos dinámicos por nivel (mantiene comunes para fomentar crafteo)
	var pesos = _pesos_base_por_nivel(mi_nivel)

	# 3. Generar 3 cartas basadas en las probabilidades del nivel
	for i in range(3):
		var rareza = _elegir_rareza_por_pesos(pesos)
		Datos.mercado_hoy.append(_elegir_carta_por_rareza(pools, rareza))
func abrir_tienda_cartas():
	var dialog = AcceptDialog.new()
	dialog.title = "🎓 Academia: Nuevas Técnicas"
	dialog.dialog_text = "Aprende nuevas técnicas para tu mazo (Rotan cada día):"
	dialog.ok_button_text = "Salir de la Academia"
	
	var vbox = VBoxContainer.new()
	vbox.alignment = BoxContainer.ALIGNMENT_CENTER

	var btn_generar = Button.new()
	var costo_gen = 120 + int(Datos.habilidades_actor.get("nivel_general", 1) * 35)
	btn_generar.text = "🧪 Generar Técnica Aleatoria ($" + str(costo_gen) + ")"
	btn_generar.custom_minimum_size = Vector2(250, 50)
	btn_generar.pressed.connect(func():
		if Datos.economia["dinero"] < costo_gen:
			mostrar_alerta("Sin fondos", "Necesitas $" + str(costo_gen) + " para generar una técnica nueva.")
			return
		var pools = _obtener_pools_cartas_por_rareza()
		var pesos = _ajustar_pesos_por_curso(_pesos_base_por_nivel(Datos.habilidades_actor.get("nivel_general", 1)), "medio")
		var rareza = _elegir_rareza_por_pesos(pesos)
		var id_new = _elegir_carta_por_rareza(pools, rareza)
		if id_new == "":
			mostrar_alerta("Sin carta", "No se pudo generar una carta en este momento.")
			return
		Datos.economia["dinero"] -= costo_gen
		var id_inst = Datos.crear_instancia_carta(id_new)
		if id_inst == "":
			mostrar_alerta("Error", "No se pudo crear la técnica generada.")
			return
		Datos.mazo_jugador.append(id_inst)
		Datos.mazo_disponible.append(id_inst)
		actualizar_interfaz()
		mostrar_alerta("🧪 Técnica generada", "Obtuviste: " + Datos.catalogo_cartas[id_new]["nombre"] + " (" + Datos.catalogo_cartas[id_new]["rareza"] + ")")
	)
	vbox.add_child(btn_generar)
	
	for id_c in Datos.mercado_hoy:
		var info = Datos.catalogo_cartas[id_c]
		var btn_comprar = Button.new()
		var precio = Datos.calcular_precio_compra_carta(id_c)
		
		btn_comprar.text = "Comprar: " + info["nombre"] + " ($" + str(precio) + ")\n" + info["desc"]
		btn_comprar.custom_minimum_size = Vector2(250, 60)
		btn_comprar.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		
		btn_comprar.pressed.connect(func():
			# --- NUEVO: LÍMITE DE MAZO ---
			var limite_mazo = 15 + int(Datos.habilidades_actor["memoria"] / 2.0)
			if Datos.mazo_jugador.size() >= limite_mazo:
				mostrar_alerta("🧠 Mente Saturada", "Tu mazo está al límite (" + str(limite_mazo) + " cartas).\nVe a la App 'Mi Mazo' y olvida (vende) técnicas viejas para aprender nuevas.")
				return
				
			if Datos.economia["dinero"] >= precio:
				Datos.economia["dinero"] -= precio
				var id_inst = Datos.crear_instancia_carta(id_c)
				if id_inst == "":
					mostrar_alerta("Error", "No se pudo crear la carta comprada.")
					return
				Datos.mazo_jugador.append(id_inst)
				Datos.mazo_disponible.append(id_inst)
				Datos.mercado_hoy.erase(id_c)
				btn_comprar.disabled = true
				btn_comprar.text = "¡Técnica Aprendida!"
				actualizar_interfaz()
				mostrar_alerta("🎓 Éxito", "Has añadido '" + info["nombre"] + "' a tu mazo. (" + str(Datos.mazo_jugador.size()) + "/" + str(limite_mazo) + ")")
			else:
				mostrar_alerta("💸 Sin fondos", "No tienes dinero suficiente.")
		)
		vbox.add_child(btn_comprar)
		
	dialog.add_child(vbox)
	add_child(dialog)
	dialog.popup_centered()

func intentar_vender_carta(id_carta):
	var info = Datos.catalogo_cartas[id_carta]
	var dialog = ConfirmationDialog.new()
	dialog.title = "🗑️ Olvidar Técnica"
	dialog.dialog_text = "¿Deseas olvidar la técnica '" + info["nombre"] + "'?\n\nRecuperarás $" + str(Datos.calcular_precio_reventa_carta(id_carta)) + " y limpiarás tu mazo para que salgan mejores combos en batalla."
	var precio_reventa = Datos.calcular_precio_reventa_carta(id_carta)
	dialog.get_ok_button().text = "Vender ($" + str(precio_reventa) + ")"
	dialog.get_cancel_button().text = "Cancelar"
	
	dialog.confirmed.connect(func():
		var instancias = Datos.obtener_instancias_por_base(id_carta, false)
		if instancias.is_empty():
			mostrar_alerta("Sin carta", "No tienes esa técnica para vender.")
			dialog.queue_free()
			return
		var id_inst = instancias[0]
		Datos.mazo_jugador.erase(id_inst)
		if Datos.mazo_disponible.has(id_inst): Datos.mazo_disponible.erase(id_inst)
		if Datos.cartas_instancia.has(id_inst): Datos.cartas_instancia.erase(id_inst)
		Datos.economia["dinero"] += precio_reventa
		actualizar_interfaz()
		mostrar_alerta("🗑️ Mazo Limpio", "Has olvidado la técnica. Tu mazo ahora es más eficiente.")
		# NOTA: Cierra y vuelve a abrir tu panel del mazo para ver los cambios
		dialog.queue_free()
	)
	dialog.canceled.connect(func(): dialog.queue_free())
	add_child(dialog)
	dialog.popup_centered()
# ==========================================
# 🎈 SISTEMA DE TEXTOS FLOTANTES (GAME FEEL)
# ==========================================
func mostrar_texto_flotante(texto: String, nodo_origen: Control, color: Color = Color.WHITE, escala: float = 1.0):
	if not is_instance_valid(nodo_origen) or not panel_balasim.visible: return
	
	var lbl = Label.new()
	lbl.text = texto
	lbl.add_theme_font_size_override("font_size", int(18 * escala))
	lbl.add_theme_color_override("font_color", color)
	lbl.add_theme_color_override("font_outline_color", Color.BLACK)
	lbl.add_theme_constant_override("outline_size", 4)
	
	# Posicionar justo en el centro del nodo que lo genera
	lbl.position = nodo_origen.global_position + (nodo_origen.size / 2.0) - Vector2(20, 20)
	panel_balasim.add_child(lbl)
	
	# Animación de flotar y desvanecerse
	var tween = get_tree().create_tween()
	var pos_final = lbl.position + Vector2(randf_range(-30, 30), -80) # Sube flotando
	tween.tween_property(lbl, "position", pos_final, 1.2).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(lbl, "modulate:a", 0.0, 1.2).set_delay(0.2)
	tween.tween_callback(lbl.queue_free)
