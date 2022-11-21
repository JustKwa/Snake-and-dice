class_name SnakeBody extends Area2D

const GLOBAL_VAR: Resource = preload("res://global_var.tres")
const GRID_SIZE = global_var.GRID_SIZE

var direction
var percent_to_tile = 0.0

onready var current_pos = self.position
onready var animation_player = get_node("AnimationPlayer")


func _ready():
	pass


func _physics_process(delta):
	_move(delta)


func _move(delta):
	# use to slow down the bullet movement
	var speed_dampener = 0.8

	percent_to_tile += (GLOBAL_VAR.speed * speed_dampener) * delta

	if percent_to_tile >= 1.0:
		position = current_pos + (direction * GRID_SIZE)
		current_pos = self.position
		percent_to_tile = 0.0

	else:
		position = current_pos + (GRID_SIZE * percent_to_tile * direction)