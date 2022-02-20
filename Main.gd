extends Node2D

var game_end = false
var moves = 0
export(int) var level = 0

func _ready():
	$Level.text = "Level " + str(level)

func _process(_delta):
	$Moves.text = "Moves: " + str(moves)
	var spots = $Spots.get_child_count()
	for i in $Spots.get_children():
		if i.occupied:
			spots -= 1
	
	if spots == 0 and !game_end:
		game_end = true
		yield(get_tree().create_timer(3.0), "timeout")
		get_tree().reload_current_scene()
