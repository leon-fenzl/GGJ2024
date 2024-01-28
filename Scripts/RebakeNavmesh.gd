extends NavigationRegion2D

func _on_timer_timeout():
	if bake_finished:
		bake_navigation_polygon(true)
