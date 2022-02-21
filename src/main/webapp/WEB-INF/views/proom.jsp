<!DOCTYPE html>
<html lang="en" class="mdc-typography">
<head>
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>참여 방</title>

<!-- app bar -->
<link rel='stylesheet' href='https://unpkg.com/material-components-web@latest/dist/material-components-web.css'>
<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<link rel="stylesheet" href="/resources/appbar.css">
<!-- poll -->
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/resources/poll.css">
<!-- custom -->
<link rel="stylesheet" href="/resources/css/timer.css">
<link rel="stylesheet" href="/resources/css/modal.css">
<link rel="stylesheet" href="/resources/css/clicker.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>
* {
  box-sizing: border-box;
}
.top{display: flex; width:97%;}
#modal_btn , .make{
	border: 2px solid lavender;
	border-radius: 50px;
	padding: 5px 20px 5px 20px;
	font-weight: bold;
	background: white;
	margin-left:5px;
	font-size:12px';
}
.make:hover { background: lavender; }
#modal_btn:hover { background: lavender; }
.code {padding: 1px 13px 1px 13px; border:1.5px solid white; border-style: none none double none; font-size:16px;}
@media screen and (max-width: 600px) {
	.code{font-size:12px;}
	.room_title{font-size:15px;}
}

</style>
</head>

<body>
<!-- Top App Bar -->
<header class="mdc-top-app-bar" style="background: #6c64a3;">
		<div class="mdc-top-app-bar__row">
			<section
				class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
				<button class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons">
					<span class="material-icons">menu</span>
				</button>
				<a class="mdc-top-app-bar__title room_title" style="color: inherit;">${read.room_name} - ${read.md_user}</a>
			</section>
			<section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
				<p class="mdc-top-app-bar__title user code">방 입장코드: ${read.code}</p>	
      		</section>
		</div>
	</header>

<div class="app-drawer-layout mdc-top-app-bar--fixed-adjust">
  <!-- Drawer -->

  <aside class="mdc-drawer mdc-drawer--dismissible demo-drawer">
			<nav class="mdc-drawer__drawer">
				<nav class="mdc-drawer__content">
					<div id="icon-with-text-demo" class="mdc-list">
						<a class="mdc-list-item mdc-list-item--selected demo-drawer-list-item">
						<span class="material-icons mdc-list-item__graphic">code</span>${read.code}</a> 
						<a class="mdc-list-item demo-drawer-list-item" href="./dash_student"> 
						<span class="material-icons mdc-list-item__graphic">favorite</span>자료실</a> 
						<a class="mdc-list-item demo-drawer-list-item" href="./main">
						<span class="material-icons mdc-list-item__graphic">exit_to_app</span>방 나가기</a>
					
					</div>
				</nav>
			</nav>
   </aside>

  <!-- Content -->
  <main class="mdc-drawer-app-content main-content">
  <div class="top">
				<button type='button' class="make" style="background: lavender;">모든 투표</button>
				<button type='button' class="make">진행중인 투표</button>
				<button type='button' class="make">종료된 투표</button>
  </div>
  <div class="row">
  
  <c:forEach items="${readSurvey}" var="surveyList">
  <div class="column" >
    <div class="poll-card">
    <div class="parent">
			<p class="question" style="display:inline-block">
				${surveyList.survey_name}
			</p>
			<p class="status">${surveyList.status}</p>
			</div>

			<div class="options">

				<div class="option option-1">
					<div class="analytic">
						<div class="bar"></div>
						<div class="percent">50%</div>
					</div>
					<div class="input">
						<input type="radio" id="option-1" name="option" hidden>
						<label for="option-1">Yes&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i>
						</label>
					</div>

				</div>

				<div class="option option-2">
					<div class="analytic">
						<div class="bar"></div>
						<div class="percent">50%</div>
					</div>
					<div class="input">
						<input type="radio" id="option-2" name="option" hidden>
						<label for="option-2">No&nbsp;<i class="fa fa-check tick" aria-hidden="true"></i></label>
					</div>
				</div>
			</div>
		</div>
  </div>
  </c:forEach>
</div>
  </main>
 
</div>
 
<!-- app bar -->
<script src='https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js'></script>
<script  src="/resources/appbar.js"></script>
<!-- poll -->  
<script  src="/resources/poll.js"></script>
</body>
</html>
