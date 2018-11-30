<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style type="text/css">
@charset "UTF-8";
div#header{
	text-align: center;
	border: 1px solid black;
	border-bottom: none;
}
div#navbar{
	background : gray;
	text-align: center;
	border: 1px solid black;
	border-top: 2px dashed black;
	margin-bottom: 10px;
	padding: 20px;
}
div#section{
	border: 1px solid black;
	height: 300px;
	text-align: center;
	padding: 50px;
}
div#footer{
	background: gray;
}
.center{
	text-align: center;
}
thead>tr>th{
	background: gray;
	color :white;
}
td.table_th{
	background : gray;
	color :white;
}
td.table_td{
	width: 500px;
}
.w100{
	width:98%;
}
span{
	color : red;
}
#navbar>a:link { 
	color: white; text-decoration: none;
}
#navbar>a:visited { 
	color: white; text-decoration: none;
}
#navbar>a:hover { 
	color: red; text-decoration: underline;
}
a:link{
	color: blue; text-decoration: none;
}
a:visited{
	color: blue; text-decoration: none;
}
a:hover{
	color: red; text-decoration: underline;
}

</style>
</head>
<body>
	<header>
		<div id="header">
			<a href="/board/main/index.do"><img src="../image/main.jpg" width="200px" height="200px"></a>
		</div>
	</header>
	<nav>
		<div id="navbar">
			<a href="/board/board/boardWriteForm.do">글쓰기</a>&nbsp
			<a href="/board/board/boardList.do">글목록</a>
		</div>
	</nav>
	<section>
		<div id="section">
			<jsp:include page="${display }"/>
		</div>
	</section>
	
	<footer>
		<div id="footer" class="center" style="border=1; width: 100%">
			<h3>제갈준혁</h3>
		</div>
	</footer>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#boardWriteBtn').on('click',function(){
		if($('#name').val()==''){
			$('#contentDiv').text('이름을 입력하세요').css('color','red');
		}else if($('#subject').val()==''){
			$('#contentDiv').text('제목을 입력하세요').css('color','red');
		}else if($('#content').val()==''){
			$('#contentDiv').text('내용을 입력하세요').css('color','red');
		}else{
			$.post('/board/board/boardWrite.do',
					$('#boardWriteForm').serialize(),
					function(data){
					if(data=='1'){
						alert('글쓰기 완료');
						location.href='/board/board/boardList.do';
					}},'text');
		}
	});
})
</script>
</html>