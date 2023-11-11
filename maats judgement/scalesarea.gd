extends Area2D

# The function to run when the heart enters the scales area
func _on_ScalesArea_body_entered(body):
	if body.is_in_group("draggable") and !body.being_dragged:
		# Snap the heart to the center of the scales area
		body.position = self.global_position

# The function to run when the heart exits the scales area
func _on_ScalesArea_body_exited(body):
	if body.is_in_group("draggable"):
		pass
		# You can add logic here if you want to do something when the heart leaves the scales area

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the body_entered and body_exited signals to the relevant functions
	connect("body_entered", Callable(self, "_on_ScalesArea_body_entered"))
	connect("body_exited", Callable(self, "_on_ScalesArea_body_exited"))
