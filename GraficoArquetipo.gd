extends Control

var radio_maximo = 80.0
var categorias = ["metodo", "fisico", "forma", "comercial", "instinto"]
var nombres = ["Método", "Físico", "Clásico", "Comercial", "Instinto"]
var valor_maximo = 50.0 # El tope para que el gráfico toque el borde (se puede subir después)

func _ready():
	# Si cambias el tamaño de la ventana, se redibuja
	item_rect_changed.connect(queue_redraw)

func actualizar_grafico():
	queue_redraw() # Esto le dice a Godot: "Vuelve a ejecutar _draw()"

func _draw():
	var centro = size / 2.0
	var angulo_separacion = TAU / 5.0 # Dividir el círculo en 5 partes (TAU es 2*PI)
	
	# 1. DIBUJAR LA "TELARAÑA" DE FONDO (Líneas guía grises)
	var color_red = Color(1.0, 1.0, 1.0, 0.15)
	
	# Dibujar anillos
	for anillo in range(1, 5):
		var radio_anillo = radio_maximo * (anillo / 4.0)
		var puntos_anillo = PackedVector2Array()
		for i in range(5):
			var angulo = i * angulo_separacion - (PI / 2.0)
			puntos_anillo.append(centro + Vector2(cos(angulo), sin(angulo)) * radio_anillo)
		puntos_anillo.append(puntos_anillo[0]) # Cerrar la figura
		draw_polyline(puntos_anillo, color_red, 1.0)
		
	# Dibujar ejes y textos
	for i in range(5):
		var angulo = i * angulo_separacion - (PI / 2.0)
		var dir = Vector2(cos(angulo), sin(angulo))
		var fin = centro + dir * radio_maximo
		draw_line(centro, fin, color_red, 1.0)
		
		# Dibujar el nombre de la estadística
		var pos_texto = centro + dir * (radio_maximo + 25.0)
		pos_texto.x -= 25 # Ajuste visual al centro aproximado
		draw_string(ThemeDB.fallback_font, pos_texto, nombres[i], HORIZONTAL_ALIGNMENT_CENTER, -1, 14, Color(0.8, 0.8, 0.8, 1.0))

	# 2. DIBUJAR EL POLÍGONO DE LOS STATS DEL JUGADOR
	var puntos_jugador = PackedVector2Array()
	
	for i in range(5):
		var angulo = i * angulo_separacion - (PI / 2.0)
		var clave = categorias[i]
		
		# Buscar el stat en GestorDatos (Si no lo encuentra, da 0)
		var valor_real = Datos.perfil_actor.get(clave, 0)
		var porcentaje = clamp(float(valor_real) / valor_maximo, 0.0, 1.0)
		
		var punto_stat = centro + Vector2(cos(angulo), sin(angulo)) * (radio_maximo * porcentaje)
		puntos_jugador.append(punto_stat)
		
	# Dibujar la figura final del jugador (Relleno y borde)
	if puntos_jugador.size() >= 3:
		var color_relleno = Color(0.2, 0.8, 1.0, 0.4) # Azul neón transparente
		var colores = PackedColorArray([color_relleno, color_relleno, color_relleno, color_relleno, color_relleno])
		
		draw_polygon(puntos_jugador, colores)
		
		# Borde brillante de la figura
		puntos_jugador.append(puntos_jugador[0]) # Cerrar línea
		draw_polyline(puntos_jugador, Color(0.2, 0.8, 1.0, 1.0), 2.0)
