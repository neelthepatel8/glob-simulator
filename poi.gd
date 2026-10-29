@abstract 
class_name PointOfInterest
extends Node2D
var hp_change: int
var _location: Coordinate
var active: bool = true
var _sprite: Sprite2D

func get_location() -> Coordinate:
	return _location

func _init(location: Coordinate = null, xmax = null, ymax = null, sprite: Sprite2D = null) -> void:
	_sprite = sprite
	if _sprite:
		add_child(_sprite)
		
	if not location:
		if xmax and ymax:
			_location = 	_random_initialization(xmax, ymax)
			return
		else:
			print("Error initializing Food, xmax and ymax must be provided when no location is provided during initializsation.")
			return
	_location = location

func _random_initialization(xmax: int, ymax: int):
	return Coordinate.random(xmax, ymax)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
