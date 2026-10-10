#Personaje
extends CharacterBody2D

@export var animacion: AnimatedSprite2D
@export var area_de_daño: Area2D

var _velocidad: float = 125
var _velocidad_de_salto: float = -250


func ready():
	area_de_daño.area_entered.connect(_on_area_de_daño_body_entered)



func _physics_process(delta):
	
	
	#Gravedad
	velocity += get_gravity() * delta
	
	#Movimiento
	if Input.is_action_just_pressed("saltar") and is_on_floor():
		velocity.y = _velocidad_de_salto
		
	if Input.is_action_pressed("derecha"):
		velocity.x = _velocidad
		animacion.flip_h = false
		animacion.play("movement")
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -_velocidad
		animacion.flip_h = true
		animacion.play("movement")
	else:
		velocity.x = 0
		animacion.play("idle")
	move_and_slide()
	
func _on_area_de_daño_body_entered(area):
	pass
