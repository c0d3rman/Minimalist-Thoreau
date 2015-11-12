# http://www.flatuicolorpicker.com/

doHideCanopyOutline = no
doHideTreeBase = no

$(document).ready ->
	paper = Snap $(window).width(), $(window).height()

	w = $(window).width() / 100
	h = $(window).height() / 100

	scaleCoords = (coords) -> [].concat.apply [], ([coords[i] * w, coords[i + 1] * h] for i in [0..coords.length - 1] by 2)
	scaleCoordsY = (coords) -> [].concat.apply [], ([coords[i] * h, coords[i + 1] * h] for i in [0..coords.length - 1] by 2)

	# Background
	bg = paper.polygon scaleCoords [
		0, 0,
		0, 100
		100, 100
		100, 0
	]
	bg.attr fill: "#22A7F0" # Picton Blue

	# Ground
	ground = paper.polygon scaleCoords [
		0, 30,
		100, 30
		100, 100
		0, 100
	]
	ground.attr fill: "#70500F" # Chambray Complement Darker

	# Lake
	lakePoints = scaleCoords [
		0, 100,
		0, 66,
		10, 62,
		18, 63,
		20, 61,
		22, 57,
		21, 50,
		18, 45,
		19, 43,
		25, 37,
		45, 38,
		55, 39,
		75, 40,
		90, 43,
		100, 46
		100, 100
	]
	#lakeUpPoints = [].concat.apply [], ([lakePoints[i] - 3, lakePoints[i + 1] - 3] for i in [0..lakePoints.length - 1] by 2)
	#lakeUp = paper.polygon lakeUpPoints
	#lakeUp.attr fill: "#5C75BD" # Chambray + 2
	lake = paper.polygon lakePoints
	lake.attr
		fill: "#3A539B", # Chambray
		strokeWidth: "3"

	setInterval ->
		clone = lakePoints.slice 0
		clone[i] += Math.floor(Math.random() * 11 - 5) for i in [1..lakePoints.length - 1] by 2 when lakePoints[i] isnt 100 * h

		#pushPoint = Math.floor(Math.random() * clone.length)
		#for i in [0..clone.length - 1]
		#	clone[i] += 5 * Math.pow(-0.5, Math.abs(pushPoint - i))
		#	console.log 5 * Math.pow(-0.5, Math.abs(pushPoint - i))

		lake.animate {points: clone}, 1100, mina.linear
	, 1000

	# Tree
	makeTree = (x, y, size) ->
		trunk = paper.polygon(scaleCoordsY [
			44, 83,
			44, 100
			55, 100
			55, 83
		]).attr fill: "#53350A" # Tree trunk brown
		tri1 = paper.polygon(scaleCoordsY [
			13, 83,
			30, 61,
			69, 61,
			86, 83
		]).attr fill: "#1D7F44" # Eucalyptus darkest
		tri2 = paper.polygon(scaleCoordsY [
			22, 62,
			37, 40,
			63, 40,
			77, 62
		]).attr fill: "#208C4B" # Eucalyptus darker
		tri3 = paper.polygon(scaleCoordsY [
			32, 41,
			44, 19,
			55, 19,
			67, 41
		]).attr fill: "#239952" # Eucalyptus dark
		tri4 = paper.polygon(scaleCoordsY [
			41, 20,
			50, 0,
			59, 20
		]).attr fill: "#26A65A" # Eucalyptus

		#trunk = trunk.attr transform: baseTransform
		#canopy = paper.group(tri1, tri2, tri3, tri4).attr transform: baseTransform
		canopy = paper.group tri1, tri2, tri3, tri4
		#canopyOutline = canopy.clone().attr transform: "s#{(size * h + 2) / (size * h)},#{(size * h + 1) / (size * h)}"
		canopyOutline = canopy.clone().attr transform: "t-1,0"
		for tri in canopyOutline.selectAll "*"
			triColor = Snap.color tri.attr "fill"
			tri.attr fill: Snap.hsb triColor.h, triColor.s, triColor.v - 0.2
		tree = paper.group(canopyOutline, trunk, canopy).attr transform: "t#{-50 * h},#{-50 * h}t#{x * w},#{y * h}s#{size / 100}"
		
		if doHideTreeBase
			trunk.attr visibility: "hidden"
			canopy.attr visibility: "hidden"
		if doHideCanopyOutline
			canopyOutline.attr visibility: "hidden"

		tree

	makeTree 22, 30, 13
	makeTree 32, 30, 13
	makeTree 36, 29, 13
	makeTree 43, 30, 13
	makeTree 61, 30, 13
	makeTree 66, 31, 13
	makeTree 72, 31, 13

	makeTree 20, 29, 14
	makeTree 23, 29, 14
	makeTree 27, 29, 14
	makeTree 34, 29, 14
	makeTree 63, 29, 14
	makeTree 69, 29, 14

	makeTree 25, 28, 15
	makeTree 20, 28, 15
	makeTree 74, 29, 14
	makeTree 90, 28, 15


	makeTree 5, 31, 19
	makeTree 11, 30, 20
	makeTree 8, 29, 21


	makeTree 10, 34, 29
	makeTree 3, 33, 30
	makeTree 14, 33, 30
	makeTree 7, 35, 31


	cabin = paper.image "cabin.png", -4 * w, 35 * h, 27 * h, 27 * h

	paper.image "ant.svg", 15 * w, 55 * h, 3 * h, 3 * h
	paper.image("ant.svg", 12 * w, 49 * h, 2 * h, 2 * h).attr transform: "s-1,1"
	paper.image "ant.svg", 80 * w, 35 * h, 1 * h, 1 * h
	paper.image("ant.svg", 55 * w, 34 * h, 1 * h, 1 * h).attr transform: "s-1,1"
	paper.image "ant.svg", 50 * w, 36 * h, 1 * h, 1 * h