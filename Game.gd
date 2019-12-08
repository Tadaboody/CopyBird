extends Node2D

onready var Wall = preload("res://Wall.tscn")
export var wallSpeed : float
export var window_height : float
# Called when the node enters the scene tree for the first time.
func _ready():
	_pipe_spawn()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Connected to PipeSpawnTimer
func _pipe_spawn():
	var wall = Wall.instance()
	wall.position.x = get_viewport_rect().size.x
	wall.speed = -wallSpeed
	wall.window_height = window_height
	add_child(wall)
