<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#registerFeed").on("click", function() {
			location.href = "writeFeed";
		})
	})
</script>
</head>
<body>
	<div id="wrapper">
		<div>프로필 사진 닉네임 프로필 메세지</div>
		<button type="button">회원 정보 편집</button>
		<c:choose>
			<c:when test="${fn:length(list) ==0}">
				게시물이 없습니다.<br>
				<button id="registerFeed">게시물 등록</button>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<td>글번호
						<td>글제목
						<td>글내용
					</tr>
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.feed_seq }
							<td><a href="/feed/detailView?feed_seq=${list.feed_seq }">${list.title }</a>
							<td>${list.contents }
							<td><button id="registerFeed">게시물 등록</button>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>