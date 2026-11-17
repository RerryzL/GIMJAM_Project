extends CharacterBody2D

@onready var animation = $AnimatedSprite2D

var direction = Vector2(0,0)
var screen_size = Vector2(1152 , 648)
var current_phase : String = GameManager.current_phase
var speed : int = 200


func _physics_process(delta: float) -> void:
	if GameManager.game_paused: return
	if GameManager.on_task: return
	
	if Input.is_action_pressed("ui_left"):
		animation.flip_h = true
	if Input.is_action_pressed("ui_right"):
		animation.flip_h = false
	calculate_direction()
	position += direction * speed * delta
	#update_animation()
	move_and_slide()


# variabel game_phase untuk animasi sprite 3 bentuk karakter yang berbeda
func update_animation():
	if direction.y < 0:
		animation.play("walk_up" + " " + str(current_phase))
	elif direction.y > 0:
		animation.play("walk_down" + " " + str(current_phase))	
	elif direction.x != 0:
		animation.play("walk_horizontal" + " " + str(current_phase))
	else:
		animation.play("idle" + " " + str(current_phase))


func calculate_direction():
	direction = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
