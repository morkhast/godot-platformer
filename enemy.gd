extends CharacterBody2D

@export var speed := 80.0
@export var patrol_distance := 100.0

var direction := 1.0
var start_x := 0.0

func _ready() -> void:
	start_x = global_position.x

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = direction * speed

	if abs(global_position.x - start_x) >= patrol_distance:
		direction *= -1.0

	move_and_slide()

func die() -> void:
	queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self or not body is CharacterBody2D:
		return
	if body.velocity.y > 0 and body.position.y < position.y:
		die()
		body.velocity.y = -300.0
	else:
		body.die()
