extends Node2D

export var window_height : int
onready var screen_size = get_viewport().size
onready var Pipe = preload("res://Pipe.tscn")

# Called when the node enters the scene tree for the first time.
func make_pipe(window_center: float,flipped:bool):
	var pipe : StaticBody2D = Pipe.instance()
	if flipped:
		pipe.rotate(deg2rad(180))
	var coeff = 1 if not flipped else -1
	pipe.position.y = window_center + (window_height)*coeff
	return pipe
	
func _ready():
	randomize()
	var window_center = screen_size.y * clamp(randf(), 0.2, 0.8)
	var upperPipe = make_pipe(window_center, false)
	add_child(upperPipe)
	var lowerPipe = make_pipe(window_center, true)
	add_child(lowerPipe)
