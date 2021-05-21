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
	<style>
		td{
			text-align: left !important;
		}
		.bno {
			width: 20%;
		}
		
		.title {
			width: 50%;
		}
		
		.writer {
			width: 30%;
		}
		
	</style>
	</head>
	<body >
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
				<h2 style="color: black;">게시판</h2>							
					<table class="default">				
						<tr>
							<th class="bno">번호</th>
							<th class="title">제목</th>
							<th class="writer">작성자</th>					
						</tr>
						<c:forEach var="board" items="${list}">
						<tr>							
								<td>${board.bno}</td>
								<td><a href="/board/view${pageMaker.cri.listLink}&bno=${board.bno}">${board.title}</a></td>
								<td>${board.writer}</td>
						</tr>
						</c:forEach>
					</table>
					<div class="fields">
						<button type="button" onclick="location.href='/board/write${pageMaker.cri.listLink}'">새글쓰기</button>
					</div>
					<c:if test="${pageMaker.startPage > 10}">
						<a href="/board/list?pageNum=${pageMaker.startPage  - 10}">&lt;&lt;</a>
					</c:if>
					<c:if test="${pageMaker.cri.pageNum ne 1}">
						<a href="/board/list?pageNum=${pageMaker.cri.pageNum - 1}">이전</a>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<c:choose>
							<c:when test="${num eq pageMaker.cri.pageNum}">
								<span>
									${num}
								</span>
							</c:when>
							<c:otherwise>
								<span>
									<a href="/board/list?pageNum=${num}">${num}</a>							
								</span>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
					<c:if test="${pageMaker.cri.pageNum ne pageMaker.realEnd}">
						<a href="/board/list?pageNum=${pageMaker.cri.pageNum + 1}">다음</a>
					</c:if>
					<c:if test="${(pageMaker.endPage - pageMaker.startPage) eq 9 && pageMaker.realEnd ne pageMaker.endPage}">
						<a href="/board/list?pageNum=${pageMaker.startPage  + 10}">&gt;&gt;</a>					
					</c:if>
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
</html>