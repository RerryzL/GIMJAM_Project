extends Node2D

@onready var door: Area2D = $Door

@onready var hud: CanvasLayer = $Hud
@onready var player: CharacterBody2D = $Player

const SpawnLocation = preload("res://scripts/Spawn_Location.gd")
var current_room : String = "Park"


func _ready() -> void:
	GameManager.current_room = current_room
	
	print("Hello Stage 1 Livingroom")
	hud.room_label.text = current_room
	door.on_door_pressed.connect(door_pressed)
	player.position = GameManager.spawn_position



## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
func door_pressed():
	GameManager.load_stage_1_Livingroom(SpawnLocation.locations["Stage_1(park-livingroom)"])
