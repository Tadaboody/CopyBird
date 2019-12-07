extends KinematicBody2D


export var horizontal_speed : int
export var gravity :int
export var jump_speed : int
export var rotation_modifier : int

onready var velocity = Vector2(horizontal_speed, 0)

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_speed
	velocity.y += gravity * delta
	position += velocity
	$Sprite.rotation_degrees = velocity.y * rotation_modifier