extends Area2D


export var horizontal_speed : int
export var jump_speed : int
export var fall_speed : int
export var rotation_modifier : int

onready var velocity = Vector2(horizontal_speed, 0)

signal hit


func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_speed
	velocity.y += fall_speed * delta
	position += velocity
	position.y = clamp(position.y, 0, get_viewport().size.y)
	$Sprite.rotation_degrees = clamp(velocity.y * rotation_modifier, -90, 90)


func _on_Player_body_entered(body):
	emit_signal("hit")
	hide()
	$CollisionShape2D.set_deferred("disabled",true)
