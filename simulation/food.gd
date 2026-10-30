extends PointOfInterest
class_name Food

var sprite: AnimatedSprite2D

func _init(location: Coordinate = null) -> void:
	sprite = $AnimatedSprite2D
	if not location:
		location = Coordinate.from_vector2(sprite.position)
	super(location)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func tick():
	if not active:
		visible = false
		
