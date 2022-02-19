extends Node2D

var game_end = false

func _process(_delta):
	var spots = $Spots.get_child_count()
	for i in $Spots.get_children():
		if i.occupied:
			spots -= 1
	
	if spots == 0 and !game_end:
		game_end = true
		yield(get_tree().create_timer(3.0), "timeout")
		get_tree().reload_current_scene()
