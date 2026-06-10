extends CanvasLayer

@onready var label := $Label

func _ready() -> void:
	GameState.score_changed.connect(_on_score_changed)
	label.text = "Score: " + str(GameState.score)

func _on_score_changed(new_score: int) -> void:
	label.text = "Score: " + str(new_score)
