extends KinematicBody2D

var scroll_speed = 150
var speed_up = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_speed += speed_up * delta
	global_position.y	+= scroll_speed * delta
	if (global_position.y > 740):
		global_position.y -= 1480
