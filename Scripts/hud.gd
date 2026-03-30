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

var is_paused: bool = false


func _ready() -> void:
	



func _process(delta: float) -> void:
	pass
	
	
	
func _pause_menu() -> void:
	is_paused = true
	pause_overlay.visible = true
	pause_settings_panel.visible = false
	get_tree().paused = true
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	
func _resume_game() -> void:
	is_paused = false
	pause_overlay.visible = false
	pause_settings_panel = false
	get_tree().paused = false
	

func update_health(current_health: int) -> void:
	var hearts: Array[TextureRect] = [heart1, heart2, heart3]
	for i in range (3):
		if i < current_health:
			hearts[i].texture = full_heart
		else:
			hearts[i].texture = empty_heart
			
			
func _on_resume_pressed() -> void: 
	_resume_game()
	

func _on_pause_settings() -> void:
	pause_overlay.visible = false
	pause_settings_panel.visible = true
	

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
	
## Pause Settings
func _on_music_volume_changed(value: float) -> void:
	var music_bus_index: int = AudioServer.get_bus_index("Music")
	if value > 0.0:
		AudioServer.set_bus_volume_db(music_bus_index, linear_to_db(value))
		AudioServer.set_bus_mute(music_bus_index, false)
	else:
		AudioServer.set_bus_mute(music_bus_index, true)	
	


func _on_sfx_volume_changed(value: float) -> void:
		var sfx_bus_index: int = AudioServer.get_bus_index("SFX")
		if value > 0.0:
			AudioServer.set_bus_volume_db(sfx_bus_index, linear_to_db(value))
			AudioServer.set_bus_mute(sfx_bus_index, false)
		else:
			AudioServer.set_bus_mute(sfx_bus_index, true)	
	
