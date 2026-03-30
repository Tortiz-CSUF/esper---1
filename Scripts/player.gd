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
