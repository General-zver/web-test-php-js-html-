<?php

$text = 'Разнообразный и богатый опыт говорит нам, что высококачественный прототип будущего проекта представляет собой интересный эксперимент проверки поэтапного и последовательного развития общества.
Повседневная практика показывает, что реализация намеченных плановых заданий способствует повышению качества своевременного выполнения сверхзадачи.
В своём стремлении улучшить пользовательский опыт мы упускаем, что сторонники тоталитаризма в науке своевременно верифицированы.';


echo '
<html>
<head>
	<meta charset="utf-8">
	<title> PHP. Найти строку в тексте.</title>
	<link type="text/css" rel="stylesheet" href="/css/style.css">
</head>

<body>
	<div id="header">
		<p class="h">PHP. Найти строку в тексте.</p>
	</div>
	<div class="input-pattern">
		<form action="" method="POST">
			<b>Ключевая строка:</b>
			<input type="text" name="InputStr" value=""></br>
			<input type="submit" name="search" value="Найти">
		</form>';
        if(isset($_POST)){
            if(strlen($_POST['InputStr'])>0){
				$masspatt=array();  
				$massrepl=array(); 
				$i=0;
				if(strpos($_POST['InputStr'], '"')!==false) 
				{
					$regular = '/"[\w\s]+"|[\w\b]+/ui';	
					preg_match_all($regular, $_POST['InputStr'], $matches);
					$fff = call_user_func_array('array_merge',$matches);
					foreach($fff as &$value){
						$masspatt[$i]='/(^|\s)'.str_replace('"','',$value).'(\s|$)/'; 
						$massrepl[$i]='<span style="color: red"> '.str_replace('"','',$value).' </span>';
						$i++;
					}
					echo '<p>'.preg_replace($masspatt, $massrepl, $text).'</p>';
						unset($_POST);
				} 
				else 
				{
					$mass = explode(' ', $_POST['InputStr']);
					foreach($mass as &$value)
						{
							$masspatt[$i]='/(^|\s)'.$value.'(\s|$)/';
							$massrepl[$i]='<span style="color: red"> '.$value.' </span>';
							$i++;
						} 
						echo '<p>'.preg_replace($masspatt, $massrepl, $text).'</p>';
						unset($_POST);
					}	
            } else{  
            echo '<p>'.$text.'</p>'; 
            }
        }
	echo '</div>
	<div class="foot">
		<a href="../index.html" class="bb link">Вернуться к выбору задания</a>
	</div>
	</body>

</html>
';
