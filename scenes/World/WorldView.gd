extends Node2D

var points_of_interest: Array[PointOfInterest] = [] 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points_of_interest.assign(get_tree().get_nodes_in_group("poi"))
	$Glob.initialize(points_of_interest)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
