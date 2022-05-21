extends Spatial


export var speed = 14;
export var fall_aceleration = 75;

var velocity = Vector3.ZERO;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var direction = Vector3.ZERO;
	
	if Input.is_action_pressed("ui_up"):
		direction.x += 1;
	if Input.is_action_pressed("ui_down"):
		direction.x -= 1;
	if Input.is_action_pressed("ui_left"):
		direction.z += 1;
	if Input.is_action_pressed("ui_right"):
		direction.z -= 1;
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$pivot.loot_at(translation + direction, Vector3.UP);
		
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	velocity.y -= fall_aceleration * delta
	
	velocity = move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
