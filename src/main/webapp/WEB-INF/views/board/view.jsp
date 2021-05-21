<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>	
	<title>Insert title here</title>
	<meta charset="utf-8" />
	<meta name="viewport"
		content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="/resources/assets/css/main.css" />
	<noscript>
		<link rel="stylesheet" href="/resources/assets/css/noscript.css" />
	</noscript>
	</head>
	<body class="is-preload">
		<!-- Header -->
			<header id="header">
				<h1>Big Picture</h1>
				<nav>
					<ul>
						<li><a href="#intro">Intro</a></li>
						<li><a href="#one">What I Do</a></li>
						<li><a href="#two">Who I Am</a></li>
						<li><a href="#work">My Work</a></li>
						<li><a href="#contact">Contact</a></li>
					</ul>
				</nav>
			</header>
		<!-- main -->
			<section class="main style3 primary">
				<div class="content">
					<h2>뷰</h2>
					<form method="post" action="/board/modify">
						<div class="fields">
						제목<input type="text" name="title" value="${board.title}" readonly/>
						</div>
						<div class="fields">
						내용<textarea class="fields quarter" name="content" readonly>
${board.content}
						</textarea>
						</div>
						<div class="fields">
						
							<div  class="fields quarter" style="text-align: left;">
							작성자<input type="text" name="writer" value="${board.writer}" readonly/>
							</div>
						</div>
						<div class="fieids">
							<input type="button" name="change" value="수정하기" onclick="modify()"/>
							<input type="submit" name="modifyOk" style="display: none" value="수정완료"/>
							<input type="button" name="remove" value="삭제하기" onclick="location.href='/board/remove${cri.listLink}&bno=${board.bno}'"/>
						</div>
						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="pageAmount" value="${cri.pageAmount}">
						<input type="hidden" name="bno" value="${board.bno}">
					</form>
					<a href="/board/list${cri.listLink}">목록보기</a>
				</div>
				
			</section>
			
		<!-- Footer -->
			<footer id="footer">

				<!-- Icons -->
					<ul class="icons">
						<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
						<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon brands fa-pinterest"><span class="label">Pinterest</span></a></li>
					</ul>

				<!-- Menu -->
					<ul class="menu">
						<li>&copy; Untitled</li>
					</ul>

			</footer>
			<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.poptrox.min.js"></script>
			<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
	
	</body>
	<script>
		function modify(){
			console.log("수정1");
			$("input[name='title']").removeAttr("readonly");
			$("textarea[name='content']").removeAttr("readonly");
			$("input[name='remove']").hide();
			$("input[name='change']").hide();
			$("input[name='modifyOk']").show();
		}
	
	</script>
</html>