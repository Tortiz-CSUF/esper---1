extends CanvasLayer

@onready var heart1: TextureRect = $HealthContainer/Heart1
@onready var heart2: TextureRect = $HealthContainer/Heart2
@onready var heart3: TextureRect = $HealthContainer/Heart3

var full_heart: Texture2D = preload("res://Assets/hud/heart.png")
var empty_heart: Texture2D = preload("res://Assets/hud/empty_heart.png")

## Pause Menu Refs
@onready var pause_overlay: ColorRect = $PauseOverlay
@onready var resume_button: Button = $PauseOverlay/PauseMenu/ResumeButton
@onready var pause_settings_button: Button = $PauseOverlay/PauseMenu/PauseSettingsButton
@onready var main_menu_button: Button = $PauseOverlay/PauseMenu/MainMenuButton

## Pause Settings Refs
@onready var pause_settings_panel: VBoxContainer = $SettingsPanel
@onready var pause_music_slider: HSlider = $SettingsPanel/MusicSlider
@onready var pause_sfx_slider: HSlider = $SettingsPanel/SFXSlider
@onready var pause_settings_back_button: Button = $SettingsPanel/SettingsBackButton



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
