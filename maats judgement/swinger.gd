extends Node
 
@export var freq:float = 1.0
@export_range(0, PI/2) var amp:float = 0.0
@export_range(0.9, 1) var decay:float = 0.9
 
var amt:float = 0.0
var n:float = 0.0
 
func swing():
	amt = 1.0
 
func _process(delta):
	n += delta # or any constant, it's just for pretty
	amt *= decay
 
func get_swing():
	return sin(n*freq)*amp*amt
 
