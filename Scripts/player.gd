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
	
	
	
	
	
	
	
	
	
	
