extends Control

@onready var begin_button: Button  = $MenuContainer/LeftPanel/BeginButton
@onready var settings_button: Button = $MenuContainer/LeftPanel/SettingsButton
@onready var quit_button: Button = $MenuContainer/LeftPanel/QuitButton
@onready var selection_indicator: ColorRect = $MenuContainer/SelectionIndicator
@onready var click_sfx: AudioStreamPlayer = $MenuContainer/ClickSFX

var menu_buttons: Array[Button] = []



func _ready() -> void:
	pass # Replace with function body.


func _on_button_hovered(btn: Button) -> void:
	selection_indicator.visible = true
	
	var btn_global_pos: Vector2 = btn.global_position
	var btn_size: Vector2 = btn.size
	selection_indicator.global_position = Vector2(
		btn_global_pos.x + (btn_size.x - selection_indicator.size.x) / 2.0,
		btn_global_pos.y + btn_size.y + 2.0
	)
	

func _on_button_unhovered() -> void:
	selection_indicator.visible = false	


func _on_begin_pressed() -> void:
	click_sfx.play()
	## map select placeholder
	

func _on_settings_pressed() -> void:
	click_sfx.play()
	## settings placholder
	
	
func _on_quit_pressed() -> void:
	click_sfx.play()
	await  get_tree().create_timer(0.15).timeout
	get_tree().quit()
	
	

	
	
	
	
	
