$(document).ready ->
	c = $("#canvas")
	ctx = c[0].getContext "2d"
	
	c.width $(window).width()
	c.height $(window).height()
	c.attr "width", $(window).width()
	c.attr "height", $(window).height()
	ctx.canvas.width  = $(window).width()
	ctx.canvas.height = $(window).height()

	ctx.translate 0.5, 0.5

	w = window.innerWidth / 100
	h = window.innerHeight / 100

	moveTo = (x, y) -> ctx.moveTo x * w, y * h
	lineTo = (x, y) -> ctx.lineTo x * w, y * h
	fillRect = (x1, y1, x2, y2) -> ctx.fillRect x1 * w, y1 * h, x2 * w, y2 * h
	
	console.log w + " " + h
	

	# Background
	ctx.fillStyle = "#22A7F0" # Picton Blue
	fillRect 0, 0, 100, 100

	# Lake
	ctx.fillStyle = "#3A539B" # Chambray
	ctx.beginPath()
	moveTo -25, 100
	lineTo -5, 70
	lineTo 10, 60
	lineTo 40, 63
	lineTo 45, 53
	lineTo 50, 57
	lineTo 53, 55
	lineTo 60, 52
	lineTo 65, 60
	lineTo 90, 75
	lineTo 105, 80
	lineTo 120, 100
	lineTo -25, 100
	ctx.closePath()
	ctx.fill()