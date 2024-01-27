extends Area2D

signal vectorCreated(vector)
@export var maxLength := 200
var touchDown:=false
var positionStart
var positionEnd

func _input(event):
	if !touchDown:
		return

func OnInputEvent():
	pass
