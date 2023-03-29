extends CharacterBody2D

var scroll_speed = Game_Vars.scroll_speed
var move_vector = Vector2(0, +Game_Vars.scroll_speed)
var screen_height = 740
var hedge_height = 72
var rnd = RandomNumberGenerator.new()
# var speed_up = 2
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", Callable(self, "on_collided"))	
	$point.connect("area_entered", Callable(self, "on_pass"))
	rnd.randomize()
	set_hedge_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# scroll_speed += speed_up * delta
	#scroll_speed = Game_Vars.scroll_speed
	#move_and_slide(move_vector)
	global_position.y	+= Game_Vars.scroll_speed * delta + 0.1
	if (global_position.y > (screen_height + hedge_height) / 2):
		global_position.y -= (screen_height + hedge_height)
		set_hedge_position()
		
func set_hedge_position():
	var min_pos = -100
	var max_pos = 100
	global_position.x = rnd.randi_range(min_pos, max_pos)	

func on_collided(area_2d):
	print("Collided with hedge")
	
func on_pass(area_2d):
	Game_Vars.score += 1
	print("Score: ", Game_Vars.score)

