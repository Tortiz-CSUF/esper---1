extends Area2D

var direction: Vector2 = Vector2.ZERO
const SPEED: float = 250.0

@onready var life_timer: Timer = $LifeTimer



func _ready() -> void:
	life_timer.timeout.connect(_on_life_timer_timeout)


func _process(delta: float) -> void:
	position += direction * SPEED * delta


func _on_life_timer_timeout() -> void:
	queue_free()


func set_direction(dir: Vector2) -> void:
	direction = dir
	rotation = dir.angle() + PI / 2.0
