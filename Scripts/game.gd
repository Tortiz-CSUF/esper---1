extends Node2D

## Scene Refs
var room_scene: PackedScene = preload("res://Scenes/room.tscn")
var boss_room_scene: PackedScene = preload("res://Scenes/room_boss.tscn")
var door_scene: PackedScene = preload("res://Scenes/door.tscn")

## Node Refs
@onready var room_container: Node2D = $RoomContainer
@onready var player: CharacterBody2D = $Player
@onready var ghost: CharacterBody2D = $Ghost
@onready var game_music: AudioStreamPlayer = $GameMusic
@onready var boss_music: AudioStreamPlayer = $BossMusic

## Room Tracking 
var current_room_index: int = 0
var total_rooms: int = 4
var current_room_instance: Node2D = null

## RNG for Doors
var starting_door_count: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
