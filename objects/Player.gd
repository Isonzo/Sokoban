extends KinematicBody2D

var tile_size = 8

onready var ray = $RayCast2D

var inputs = { 
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
	"ui_right": Vector2.RIGHT
}

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir) and !get_parent().game_end:
			if move(dir):
				get_parent().moves += 1
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()


func move(dir):
	var vector_pos = inputs[dir] * tile_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
		return true
	var collider = ray.get_collider()
	if collider.is_in_group("box"):
		if collider.move(dir):
			position += vector_pos
			return true
	return false

func celebrate():
	$Sprite.play("celebrate")
	
