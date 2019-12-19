extends Node2D

onready var Wall = preload("res://Wall.tscn")
onready var score = 0

export var wallSpeed : float
export var window_height : float


func _ready():
	_pipe_spawn()

# Connected to PipeSpawnTimer
func _pipe_spawn():
	var wall = Wall.instance()
	wall.position.x = get_viewport_rect().size.x
	wall.speed = -wallSpeed
	wall.window_height = rand_range(window_height / 2, window_height * 1.5)
	$Walls.add_child(wall)

func _on_Player_hit():
	for wall in $Walls.get_children():
		wall.stop()
	$PipeSpawnTimer.stop()


func _on_Player_score():
	score += 1
	$Score.text = str(score)
