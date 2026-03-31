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


func _ready() -> void:
	total_rooms = GameManager.get_room_count()
	go_to_room(0)


func go_to_room(room_index: int) -> void:
	if current_room_instance != null:
		current_room_instance.queue_free()
		current_room_instance = null
		
	current_room_index = room_index
	
	var is_boss_room: bool = (room_index == total_rooms - 1)
	
	if is_boss_room:
		current_room_instance = boss_room_scene.instantiate()
	else:
		current_room_instance = room_scene.instantiate()
		
	room_container.add_child(current_room_instance)
	
	_spawn_doors(room_index, is_boss_room)
	
	var spawn_point: Marker2D = current_room_instance.get_node("PlayerSpawn")
	player.global_position = spawn_point.global_position
	ghost.global_position = spawn_point.global_position + Vector2(20, 0)
	
	if is_boss_room:
		game_music.stop()
		if not boss_music.playing:
			boss_music.play()
	else:
		boss_music.stop()
		if not game_music.playing:
			game_music.play()
	
	
	
func _spawn_doors(room_index: int, is_boss_room: bool) -> void:
	if is_boss_room:
		return
		
	var door_spots_node: Node2D = current_room_instance.get_node("DoorSpots")
	var all_spots: Array[Node] = door_spots_node.get_children()
	
	var door_count: int = 1
	if room_index == 0:
		door_count = randi_range(1,3)
		starting_door_count = door_count
	else:
		door_count = 1
		
	all_spots.shuffle()
	
	door_count = mini(door_count, all_spots.size())
	
	for i in range(door_count):
		var spot: Marker2D = all_spots[i] as Marker2D
		var door: Area2D = door_scene.instantiate()
		door.global_position = spot.global_position
		
		door.target_room_index = room_index + 1
		
		#if room_index == 0:
			#door.target_room_index = mini(i + 1, total_rooms - 1)
		#else:
			#door.target_room_index = room_index + 1
			
		current_room_instance.add_child(door)
		
		
		
		
		
