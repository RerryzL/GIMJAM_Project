extends CanvasLayer
# HUD gunanya bakal dipasang (nodenya) disemua stage scene

@onready var interaction_button: AnimatedSprite2D = $MarginContainer/RightBottomContainer/InteractionButton
@onready var room_label: Label = $MarginContainer/LeftTopContainer/RoomLabel
@onready var room_label_timer: Timer = $MarginContainer/LeftTopContainer/RoomLabelTimer
@onready var animation_player: AnimationPlayer = $MarginContainer/AnimationPlayer

var current_phase : String = GameManager.current_phase

func _ready() -> void:
	interaction_button.visible = false
	room_label.visible = true
	room_label_timer.start()

func _process(delta: float) -> void:
	if GameManager.interact:
		interaction_button.visible = true
	else:
		interaction_button.visible = false
		

# kalau timernya udah lewat, label current room akan menghilang
func _on_room_label_timer_timeout() -> void:
	animation_player.play("label_fade")
