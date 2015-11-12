# http://spin.atomicobject.com/2015/10/09/reverse-scroll-animations-css/

$(document).ready ->
	# Hide our element on page load
	#$('.textFadeIn').css 'opacity', 0

	$('.textFadeIn').waypoint (direction) ->
		if direction is 'down'
			# Reveal our content
			$('.textFadeIn').addClass 'fadeIn'
			$('.textFadeIn').removeClass 'fadeOut'
		else if direction is 'up'
			# Hide our content
			$('.textFadeIn').addClass 'fadeOut'
			$('.textFadeIn').removeClass 'fadeIn'
	, offset: '50%'