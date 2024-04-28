extends Node

@onready var game_manager: Node = %GameManager

var points = 0

func add_point():
	points += 1
	print(points)
	%PointsLabel.text = "Points: " + str(points)
