<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>우리반 화이팅</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('button').on('click',function(e){
			var fData=$("#fr"); 
			var btn=$(this).data('btn');  //내가 현재 클릭한 버튼 -> data-btn
			
			if(btn=='reply'){
				fData.attr("action","${root}/board/reply");
			}
			else if(btn=='modify'){
				fData.attr("action","${root}/board/modify");
			}
			else if(btn=='list'){
				fData.find("#idx").remove();
				fData.attr("action","${root}/board/list");
			}
			fData.submit();
		});
	})
	



</script>
	
	
</head>
<body>
	<div class="container">
		<h2>화이팅♥</h2>
			<div class="panel-body">
			<table class="table table-bordered">
				<tr>
					<td>번호</td>
					<td><input type="text" class="form-control" name="idx"
					readonly="readonly" value="${vo.idx }"></td>
				</tr>				
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="title"
					readonly="readonly" value="<c:out value='${vo.title }'/>"/></td>
				</tr>				
				<tr>
					<td>내용</td>
					<td><textarea rows="10" class="form-control" 
					name="content" readonly="readonly"><c:out value='${vo.content }'/></textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" class="form-control" name="writer"
					readonly="readonly" value="${vo.writer }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;">
					<c:if test="${!empty mem}">			
						<button data-btn="reply" class="btn btn-md btn-primary">답글</button>
						<button data-btn="modify" class="btn btn-md btn-success">수정</button>
					</c:if>
					<c:if test="${empty mem }">
						<button class="btn btn-md btn-primary" disabled="disabled">답글</button>
						<button class="btn btn-md btn-success" disabled="disabled" onclick="location.href='${root}/board/modify?idx=${vo.idx }'">수정</button>
					</c:if>
						<button data-btn="list" class="btn btn-md btn-info">목록</button>
					</td>
			</table>
			
			<form id="fr" method="get">
				<input type="hidden" id="idx" name="idx" value="<c:out value='${vo.idx }'/>"/>
				<input type="hidden" name="page" value="<c:out value='${cri.page }'/>"/>
				<input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum }'/>"/>
				<input type="hidden" name="type" value="<c:out value='${cri.type }'/>"/>
				<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>"/>
			
			</form>
			
			
			</div>

		</div>
	</div>
</body>
</html>
