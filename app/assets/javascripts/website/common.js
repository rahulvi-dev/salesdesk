function slideContent(slideFrom){
	$('#wrapper').hide();
    $('#wrapper').show('slide', { direction : slideFrom}, 1000);
}

$(document).ready(function(){
	$('.navbar-toggle').click(function(){
		$(this).toggleClass('active');
		$('.navbar-collapse').toggleClass('active');
		$('.menuOverlay').toggleClass('active');
	});
	$('.menuOverlay').click(function(){
		$(this).removeClass('active');
		$('.navbar-collapse').toggleClass('active');
		$('.navbar-toggle').toggleClass('active');
	});
});