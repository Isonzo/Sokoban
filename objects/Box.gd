extends KinematicBody2D

var tile_size = 8

onready var ray = $RayCast2D

var inputs = { 
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_left": Vector2.LEFT,
	"ui_right": Vector2.RIGHT
}


func move(dir):
	var vector_pos = inputs[dir] * tile_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
		return true
	return false
