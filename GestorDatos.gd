extends Node

# ==========================================
# 🧠 VARIABLES GLOBALES DEL JUGADOR
# ==========================================
var economia = {
	"dinero": 250,
	"deuda_bancaria": 0
}
var mercado_hoy = [] # Guarda los IDs de las 3 cartas a la venta del día
var stats_actor = {
	"energia_actual": 3,
	"energia_maxima": 3,
	"reputacion": 0,
	"seguidores": 1, 
	"contactos": 0,
	"estres": 0,    # <--- NUEVO
	"ego": 0        # <--- NUEVO
}
# ==========================================
# 🎭 SISTEMA DE ARQUETIPOS (BALASIM - FASE 1)
# ==========================================
# Estos puntos definirán tu "Gráfico de Araña" y el tipo de cartas que desbloqueas.
var perfil_actor = {
	"metodo": 0,     
	"fisico": 0,     
	"forma": 0,      
	"comercial": 0,  
	"instinto": 0    
}
var tiempo = {
	"dia": 1,
	"fase_dia": "Mañana" 
}

var habilidades_actor = {
	"nivel_general": 1,
	"xp_actual": 0,
	"xp_requerida": 100,
	"puntos_habilidad": 0,
	"tecnica_vocal": 1,
	"expresion_corporal": 1,
	"carisma": 1,
	"memoria": 1
}

# ==========================================
# 📱 REDES, CONTACTOS Y LEGADO (BOOK)
# ==========================================
var ultimos_seguidores = ["@TuMama_Oficial"] # Tu fan número 1
var lista_contactos = [] # Aquí guardaremos los NPCs que conozcas
var historial_posts = [] # Aquí se guardan tus "tweets"
var proyectos_activos = {} # Guarda la obra ÚNICA que estás haciendo
var historial_proyectos = [] # ¡NUEVO! El "Book" o currículum del actor
# ==========================================
# 🏢 SISTEMA DE COMPAÑÍA Y BIENES RAÍCES (NUEVO)
# ==========================================
var mi_compania = {
	"fundada": false,
	"nombre": "Sin Nombre",
	"id_espacio_actual": "sala_casa",
	"contrato_renta": {"id_espacio": "sala_casa", "vence_dia": -1},
	"espacios_propios": [],
	"mejoras_locales": {},
	"prestigio": 0,
	"producciones_realizadas": 0,
	"tier_empresa": 0
}

var mejoras_simzon = {
	"aro_luz": false,
	"suscripcion_meditacion": false,
	"set_utileria": false,
	"microfono_solapa": false
}

# ==========================================
# 🃏 MEGA-CATÁLOGO BALASIM
# ==========================================
# ==========================================
# 🃏 MEGA-CATÁLOGO BALASIM (EXPANSIÓN 1 Y 2: 70 CARTAS)
# ==========================================
# ==========================================
# 🃏 DICCIONARIO MAESTRO DE CARTAS (110 CARTAS)
# ==========================================
var catalogo_cartas = {
	# 🟢 COMUNES (Tier 1: Poder 0-4 | Utilidad Básica y Supervivencia)
	"risa_nerviosa": {"nombre": "Risa Nerviosa", "rareza": "Común", "poder": 2, "desc": "Sonríe y asiente. Nunca falla."},
	"lagrima_falsa": {"nombre": "Lágrima Falsa", "rareza": "Común", "poder": 3, "desc": "Pellizco táctico en el muslo."},
	"voz_profunda": {"nombre": "Voz de Tráiler", "rareza": "Común", "poder": 3, "desc": "Suenas a comercial de camionetas."},
	"tropiezo_gracioso": {"nombre": "Tropiezo Gracioso", "rareza": "Común", "poder": 2, "desc": "Comedia física muy barata."},
	"mirada_perdida": {"nombre": "Mirada Perdida", "rareza": "Común", "poder": 1, "desc": "El arte de olvidar tus líneas."},
	"tos_falsa": {"nombre": "Tos Falsa", "rareza": "Común", "poder": 0, "efecto": "bajar_exigencia", "valor": 2, "desc": "Ganas tiempo. (-2 Exigencia)"},
	"cejas_arqueadas": {"nombre": "Cejas Arqueadas", "rareza": "Común", "poder": 4, "desc": "Mirada de villano genérico."},
	"suspiro_profundo": {"nombre": "Suspiro Profundo", "rareza": "Común", "poder": 0, "efecto": "curar_estres", "valor": 10, "desc": "Inhalar, exhalar. (Cura 10 Estrés)"},
	"tartamudeo_calculado": {"nombre": "Tartamudeo", "rareza": "Común", "poder": 3, "desc": "Te hace ver 'vulnerable'."},
	"silencio_incomodo": {"nombre": "Silencio Incómodo", "rareza": "Común", "poder": 0, "efecto": "robar_carta", "valor": 1, "desc": "El director duda. (Robas 1 carta)"},
	"carisma_magnetico": {
	"nombre": "Carisma Magnético",
	"desc": "No suma puntos directos, pero hace que toda tu actuación se vea un 50% mejor.",
	"poder": 0,
	"rareza": "Rara",
	"efecto": "multiplicar_poder",
	"valor": 1.5  # <--- Al ser 1.5, el código nuevo sabrá que debe multiplicar tus puntos x 1.5
},
"basura_nervios": {
		"nombre": "Nervios", "desc": "Te resta -10 Puntos al actuar.",
		"poder": -10, "rareza": "Peligro", "efecto": "basura", "valor": 0
	},
	"basura_panico": {
		"nombre": "Ataque de Pánico", "desc": "Si sigue en tu mano al actuar, sufres +15 Estrés.",
		"poder": 0, "rareza": "Peligro", "efecto": "basura", "valor": 0
	},
	"mirada_al_reloj": {"nombre": "Mirar el Reloj", "rareza": "Común", "poder": 1, "desc": "¿Ya es hora del almuerzo?"},
	"carraspeo": {"nombre": "Carraspeo", "rareza": "Común", "poder": 2, "desc": "Afinas la garganta y el ego."},
	"rascarse_cabeza": {"nombre": "Rascarse la Cabeza", "rareza": "Común", "poder": 1, "desc": "Inseguridad proyectada."},
	"bostezo_disimulado": {"nombre": "Bostezo Disimulado", "rareza": "Común", "poder": 0, "efecto": "robar_carta", "valor": 1, "desc": "Aburrimiento táctico. (+1 Carta)"},
	"sonrisa_falsa": {"nombre": "Sonrisa Plástica", "rareza": "Común", "poder": 2, "desc": "Sonrisa de foto de graduación."},
	"paso_atras": {"nombre": "Paso Atrás", "rareza": "Común", "poder": 1, "efecto": "curar_estres", "valor": 5, "desc": "Tomas distancia. (Cura 5 Estrés)"},
	"asentir_lentamente": {"nombre": "Asentir Lento", "rareza": "Común", "poder": 1, "efecto": "mas_jugadas", "valor": 1, "desc": "Finges entender. (+1 Carta jugable)"},
	"morderse_labio": {"nombre": "Morderse el Labio", "rareza": "Común", "poder": 3, "desc": "Tensión romántica instantánea."},
	"jugar_cabello": {"nombre": "Jugar con Cabello", "rareza": "Común", "poder": 2, "desc": "Coqueteo sutil o nerviosismo."},
	"mirar_apuntador": {"nombre": "Mirar al Apuntador", "rareza": "Común", "poder": 0, "efecto": "robar_carta", "valor": 2, "desc": "Trampa descarada. (+2 Cartas)"},
	"pose_generica": {"nombre": "Pose Genérica", "rareza": "Común", "poder": 3, "desc": "Manos en la cintura, mirada al frente."},
	"susurro": {"nombre": "Susurro Místico", "rareza": "Común", "poder": 2, "efecto": "bajar_exigencia", "valor": 3, "desc": "Nadie oye nada. (-3 Exigencia)"},
	"parpadeo_rapido": {"nombre": "Parpadeo Rápido", "rareza": "Común", "poder": 2, "desc": "Finges incredulidad."},
	"tragar_saliva": {"nombre": "Tragar Saliva", "rareza": "Común", "poder": 1, "efecto": "curar_estres", "valor": 5, "desc": "Tragas el miedo. (Cura 5 Estrés)"},
	"frotarse_manos": {"nombre": "Frotarse las Manos", "rareza": "Común", "poder": 2, "desc": "Anticipación maquiavélica."},
	"ajuste_corbata": {"nombre": "Ajuste de Corbata", "rareza": "Común", "poder": 3, "desc": "Elegancia bajo presión."},
	"mirada_al_cielo": {"nombre": "Mirada al Cielo", "rareza": "Común", "poder": 1, "desc": "Pidiendo ayuda divina."},
	"encoger_hombros": {"nombre": "Encoger Hombros", "rareza": "Común", "poder": 2, "desc": "'Yo no fui', versión actoral."},
	"sonrisa_timida": {"nombre": "Sonrisa Tímida", "rareza": "Común", "poder": 4, "desc": "Derrite corazones (y directores)."},
	"ceno_fruncido": {"nombre": "Ceño Fruncido", "rareza": "Común", "poder": 3, "desc": "Concentración nivel intelectual."},

	# 🔵 RARAS (Tier 2: Poder 5-9 | Manipulación de Tablero y Multiplicadores bajos)
	"mirada_intensa": {"nombre": "Mirada de Galán", "rareza": "Rara", "poder": 6, "desc": "Estás listo para protagonizar la novela."},
	"pausa_dramatica": {"nombre": "Pausa Dramática", "rareza": "Rara", "poder": 0, "efecto": "robar_carta", "valor": 2, "desc": "El tiempo se detiene. (+2 Cartas)"},
	"improvisacion_brillante": {"nombre": "Improvisación", "rareza": "Rara", "poder": 4, "efecto": "mas_jugadas", "valor": 1, "desc": "Guion nuevo sobre la marcha. (+1 Jugada)"},
	"proyeccion_vocal": {"nombre": "Proyección Vocal", "rareza": "Rara", "poder": 5, "desc": "Tu voz retumba en los pasillos."},
	"caida_dramatica": {"nombre": "Caída Dramática", "rareza": "Rara", "poder": 7, "desc": "El piso es tu mejor co-estrella."},
	"bofetada_falsa": {"nombre": "Bofetada Acústica", "rareza": "Rara", "poder": 8, "desc": "El sonido del aplauso asustó a todos."},
	"sonrisa_congelada": {"nombre": "Sonrisa Congelada", "rareza": "Rara", "poder": 0, "efecto": "escalar_carisma", "valor": 2, "desc": "Poder = Carisma x2."},
	"robar_utileria": {"nombre": "Robar Utilería", "rareza": "Rara", "poder": 5, "efecto": "bajar_exigencia", "valor": 5, "desc": "Tomas el vaso de agua del director. (-5 Exigencia)"},
	"llanto_feo": {"nombre": "Llanto Feo", "rareza": "Rara", "poder": 9, "desc": "Realismo extremo, mocos incluidos."},
	"guiño_coqueto": {"nombre": "Guiño Coqueto", "rareza": "Rara", "poder": 0, "efecto": "multiplicar_poder", "valor": 1.5, "desc": "Carisma puro. (Poder actual x1.5)"},
	"grito_ahogado": {"nombre": "Grito Ahogado", "rareza": "Rara", "poder": 6, "desc": "Terror silencioso."},
	"senal_de_paz": {"nombre": "Señal de Paz", "rareza": "Rara", "poder": 0, "efecto": "bajar_exigencia", "valor": 8, "desc": "Calmas la sala. (-8 Exigencia)"},
	"golpe_en_la_mesa": {"nombre": "Golpe en la Mesa", "rareza": "Rara", "poder": 8, "desc": "¡Silencio en la sala!"},
	"lagrima_solitaria": {"nombre": "Lágrima Solitaria", "rareza": "Rara", "poder": 5, "efecto": "escalar_carisma", "valor": 1, "desc": "Ganas tu Carisma en Poder."},
	"mirada_desafiante": {"nombre": "Mirada Desafiante", "rareza": "Rara", "poder": 9, "desc": "Retas al casting entero."},
	"risa_maniaca": {"nombre": "Risa Maníaca", "rareza": "Rara", "poder": 6, "efecto": "multiplicar_poder", "valor": 1.5, "desc": "Locura total. (Poder x1.5)"},
	"improvisar_cancion": {"nombre": "Improvisar Canción", "rareza": "Rara", "poder": 7, "desc": "Un musical espontáneo."},
	"mirada_juzgadora": {"nombre": "Mirada Juzgadora", "rareza": "Rara", "poder": 4, "efecto": "bajar_exigencia", "valor": 6, "desc": "El director se siente culpable. (-6 Exigencia)"},
	"risa_sarcastica": {"nombre": "Risa Sarcástica", "rareza": "Rara", "poder": 7, "desc": "Ofendes al guionista, pero funciona."},
	"monologo_acelerado": {"nombre": "Hablar Rápido", "rareza": "Rara", "poder": 6, "efecto": "mas_jugadas", "valor": 2, "desc": "Eminem actoral. (+2 Cartas jugables)"},
	"voz_quebrada": {"nombre": "Voz Quebrada", "rareza": "Rara", "poder": 8, "desc": "Vulnerabilidad cruda."},
	"apuntar_dedo": {"nombre": "Apuntar con el Dedo", "rareza": "Rara", "poder": 7, "desc": "¡Tú fuiste!"},
	"ignorar_director": {"nombre": "Ignorar al Director", "rareza": "Rara", "poder": 9, "efecto": "curar_estres", "valor": 15, "desc": "Haces lo que quieres. (Cura 15 Estrés)"},
	"fingir_desmayo": {"nombre": "Fingir Desmayo", "rareza": "Rara", "poder": 5, "efecto": "robar_carta", "valor": 3, "desc": "Caos en el set. (+3 Cartas)"},
	"tirar_silla": {"nombre": "Tirar una Silla", "rareza": "Rara", "poder": 9, "desc": "Acción innecesaria pero impactante."},

	# 🟣 ÉPICAS (Tier 3: Poder 10-25 | Riesgos Físicos y Poderes Masivos)
	"berrinche": {"nombre": "Berrinche Orgánico", "rareza": "Épica", "poder": 12, "desc": "Rompes cosas. Es puro ARTE."},
	"romper_cuarta_pared": {"nombre": "Mirar a Cámara", "rareza": "Épica", "poder": 0, "efecto": "doblar_poder_actual", "valor": 0, "desc": "Destrozas la ficción. (Poder x2)"},
	"monologo_intenso": {"nombre": "Monólogo Clásico", "rareza": "Épica", "poder": 15, "desc": "Llora el sonidista."},
	"beso_no_guionizado": {"nombre": "Beso Improvisado", "rareza": "Épica", "poder": 18, "desc": "Altamente demandable, pero efectivo."},
	"ataque_panico_real": {"nombre": "Pánico Real", "rareza": "Épica", "poder": 20, "desc": "Tu miedo te dio el papel."},
	"sacrificio_fisico": {"nombre": "Acrobacia Peligrosa", "rareza": "Épica", "poder": 25, "efecto": "sacrificar_energia", "valor": 1, "desc": "Mortal hacia atrás. (-1 Energía real)"},
	"revelacion_chocante": {"nombre": "Plot Twist", "rareza": "Épica", "poder": 10, "efecto": "bajar_exigencia", "valor": 15, "desc": "Cambias la trama. (-15 Exigencia)"},
	"discurso_inspirador": {"nombre": "Discurso Inspirador", "rareza": "Épica", "poder": 16, "desc": "La banda sonora suena en sus mentes."},
	"llanto_desconsolado": {"nombre": "Llanto Desconsolado", "rareza": "Épica", "poder": 18, "desc": "Inundas el set de lágrimas."},
	"pelea_coreografiada": {"nombre": "Pelea Coreografiada", "rareza": "Épica", "poder": 22, "efecto": "sacrificar_energia", "valor": 1, "desc": "Golpeas al aire. (-1 Energía real)"},
	"revelacion_traicion": {"nombre": "Grito de Traición", "rareza": "Épica", "poder": 12, "efecto": "multiplicar_poder", "valor": 2.0, "desc": "¡Tú mataste a mi hermano! (Poder x2.0)"},
	"mirada_de_muerte": {"nombre": "Mirada de Muerte", "rareza": "Épica", "poder": 20, "desc": "Atemorizas al productor."},
	"improvisacion_maestra": {"nombre": "Improvisación Maestra", "rareza": "Épica", "poder": 10, "efecto": "mas_jugadas", "valor": 3, "desc": "Reescribes la obra. (+3 Cartas jugables)"},
	"insulto_director": {"nombre": "Insultar al Director", "rareza": "Épica", "poder": 25, "efecto": "bajar_exigencia", "valor": 20, "desc": "Arriesgas tu carrera. (-20 Exigencia)"},
	"desmayo_realista": {"nombre": "Desmayo Realista", "rareza": "Épica", "poder": 15, "efecto": "curar_estres", "valor": 30, "desc": "Llaman al médico. (Cura 30 Estrés)"},
	"cachetada_real": {"nombre": "Cachetada Real", "rareza": "Épica", "poder": 24, "desc": "Le pegaste de verdad al co-protagonista."},
	"amenaza_sutil": {"nombre": "Amenaza Sutil", "rareza": "Épica", "poder": 19, "desc": "El silencio más oscuro de tu vida."},
	"destrozar_set": {"nombre": "Destrozar el Set", "rareza": "Épica", "poder": 30, "efecto": "sacrificar_energia", "valor": 2, "desc": "Vandalismo actoral. (-2 Energía real)"},

	# 🟡 LEGENDARIAS (Tier 4: Poder 30-99 | Rompe-juegos, requieren Crafteos Locos)
	"divo_insuperable": {"nombre": "Divo Insuperable", "rareza": "Legendaria", "poder": 35, "desc": "Nadie más respira en el cuarto."},
	"metodo_absoluto": {"nombre": "El Método Absoluto", "rareza": "Legendaria", "poder": 45, "desc": "Tu acta de nacimiento ha cambiado."},
	"premio_oscar_prematuro": {"nombre": "Actuación de Oscar", "rareza": "Legendaria", "poder": 55, "desc": "Apunten tu nombre para la gala."},
	"actuacion_trascendental": {"nombre": "Trascendencia", "rareza": "Legendaria", "poder": 60, "desc": "Levitas sobre el escenario."},
	"director_llora": {"nombre": "El Director Llora", "rareza": "Legendaria", "poder": 0, "efecto": "bajar_exigencia", "valor": 50, "desc": "El jefe se rinde ante tu arte. (-50 Exigencia)"},
	"renacimiento_artistico": {"nombre": "Renacimiento", "rareza": "Legendaria", "poder": 0, "efecto": "multiplicar_poder", "valor": 4.0, "desc": "Reinventas el teatro. (Poder x4.0)"},
	"control_mental_set": {"nombre": "Control Mental", "rareza": "Legendaria", "poder": 70, "desc": "Todos hacen exactamente lo que tú dices."},
	"ovacion_de_pie": {"nombre": "Ovación de Pie", "rareza": "Legendaria", "poder": 80, "efecto": "curar_estres", "valor": 100, "desc": "Eres un dios. (Cura 100 Estrés)"},
	"romper_el_universo": {"nombre": "Romper el Universo", "rareza": "Legendaria", "poder": 99, "efecto": "sacrificar_energia", "valor": 3, "desc": "Ganas la realidad. (-3 Energía real)"},
	"perfeccion_absoluta": {"nombre": "Perfección Absoluta", "rareza": "Legendaria", "poder": 50, "efecto": "mas_jugadas", "valor": 5, "desc": "El tiempo es tuyo. (+5 Cartas jugables)"},
	"ego_infinito": {"nombre": "Ego Infinito", "rareza": "Legendaria", "poder": 0, "efecto": "escalar_carisma", "valor": 10, "desc": "El universo gira en torno a ti. (Carisma x10)"},
# --- EXPANSIÓN 4: EL MÉTODO (Añadir al final de catalogo_cartas) ---
	"ajustar_gafas": {"nombre": "Ajustar Gafas", "rareza": "Común", "poder": 2, "desc": "Te hace ver intelectual instantáneamente."},
	"mirada_de_reojo": {"nombre": "Mirar de Reojo", "rareza": "Común", "poder": 1, "desc": "Sospecha barata pero efectiva."},
	"apretar_punos": {"nombre": "Apretar Puños", "rareza": "Común", "poder": 3, "desc": "Ira contenida."},
	"masajear_sienes": {"nombre": "Masajear Sienes", "rareza": "Común", "poder": 1, "efecto": "curar_estres", "valor": 8, "desc": "Te duele la cabeza de tanta mala actuación. (Cura 8 Estrés)"},
	"tomar_agua": {"nombre": "Trago de Agua", "rareza": "Común", "poder": 0, "efecto": "robar_carta", "valor": 1, "desc": "Pausa técnica. (+1 Carta)"},
	"risa_burlona": {"nombre": "Risa Burlona", "rareza": "Rara", "poder": 5, "efecto": "bajar_exigencia", "valor": 4, "desc": "Minimizas al director. (-4 Exigencia)"},
	"susurro_amenazante": {"nombre": "Susurro Amenazante", "rareza": "Rara", "poder": 7, "desc": "Te acercas al micro y das miedo."},
	"quitarse_chaqueta": {"nombre": "Quitarse la Chaqueta", "rareza": "Rara", "poder": 6, "efecto": "mas_jugadas", "valor": 1, "desc": "Te preparas para la acción. (+1 Carta jugable)"},
	"romper_llanto": {"nombre": "Lágrima Fácil", "rareza": "Rara", "poder": 5, "efecto": "escalar_carisma", "valor": 1, "desc": "Lloras a voluntad. (Poder = Carisma)"},
	"grito_de_batalla": {"nombre": "Grito de Guerra", "rareza": "Rara", "poder": 8, "desc": "¡Por Esparta!"},
	"llorar_sangre": {"nombre": "Lágrimas de Sangre", "rareza": "Épica", "poder": 22, "efecto": "sacrificar_energia", "valor": 1, "desc": "Nadie sabe cómo lo hiciste. (-1 Energía)"},
	"monologo_villano": {"nombre": "Monólogo de Villano", "rareza": "Épica", "poder": 18, "desc": "Explicas tu plan malévolo."},
	"salto_fe": {"nombre": "Salto de Fe", "rareza": "Épica", "poder": 0, "efecto": "doblar_poder_actual", "valor": 0, "desc": "Te lanzas al vacío escénico. (Poder x2)"},
	"quitar_peluca": {"nombre": "Quitarse la Peluca", "rareza": "Épica", "poder": 20, "efecto": "bajar_exigencia", "valor": 10, "desc": "Shock total. (-10 Exigencia)"},
	"director_despedido": {"nombre": "Despedir al Director", "rareza": "Legendaria", "poder": 85, "desc": "Ahora tú diriges la película."},
	"oscar_honorifico": {"nombre": "Premio a la Trayectoria", "rareza": "Legendaria", "poder": 90, "efecto": "curar_estres", "valor": 50, "desc": "Ya no tienes nada que probar. (Cura 50 Estrés)"},
	
	# --- EXPANSIÓN 5: SHOWTIME ---
	"respirar_personaje": {"nombre": "Respirar Personaje", "rareza": "Común", "poder": 2, "efecto": "curar_estres", "valor": 6, "desc": "Te centras y vuelves al papel. (Cura 6 Estrés)"},
	"eco_de_dialogo": {"nombre": "Eco de Diálogo", "rareza": "Común", "poder": 1, "efecto": "robar_carta", "valor": 1, "desc": "Repites la última frase para comprar tiempo. (+1 Carta)"},
	"paso_marcado": {"nombre": "Paso Marcado", "rareza": "Rara", "poder": 6, "efecto": "mas_jugadas", "valor": 1, "desc": "El bloqueo escénico sale perfecto. (+1 Jugada)"},
	"mirada_hielo": {"nombre": "Mirada de Hielo", "rareza": "Rara", "poder": 7, "efecto": "bajar_exigencia", "valor": 5, "desc": "Congelas al casting. (-5 Exigencia)"},
	"ovacion_ensayo": {"nombre": "Ovación de Ensayo", "rareza": "Épica", "poder": 16, "efecto": "curar_estres", "valor": 24, "desc": "El equipo técnico te aplaude sin parar. (Cura 24 Estrés)"},
	"cambio_de_mascara": {"nombre": "Cambio de Máscara", "rareza": "Épica", "poder": 14, "efecto": "multiplicar_poder", "valor": 1.8, "desc": "Entras y sales del personaje en segundos. (Poder x1.8)"},
	"silencio_que_mata": {"nombre": "Silencio que Mata", "rareza": "Legendaria", "poder": 38, "efecto": "bajar_exigencia", "valor": 35, "desc": "Ni el jurado se atreve a respirar. (-35 Exigencia)"},
	"metodo_camaleon": {"nombre": "Método Camaleón", "rareza": "Legendaria", "poder": 30, "efecto": "escalar_carisma", "valor": 8, "desc": "Adaptas tu energía a cualquier escena. (Escala con Carisma x8)"}
}

# ==========================================
# 🧭 ASIGNACIÓN DE ARQUETIPOS (Balance por estilo)
# ==========================================
const ARQUETIPOS_CARTAS = {
	"metodo": [
		"lagrima_falsa", "mirada_perdida", "suspiro_profundo", "morderse_labio", "tragar_saliva",
		"mirada_al_cielo", "ceno_fruncido", "mirada_intensa", "llanto_feo", "grito_ahogado",
		"lagrima_solitaria", "mirada_juzgadora", "voz_quebrada", "berrinche", "monologo_intenso",
		"ataque_panico_real", "llanto_desconsolado", "revelacion_traicion", "mirada_de_muerte",
		"amenaza_sutil", "masajear_sienes", "romper_llanto", "llorar_sangre", "monologo_villano",
		"metodo_absoluto", "actuacion_trascendental", "director_llora", "renacimiento_artistico", "respirar_personaje", "metodo_camaleon"
	],
	"fisico": [
		"tropiezo_gracioso", "paso_atras", "caida_dramatica", "bofetada_falsa", "golpe_en_la_mesa",
		"tirar_silla", "sacrificio_fisico", "pelea_coreografiada", "cachetada_real", "destrozar_set",
		"fingir_desmayo", "desmayo_realista", "apretar_punos", "quitarse_chaqueta", "grito_de_batalla"
	],
	"forma": [
		"voz_profunda", "tos_falsa", "tartamudeo_calculado", "carraspeo", "mirar_apuntador",
		"susurro", "pausa_dramatica", "proyeccion_vocal", "monologo_acelerado", "ajustar_gafas",
		"tomar_agua", "susurro_amenazante", "perfeccion_absoluta", "eco_de_dialogo"
	],
	"comercial": [
		"carisma_magnetico", "cejas_arqueadas", "sonrisa_falsa", "asentir_lentamente", "jugar_cabello",
		"pose_generica", "ajuste_corbata", "encoger_hombros", "sonrisa_timida", "sonrisa_congelada",
		"senal_de_paz", "risa_sarcastica", "apuntar_dedo", "discurso_inspirador", "divo_insuperable",
		"premio_oscar_prematuro", "ovacion_de_pie", "ego_infinito", "risa_burlona", "oscar_honorifico", "ovacion_ensayo"
	],
	"instinto": [
		"risa_nerviosa", "silencio_incomodo", "mirada_al_reloj", "rascarse_cabeza", "bostezo_disimulado",
		"parpadeo_rapido", "frotarse_manos", "improvisacion_brillante", "robar_utileria",
		"mirada_desafiante", "risa_maniaca", "improvisar_cancion", "ignorar_director",
		"romper_cuarta_pared", "beso_no_guionizado", "revelacion_chocante", "improvisacion_maestra",
		"insulto_director", "control_mental_set", "romper_el_universo", "director_despedido",
		"salto_fe", "quitar_peluca", "mirada_de_reojo", "paso_marcado", "mirada_hielo", "cambio_de_mascara", "silencio_que_mata", "basura_nervios", "basura_panico"
	]
}

# Rangos de seguridad para efectos (no altera valores actuales si están dentro)
const RANGOS_EFECTO = {
	"bajar_exigencia": {"Común": Vector2(2, 4), "Rara": Vector2(4, 8), "Épica": Vector2(10, 25), "Legendaria": Vector2(20, 60)},
	"curar_estres": {"Común": Vector2(5, 10), "Rara": Vector2(10, 20), "Épica": Vector2(20, 35), "Legendaria": Vector2(40, 100)},
	"robar_carta": {"Común": Vector2(1, 2), "Rara": Vector2(2, 3), "Épica": Vector2(2, 4), "Legendaria": Vector2(3, 5)},
	"mas_jugadas": {"Común": Vector2(1, 1), "Rara": Vector2(1, 2), "Épica": Vector2(2, 3), "Legendaria": Vector2(3, 5)},
	"multiplicar_poder": {"Común": Vector2(1.2, 1.3), "Rara": Vector2(1.3, 1.6), "Épica": Vector2(1.6, 2.2), "Legendaria": Vector2(2.5, 4.0)},
	"escalar_carisma": {"Común": Vector2(1, 1), "Rara": Vector2(1, 2), "Épica": Vector2(2, 4), "Legendaria": Vector2(6, 10)},
	"sacrificar_energia": {"Común": Vector2(1, 1), "Rara": Vector2(1, 1), "Épica": Vector2(1, 2), "Legendaria": Vector2(2, 3)},
	"restaurar_mulligan": {"Común": Vector2(1, 1), "Rara": Vector2(1, 1), "Épica": Vector2(1, 2), "Legendaria": Vector2(2, 3)}
}
const COSTE_BASE_RAREZA = {
	"Común": 70,
	"Rara": 130,
	"Épica": 230,
	"Legendaria": 380,
	"Peligro": 5
}

const MULTIPLICADOR_REVENTA_RAREZA = {
	"Común": 0.45,
	"Rara": 0.48,
	"Épica": 0.52,
	"Legendaria": 0.58,
	"Peligro": 0.0
}

const PESO_EFECTO_ECONOMIA = {
	"bajar_exigencia": 7.0,
	"curar_estres": 2.0,
	"robar_carta": 13.0,
	"mas_jugadas": 18.0,
	"multiplicar_poder": 30.0,
	"escalar_carisma": 10.0,
	"sacrificar_energia": -12.0,
	"doblar_poder_actual": 32.0,
	"restaurar_mulligan": 15.0,
	"impulso_cero": 11.0,
	"basura": -35.0
}

const ESCALADO_PODER_RAREZA = {
	"Común": 0.65,
	"Rara": 0.85,
	"Épica": 1.1,
	"Legendaria": 1.35,
	"Peligro": 0.0
}

const ESCALADO_XP_RAREZA = {
	"Común": 1.0,
	"Rara": 1.12,
	"Épica": 1.25,
	"Legendaria": 1.4,
	"Peligro": 0.85
}

const META_PODER_RAREZA = {
	"Común": Vector2(1, 4),
	"Rara": Vector2(4, 9),
	"Épica": Vector2(12, 23),
	"Legendaria": Vector2(26, 60),
	"Peligro": Vector2(-12, 0)
}

func normalizar_catalogo_cartas():
	_aplicar_arquetipos_cartas()
	_balancear_efectos_cartas()
	_inyectar_utilidad_cartas_cero()
	#_balancear_poder_cartas()
	_generar_economia_cartas()

func _inyectar_utilidad_cartas_cero():
	for id in catalogo_cartas.keys():
		var carta = catalogo_cartas[id]
		if str(carta.get("rareza", "Común")) == "Peligro":
			continue
		if int(carta.get("poder", 0)) != 0:
			continue
		if str(carta.get("efecto", "")) != "":
			continue
		var rareza = str(carta.get("rareza", "Común"))
		var val_base = 2.0
		if rareza == "Rara":
			val_base = 3.0
		elif rareza == "Épica":
			val_base = 5.0
		elif rareza == "Legendaria":
			val_base = 7.0
		carta["efecto"] = "impulso_cero"
		carta["valor"] = val_base
		var desc_actual = str(carta.get("desc", ""))
		if desc_actual.find("Impulso") == -1:
			carta["desc"] = (desc_actual + " (Impulso +" + str(int(val_base)) + ")").strip_edges()
func _aplicar_arquetipos_cartas():
	for arq in ARQUETIPOS_CARTAS.keys():
		for id in ARQUETIPOS_CARTAS[arq]:
			if not catalogo_cartas.has(id):
				print("⚠️ Carta inexistente en arquetipos: ", id)
				continue
			catalogo_cartas[id]["arquetipo"] = arq
	# Default para las que no estén mapeadas
	for id in catalogo_cartas.keys():
		if not catalogo_cartas[id].has("arquetipo"):
			catalogo_cartas[id]["arquetipo"] = "versatil"

func _balancear_efectos_cartas():
	for id in catalogo_cartas.keys():
		var carta = catalogo_cartas[id]
		var ef = carta.get("efecto", "")
		if ef == "" or ef == "basura": continue
		var rareza = carta.get("rareza", "Común")
		if RANGOS_EFECTO.has(ef) and RANGOS_EFECTO[ef].has(rareza):
			var rango = RANGOS_EFECTO[ef][rareza]
			var valor = float(carta.get("valor", rango.x))
			carta["valor"] = clamp(valor, rango.x, rango.y)
func balancear_poder_cartas():
	for id in catalogo_cartas.keys():
		var carta = catalogo_cartas[id]
		var rareza = carta.get("rareza", "Común")
		if not META_PODER_RAREZA.has(rareza):
			continue

		var rango = META_PODER_RAREZA[rareza]
		var poder_actual = float(carta.get("poder", 0.0))
		carta["poder"] = int(round(clamp(poder_actual, rango.x, rango.y)))

func _generar_economia_cartas():
	for id in catalogo_cartas.keys():
		var carta = catalogo_cartas[id]
		var rareza = carta.get("rareza", "Común")
		var base = float(COSTE_BASE_RAREZA.get(rareza, 80))
		var poder = float(carta.get("poder", 0))
		var efecto = str(carta.get("efecto", ""))
		var valor_efecto = float(carta.get("valor", 0.0))

		var peso = float(PESO_EFECTO_ECONOMIA.get(efecto, 0.0))
		var coste = base + (poder * 9.0) + (valor_efecto * peso)

		# Penalizar cartas de riesgo para evitar roturas de economía.
		if efecto == "sacrificar_energia":
			coste -= 20.0
		elif efecto == "basura":
			coste = 5.0

		coste = clamp(coste, 5.0, 1200.0)
		var valor_compra = int(round(coste / 5.0) * 5)
		var mult_reventa = float(MULTIPLICADOR_REVENTA_RAREZA.get(rareza, 0.45))
		var valor_reventa = int(round((valor_compra * mult_reventa) / 5.0) * 5)

		carta["valor_compra"] = valor_compra
		carta["valor_reventa"] = max(valor_reventa, 0)

func calcular_precio_compra_carta(id_carta: String) -> int:
	if not catalogo_cartas.has(id_carta):
		return 0
	return int(catalogo_cartas[id_carta].get("valor_compra", 100))

func calcular_precio_reventa_carta(id_carta: String) -> int:
	if not catalogo_cartas.has(id_carta):
		return 0
	return int(catalogo_cartas[id_carta].get("valor_reventa", 20))
# --- MEGA RECETAS DE CRAFTEO ---
# ==========================================
# 🔮 MEGA RECETAS DE CRAFTEO (De Común a Legendaria)
# ==========================================
var recetas_crafteo = {
	# --- A RARAS (Requieren 2 Comunes) ---
	"pausa_dramatica": ["mirada_perdida", "silencio_incomodo"],
	"proyeccion_vocal": ["voz_profunda", "carraspeo"],
	"mirada_intensa": ["mirada_perdida", "cejas_arqueadas"],
	"caida_dramatica": ["tropiezo_gracioso", "bostezo_disimulado"],
	"bofetada_falsa": ["sonrisa_falsa", "tos_falsa"],
	"robar_utileria": ["mirar_apuntador", "rascarse_cabeza"],
	"guiño_coqueto": ["sonrisa_timida", "morderse_labio"],
	"risa_maniaca": ["risa_nerviosa", "risa_nerviosa"],
	"grito_ahogado": ["suspiro_profundo", "tartamudeo_calculado"],
	
	# --- A ÉPICAS (Requieren 2 Raras) ---
	"berrinche": ["golpe_en_la_mesa", "risa_maniaca"],
	"romper_cuarta_pared": ["improvisacion_brillante", "mirada_intensa"],
	"llanto_desconsolado": ["llanto_feo", "lagrima_solitaria"],
	"desmayo_realista": ["caida_dramatica", "grito_ahogado"],
	"insulto_director": ["risa_sarcastica", "mirada_desafiante"],
	"amenaza_sutil": ["mirada_juzgadora", "pausa_dramatica"],
	"mirada_de_muerte": ["mirada_intensa", "mirada_desafiante"],
	
	# --- A LEGENDARIAS (Requieren 2 Épicas) ---
	"divo_insuperable": ["berrinche", "insulto_director"],
	"metodo_absoluto": ["monologo_intenso", "ataque_panico_real"],
	"premio_oscar_prematuro": ["divo_insuperable", "metodo_absoluto"],
	"control_mental_set": ["amenaza_sutil", "mirada_de_muerte"],
	"director_llora": ["llanto_desconsolado", "berrinche"],
	"romper_el_universo": ["romper_cuarta_pared", "desmayo_realista"],
	# --- EXPANSIÓN 4 (Añadir al final de recetas_crafteo) ---
	"susurro_amenazante": ["susurro", "mirada_de_reojo"],
	"quitarse_chaqueta": ["ajuste_corbata", "pose_generica"],
	"grito_de_batalla": ["carraspeo", "apretar_punos"],
	"romper_llanto": ["lagrima_falsa", "masajear_sienes"],
	"monologo_villano": ["risa_burlona", "susurro_amenazante"],
	"llorar_sangre": ["romper_llanto", "mirada_intensa"],
	"quitar_peluca": ["tomar_agua", "caida_dramatica"],
	"director_despedido": ["monologo_villano", "insulto_director"],
	"oscar_honorifico": ["premio_oscar_prematuro", "director_despedido"],
	# --- EXPANSIÓN 5 ---
	"respirar_personaje": ["suspiro_profundo", "tragar_saliva"],
	"eco_de_dialogo": ["mirar_apuntador", "tomar_agua"],
	"paso_marcado": ["pose_generica", "ajuste_corbata"],
	"mirada_hielo": ["cejas_arqueadas", "mirada_de_reojo"],
	"ovacion_ensayo": ["romper_llanto", "grito_de_batalla"],
	"cambio_de_mascara": ["paso_marcado", "romper_cuarta_pared"],
	"silencio_que_mata": ["amenaza_sutil", "cambio_de_mascara"],
	"metodo_camaleon": ["ovacion_ensayo", "renacimiento_artistico"]
}

# ==========================================
# 💥 COMBOS EN BATALLA (Sinergias Multiplicadoras)
# ==========================================
var combos_balasim = {
	"crisis_emocional": {"cartas": ["risa_nerviosa", "lagrima_falsa"], "multiplicador": 1.5, "nombre_combo": "¡Combo: Crisis Emocional! (x1.5)"},
	"comedia_fisica": {"cartas": ["tropiezo_gracioso", "risa_nerviosa"], "multiplicador": 1.5, "nombre_combo": "¡Combo: Comedia Slapstick! (x1.5)"},
	"drama_epoca": {"cartas": ["voz_profunda", "pausa_dramatica"], "multiplicador": 2.0, "nombre_combo": "¡Combo: Drama de Época! (x2.0)"},
	"intensidad_total": {"cartas": ["mirada_intensa", "romper_cuarta_pared"], "multiplicador": 2.5, "nombre_combo": "¡Combo: Protagonista Absoluto! (x2.5)"},
	"novela_barata": {"cartas": ["bofetada_falsa", "caida_dramatica"], "multiplicador": 2.0, "nombre_combo": "¡Combo: Telenovela Barata! (x2.0)"},
	"romance_improvisado": {"cartas": ["guiño_coqueto", "beso_no_guionizado"], "multiplicador": 3.0, "nombre_combo": "¡Combo: Tensión Sexual Extrema! (x3.0)"},
	"locura_absoluta": {"cartas": ["risa_maniaca", "mirada_desafiante"], "multiplicador": 2.5, "nombre_combo": "¡Combo: El Guasón! (x2.5)"},
	"melodrama": {"cartas": ["caida_dramatica", "grito_ahogado"], "multiplicador": 2.0, "nombre_combo": "¡Combo: Melodrama Supremo! (x2.0)"},
	"inseguridad_total": {"cartas": ["morderse_labio", "jugar_cabello"], "multiplicador": 1.8, "nombre_combo": "¡Combo: Adolescente Inseguro! (x1.8)"},
	"rebeldia_pura": {"cartas": ["insulto_director", "destrozar_set"], "multiplicador": 3.0, "nombre_combo": "¡Combo: Despido Inminente! (x3.0)"},
	"divinidad_actoral": {"cartas": ["ovacion_de_pie", "renacimiento_artistico"], "multiplicador": 5.0, "nombre_combo": "¡Combo: Dios del Teatro! (x5.0)"},
	# --- EXPANSIÓN 4 (Añadir al final de combos_balasim) ---
	"intelectual_falso": {"cartas": ["ajustar_gafas", "rascarse_cabeza"], "multiplicador": 1.5, "nombre_combo": "¡Combo: Falso Intelectual! (x1.5)"},
	"preparacion_combate": {"cartas": ["quitarse_chaqueta", "apretar_punos"], "multiplicador": 2.0, "nombre_combo": "¡Combo: Listo para Pelear! (x2.0)"},
	"villano_clasico": {"cartas": ["monologo_villano", "risa_burlona"], "multiplicador": 2.5, "nombre_combo": "¡Combo: Mente Maestra! (x2.5)"},
	"shock_teatral": {"cartas": ["quitar_peluca", "salto_fe"], "multiplicador": 3.0, "nombre_combo": "¡Combo: Giro Inesperado! (x3.0)"},
	"toma_hostil": {"cartas": ["director_despedido", "mirada_de_muerte"], "multiplicador": 4.0, "nombre_combo": "¡Combo: Golpe de Estado en el Set! (x4.0)"},
	"calma_tensa": {"cartas": ["respirar_personaje", "mirada_hielo"], "multiplicador": 2.0, "nombre_combo": "¡Combo: Calma Tensa! (x2.0)"},
	"doble_personaje": {"cartas": ["eco_de_dialogo", "cambio_de_mascara"], "multiplicador": 2.7, "nombre_combo": "¡Combo: Doble Personalidad! (x2.7)"},
	"showrunner": {"cartas": ["silencio_que_mata", "metodo_camaleon"], "multiplicador": 4.5, "nombre_combo": "¡Combo: Showrunner Supremo! (x4.5)"}
}

# (Recuerda mantener tu var mazo_jugador aquí abajo)

var mazo_jugador = [] # Inicias sin ninguna técnica actoral
var mazo_disponible = [] # Cartas que aún no has usado esta semana
var cartas_instancia = {} # id_instancia -> {"id_base","nivel","xp_actual","xp_requerida"}
var ultimo_id_carta_instancia = 0
const NIVEL_MAX_CARTA = 10
var agentes_slots = ["", "", ""]
var agentes_poseidos = []
var catalogo_agentes = {
	"mania_comedia": {"nombre": "🎭 Manía de Comedia", "desc": "+20% poder cartas Comerciales, +2 Exigencia por ronda.", "tipo": "build"},
	"amuleto_memoria": {"nombre": "🧠 Amuleto de Memoria", "desc": "Si tu primera carta es Forma, recuperas +1 mulligan.", "tipo": "build"},
	"padrino_metodo": {"nombre": "🎬 Padrino de Método", "desc": "+15% poder Método y +5% crit base.", "tipo": "contacto"},
	"sponsor_fisico": {"nombre": "💪 Sponsor Físico", "desc": "+1 Energía al iniciar combate y +12% poder Físico.", "tipo": "build"}
}
# El mazo inicial con el que empieza el jugador
# Los lugares que puedes rentar. Contactos de alto nivel (Indie/Pro) 
# se negarán a trabajar contigo si los citas en la sala de tu casa.
var espacios_disponibles = {
	"sala_casa": {
		"nombre": "Cuarto de Azotea",
		"renta_mensual": 0,
		"precio_compra": 0,
		"tier": 0,
		"nivel_max_contactos": "Local",
		"capacidad_equipo": 1,
		"capacidad_publico": 5,
		"especialidad": "ninguna"
	},
	"cafe_bohemio": {"nombre": "Café Bohemio", "renta_mensual": 100, "precio_compra": 1500, "tier": 1, "nivel_max_contactos": "Indie", "capacidad_equipo": 4, "capacidad_publico": 30, "especialidad": "intimo"},
	"foro_underground": {"nombre": "Foro Alternativo (Underground)", "renta_mensual": 350, "precio_compra": 5250, "tier": 2, "nivel_max_contactos": "Indie", "capacidad_equipo": 7, "capacidad_publico": 80, "especialidad": "experimental"},
	"teatro_camara": {"nombre": "Teatro de Cámara Clásico", "renta_mensual": 1000, "precio_compra": 15000, "tier": 3, "nivel_max_contactos": "Profesional", "capacidad_equipo": 15, "capacidad_publico": 250, "especialidad": "texto"},
	"gran_auditorio": {"nombre": "Gran Auditorio de la Ciudad", "renta_mensual": 4000, "precio_compra": 60000, "tier": 4, "nivel_max_contactos": "Profesional", "capacidad_equipo": 45, "capacidad_publico": 1000, "especialidad": "mega"}
}
# ==========================================
# 🎭 FORMATOS DE PRODUCCIÓN PROPIA (NUEVO)
# ==========================================
var formatos_produccion = {
	"monologo_bolsillo": {"titulo": "Monólogo de Bolsillo", "descripcion": "Formato pequeño para testear material.", "costo_montaje": 200, "corte_boleto": 12, "dias_de_trabajo": 2, "aforo_minimo": 15, "dificultad": 1.7, "importancia": 1, "requiere_taquilla": true, "formato_tipo": "intimo"},
	"obra_reparto": {"titulo": "Obra de Reparto", "descripcion": "Montaje estándar con elenco completo.", "costo_montaje": 800, "corte_boleto": 20, "dias_de_trabajo": 4, "aforo_minimo": 50, "dificultad": 2.8, "importancia": 2, "requiere_taquilla": true, "formato_tipo": "experimental"},
	"musical_gran_formato": {"titulo": "Musical / Gran Formato", "descripcion": "Gran producción de alto riesgo y alta recompensa.", "costo_montaje": 3000, "corte_boleto": 35, "dias_de_trabajo": 6, "aforo_minimo": 200, "dificultad": 4.2, "importancia": 3, "requiere_taquilla": true, "formato_tipo": "mega"},
	"cortometraje_indie": {"titulo": "Cortometraje Indie", "descripcion": "Proyecto para festivales y prestigio, sin taquilla directa.", "costo_montaje": 1500, "corte_boleto": 0, "dias_de_trabajo": 3, "aforo_minimo": 0, "dificultad": 3.2, "importancia": 3, "requiere_taquilla": false, "formato_tipo": "experimental"}
}
var estado_actual = "normal" # Puede ser: normal, inspirado, torpe, viral, resaca
var hitos_redes = {
	"micro_influencer": false, # Se activa a los 100 seguidores
	"verificado": false        # Se activa a los 500 seguidores
}

var agenda = {
	30: "Pago_Renta"
}


var objetivos_temporada = {
	"prestigio": {"nombre": "Temporada de Prestigio"},
	"fama": {"nombre": "Temporada Viral"},
	"caja": {"nombre": "Temporada de Caja"},
	"supervivencia": {"nombre": "Temporada de Supervivencia"}
}

var mutadores_temporada = {
	"normal": {"nombre": "Sin Mutador"},
	"industria_ajustada": {"nombre": "Recortes de Industria"},
	"sponsors_agresivos": {"nombre": "Sponsors Agresivos"}
}

var temporada_actual = {
	"numero": 1,
	"objetivo_id": "prestigio",
	"mutador_id": "normal"
}

var contratos_casting = [
	{"nombre": "Estándar", "multi_pago": 1.0, "multi_xp": 1.0, "multi_seguidores": 1.0, "penalidad_fracaso": 0},
	{"nombre": "Taquilla Garantizada", "multi_pago": 1.25, "multi_xp": 0.9, "multi_seguidores": 0.9, "penalidad_fracaso": 6},
	{"nombre": "Autoral", "multi_pago": 0.8, "multi_xp": 1.35, "multi_seguidores": 1.1, "penalidad_fracaso": 2},
	{"nombre": "Exposición", "multi_pago": 0.7, "multi_xp": 1.0, "multi_seguidores": 1.45, "penalidad_fracaso": 5}
]

# ==========================================
# 🎬 BOLSA DE TRABAJO EXTENDIDA (CON TAQUILLA Y BOOK)
# ==========================================
var castings_disponibles = {
	# --- TIER 1: PRINCIPIANTES (Supervivencia y Talento) ---
	"extra_pelicula": {
		"titulo": "Extra en Película Z",
		"descripcion": "Estar parado 12 horas fingiendo ser un zombi.",
		"stat_requerido": "expresion_corporal", "nivel_minimo": 1, "seguidores_minimos": 0,
		"paga": 35, "recompensa_xp": 20, "recompensa_seguidores": 5,
		"dias_de_trabajo": 1, "dificultad": 1,
		"tipo_pago": "fijo", "importancia": 1
	},
	"corto_estudiantil": {
		"titulo": "Corto Universitario",
		"descripcion": "Te pagan con pizza, pero el guion es muy bueno.",
		"stat_requerido": "memoria", "nivel_minimo": 1, "seguidores_minimos": 0,
		"paga": 0, "recompensa_xp": 120, "recompensa_seguidores": 10,
		"dias_de_trabajo": 2, "dificultad": 1,
		"tipo_pago": "fijo", "importancia": 1
	},
	"animador_fiestas": {
		"titulo": "Animador Infantil",
		"descripcion": "Disfrazarte de perrito y hacer reír a los niños.",
		"stat_requerido": "carisma", "nivel_minimo": 2, "seguidores_minimos": 0,
		"paga": 80, "recompensa_xp": 30, "recompensa_seguidores": 5,
		"dias_de_trabajo": 1, "dificultad": 1,
		"tipo_pago": "fijo", "importancia": 1
	},
	"obra_universitaria": {
		"titulo": "Obra Estudiantil",
		"descripcion": "Sin paga, pero excelente para ganar tablas.",
		"stat_requerido": "memoria", "nivel_minimo": 2, "seguidores_minimos": 0,
		"paga": 0, "recompensa_xp": 180, "recompensa_seguidores": 15,
		"dias_de_trabajo": 3, "dificultad": 1,
		"tipo_pago": "taquilla", "corte_boleto": 5, "importancia": 1 # Escala pequeña
	},
	"microteatro_bar": {
		"titulo": "Microteatro en Bar",
		"descripcion": "Actúas en un cuarto pequeño. Ganas lo que se cobre en puerta.",
		"stat_requerido": "carisma", "nivel_minimo": 2, "seguidores_minimos": 15,
		"paga": 0, "recompensa_xp": 150, "recompensa_seguidores": 20,
		"dias_de_trabajo": 2, "dificultad": 2,
		"tipo_pago": "taquilla", "corte_boleto": 8, "importancia": 1 
	},

	# --- TIER 2: AMATEUR (El salto a la industria) ---
	"doblaje_indie": {
		"titulo": "Voz Juego Indie",
		"descripcion": "Grabar desde casa. Requiere buena técnica vocal.",
		"stat_requerido": "tecnica_vocal", "nivel_minimo": 2, "seguidores_minimos": 50,
		"paga": 250, "recompensa_xp": 100, "recompensa_seguidores": 40,
		"dias_de_trabajo": 2, "dificultad": 2,
		"tipo_pago": "fijo", "importancia": 2
	},
	"locutor_radio": {
		"titulo": "Locutor Comercial Radio",
		"descripcion": "Anunciar ofertas de supermercado con voz grave.",
		"stat_requerido": "tecnica_vocal", "nivel_minimo": 3, "seguidores_minimos": 100,
		"paga": 300, "recompensa_xp": 80, "recompensa_seguidores": 60,
		"dias_de_trabajo": 1, "dificultad": 2,
		"tipo_pago": "fijo", "importancia": 2
	},
	"comercial_local": {
		"titulo": "Comercial TV Local",
		"descripcion": "Paga bien, pero necesitas sonreír muchísimo.",
		"stat_requerido": "carisma", "nivel_minimo": 3, "seguidores_minimos": 200, 
		"paga": 450, "recompensa_xp": 60, "recompensa_seguidores": 120,
		"dias_de_trabajo": 1, "dificultad": 3,
		"tipo_pago": "fijo", "importancia": 2
	},
	"obra_independiente": {
		"titulo": "Teatro Independiente",
		"descripcion": "Foro de tamaño mediano. Requiere ensayo físico intenso.",
		"stat_requerido": "expresion_corporal", "nivel_minimo": 4, "seguidores_minimos": 150, 
		"paga": 0, "recompensa_xp": 300, "recompensa_seguidores": 150,
		"dias_de_trabajo": 4, "dificultad": 2,
		"tipo_pago": "taquilla", "corte_boleto": 12, "importancia": 2 # Escala media
	},
	"standup_club": {
		"titulo": "Show de Stand-Up",
		"descripcion": "Un micrófono, tú y el público. Pura improvisación.",
		"stat_requerido": "carisma", "nivel_minimo": 4, "seguidores_minimos": 300, 
		"paga": 0, "recompensa_xp": 200, "recompensa_seguidores": 200,
		"dias_de_trabajo": 2, "dificultad": 3,
		"tipo_pago": "taquilla", "corte_boleto": 15, "importancia": 2
	},

	# --- TIER 3: PROFESIONAL (El estrellato) ---
	"teatro_nacional": {
		"titulo": "Teatro Nacional (Protagónico)",
		"descripcion": "Puro arte. El papel de tu vida, exige talento absoluto.",
		"stat_requerido": "expresion_corporal", "nivel_minimo": 5, "seguidores_minimos": 0,
		"paga": 0, "recompensa_xp": 800, "recompensa_seguidores": 500,
		"dias_de_trabajo": 5, "dificultad": 3,
		"tipo_pago": "taquilla", "corte_boleto": 25, "importancia": 3 # Escala Masiva
	},
	"serie_streaming": {
		"titulo": "Papel Secundario Serie",
		"descripcion": "Apareces en 3 capítulos. ¡Tu cara estará en todos lados!",
		"stat_requerido": "memoria", "nivel_minimo": 4, "seguidores_minimos": 800, 
		"paga": 2000, "recompensa_xp": 400, "recompensa_seguidores": 1000,
		"dias_de_trabajo": 4, "dificultad": 3,
		"tipo_pago": "fijo", "importancia": 3
	},
	"campana_global": {
		"titulo": "Embajador Marca Global",
		"descripcion": "Solo les importa tu fama. Eres una cara bonita que vende.",
		"stat_requerido": "carisma", "nivel_minimo": 4, "seguidores_minimos": 2000, 
		"paga": 4000, "recompensa_xp": 100, "recompensa_seguidores": 2500,
		"dias_de_trabajo": 2, "dificultad": 2,
		"tipo_pago": "fijo", "importancia": 3
	},
	"pelicula_indie_festival": {
		"titulo": "Película de Festival",
		"descripcion": "Bajo presupuesto, pero si a la crítica le gusta, serás leyenda.",
		"stat_requerido": "memoria", "nivel_minimo": 6, "seguidores_minimos": 1500, 
		"paga": 0, "recompensa_xp": 1200, "recompensa_seguidores": 3000,
		"dias_de_trabajo": 6, "dificultad": 3,
		"tipo_pago": "taquilla", "corte_boleto": 30, "importancia": 3 
	}
}

# ==========================================
# 🌅 EVENTOS MATUTINOS Y CLIMA DIARIO
# ==========================================
var eventos_matutinos = {
	"insomnio": {
		"titulo": "Noche de Insomnio",
		"descripcion": "Te quedaste sobrepensando tu carrera hasta las 4 AM. Estás torpe.",
		"efecto_energia": -1, "efecto_dinero": 0, "efecto_seguidores": 0,
		"estado_dia": "torpe" 
	},
	"sueno_reparador": {
		"titulo": "Sueño Reparador",
		"descripcion": "Dormiste 9 horas de corrido. Te sientes invencible e inspirado.",
		"efecto_energia": 1, "efecto_dinero": 0, "efecto_seguidores": 0,
		"estado_dia": "inspirado" 
	},
	"viral_madrugada": {
		"titulo": "Algoritmo Bendito",
		"descripcion": "Un Reel viejo tuyo se hizo viral mientras dormías. ¡Es tu momento!",
		"efecto_energia": 0, "efecto_dinero": 0, "efecto_seguidores": 50,
		"estado_dia": "viral" 
	},
	"billete_encontrado": {
		"titulo": "Suerte Inesperada",
		"descripcion": "Encontraste un billete en tu chamarra. Hoy es un buen día económico.",
		"efecto_energia": 0, "efecto_dinero": 50, "efecto_seguidores": 0,
		"estado_dia": "suerte" 
	},
	"resaca": {
		"titulo": "Resaca Espantosa",
		"descripcion": "No debiste ir a esa fiesta anoche. Te duele la cabeza horrores.",
		"efecto_energia": -2, "efecto_dinero": -20, "efecto_seguidores": -5,
		"estado_dia": "resaca" 
	}
}

# ==========================================
# 🔄 SISTEMA DE REINICIO (GAME OVER ACTUALIZADO)
# ==========================================
func reiniciar_datos():
	# Respetamos tus variables agregadas (reputacion, deuda, fase_dia)
	mazo_jugador = [] # El olvido total al reiniciar
	mazo_disponible = mazo_jugador.duplicate()
	cartas_instancia.clear()
	ultimo_id_carta_instancia = 0
	agentes_slots = ["", "", ""]
	agentes_poseidos.clear()
	economia = {"dinero": 250, "deuda_bancaria": 0}
	stats_actor = {"energia_actual": 3, "energia_maxima": 3, "reputacion": 0, "seguidores": 1, "contactos": 0, "estres": 0, "ego": 0}
	perfil_actor = {
	"metodo": 0,     
	"fisico": 0,     
	"forma": 0,      
	"comercial": 0,  
	"instinto": 0    
}
	tiempo = {"dia": 1, "fase_dia": "Mañana"}
	mi_compania = {
		"fundada": false,
		"nombre": "Sin Nombre",
		"id_espacio_actual": "sala_casa",
		"contrato_renta": {"id_espacio": "sala_casa", "vence_dia": -1},
		"espacios_propios": [],
		"mejoras_locales": {},
		"prestigio": 0,
		"producciones_realizadas": 0,
		"tier_empresa": 0
	}
	habilidades_actor = {
		"nivel_general": 1, "xp_actual": 0, "xp_requerida": 100, "puntos_habilidad": 0,
		"tecnica_vocal": 1, "expresion_corporal": 1, "carisma": 1, "memoria": 1
	}
	
	# Vaciamos agenda y estados
	agenda.clear()
	agenda[30] = "Pago_Renta"
	estado_actual = "normal"
	hitos_redes = {"micro_influencer": false, "verificado": false}
	temporada_actual = {"numero": 1, "objetivo_id": "prestigio", "mutador_id": "normal"}
	
	# Vaciamos el legado
	ultimos_seguidores = ["@TuMama_Oficial"]
	lista_contactos.clear()
	historial_posts.clear()
	proyectos_activos.clear()
	historial_proyectos.clear()
	mejoras_simzon = {"aro_luz": false, "suscripcion_meditacion": false, "set_utileria": false, "microfono_solapa": false}

# ==========================================
# 🧑‍🤝‍🧑 GENERADOR DE NOMBRES Y USUARIOS
# ==========================================

func _ready():
	randomize()
	normalizar_catalogo_cartas()
	_actualizar_mazos_a_instancias()

func crear_instancia_carta(id_base: String) -> String:
	if not catalogo_cartas.has(id_base):
		return ""
	ultimo_id_carta_instancia += 1
	var id_instancia = "ci_" + str(ultimo_id_carta_instancia)
	cartas_instancia[id_instancia] = {
		"id_base": id_base,
		"nivel": 1,
		"xp_actual": 0,
		"xp_requerida": calcular_xp_requerida_carta(id_base, 1)
	}
	return id_instancia

func obtener_id_base_carta(id_carta) -> String:
	if typeof(id_carta) != TYPE_STRING:
		return ""
	var id_txt = str(id_carta)
	if cartas_instancia.has(id_txt):
		return str(cartas_instancia[id_txt].get("id_base", ""))
	return id_txt

func obtener_info_carta(id_carta) -> Dictionary:
	var id_base = obtener_id_base_carta(id_carta)
	if not catalogo_cartas.has(id_base):
		return {}
	return catalogo_cartas[id_base]

func obtener_nivel_carta(id_carta) -> int:
	if cartas_instancia.has(id_carta):
		return int(cartas_instancia[id_carta].get("nivel", 1))
	return 1

func obtener_poder_carta(id_carta) -> int:
	var info = obtener_info_carta(id_carta)
	if info.is_empty():
		return 0
	var poder_base = int(info.get("poder", 0))
	var nivel = obtener_nivel_carta(id_carta)
	if poder_base < 0:
		return poder_base
	var rareza = str(info.get("rareza", "Común"))
	var esc = float(ESCALADO_PODER_RAREZA.get(rareza, 0.7))
	var bonus_nivel = int(floor(max(0, nivel - 1) * esc)) + int(floor(max(0, nivel - 1) / 4.0))
	return poder_base + bonus_nivel

func obtener_valor_efecto_carta(id_carta) -> float:
	var info = obtener_info_carta(id_carta)
	if info.is_empty():
		return 0.0
	var ef = str(info.get("efecto", ""))
	var base = float(info.get("valor", 0.0))
	if ef == "":
		return base
	var nivel = max(1, obtener_nivel_carta(id_carta))
	var rareza = str(info.get("rareza", "Común"))
	var t = max(0.0, float(nivel - 1))
	if ef == "multiplicar_poder":
		return base + (t * (0.015 + (0.003 * float(ESCALADO_PODER_RAREZA.get(rareza, 0.6)))))
	if ef == "escalar_carisma":
		return base + int(floor(t / 3.0))
	if ef == "robar_carta" or ef == "mas_jugadas" or ef == "restaurar_mulligan":
		return base + int(floor(t / 6.0))
	return base + int(floor(t * (0.35 + (0.08 * float(ESCALADO_PODER_RAREZA.get(rareza, 0.6))))))

func calcular_xp_requerida_carta(id_base: String, nivel_actual: int) -> int:
	var info = catalogo_cartas.get(id_base, {})
	var rareza = str(info.get("rareza", "Común"))
	var esc = float(ESCALADO_XP_RAREZA.get(rareza, 1.0))
	var n = max(1, nivel_actual)
	var base = 80 + int((n - 1) * 35) + int(pow(max(0, n - 1), 1.22) * 9.0)
	return int(round(float(base) * esc))

func otorgar_xp_carta(id_carta, xp_ganada: int):
	if xp_ganada <= 0:
		return
	if not cartas_instancia.has(id_carta):
		return
	var data = cartas_instancia[id_carta]
	if int(data.get("nivel", 1)) >= NIVEL_MAX_CARTA:
		data["xp_actual"] = 0
		cartas_instancia[id_carta] = data
		return
	data["xp_actual"] = int(data.get("xp_actual", 0)) + xp_ganada
	while int(data.get("nivel", 1)) < NIVEL_MAX_CARTA and int(data.get("xp_actual", 0)) >= int(data.get("xp_requerida", 100)):
		data["xp_actual"] -= int(data.get("xp_requerida", 100))
		data["nivel"] = int(data.get("nivel", 1)) + 1
		data["xp_requerida"] = calcular_xp_requerida_carta(str(data.get("id_base", "")), int(data.get("nivel", 1)))
	if int(data.get("nivel", 1)) >= NIVEL_MAX_CARTA:
		data["nivel"] = NIVEL_MAX_CARTA
		data["xp_actual"] = 0
	data["xp_requerida"] = calcular_xp_requerida_carta(str(data.get("id_base", "")), int(data.get("nivel", 1)))
	cartas_instancia[id_carta] = data

func contar_cartas_por_base(id_base: String) -> int:
	var c = 0
	for id_inst in mazo_jugador:
		if obtener_id_base_carta(id_inst) == id_base:
			c += 1
	return c

func obtener_instancias_por_base(id_base: String, solo_disponibles := false) -> Array:
	var salida = []
	var fuente = mazo_jugador
	if solo_disponibles:
		fuente = mazo_disponible
	for id_inst in fuente:
		if obtener_id_base_carta(id_inst) == id_base:
			salida.append(id_inst)
	return salida

func _actualizar_mazos_a_instancias():
	if mazo_jugador.is_empty():
		return
	var requiere_migracion = false
	for id_c in mazo_jugador:
		if not str(id_c).begins_with("ci_"):
			requiere_migracion = true
			break
	if not requiere_migracion:
		return
	var nuevo_mazo = []
	var nuevo_disponible = []
	for id_base in mazo_jugador:
		var inst = crear_instancia_carta(str(id_base))
		if inst != "":
			nuevo_mazo.append(inst)
	for id_base in mazo_disponible:
		for id_inst in nuevo_mazo:
			if not nuevo_disponible.has(id_inst) and obtener_id_base_carta(id_inst) == str(id_base):
				nuevo_disponible.append(id_inst)
				break
	mazo_jugador = nuevo_mazo
	mazo_disponible = nuevo_disponible

var nombres_npc = ["Juan", "María", "Carlos", "Ana", "Luis", "Elena", "Pedro", "Sofía", "Diego", "Laura", "Mónica", "Raúl"]
var apellidos_npc = ["Pérez", "Gómez", "López", "Díaz", "Martínez", "García", "Ruiz", "Hernández"]
var prefijos_user = ["user_", "teatro_fan_", "actor_wannabe_", "cine_", "soyel_", "anon_", "fan_"]

func generar_usuario_aleatorio() -> String:
	var azar = randi_range(1, 3)
	if azar == 1: return "@" + prefijos_user.pick_random() + str(randi_range(100, 9999))
	elif azar == 2: return "@" + nombres_npc.pick_random().to_lower() + "_" + apellidos_npc.pick_random().to_lower()
	else: return "@" + nombres_npc.pick_random().to_lower() + str(randi_range(10, 99))

func generar_contacto_nuevo(nivel_jugador: int, carisma_jugador: int) -> Dictionary:
	var roles = ["Director", "Productor", "Maestro de Actuación", "Cazatalentos (Agente)", "Guionista"]
	var rol_elegido = roles.pick_random()
	
	var categoria = "Local"
	var influencia = randi_range(1, 10)
	
	if nivel_jugador >= 3 or carisma_jugador >= 3:
		if randi_range(1, 100) > 50: 
			categoria = "Indie"
			influencia = randi_range(11, 50)
			
	if nivel_jugador >= 6 or carisma_jugador >= 5:
		if randi_range(1, 100) > 70:
			categoria = "Profesional"
			influencia = randi_range(51, 100)
			
	return {
		"nombre": nombres_npc.pick_random() + " " + apellidos_npc.pick_random(),
		"rol": rol_elegido,
		"categoria": categoria,
		"influencia": influencia,
		"afinidad": 50 
	}
# ==========================================
# 💾 SISTEMA DE GUARDADO Y CARGA
# ==========================================
const RUTA_GUARDADO = "user://carrera_actoral.save"

func guardar_partida():
	# Metemos todas las variables importantes en un Diccionario
	
	var paquete_datos = {
		"economia": economia,
		"stats_actor": stats_actor,
		"habilidades_actor": habilidades_actor,
		"perfil_actor": perfil_actor,
		"tiempo": tiempo,
		"mazo_jugador": mazo_jugador,
		"mazo_disponible": mazo_disponible,
		"cartas_instancia": cartas_instancia,
		"ultimo_id_carta_instancia": ultimo_id_carta_instancia,
		"agentes_slots": agentes_slots,
		"agentes_poseidos": agentes_poseidos,
		"proyectos_activos": proyectos_activos,
		"agenda": agenda,
		"mercado_hoy": mercado_hoy, # <--- AÑADE ESTO AQUÍ
		"temporada_actual": temporada_actual,
		"mi_compania": mi_compania,
		"lista_contactos": lista_contactos,
		"historial_proyectos": historial_proyectos,
		"mejoras_simzon": mejoras_simzon
	}
	
	# Abrimos el archivo en modo ESCRITURA y guardamos en formato JSON
	var archivo = FileAccess.open(RUTA_GUARDADO, FileAccess.WRITE)
	if archivo:
		var json_string = JSON.stringify(paquete_datos)
		archivo.store_string(json_string)
		archivo.close()
		print("💾 Partida guardada con éxito en: ", RUTA_GUARDADO)

func cargar_partida() -> bool:
	# Verificamos si existe un archivo de guardado previo
	if not FileAccess.file_exists(RUTA_GUARDADO):
		print("No se encontró archivo de guardado.")
		return false
	
	var archivo = FileAccess.open(RUTA_GUARDADO, FileAccess.READ)
	if archivo:
		var json_string = archivo.get_as_text()
		archivo.close()
		
		var json = JSON.new()
		var error = json.parse(json_string)
		if error == OK:
			var datos_cargados = json.data
			
			# 1. Variables complejas
			mazo_jugador = datos_cargados.get("mazo_jugador", mazo_jugador)
			mazo_disponible = datos_cargados.get("mazo_disponible", mazo_disponible)
			cartas_instancia = datos_cargados.get("cartas_instancia", cartas_instancia)
			ultimo_id_carta_instancia = int(datos_cargados.get("ultimo_id_carta_instancia", ultimo_id_carta_instancia))
			agentes_slots = datos_cargados.get("agentes_slots", agentes_slots)
			agentes_poseidos = datos_cargados.get("agentes_poseidos", agentes_poseidos)
			proyectos_activos = datos_cargados.get("proyectos_activos", proyectos_activos)
			mi_compania = datos_cargados.get("mi_compania", mi_compania)
			if not mi_compania.has("contrato_renta"):
				mi_compania["contrato_renta"] = {"id_espacio": "sala_casa", "vence_dia": -1}
			if not mi_compania.has("espacios_propios"):
				mi_compania["espacios_propios"] = []
			if not mi_compania.has("mejoras_locales"):
				mi_compania["mejoras_locales"] = {}
			if not mi_compania.has("prestigio"):
				mi_compania["prestigio"] = 0
			if not mi_compania.has("producciones_realizadas"):
				mi_compania["producciones_realizadas"] = 0
			if not mi_compania.has("tier_empresa"):
				mi_compania["tier_empresa"] = 0
			lista_contactos = datos_cargados.get("lista_contactos", lista_contactos)
			historial_proyectos = datos_cargados.get("historial_proyectos", historial_proyectos)
			mejoras_simzon = datos_cargados.get("mejoras_simzon", mejoras_simzon)
			
			if datos_cargados.has("agenda"):
				agenda.clear()
				for llave in datos_cargados["agenda"].keys():
					agenda[int(llave)] = datos_cargados["agenda"][llave]
			
			# 2. Diccionarios numéricos
			if datos_cargados.has("economia"):
				for llave in datos_cargados["economia"]:
					economia[llave] = int(datos_cargados["economia"][llave])
			if datos_cargados.has("stats_actor"):
				for llave in datos_cargados["stats_actor"]:
					stats_actor[llave] = int(datos_cargados["stats_actor"][llave])
			if datos_cargados.has("habilidades_actor"):
				for llave in datos_cargados["habilidades_actor"]:
					habilidades_actor[llave] = int(datos_cargados["habilidades_actor"][llave])
			if datos_cargados.has("perfil_actor"):
				for llave in datos_cargados["perfil_actor"]:
					perfil_actor[llave] = int(datos_cargados["perfil_actor"][llave])
			if datos_cargados.has("tiempo"):
				for llave in datos_cargados["tiempo"]:
					tiempo[llave] = int(datos_cargados["tiempo"][llave])
			
			mercado_hoy = datos_cargados.get("mercado_hoy", mercado_hoy)
			temporada_actual = datos_cargados.get("temporada_actual", temporada_actual)
			_actualizar_mazos_a_instancias()
			print("📂 Partida cargada con éxito. (Números corregidos)")
			return true
	
	return false

# (Opcional) Para cuando quieras borrar tu progreso
func borrar_partida():
	if FileAccess.file_exists(RUTA_GUARDADO):
		var dir = DirAccess.open("user://")
		dir.remove("carrera_actoral.save")
		reiniciar_datos()
