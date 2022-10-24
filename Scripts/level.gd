extends Node2D

const GLOBAL_VAR: Resource = preload("res://global_var.tres")

export var speed: int

onready var food = preload("res://Scenes/food.tscn")

var old_score: int = 1


func _ready():
	GLOBAL_VAR.speed = speed
	score.player_score = 0
	spawn_food()


func _process(_delta):
	difficulty_check()


func difficulty_check():
	if score.player_score - old_score >= 10:
		old_score = score.player_score
		GLOBAL_VAR.speed += GLOBAL_VAR.speed * 0.1


func spawn_food():
	var instance = food.instance()
	var x = rand_range(1, 11)
	var y = rand_range(1, 11)
	instance.position = $grid.map_to_world(Vector2(x, y)) + Vector2(8, 8)
	instance.connect("food_eaten", self, "is_eaten")
	call_deferred("add_child", instance)


func is_eaten():
	spawn_food()
	get_node("snake").food_eaten()


func _on_snake_game_over():
	return get_tree().reload_current_scene()
