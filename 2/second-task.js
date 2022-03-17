$(document).ready(
function(){

var current_fs, next_fs, previous_fs; //наборы полей
var opacity;

$(".next").click(function(){

current_fs = $(this).parent();
next_fs = $(this).parent().next();

if(!$(".active-text").val()){
	$(".active-span").text("Поле обязательно для заполнения!");
	return false;
} 

if($("#submitter").hasClass("active-text")){
if($("input.active-text").val()){ 
	RegExp1 = new RegExp('\\w+\\@.\\w+\\.\\w{2,4}' , 'img'); //регулярка
	text = $("input.active-text").val();
	
	if(!RegExp1.test($("input.active-text").val())){
		alert(RegExp1.test($("input.active-text").val()));
		$(".active-span").text("Почта не является настоящей!");
		return false;
	}
} 
else { return false;}
}

$(".active-text").removeClass("active-text"); 
$("span.active-span").removeClass("active-span");


//Добавить класс активный 
$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
$("input.input-text").eq($("fieldset").index(next_fs)).addClass("active-text");
$("span").eq($("fieldset").index(next_fs)).addClass("active-span");

//Показать следующий набор полей
next_fs.show();

//скрыть текущий набор полей
current_fs.animate({opacity: 0}, {
step: function(now) {
//анимация отображения набора полей
opacity = 1 - now;

current_fs.css({
'display': 'none',
'position': 'relative'
});
next_fs.css({'opacity': opacity});
},
duration: 600
});

});

$(".previous").click(function(){

current_fs = $(this).parent();
previous_fs = $(this).parent().prev();

//изменение классов
$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
$(".active-text").eq($("fieldset").index(current_fs)).removeClass("active-text");
$("span.active-span").eq($("fieldset").index(current_fs)).removeClass("active-span");
$("input.input-text").eq($("fieldset").index(previous_fs)).addClass("active-text");
$("span").eq($("fieldset").index(previous_fs)).addClass("active-span");
//show the previous fieldset
previous_fs.show();

//hide the current fieldset with style
current_fs.animate({opacity: 0}, {
step: function(now) {
// for making fielset appear animation
opacity = 1 - now;

current_fs.css({
'display': 'none',
'position': 'relative'
});
previous_fs.css({'opacity': opacity});
},
duration: 600
});
});

});