<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet" href="resources/css/admin_inquiry_list_page.css" />
</head>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});
function deleteValue(){
	var url = "delete";    // Controller로 보내고자 하는 URL
	var valueArr = new Array();
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length == 0){
    	alert("선택된 글이 없습니다.");
    }
    else{
		var chk = confirm("정말 삭제하시겠습니까?");
		
		if(chk)
			{
		$.ajax({
		    url : url,                    // 전송 URL
		    type : 'POST',                // POST 방식
		    traditional : true,
		    data : {
		    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                    alert("삭제 성공");
                    location.replace("mypage_customer_inquiry_list_page") //페이지 새로고침
                }
                else{
                    alert("삭제 실패");
                }
            }
		});
			}
		else{
			alert("삭제 취소");
		}
	}
}
</script>
<body>
	<div class="main-body">

		<!-- main -->

		<div class="content-wrapper">
			<!-- 검색창과 검색결과 -->
			<div class="searchbar-container">
				<form action="admin_inquiry_list_page" id="inquiry-form">
					<!-- 서치바 셀렉 그룹시작 -->
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>기간</span>
						</div>
						<div class="searchbar-content">
							<input type="date" name="START_YMD" id="START_YMD"
							<c:if test="${search ne null}">value="${search.START_YMD }"</c:if>> <span>~</span>
							<input type="date" name="END_YMD" id="END_YMD"
							<c:if test="${search ne null}">value="${search.END_YMD }"</c:if>>
							<div class="form-date-btn" id="date-today">
								<div class="div-placeholder">
									<div class="div">오늘</div>
								</div>
							</div>
							<div class="form-date-btn" id="date-1week">
								<div class="div-placeholder">
									<div class="div">1주일</div>
								</div>
							</div>
							<div class="form-date-btn" id="date-1month">
								<div class="div-placeholder">
									<div class="div">1개월</div>
								</div>
							</div>
							<div class="form-date-btn" id="date-3month">
								<div class="div-placeholder">
									<div class="div">3개월</div>
								</div>
							</div>
							<div class="form-date-btn" id="date-6month">
								<div class="div-placeholder">
									<div class="div">6개월</div>
								</div>
							</div>
							<div class="form-date-btn" id="date-all">
								<div class="div-placeholder">
									<div class="div">전체</div>
								</div>
							</div>
						</div>
					</div>

					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>답변유무</span>
						</div>
						<div class="searchbar-content">
							<select name="reply_status" id="reply_status">
								<option value="all" 
								<c:if test="${search.reply_status eq 'all'}">selected</c:if>>전체</option>
								<option value="ing" 
								<c:if test="${search.reply_status eq 'ing'}">selected</c:if>>처리중</option>
								<option value="done" 
								<c:if test="${search.reply_status eq 'done'}">selected</c:if>>답변완료</option>
							</select>
						</div>
					</div>

					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<select name="search_type" id="search_type">
								<option value="title"
								<c:if test="${search.search_type eq 'title'}">selected</c:if>>제목</option>
								<option value="user" 
								<c:if test="${search.search_type eq 'user'}">selected</c:if>>문의자</option>
								<option value="admin" 
								<c:if test="${search.search_type eq 'admin'}">selected</c:if>>답변자</option>
							</select>
						</div>
						<div class="searchbar-content">
							<input type="search" name="search_content" id="search_content" style="min-width: 300px;">
						</div>
					</div>

					<!-- form 조회용 버튼 -->
					<div class="search-btn-block">
						<button type="submit" form="inquiry-form">
							조회<img src="resources/img/searchIcon.png" alt="">
						</button>
						<button class="reset">
							<div class="div">초기화</div>
						</button>
					</div>
				</form>
			</div>
			<!-- 검색창과 검색결과 끝 -->
			<div class="content-container">
				<div class="table-caption-wrapper">
					<div class="talbe-caption-container">
						<div class="table-caption">
							<span class="caption-total">${pageVo.totRow}개</span><span>의
								문의내역이 있습니다</span>
						</div>
					</div>
					<div class="list-control-container">
						<button class="btn-list" id="btn-delete" onclick="deleteValue();"
							style="cursor: pointer;">삭제하기</button>
					</div>

				</div>
				<table class="info-table">
					<tr>
						<th><span><input type="checkbox" name="allCheck"
								id="allCheck" class="table-check-box"></span></th>
						<th><span>글번호</span></th>
						<th class="table-title"><span>제목</span></th>
						<th><span>문의자</span></th>
						<th><span>처리상태</span></th>
						<th><span>문의 날짜</span></th>
						<th><span>답변 날짜</span></th>
						<th><span>답변자</span></th>

					</tr>

					<c:forEach items="${list }" var="list">
						<tr>
							<td><input type="checkbox" name="RowCheck"
								value="${list.userInquiry.board_num}" class="table-check-box"></td>
							<td>${list.userInquiry.board_num}</td>
							<td class="table-title">${list.userInquiry.board_title}</td>
							<td>${list.userInquiry.user_id}</td>
							<td>${list.userInquiry.board_reply_status}</td>
							<td>${list.userInquiry.board_registration_date}</td>
							<td>${list.board_reply }</td>
							<td>${list.admin_id }</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>

		<!-- page -->

		<div class="result-container">
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span><span class="current-page">${pageVo.page}</span><span>of</span><span
						class="total-page">${pageVo.totPage}</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}-1)"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
					<c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq pageVo.page}">
								<li><span class="currpage">${i}</span></li>
							</c:when>
							<c:otherwise>
								<li><a href="javascript:void(0);" onclick="goToPage(${i})">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}+1)"><img
							src="resources/img/chevron-left.png" alt=""></a></li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}-10)">Previous</a></li>
					<li class="btn-next-group"><a href="javascript:void(0);"
						onclick="goToPage(${pageVo.page}+10)">Next</a></li>
				</ul>
			</div>
		</div>

	</div>
	<script>
		function goToPage(pageNumber) {
			var currpage = pageNumber;
			if (pageNumber<=0){
				currpage = 1;
			}else if(currpage>${pageVo.totPage}){//현재페이지가 총페이지보다 클경우 현재페이지 = 총페이지 
				currpage = ${pageVo.totPage};
			}
			else if(currpage>${pageVo.pageEnd}){//페이지 표시갯수인 10이 넘을때는 해당 페이지리스트의 1번으로 가게함
				currpage= pageNumber-(pageNumber-1)%10;
			}
			else if(currpage<${pageVo.pageStart}){//-10page 버튼누를시 -10 말고 이전 페이지리스트의 10번으로 가게함
				currpage= pageNumber-((pageNumber-1)%10)+9;
			}
			var newPath = window.location.pathname + '?currPage=' + currpage;
			
		    // inquiry-form의 모든 매개변수를 가져와서 URL에 추가
		    var form = document.getElementById("inquiry-form");
		    var formData = new FormData(form);
		    formData.append('currPage', currpage); // currPage를 추가
		    for (var pair of formData.entries()) {
		        newPath += '&' + pair[0] + '=' + pair[1];
		    }
		    
			window.location.href = newPath; // 새 경로로 페이지 이동
			
		}
	</script>
	<!-- 날짜 제한 -->
	<script>
					var now_utc = Date.now() // 지금 날짜를 밀리초로
					// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
					var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
					// new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
					var today = new Date(now_utc - timeOff).toISOString()
							.split("T")[0];
					var today2 = new Date(now_utc - timeOff)//.getFullYear()등을 쓰기위한 today2
		$(document).ready(
				function() {//로드완료시
					document.getElementById("START_YMD").setAttribute("max",
							today); //시작날짜 최대값 오늘날짜로 제한
					document.getElementById("END_YMD").setAttribute("max",
							today);//종료날짜 오늘날짜로 제한
				});
 /*날짜선택버튼*/
	document.getElementById('date-today').addEventListener('click', function() {
	    document.getElementById('START_YMD').value = today;
	    document.getElementById('END_YMD').value = today;
	});

	document.getElementById('date-1week').addEventListener('click', function() {
	    const lastWeek = new Date(today2.getFullYear(), today2.getMonth(), today2.getDate() - 7);
	    document.getElementById('START_YMD').value = lastWeek.toISOString().substring(0, 10); // 일주일 전 날짜
	    document.getElementById('END_YMD').value = today.toISOString().substring(0, 10); // 오늘 날짜
	});

	document.getElementById('date-all').addEventListener('click', function() {
	    document.getElementById('START_YMD').value = ""; // 입력 필드를 비웁니다
	    document.getElementById('END_YMD').value = ""; // 입력 필드를 비웁니다
	});
	
	document.getElementById('date-1month').addEventListener('click', setPastDate.bind(null, 1));
	document.getElementById('date-3month').addEventListener('click', setPastDate.bind(null, 3));
	document.getElementById('date-6month').addEventListener('click', setPastDate.bind(null, 6));

	function setPastDate(months) {
	    const pastDate = new Date(today2.getFullYear(), today2.getMonth() - months, today2.getDate());
	    document.getElementById('START_YMD').value = pastDate.toISOString().substring(0, 10);
	    document.getElementById('END_YMD').value = today2.toISOString().substring(0, 10);
	}
	</script>
	
</body>
</html>