extends Control

@onready var begin_button: Button  = $MenuContainer/LeftPanel/BeginButton
@onready var settings_button: Button = $MenuContainer/LeftPanel/SettingsButton
@onready var quit_button: Button = $MenuContainer/LeftPanel/QuitButton
@onready var selection_indicator: ColorRect = $MenuContainer/SelectionIndicator
@onready var click_sfx: AudioStreamPlayer = $MenuContainer/ClickSFX


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
