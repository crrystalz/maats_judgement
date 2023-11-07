extends Sprite2D

# The weight of the heart
var weight = 1

# Variable to track if the heart is being dragged
var being_dragged = false

# Function called when the node enters the scene tree for the first time
func _ready():
	pass  # Replace with function body.

# Input event function to detect dragging
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Begin dragging
			being_dragged = true
			# To drag the heart, we make sure it's always drawn on top while being dragged
			self.z_index = 1
		else:
			# End dragging
			being_dragged = false
			# Reset the z-index
			self.z_index = 0
			# Here you could add logic to 'snap' the heart to the scales

# Process function to move the heart while dragging
func _process(delta):
	if being_dragged:
		# Follow the mouse position
		var mouse_position = get_viewport().get_mouse_position()
		self.position = mouse_position
