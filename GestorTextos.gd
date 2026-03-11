extends Node

var textos = {
	# --- MESERO (ÉXITOS) ---
	"trabajo_exito": [
		{"titulo": "¡Propina Jugosa!", "desc": "Atendiste a un productor de cine de incógnito y le encantó tu actitud."},
		{"titulo": "Mesero Estrella", "desc": "Hiciste malabares con las tazas de café y toda la cafetería aplaudió."},
		{"titulo": "Día Tranquilo", "desc": "Sobreviviste al turno sin que ningún cliente te gritara. Un milagro."},
		{"titulo": "El Influencer", "desc": "Atendiste a un SimToker famoso. Dejó $50 de propina y no pidió grabarte."},
		{"titulo": "Cliente Frecuente", "desc": "El señor de la mesa 4 te dio una charla motivacional y una buena propina."},
		{"titulo": "Pedido Imposible", "desc": "Te pidieron un 'latte descafeinado con leche de almendras a 43°C'. Lo clavaste."},
		{"titulo": "Sobras VIP", "desc": "Te dejaron llevarte a casa media pizza gourmet que un cliente no tocó. ¡Cena gratis!"},
		{"titulo": "Encanto Natural", "desc": "Le sonreíste a una mesa de ancianitas y te dejaron propina doble por 'simpático'."},
		{"titulo": "Reflejos Felinos", "desc": "Un vaso estaba a punto de caer y lo atrapaste en el aire. Te sentiste como Spider-Man."},
		{"titulo": "Turno Rápido", "desc": "El restaurante estuvo vacío la mitad del día. Te pagaron por existir."}
	],
	# --- MESERO (FRACASOS) ---
	"trabajo_fallo": [
		{"titulo": "Desastre en la Mesa 4", "desc": "Tiraste una sopa hirviendo sobre un cliente VIP. Tuviste que pagar la tintorería."},
		{"titulo": "Agotamiento Total", "desc": "Te quedaste dormido parado junto a la caja registradora."},
		{"titulo": "Día Gris", "desc": "Confundiste todas las órdenes y el gerente te descontó las mermas."},
		{"titulo": "El Crítico de Comida", "desc": "Un tipo pretencioso odió la comida y te echó la culpa a ti. Sin propina."},
		{"titulo": "Caída Épica", "desc": "Resbalaste con un charco invisible y la bandeja voló por los aires."},
		{"titulo": "Ataque Karen", "desc": "Una clienta exigió hablar con el gerente porque 'el hielo estaba muy frío'."},
		{"titulo": "Fuga de Cerebro", "desc": "Olvidaste cobrarle a una mesa de 6 personas que salió corriendo. Adiós sueldo."},
		{"titulo": "Uniforme Manchado", "desc": "Alguien te derramó salsa de tomate encima en tu primera hora de turno."},
		{"titulo": "Caos en la Cocina", "desc": "El chef enloqueció y te gritó frente a todos por pedirle extra kétchup."},
		{"titulo": "Día Etílico", "desc": "Un cliente borracho te contó toda su vida sentimental y no te dejó trabajar."}
	],
	# --- ENSAYOS EN CASA (ÉXITOS) ---
	"ensayo_casa_exito": [
		{"titulo": "¡Inspiración Pura!", "desc": "Lloraste lágrimas reales frente al espejo del baño. ¡Qué actuación!"},
		{"titulo": "El Método", "desc": "Descubriste un nuevo tono de voz para tu personaje que suena increíble."},
		{"titulo": "Modo Monje", "desc": "Apagaste el celular y memorizaste 5 páginas de corrido sin fallar."},
		{"titulo": "Epifanía Actoral", "desc": "De pronto entendiste exactamente cuál es la 'motivación' de tu personaje."},
		{"titulo": "Gimnasia Vocal", "desc": "Tus ejercicios de dicción sonaron tan bien que hasta el vecino aplaudió."},
		{"titulo": "Memoria Fotográfica", "desc": "Leíste el texto dos veces y se te grabó a fuego en la mente."},
		{"titulo": "Coreografía Mental", "desc": "Marcaste tus movimientos en la sala de tu casa esquivando el sofá a la perfección."},
		{"titulo": "Catarsis", "desc": "Gritaste una línea de enojo con tanta pasión que asustaste a tu gato."},
		{"titulo": "Fluidez Total", "desc": "Las palabras salían de tu boca de forma tan natural que no parecía un guion."},
		{"titulo": "Conexión Emocional", "desc": "Recordaste a tu ex y usaste ese dolor para la escena dramática. Funciona."}
	],
	# --- ENSAYOS EN CASA (FRACASOS) ---
	"ensayo_casa_fallo": [
		{"titulo": "Procrastinación", "desc": "Te distrajiste viendo videos de gatitos en SimTok durante 2 horas."},
		{"titulo": "Bloqueo Actoral", "desc": "Sentiste que actuabas como un robot de madera. Frustración total."},
		{"titulo": "Ruido Vecinal", "desc": "Tus vecinos tenían fiesta y no lograste concentrarte en el guion."},
		{"titulo": "Garganta Seca", "desc": "Te dolió la garganta a los 10 minutos y tuviste que parar a tomar té."},
		{"titulo": "Crisis Existencial", "desc": "Pasaste todo el ensayo dudando de si elegiste la carrera correcta."},
		{"titulo": "Sobreactuación Mágica", "desc": "Te grabaste en video, lo viste y diste tanto 'cringe' que borraste el archivo."},
		{"titulo": "Dilema del Acento", "desc": "Intentaste hacer un acento británico pero terminaste sonando ruso."},
		{"titulo": "Bucle Mental", "desc": "Te trabaste en la misma frase quince veces seguidas. Tu cerebro se apagó."},
		{"titulo": "Siesta Accidental", "desc": "Te acostaste en la cama 'solo para leer el guion' y despertaste 4 horas después."},
		{"titulo": "Ataque de Hambre", "desc": "Pasaste más tiempo yendo al refrigerador que leyendo tus líneas."}
	],
	# --- ENSAYOS DE CASTING (ÉXITOS) ---
	"ensayo_cast_exito": [
		{"titulo": "Marcaje Perfecto", "desc": "Te paraste exactamente en tu marca de luz sin mirar al suelo. El director sonrió."},
		{"titulo": "Química Increíble", "desc": "Tuviste una conexión brutal con tu compañero de escena durante la lectura."},
		{"titulo": "Propuesta Aceptada", "desc": "Le sugeriste un movimiento al director y le encantó la idea."},
		{"titulo": "Director Complacido", "desc": "El director dijo: '¡Exactamente eso es lo que busco!' frente a todos."},
		{"titulo": "Salvando al Prota", "desc": "El protagonista olvidó su línea y tú lo cubriste improvisando sutilmente."},
		{"titulo": "Lágrimas Reales", "desc": "Hiciste llorar a la maquillista durante la lectura de mesa."},
		{"titulo": "Comedia Física", "desc": "Ejecutaste el tropiezo cómico a la perfección sin lastimarte."},
		{"titulo": "Voz Proyectada", "desc": "Llenaste todo el teatro con tu voz sin necesidad de micrófono."}
	],
	# --- ENSAYOS DE CASTING (FRACASOS) ---
	"ensayo_cast_fallo": [
		{"titulo": "Choque Físico", "desc": "Caminaste hacia la izquierda cuando era a la derecha y chocaste con un mueble."},
		{"titulo": "Lectura Plana", "desc": "El director te pidió que le pusieras 'más ganitas'. Qué vergüenza."},
		{"titulo": "Ataque de Risa", "desc": "Te dio un ataque de risa nerviosa en la escena más triste de la obra."},
		{"titulo": "El Clásico Olvido", "desc": "Dijiste el nombre del actor en lugar del nombre del personaje."},
		{"titulo": "Marca Perdida", "desc": "Quedaste totalmente a oscuras porque no encontraste tu foco de luz."},
		{"titulo": "Vestuario Incómodo", "desc": "Te tropezaste con la capa de tu vestuario de época en pleno monólogo."},
		{"titulo": "Micrófono Abierto", "desc": "Murmuraste una queja y todo el teatro te escuchó por los altavoces."},
		{"titulo": "Tensión en el Set", "desc": "Tu compañero de escena amaneció de mal humor y no te dio réplica."}
	],
	# --- EL GRAN DÍA / FUNCIÓN (ÉXITOS) ---
	"grabacion_exito": [
		{"titulo": "🎬 ¡Corte, Queda!", "desc": "El director gritó emocionado a la primera toma. Eres un prodigio."},
		{"titulo": "Magia en el Set", "desc": "Improvisaste un pequeño gesto y a todo el equipo técnico le encantó."},
		{"titulo": "Roba Escenas", "desc": "Tus compañeros de escena se quedaron sin palabras ante tu monólogo."},
		{"titulo": "Standing Ovation", "desc": "El público rompió en aplausos sinceros al terminar tu escena clave."},
		{"titulo": "Salvada Maestra", "desc": "Alguien tiró utilería, pero tú lo integraste a la escena como un genio."},
		{"titulo": "One-Take Wonder", "desc": "Hiciste una escena de 5 minutos sin un solo corte. Épico."},
		{"titulo": "Energía Pura", "desc": "Le diste tanta intensidad a la toma que hasta los camarógrafos contuvieron el aliento."},
		{"titulo": "Meme Potencial", "desc": "Hiciste una expresión tan icónica que el equipo de marketing dice que se hará viral."},
		{"titulo": "El Rescate", "desc": "Empezó a llover de la nada y usaste la lluvia para darle más drama a tu actuación."},
		{"titulo": "Piel de Gallina", "desc": "Pronunciaste la última línea con tanto peso que se sintió magia en el aire."}
	],
	# --- EL GRAN DÍA / FUNCIÓN (FRACASOS) ---
	"grabacion_fallo": [
		{"titulo": "❌ Mirada a Cámara", "desc": "Miraste directo al lente en medio del drama. Error de novato total."},
		{"titulo": "❌ Blanco Mental", "desc": "Olvidaste la frase clave y el silencio incómodo duró una eternidad."},
		{"titulo": "❌ Fuera de Foco", "desc": "Te saliste de tu marca y el director de fotografía te dio un regaño monumental."},
		{"titulo": "❌ Sobre-actuación", "desc": "Gritaste la línea como si fuera telenovela barata. El director suspiró."},
		{"titulo": "❌ Tropiezo Real", "desc": "Te tropezaste con un cable y arruinaste una toma carísima."},
		{"titulo": "❌ Ataque de Tos", "desc": "Te ahogaste con tu propia saliva a mitad del monólogo clímax."},
		{"titulo": "❌ Boom en la Cabeza", "desc": "El microfonista te golpeó con el 'boom' porque improvisaste un salto."},
		{"titulo": "❌ Vestuario Roto", "desc": "Hiciste un movimiento brusco y se escuchó cómo se rompía tu pantalón en escena."},
		{"titulo": "❌ Celular Sonando", "desc": "Olvidaste apagar tu celular y sonó en medio del set. Te querían matar."},
		{"titulo": "❌ Sombra Intrusiva", "desc": "Tapaste la luz del protagonista durante 3 minutos. Tuvieron que repetir todo."}
	],
	# --- TIENDA (LIBROS PARODIA) ---
	"compra_libro": [
		{"titulo": "📚 'El Actor se Prepara... un Sándwich'", "desc": "Parodia de Stanislavski. Aprendiste a usar tu 'memoria emotiva' recordando cuando se te cayó tu helado."},
		{"titulo": "📚 'Sobre la Actuación y el Desempleo'", "desc": "Inspirado en Sanford Meisner. Ahora sabes escuchar a tu compañero... y a tus acreedores."},
		{"titulo": "📚 'Uta Madre, Olvidé mi Línea'", "desc": "Un clásico moderno. Técnicas avanzadas de improvisación desesperada en vivo."},
		{"titulo": "📚 'El Camino del Artista Pobre'", "desc": "Un libro de autoayuda que te enseñó a romantizar el comer atún de lata todos los días."},
		{"titulo": "📚 'Shakespeare para Ansiosos'", "desc": "Descubriste que Hamlet también tenía crisis existenciales a sus veintitantos."},
		{"titulo": "📚 'Llorar en 3 Segundos'", "desc": "Técnica infalible que consiste en pensar en tu estado de cuenta bancario."},
		{"titulo": "📚 'Cómo Sobrevivir a Directores Locos'", "desc": "Regla número 1: Siempre asiente y di 'es una propuesta muy interesante'."},
		{"titulo": "📚 'El Método: No Bañarse'", "desc": "Biografía de un actor famoso que arruinó su matrimonio por 'no salir de personaje'."}
	],
	# --- TIENDA (CONSUMIBLES DE CAFETERÍA) ---
	"compra_cafe": [
		{"titulo": "☕ Frapuccino 'StarBugs'", "desc": "Lleno de azúcar, cafeína y arrepentimiento financiero. ¡A ensayar!"},
		{"titulo": "☕ Expreso Doble Ansiedad", "desc": "Te tiemblan las manos, pero sientes que puedes memorizar la Biblia entera."},
		{"titulo": "☕ Café de la Esquina", "desc": "Sabe a tierra, pero despertó hasta la última de tus neuronas dormidas."},
		{"titulo": "☕ Bebida Energética 'Toro Rojo'", "desc": "Sientes que tienes alas, o taquicardia. Una de las dos."},
		{"titulo": "☕ Matcha Sobrevalorado", "desc": "Sabe a pasto licuado, pero te hizo sentir muy 'aesthetic' y motivado."},
		{"titulo": "☕ Café Negro Americano", "desc": "El combustible oficial de los guionistas y actores con el corazón roto."},
		{"titulo": "☕ Té de Manzanilla con Miel", "desc": "Técnicamente no te da energía, pero suavizó tu garganta como seda."}
	],
	# --- SIMGRAM (INICIOS - MENOS DE 15 SEGUIDORES) ---
	"redes_inicio_normal": [
		{"titulo": "Apoyo Familiar", "desc": "Tu mamá le dio me gusta y lo compartió en su grupo de WhatsApp. Sus amigas te siguieron."},
		{"titulo": "Comentario de la Tía", "desc": "Tu tía te comentó 'Qué guapo mi sobrino, saludos a tu mami'. Sumaste un par de seguidores despistados."},
		{"titulo": "Amigo de la prepa", "desc": "Un viejo compañero de la escuela vio tu video y te siguió por compromiso."}
	],
	"redes_inicio_fracaso": [
		{"titulo": "Solo Grillos", "desc": "Subiste el video y literalmente nadie lo vio. Ni tu mamá. Cero vistas."},
		{"titulo": "Comentario Vergonzoso", "desc": "Tu mamá comentó: 'Mijo, ¿ya comiste? Te ves muy flaco'. Te dio tanta pena que borraste el reel."},
		{"titulo": "El Algoritmo te Ignora", "desc": "Usaste 30 hashtags diferentes (#Actor #Arte #Hollywood) y aún así, tuviste 1 vista."}
	],

	# --- SIMGRAM (REDES SOCIALES ESTÁNDAR) ---
	# --- SIMGRAM (REDES SOCIALES) ---
	"redes_normal": [
		{"titulo": "Reel Estético", "desc": "Subiste tu rutina de 'Skin Care'. A la gente le gustó tu cutis."},
		{"titulo": "Trend de Baile", "desc": "Hiciste el baile de moda. Te viste un poco tieso, pero sumaste números."},
		{"titulo": "Story Time", "desc": "Contaste una anécdota actuando varios personajes. Buenos comentarios."}
	],
	"redes_viral": [
		{"titulo": "¡VIRAL! Audio Tendencia", "desc": "Usaste un audio de comedia y el algoritmo te amó. ¡Tus notificaciones explotaron!"},
		{"titulo": "¡VIRAL! Meme Actoral", "desc": "Te burlaste de los directores intensos y todos los actores de la ciudad lo compartieron."},
		{"titulo": "¡VIRAL! Dúo Perfecto", "desc": "Reaccionaste a una escena de Hollywood y un famoso le dio Like."}
	],
	"redes_fracaso": [
		{"titulo": "Cringe Total", "desc": "Subiste un monólogo llorando que dio más risa que pena. Te dejaron de seguir algunos."},
		{"titulo": "Haters", "desc": "Un hater comentó 'actúas como un tronco' y te arruinó la energía del día."},
		{"titulo": "Shadowban", "desc": "SimGram ocultó tu Reel porque usaste música con copyright. Esfuerzo a la basura."}
	],
# --- NETWORKING (MIXERS) CONTEXTUALES ---
	"networking_inicio_exito": [
		{"titulo": "Colado con Suerte", "desc": "Entraste a la zona VIP por error y le caíste bien a un asistente de dirección."},
		{"titulo": "Charla de Pasillo", "desc": "Platicaste horas con un sonidista. Te prometió recomendarte para comerciales."}
	],
	"networking_inicio_fracaso": [
		{"titulo": "Totalmente Ignorado", "desc": "Nadie te volteó a ver. Parecías un fantasma comiendo canapés gratis."},
		{"titulo": "Humillación", "desc": "Le diste tu tarjeta a un productor y la tiró a la basura frente a ti."}
	],
	"networking_fama_exito": [
		{"titulo": "El Centro de Atención", "desc": "Todos querían tomarse fotos contigo. Un productor se acercó a ofrecerte un papel."},
		{"titulo": "Trato VIP", "desc": "Bebidas gratis toda la noche y charlas con la élite de Hollywood."}
	],
	"networking_fama_fracaso": [
		{"titulo": "Acoso de Fans", "desc": "Te pidieron tantas fotos que no pudiste hablar de negocios con nadie."},
		{"titulo": "Escándalo Menor", "desc": "Un paparazzi te tomó una foto fea comiendo y te arruinó la noche."}
	],
	
}

func obtener_texto(categoria: String) -> Dictionary:
	return textos[categoria].pick_random()


# --- GENERADOR DE NOMBRES Y USUARIOS (AQUÍ ESTÁ LA MAGIA QUE FALTABA) ---
var nombres_npc = ["Juan", "María", "Carlos", "Ana", "Luis", "Elena", "Pedro", "Sofía", "Diego", "Laura", "Mónica", "Raúl"]
var apellidos_npc = ["Pérez", "Gómez", "López", "Díaz", "Martínez", "García", "Ruiz", "Hernández"]
var prefijos_user = ["user_", "teatro_fan_", "actor_wannabe_", "cine_", "soyel_", "anon_", "fan_"]
# ==========================================
# 🎬 GENERADOR DE OBRAS Y PAPELES ÚNICOS (GOTY)
# ==========================================
var sustantivos_obra = ["Gato", "Reloj", "Silencio", "Espejo", "Tren", "Jardín", "Abismo"]
var adjetivos_obra = ["Ciego", "Roto", "Dorado", "Olvidado", "Rojo", "Infinito", "Lúgubre"]
var marcas_comercial = ["Jabón Zote", "Cereales Flakes", "Seguros Vida", "Autos Sedan", "Bebida Toro Rojo", "Muebles Troncoso"]
var nombres_ninos = ["Pablito", "Santi", "Maria", "Leo", "Sofía"]

func generar_titulo_produccion(base_id: String) -> String:
	if "obra" in base_id or "teatro" in base_id:
		return "«El " + sustantivos_obra.pick_random() + " " + adjetivos_obra.pick_random() + "»"
	elif "comercial" in base_id:
		return "Comercial de " + marcas_comercial.pick_random()
	elif "doblaje" in base_id or "juego" in base_id:
		return "Juego: 'Ciber-Guerra 2077'"
	elif "serie" in base_id or "pelicula" in base_id or "corto" in base_id:
		return "Cine: 'El Retorno del " + sustantivos_obra.pick_random() + "'"
	elif "animador" in base_id:
		return "Fiesta Infantil de " + nombres_ninos.pick_random()
	elif "locutor" in base_id:
		return "Campaña de Radio: " + marcas_comercial.pick_random()
	elif "standup" in base_id:
		return "Especial: 'Riendo en el " + sustantivos_obra.pick_random() + "'"
	return "Proyecto Clasificado"

func generar_papel_produccion(base_id: String) -> String:
	if "extra" in base_id:
		return ["Zombi 3", "Transeúnte Asustado", "Cadáver 1", "Cliente de Cafetería", "Prófugo de Ácido Fólico"].pick_random()
	elif "animador" in base_id:
		return ["Perrito Bailarín", "Superhéroe Pirata", "Payaso Triste", "Princesa Mágica"].pick_random()
	elif "locutor" in base_id or "comercial" in base_id:
		return ["Voz en Off Institucional", "Consumidor Feliz", "Voz Joven y Dinámica"].pick_random()
	elif "teatro_nacional" in base_id:
		return ["Protagonista Dramático", "Antagonista Principal"].pick_random()
	elif "obra" in base_id or "teatro" in base_id or "corto" in base_id:
		return ["Mejor Amigo(a)", "Interés Amoroso", "Villano Incomprendido", "Personaje de Alivio Cómico"].pick_random()
	elif "standup" in base_id:
		return "Comediante Principal"
	elif "doblaje" in base_id:
		return ["Soldado Genérico", "Alienígena", "Robot Asistente"].pick_random()
	return "Actor de Reparto"
func generar_usuario_aleatorio() -> String:
	var azar = randi_range(1, 3)
	if azar == 1:
		return "@" + prefijos_user.pick_random() + str(randi_range(100, 9999))
	elif azar == 2:
		return "@" + nombres_npc.pick_random().to_lower() + "_" + apellidos_npc.pick_random().to_lower()
	else:
		return "@" + nombres_npc.pick_random().to_lower() + str(randi_range(10, 99))

func generar_contacto_nuevo(nivel_jugador: int, carisma_jugador: int) -> Dictionary:
	var roles = ["Director", "Productor", "Maestro de Actuación", "Cazatalentos", "Guionista"]
	var rol_elegido = roles.pick_random()
	
	# El nivel del contacto depende de qué tan famoso/experimentado seas
	var categoria = "Local" # Nivel 1
	var influencia = randi_range(1, 10)
	
	if nivel_jugador >= 3 or carisma_jugador >= 3:
		if randi_range(1, 100) > 50: 
			categoria = "Indie" # Nivel 2
			influencia = randi_range(11, 50)
			
	if nivel_jugador >= 6 or carisma_jugador >= 5:
		if randi_range(1, 100) > 70:
			categoria = "Profesional" # Nivel 3
			influencia = randi_range(51, 100)
			
	return {
		"nombre": nombres_npc.pick_random() + " " + apellidos_npc.pick_random(),
		"rol": rol_elegido,
		"categoria": categoria,
		"influencia": influencia, # Poder del contacto para futuros proyectos
		"afinidad": 50 # Relación inicial (de 0 a 100)
	}
