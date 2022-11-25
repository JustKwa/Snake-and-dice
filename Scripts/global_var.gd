class_name global_var
extends Resource

const GRID_SIZE = 16

var player_score: int = 0 setget _set_score
var high_score: int = 0 setget _set_high_score
var game_over: bool = false setget _set_game_over
var speed: float

signal game_over
signal score_gained

func _set_score(value):
    player_score = value
    emit_signal('score_gained')

func _set_game_over(value):
    if !value: return
    else:
        emit_signal('game_over')


func _set_high_score(value):
    if value < high_score: return
    else:
        high_score = value