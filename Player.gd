extends KinematicBody2D


export var horizontal_speed : int
export var gravity :int
export var jump_speed : int
export var rotation_modifier : int
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = horizontal_speed

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		velocity.y -= jump_speed
	velocity.y += gravity * delta
	position += velocity
	$Sprite.rotation_degrees = velocity.y * rotation_modifier