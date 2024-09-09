extends CharacterBody2D

var SCREENHEIGHT = 760
var scroll_speed = Game_Vars.scroll_speed
var speed_up = 2
var end_game = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# scroll_speed += speed_up * delta
	if end_game != true:
		scroll_speed = Game_Vars.scroll_speed
		global_position.y	+= scroll_speed * delta
		if (global_position.y > SCREENHEIGHT):
			global_position.y -= (SCREENHEIGHT * 2)

func stop():
	end_game = true

func start():
	end_game = false
