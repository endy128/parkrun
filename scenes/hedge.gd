extends CharacterBody2D

var scroll_speed = Game_Vars.scroll_speed
var move_vector = Vector2(0, +Game_Vars.scroll_speed)
var screen_height = 740
var hedge_height = 72
var rnd = RandomNumberGenerator.new()
# var speed_up = 2
var score = 0
var hedge_offset = 110
var paralax_speed = 0.1
var end_game = true


# Called when the node enters the scene tree for the first time.
func _ready():
	rnd.randomize()
	set_hedge_position()
	$Area2D.connect("area_entered", Callable(self, "on_collided"))	
	$point.connect("area_entered", Callable(self, "on_pass"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# scroll_speed += speed_up * delta
	#scroll_speed = Game_Vars.scroll_speed
	#move_and_slide(move_vector)
	if end_game != true:
		global_position.y	+= Game_Vars.scroll_speed * delta + paralax_speed
		if (global_position.y > (screen_height + hedge_height) / float(2)):
			global_position.y -= (screen_height + hedge_height)
			set_hedge_position()
		
func set_hedge_position():
	var min_pos = -hedge_offset
	var max_pos = hedge_offset
	global_position.x = rnd.randi_range(min_pos, max_pos)	

func on_collided(_area2d):
	print("Collided with hedge")
	get_node('/root/main').game_over()

func on_pass(_pass):
	Game_Vars.score += 1
	get_node('/root/main').update_score(Game_Vars.score)
	print("Score: ", Game_Vars.score)

func stop():
	end_game = true
	
func start(pos):
	end_game = false
	position = pos
