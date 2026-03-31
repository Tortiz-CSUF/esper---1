extends Area2D

var  target_room_index: int = 0



func _ready() -> void:
	body_entered.connect(_on_body_entered)



func _on_body_entered(body: Node2D) -> void: 
	if body.name == "Player":
		var game: Node = get_tree().current_scene
		if game.has_method("go_to_room"):
			game.call("go_to_room", target_room_index)
		
