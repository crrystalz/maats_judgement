extends Sprite2D

@onready var sprite = self
@onready var swinger = $Swinger

signal mouse_released

var picked_up:bool = false :
	set(b):
		if not b:
			position = Vector2.ZERO
		picked_up = b
		# picked_up_changed.emit()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if picked_up:
		global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("LMB"):
		mouse_released.emit()
		
	sprite.rotation = swinger.get_swing()


func _on_button_pressed():
	picked_up = true
	await mouse_released
	picked_up = false
