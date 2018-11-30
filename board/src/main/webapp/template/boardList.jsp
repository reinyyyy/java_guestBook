<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<table class="center" cellspacing="0" cellpadding="5" border="1" align="center">
		<thead>
			<tr>
				<th style="width: 8%">글번호</th>
				<th style="width: 20%">제목</th>
				<th style="width: 42%">내용</th>
				<th style="width: 10%">작성자</th>
				<th style="width: 10%">이메일</th>
				<th style="width: 10%">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="boardDTO" items="${list }">
			<tr>
				<td>${boardDTO.seq}</td>
				<td>${boardDTO.subject}</td>
				<td>${boardDTO.content}</td>
				<td>${boardDTO.name}</td>
				<td>${boardDTO.email}</td>
				<td><fmt:formatDate value="${boardDTO.logtime}" pattern="yyyy-MM-dd" type="date"/></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="paging" class="center">
		${boardPaging.pagingHTML}
	</div>
