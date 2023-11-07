extends Sprite

var weight = 1
var being_dragged = false
var drag_offset = Vector2()

func _ready():
	# Assuming the child Area2D is named "HeartArea"
	var area = get_node("HeartArea")
	area.connect("input_event", self, "_on_HeartArea_input_event")
	area.mouse_filter = Control.MOUSE_FILTER_STOP
	pass # Replace with function body.

func _on_HeartArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			being_dragged = true
			# Calculate the offset from the sprite's position to the mouse click position
			drag_offset = self.position - event.position
			self.z_index = 1
		else:
			being_dragged = false
			self.z_index = 0
			# Add logic to snap the heart to the scales if needed

func _process(delta):
	if being_dragged:
		# Use the offset so that the dragging feels more natural
		self.position = get_global_mouse_position() + drag_offset
