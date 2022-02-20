extends Node2D

var game_end = false
var moves = 0
export(int) var level = 0
var next_level

func _ready():
	next_level = level + 1
	if next_level > get_number_of_levels():
		next_level = 1
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
		var next_level_path = "res://levels/level_%d.tscn" % next_level
		get_tree().change_scene(next_level_path)


func get_number_of_levels():
	var level_count = -1
	var dir = Directory.new()
	dir.open("res://levels/")
	dir.list_dir_begin(true)
	
	while true:
		var file = dir.get_next()
		if file == "":
			break
		level_count += 1
	dir.list_dir_end()
	return level_count
