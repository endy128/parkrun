extends Node


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	

func update_score(score):
	get_node("HUD").update_score(score)
	
func game_over():
	get_node("hedges/hedge").stop()
	get_node("hedges/hedge2").stop()
	get_node("floors/floor").stop()
	get_node("floors/floor2").stop()
	$dog.stop()
	$HUD.show_message("Game Over")
	$HUD.show_game_over()

	
func new_game():
	Game_Vars.score = 0
	$HUD.show_message("")
	get_node('/root/main').update_score(Game_Vars.score)
	$dog.start($dog_start_pos.position)
	get_node("hedges/hedge").start($hedge_start_pos.position)
	get_node("hedges/hedge2").start($hedge2_start_pos.position)
	get_node("floors/floor").start()
	get_node("floors/floor2").start()


