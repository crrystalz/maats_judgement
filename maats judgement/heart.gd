extends Sprite2D

var weight = 1
var being_dragged = false
var drag_offset = Vector2()

func _ready():
	var area = get_node("HeartArea")
	area.input_pickable = true
	area.connect("input_event", Callable(self, "_on_HeartArea_input_event"))

func _on_HeartArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			being_dragged = true
			drag_offset = self.position - event.position
			self.z_index = 1
		else:
			being_dragged = false
			self.z_index = 0
			# Add logic to snap the heart to the scales if needed

func _process(delta):
	if being_dragged:
		self.position = get_global_mouse_position() + drag_offset
