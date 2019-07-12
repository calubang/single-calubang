<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<!-- 네아로 설정값-->
<!-- <c:set var= "callbackUrl" value="http://localhost/single/member/callback.jsp"/> -->
<!-- <c:set var="serviceUrl" value= "http://localhost/single"/> -->
<%-- <c:set var = "callbackUrl" value = "http://${url}/single/member/callback.jsp"/> --%>
<c:set var = "callbackUrl" value = "https://localhost:8443/single/member/callback.jsp"/>
<%-- <c:set var = "serviceUrl" value = "http://${url}/single"/> --%>
<c:set var = "serviceUrl" value = "https://localhost:8443/single"/>
<c:set var = "clientId" value = "3FGMY2V_UXaBQxS0sx0g"/>


<c:if test="${sessionScope.userInfo != null }">
	<script>
// 		location.href = "/single/home";
		history.back();
	</script>
</c:if>    

<script type="text/javascript">
  $(document).ready(function(){
    //로그인
	  $('#btnLogin').click(function() {
//	 	$('#loginForm').attr("action", "${root}/member/login").attr("method", "post");

//	 	var formdata = new FormData($('#loginForm')[0]); // ->	contentType: false,
//		contentType: false, //서버에 전달하는 형식
//		processData: false,
		var formdata = $('#loginForm').serialize(); //-> contentType:"application/x-www-form-urlencoded; charset=UTF-8", //default
		console.log(formdata);
		$.ajax({
			url:"${root}/member/login",
			type: "POST",
			data: formdata,
			dataType : "json", //서버에서 반환되는 형식
			success :function(data){
				if(data.msg == '1'){
					console.log('로그인에 성공하였습니다.');
					console.log('-----loginpage');
					console.log(data);
					console.log('datareceive :'+ data.msg);
					console.log(document.referrer);
//	 				location.href= "${root}/index.jsp"
//	 				location.reload();
					history.back();
//	 				history.go();
//	 				history.forward();
				}
				if(data.msg == '0'){
					showAlertModal('로그인 실패', '아이디와 비밀번호를 확인해주세요.')
				}
				

			},error: function (){
				console.log('error')
			}
		});
	})
	
	//회원가입 버튼
	$('.registerBtn').click(function(){
		$(location).attr("href","${root}/member/emailauth");
	})
  });

</script>

<style>
html{
    min-height: 100% ;
    height: 100%;
}
body{
    height: 95%;
}

.footer{
  height: 5%;
  margin-top: 5%;
  padding-top: 0.rem!important;
}
.container{
min-height: 95%;
}
</style>


<!-- 네아로 자바스크립트-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 모달 css (이미지 참고 사이트 :  https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_login_form_modal -->
<link rel="stylesheet" href="${root}/resources/css/member/loginmodal.css" type="text/css">

<div class="container mt-4 mb-3" >
	  <form id="loginForm" >
		<h3 >우리 혼자 살아요</h3>
		<div class= "row">
			 <div class="col-2">
			 	<label class="loginmodal-label" for="userId"><b>아이디</b></label>
			 </div>
			 <div class="col-5">
				<input type="email" placeholder="아이디를 입력해주세요" name="userId"  style="font-family:돋움;" size="35" required> 
			 </div>
		</div>
		<div class= "row mt-3">
		  	<div class="col-2">
			 	<label class="loginmodal-label" for="userPassword"  ><b>비밀번호</b></label>
			</div>
			<div class="col-5">
				<input type="password" placeholder="비밀번호를 입력해주세요" name="userPassword" required style="font-family:돋움;" size="35"> 
			</div>
		</div>
		<div class= "row mt-3">
			<div class="col-5">
				<button  type="button" class = "btn btn-primary" id="btnLogin">Login</button>
				<div id="naver_id_login" style= "display:inline-block;"></div>
			</div>
		</div>
		  
		<div class ="mt-3"> <input type="checkbox"  name="remember" /> <label for="remember">아이디 기억하기</label> </div>	
				
		<div class ="mt-3">
			<a href="#" class = "registerBtn">회원가입</a>  <a href="#" >비밀번호변경</a> <a href="#">비밀번호 찾기</a>
		</div>
	</form>
</div>
<script>
<!-- 네이버 로그인 실행-->  
var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g","${callbackUrl}");
//  var naver_id_login = new naver_id_login("3FGMY2V_UXaBQxS0sx0g", "http://localhost/single/naverlogin/mvcallback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain("${serviceUrl}");
	naver_id_login.setState(state);
//	naver_id_login.setPopup(); 
	naver_id_login.init_naver_id_login();
<!-- //네이버 로그인 실행-->  
</script>

<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>