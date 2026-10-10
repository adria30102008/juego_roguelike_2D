#Personaje
extends CharacterBody2D

@export var animacion: AnimatedSprite2D

var en_zona := false 
var _velocidad: float = 100
var _velocidad_de_salto: float = -200
var _segundo_salto: float = -100
var velocidad_zona := 900

func _physics_process(delta):
	
	
	
	#Gravedad
	velocity += get_gravity() * delta
	
	#Movimiento
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = _velocidad_de_salto
	elif Input.is_action_just_pressed("saltar") and not is_on_floor():
		velocity.y = _segundo_salto
		
	if Input.is_action_pressed("derecha"):
		velocity.x = _velocidad
		animacion.flip_h = false
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -_velocidad
		animacion.flip_h = true
	else:
		velocity.x = 0
	move_and_slide()
	
	#personaje agua
	
