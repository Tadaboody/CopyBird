extends Node2D

export var window_height : float
export var speed : float

onready var screen_size = get_viewport().size
onready var Pipe = preload("res://Pipe.tscn")
# Not that kind of pipe
func make_pipe(window_center: float, flipped:bool):
	var pipe : StaticBody2D = Pipe.instance()
	if flipped:
		pipe.rotate(deg2rad(180))
	var coeff = 1 if not flipped else -1
	pipe.position.y = window_center + (window_height)*coeff
	return pipe

func _ready():
	randomize()
	var window_center = lerp($WindowRoof.position.y, $WindowFloor.position.y, randf())
	var upperPipe = make_pipe(window_center, false)
	add_child(upperPipe)
	var lowerPipe = make_pipe(window_center, true)
	add_child(lowerPipe)

func _physics_process(delta):
	position.x += speed * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
