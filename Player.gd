extends Area2D

export var horizontal_speed : int
export var jump_speed : int
export var fall_speed : int
export var rotation_modifier : int
export var max_speed : int

onready var speed = Vector2(horizontal_speed, 0)

signal hit

func update_position(speed):
	position += speed
	position.y = clamp(position.y, 0, get_viewport().size.y)
	$Sprite.rotation_degrees = clamp(speed.y * rotation_modifier, -90, 90)

func update_speed(delta):
	if Input.is_action_just_pressed("jump"):
		speed.y -= jump_speed
	speed.y += fall_speed * delta
	speed.y = clamp(speed.y, -max_speed, max_speed)
	return speed

func update_animation(speed):
	if speed.y > 0:
		$Sprite.play("fold")
	else:
		$Sprite.play("flap")
		
func _physics_process(delta):
	update_speed(delta)
	update_animation(speed)
	update_position(speed)

func _on_Player_body_entered(body:Node2D):
	emit_signal("hit")
	set_physics_process(false)
	$CollisionShape2D.set_deferred("disabled", true)

