extends PointOfInterest
class_name Food

func _init(location: Coordinate = null, xmax = null, ymax = null, sprite: Sprite2D = null) -> void:
	super(location, xmax, ymax, sprite)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func tick():
	if not active:
		visible = false
	_rerender()

func _rerender():
	_sprite.position = _location.to_vector2().abs()
