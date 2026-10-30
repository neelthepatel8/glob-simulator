extends Node2D
class_name Glob

var impl: GlobImpl
var pois: Array[PointOfInterest]

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func initialize(points_of_interest: Array[PointOfInterest]):
	pois = points_of_interest
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#assert(CONFIG != null, "Glob spawned without CONFIG")
	impl = GlobImpl.new(Coordinate.new(position.x, position.y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	impl.search(pois)

func _rerender(delta: float):
	sprite.position = impl.location.to_vector2().abs()
