extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "Don't hit the hedges!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = "Score: " + str(Game_Vars.score)

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _input(event):
	if event is InputEventKey:
		if event.pressed and $StartButton.is_visible_in_tree():
			_on_start_button_pressed()
