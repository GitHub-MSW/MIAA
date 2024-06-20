# 프로젝트명 : MIAA (Missing ITEM and ANIMAL Alarm)
<br/>
<p align="center">
  <img src="https://github.com/jeongmin-Lee0321/MIAA/assets/146930254/d4218bb2-2664-45b9-ab5e-673f04e784cc">
</p>
<br/>

## 프로젝트 소개
* MIAA프로젝트는 분실물과 분실동물을 찾을 때 각각 다른 사이트에서 조회해야하는 번거로움을 한사이트에서 한번에 처리할 수 있게하기 위해 기획했습니다.
* 사용자가 분실물, 분실동물 정보를 등록하면 그 게시물을 기준으로 API를 통해 매칭되는 결과를 알람 형태로 알려줍니다. 
* 사용자가 자기가 찾는것이 아닌 알람을 삭제하면 삭제된 결과는 더이상 알람으로 전송하지 않아 좀더 빠르게 찾고자 하는 것을 찾을 수 있게 도와줍니다.
<br/>

## 프로젝트 기간
* 2024.02.16~2024.04.26

| 기간 | 설명 |
| ----- | ----- |
| 2.16 ~ 2.21  | 프로젝트 제안 및 선정, 기획 |
| 2.21 ~ 3.5 | 프로젝트 기능 정의 및 ERD설계 |
| 3.5 ~ 3.11 | UI디자인 및 사용 API분석 |
| 3.11 ~ 3.18 | 홈페이지 화면 구현 |
| 3.18 ~ 4.26 | 개인 별 기능 구현 및 TEST |
| 4.26 | 프로젝트 발표 및 마무리 |
<br/>

## 팀원 및 담당역할
#### 김근영(팀장) 
* 로그인 및 회원가입 기능
* 습득물 찾기 및 수정, 삭제기능
* 실종동물 찾기 및 수정, 삭제기능
* 내정보 등록게시물 관리기능
#### 김영빈(서기)
* 페이지 화면 디자인 프론트
* Tiles 설정
* 관리자 페이지 기능
* DB설계
#### 이정민(팀원)
* 유기동물 API분석
* 유기동물 API 사용 유기동물 찾기 기능
* 회원 비밀번호 및 아이디 찾기 기능
#### 문성원(팀원)
* 페이지 화면 디자인(프론트)
* 회원정보 수정 및 회원탈퇴 기능
* 1:1 문의 게시판 기능
#### 마한슬(팀원)
* 경찰청 API분석
* 매칭 알람 기능
* 스케줄러 생성
<br/>

## 개발 환경
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/36b0e331-afea-433d-9f84-6d3def286eaf">
</p>
<br/>

## 주요 기능 및 프로세스
<p align="center">
  <img src="https://github.com/jeongmin-Lee0321/MIAA/assets/146930254/f70ac1bc-53a3-4038-b04a-ea7a859b7a39">
</p>
<br/>

## 담당 주요 기능 상세설명
 전체 영상 : https://youtu.be/tvcSdTwA2cM?si=cBgy41U-UUKb2WNl
<br/>

### [분실물 및 실종동물 검색기능]
<p align="center">
  <img src="https://github.com/jeongmin-Lee0321/MIAA/assets/146930254/aea79398-fa47-4dd4-9f35-34c5e5c60254">
</p>

* 사용자가 등록한 게시물을 검색하는 기능으로 각 조건을 선택하면 DB에 저장되어있는 데이터 중 조건에 충족하는 게시물을 출력합니다.
* 품목은 상위 카테고리를 정하면 하위 카테고리 리스트가 자동으로 가져와지게 구현했습니다.

<br/>

### [분실물 및 실종동물 게시물 등록기능]
<p align="center">
  <img src="https://github.com/jeongmin-Lee0321/MIAA/assets/146930254/616bc599-e1e3-4848-8596-58713d53bd02">
</p>

* 버스정류소를 클릭하면 해당 버스정류장 위치가 카카오맵에 마커로 표시되게 구현했습니다.

<br/>

### [분실물 및 실종동물 등록게시물 수정,삭제기능]
<p align="center">
  <img src="https://github.com/jeongmin-Lee0321/MIAA/assets/146930254/c9c7fedb-6216-4794-8760-245782c98f61">
</p>

* 행정구역 클릭 시 클릭한 행정구역의 중심좌표를 DB에서 가져와 카카오맵을 출력하고 해당 중심위치 기준 주위의 지하철역이 마커로 표시되게 구현했습니다.

<br/>

### [내정보 등록게시물 관리기능]
<p align="center">
  <img src="https://github.com/jeongmin-Lee0321/MIAA/assets/146930254/6899078b-89d8-4c55-b843-e8af1d28681c">
</p>

* 서울시 행정구역 별 탑승자 통계가 나오는 페이지입니다.
* 버스, 지하철 각각의 탑승자를 DB에서 가져와 차트 JS를 통해 구현했습니다.

<br/>

## 프로젝트 진행 소감
처음으로 프로젝트의 기획 및 구현까지 혼자서 처리해보았습니다. 처음엔 혼자라는 부담감과 결과를 만들어야하는 압박감이 있었지만 혼자서 주제를 선정하고 기능을 구현하면서 지금까지 배웠던 것들을 재확립 하고 API를 활용하여 내가 구성한 기능에 맞게 재구성 하면서 정말 많을걸 공부 할 수 있었던 시간이였습니다. 그러면서 MVC모델에 이해도가 높아지고 이 프로젝트 전 과정을 혼자서 진행하면서 끝내 잘 마무리 해 자신감도 높아지고 여러모로 뜻깊은 프로젝트였습니다.
