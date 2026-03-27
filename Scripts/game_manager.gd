extends Node

var selected_map: String = "small"

var map_room_counts: Dictionary = {
	"small": 4,
	"medium": 5,
	"large": 6
}

func get_room_count() -> int:
	return map_room_counts[selected_map]
