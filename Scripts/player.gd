extends CharacterBody2D


## Movement Speeds
const WALK_SPEED: float = 100.0
const SPRINT_SPEED: float = 180.0

# Health
var health: int = 3

# Node Refs
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var footstep_sfx: AudioStreamPlayer2D = $FootstepSFX
@onready var shoot_cooldown: Timer = $ShootCooldown

# Bullet Scene - To be implemented
var bullet_scene: PackedScene =  null

# Direction Tracking 
var last_direction: Vector2 = Vector2.DOWN

func _ready() -> void:
	if ResourceLoader.exists("res://Scenes/bullet.tscn"):		## MAKE SURE SCENE PATH MATCHES 
		bullet_scene = load("res://Scenes/bullet.tscn")
	animated_sprite.play("idle")
	

func _physics_process(delta: float) -> void:
	var input_dir: Vector2 = Vector2.ZERO
	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir.y = Input.get_axis("move_up", "move_down")
	
	input_dir = input_dir.normalized()
	
	var speed: float = SPRINT_SPEED if Input.is_action_pressed("sprint") else WALK_SPEED
	
	velocity = input_dir * speed
	move_and_slide()
	
	if input_dir != Vector2.ZERO:
		last_direction = input_dir
		if input_dir.y < 0:
			animated_sprite.play("run_up")
		else:
			animated_sprite.play("run_down")
			
		animated_sprite.flip_h = input_dir.x < 0
		
		if not footstep_sfx:
			footstep_sfx.play()
	else:
		animated_sprite.play("idle")
		footstep_sfx.stop()
		
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") and shoot_cooldown.is_stopped():
		_shoot()
		shoot_cooldown.start()
		
		
func _shoot() -> void:
	if bullet_scene == null:
		return
	var bullet: Node = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.direction = last_direction.normalized()
	get_tree().current_scene.add_child(bullet)
	
	
	
	
	
	
	
	
