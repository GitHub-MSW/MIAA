<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" href="resources/css/mypage_post_list_page.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>

<div class="main-body">

	<!-- main -->
			
        <!-- 검색창과 검색결과 -->

			<div class="searchbar-container">
				<form action="mypage_post_list_page">				
					<div class="searchbar-select-group">
						<div class="searchbar-content">
							<select name="reply_text" id="reply_text" style="border: 1px solid #D8D8D8;">
								<option>제목+내용</option> 
								<option>제목</option> 
								<option>내용</option> 								
							</select>
						</div>
						<div class="searchbar-content">
							<input type="text" style="border: 1px solid #D8D8D8; width: 300px;" placeholder="Search">
						</div>
						<button class="btn-list" id="btn-search"
							style="cursor: pointer;">
							조회<img src="resources/img/search.png" alt="">
						</button>
					</div>
				</form>
			</div>
			
			<!-- 검색창과 검색결과 끝 -->

	
	<div style="padding: 15px 40px; color: #0066ff;">
	등록된 게시물 (${totalCount }개)
	</div>

	<div class="content-wrapper">
		<div class="content-container">
			
			<div class="table-caption-wrapper">
				<div class="talbe-caption-container">
					<div class="table-caption">
						<div>
							<div class="searchbar-content">
							<select name="reply_status" id="reply_status" style="font-family: inherit; 
							border: 1px solid #D8D8D8;" onchange="status(this.value)">
								<option value="전체" >전체</option>
								<option value="물건" >물건</option>
								<option value="동물" >동물</option>														
							</select>
						</div>
						</div>
					</div>
					<div class="table-caption">
					</div>
				</div>
				<div class="list-control-container">
				<button class="btn-list" id="btn-write"
							style="cursor: pointer;">
							<img src="resources/img/bell-on.png" alt="">알림설정
						</button>
				<button class="btn-list" id="btn-write"
							style="cursor: pointer;">
							<img src="resources/img/bell-off.png" alt="">알림제거
						</button>
					<button id="btn-delete"
						style="cursor: pointer;">삭제하기</button>
				</div>
			</div>
			
			<table class="info-table">
				<tr>
					<th><input type="checkbox" name="allCheck" id="allCheck"
						class="table-check-box"></th>
					<th>분류</th>
					<th>사진</th>
					<th class="table-title">게시 제목</th>
					<th>분실/실종일자</th>
					<th>분실/실종 장소</th>
					<th>알람설정</th>
					<th class="table-image"></th>
					<th class="table-image"></th>
				</tr>
				<c:forEach items="${dtos }" var="dtos">
				<input type="hidden" name="kind" id="kind" value="">
				<tr>
					<td><input type="checkbox" name="RowCheck" value=""
						class="table-check-box"></td>
					<td>${dtos.kind }</td>
					<c:if test="${dtos.kind eq '동물' }">
					<td><input type="image" src="${dtos.filename }"
						id="item-image-value" onclick="location.href='missing_ani_detail_page?total_id=${dtos.total_id}&kind=${dtos.kind}'" style="cursor: pointer;" /></td>
					<td class="table-title">
					<a href="missing_ani_detail_page?total_id=${dtos.total_id}&kind=${dtos.kind}">${dtos.name }</a>
					</c:if>
					<c:if test="${dtos.kind eq '물건' }">
					<td><input type="image" src="${dtos.filename }"
						id="item-image-value" onclick="location.href='lost_item_detail_page?total_id=${dtos.total_id}&kind=${dtos.kind}'" style="cursor: pointer;" /></td>
					<td class="table-title">
					<a href="lost_item_detail_page?total_id=${dtos.total_id}&kind=${dtos.kind}">${dtos.name }</a>
					</c:if>
					
					<td>${dtos.day }</td>
					<td>${dtos.address }</td>
					<td>
					
					<!-- 벨 ON OFF 설정 -->
					<%-- <c:if test="${들어오는값 eq 'Y'}"> --%>
					<input type="image" src="resources/img/bell-on.png"
						onclick="" style="cursor: pointer;" />
					<%-- </c:if> --%>	
					<%-- <c:if test="${들어오는값 eq 'N'}">
					<input type="image" src="resources/img/bell-off.png"
						onclick="" style="cursor: pointer;" />
					</c:if> --%>
					</td>
					<c:if test="${dtos.kind eq '동물' }">
					<td class="table-image"><input type="image" src="resources/img/trash_icon.png"
						onclick="deletes_an('${dtos.total_id}')" 
						style="cursor: pointer;" />
						</td>
					<td class="table-image"><input type="image" src="resources/img/write_icon.png"
						onclick="modify_an('${dtos.total_id}')" style="cursor: pointer; margin-top: 10px;"/></td>
					</c:if>
					<c:if test="${dtos.kind eq '물건' }">
					<td class="table-image"><input type="image" src="resources/img/trash_icon.png"
						onclick="deletes_it('${dtos.total_id}')" 
						style="cursor: pointer;" />
						</td>
					<td class="table-image"><input type="image" src="resources/img/write_icon.png"
						onclick="modify_it('${dtos.total_id}')" style="cursor: pointer; margin-top: 10px;"/></td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- 페이징 프레임시작 -->
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span>
					<span class="current-page">${pageVo.page}</span>
					<span>of</span><span
						class="total-page">${pageVo.totPage}</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev"><a class="test"
						href="mypage_post_list_page?page=${pageVo.page - 1}&reply_status=${status}"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq pageVo.page}">
								<li><a href="#" style="color: #0066ff">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="mypage_post_list_page?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next">
					<c:if test="${pageVo.page == pageVo.totPage}">
					<a href="mypage_post_list_page?page=${pageVo.page }&reply_status=${status}"><img src="resources/img/chevron-left.png" alt=""></a>
					</c:if>
					<c:if test="${pageVo.page != pageVo.totPage}">
					<a href="mypage_post_list_page?page=${pageVo.page + 1}&reply_status=${status}"><img src="resources/img/chevron-left.png" alt=""></a>
					</c:if>
					</li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a
						href="mypage_post_list_page?page=${pageVo.page - 10}">Previous</a></li>
					<li class="btn-next-group"><a
						href="mypage_post_list_page?page=${pageVo.page + 10}">Next</a></li>
				</ul>
			</div>
			<!-- 페이징 프레임 끝 -->
</div>
<script>
function deletes_an(total_id){
	if(window.confirm("게시물을 삭제하시겠습니까?")){
		location.href='mypage_ani_delete?total_id='+total_id;
	}
};
function deletes_it(total_id){
	if(window.confirm("게시물을 삭제하시겠습니까?")){
		location.href='mypage_item_delete?total_id='+total_id;
	}
};
function modify_an(total_id) {
	if(window.confirm("게시물을 수정하시겠습니까?")){
		location.href='mypage_ani_modify_page?total_id='+total_id;
	}
};
function modify_it(total_id) {
	if(window.confirm("게시물을 수정하시겠습니까?")){
		location.href='mypage_item_modify_page?total_id='+total_id;
	}
};
function status(status) {
	location.href='mypage_post_list_page?reply_status='+status;
};
</script>
<script>
 window.onload = function() {
	var selectedkind = "${status}";
	var prd_kind = document.getElementById("reply_status");
	prd_kind.value = selectedkind;
}
</script>
</body>
</html>
