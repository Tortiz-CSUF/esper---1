extends CharacterBody2D


const MOVE_SPEED: float = 90.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	animated_sprite.play("idle")
	
	
func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Vector2.ZERO
	input_dir.x = Input.get_axis("ghost_left", "ghost_right")
	input_dir.y = Input.get_axis("ghost_up", "ghost_down")
	
	input_dir = input_dir.normalized()
	
	velocity = input_dir * MOVE_SPEED
	move_and_slide()
	
	if input_dir.x != 0:
		animated_sprite.flip_h = input_dir.x < 0
		
		
