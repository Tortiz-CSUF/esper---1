extends Area2D

var direciton: Vector2 = Vector2.ZERO
const SPEED: float = 250.0

@onready var life_timer: Timer = $LifeTimer



func _ready() -> void:
	life_timer.timeout.connect(_on_life_timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direciton * SPEED * delta


func _on_life_timer_timeout() -> void:
	queue_free()
