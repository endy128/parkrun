extends CharacterBody2D

var gravity = 300
var move_vector = Vector2.ZERO 
var direction = 0
var move_strength = 30
var end_game = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(end_game != true):
		if(Input.is_action_pressed("left")):
			direction = -1
			move_vector.x += -move_strength 
		if(Input.is_action_pressed("right")):
			direction = 1
			move_vector.x += move_strength
		set_velocity(move_vector)
		move_and_slide()	
			
		if (global_position.x - 36 - gravity*delta > -180 && global_position.x + 36 + gravity*delta < 180):
			# give the steeting 'gravity' each way the player goes
			if (direction < 0):
				move_vector.x += -gravity*delta
			if (direction > 0):
				move_vector.x += gravity*delta
		else:
			move_vector.x = 0
		rotate_dog()

func rotate_dog():
	var clamped_turn = clamp(move_vector.x, -60, 60)
	if (direction < 0):
		rotation_degrees = clamped_turn / 10
	if (direction > 0):
		rotation_degrees = clamped_turn / 10
		
func stop():
	end_game = true
	move_vector = Vector2.ZERO 
	direction = 0
	
func start(pos):
	end_game = false
	position = pos
	rotation_degrees = 0
	move_vector = Vector2.ZERO 
	direction = 0
