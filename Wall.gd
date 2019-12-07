extends Node2D

export var window_height : int

onready var screen_size = get_viewport().size

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var window_center = int(screen_size.y * randf())
	$UpperPipe.position.y = window_center + window_height
	$LowerPipe.position.y = window_center - window_height

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
