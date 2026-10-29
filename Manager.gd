extends Node2D

var GLOB_PREFAB = preload("res://glob.tscn")
var FOOD_PREFAB = preload("res://food.tscn")

@export var CONFIG: Config
@export var update_interval := 0.1
var elapsed := 0.0
var globs: Array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CONFIG.xmax = get_window().size.x 
	CONFIG.ymax = get_window().size.y
	
	# create some POIs
	for i in range(50):
		var food := Food.new(
			null,
			CONFIG.xmax,
			CONFIG.ymax,
			FOOD_PREFAB.instantiate() as Sprite2D
		)
		
		print("Food object script: ", food.get_script().resource_path)

		add_child(food) 
		CONFIG.points_of_interest.append(food)	
	
	print("Spawner config: ", CONFIG)
		
	# create globs
	for i in range(10):
		var glob = GLOB_PREFAB.instantiate() as Glob
		assert(glob != null, "glob.tscn root is not a Glob")
		glob.position = Coordinate.new().to_vector2()
		glob.CONFIG = CONFIG
		print("Assigned config: ", glob.CONFIG)
		add_child(glob)
		globs.append(glob)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	if elapsed < update_interval:
		return
	
	elapsed = 0.0
	
	for i in range(globs.size()):
		globs[i].tick(delta)
	
	for i in range(CONFIG.points_of_interest.size()):
		CONFIG.points_of_interest[i].tick()
