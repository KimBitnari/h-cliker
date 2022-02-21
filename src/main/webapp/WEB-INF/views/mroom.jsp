<!DOCTYPE html>
<html lang="en" class="mdc-typography">
<head>
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>만든 방</title>

<!-- app bar -->
<link rel='stylesheet'
	href='https://unpkg.com/material-components-web@latest/dist/material-components-web.css'>
<link rel='stylesheet'
	href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<link rel="stylesheet" href="/resources/appbar.css">
<!-- poll -->
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/resources/poll.css">
<!-- custom -->
<link rel="stylesheet" href="/resources/css/timer.css">
<link rel="stylesheet" href="/resources/css/modal.css">
<link rel="stylesheet" href="/resources/css/clicker.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>
* {box-sizing: border-box;}
.column {
	float: left;
	width: 30%;
	padding: 10px;
	margin-left:2rem;
}
.row:after {
	content: "";
	display: table;
	clear: both;
}
.parent {
	display: flex;
	width: 100%;
}
.question {width: 80%; display: inline-block}
.status {
	background-color: lightblue;
	font-weight: bold;
	border-radius: 10px;
	width: 20%;
	text-align: center;
	height: 10%;
}
.status_f {
	background-color: lightgrey;
	font-weight: bold;
	border-radius: 10px;
	width: 20%;
	text-align: center;
	height: 10%;
}
.end {
	font-weight: bold;
	text-align: center;
	background:none;
	border:none;
	float:right;
	margin-top:4%;
}
.top {
	display: flex;
	width: 97%;
}
#modal_btn, .make {
	border: 2px solid lavender;
	border-radius: 50px;
	padding: 5px 20px 5px 20px;
	font-weight: bold;
	background: white;
	margin-left: 5px;
	font-size: 12px';
}
.make:hover {background: lavender;}
#modal_btn:hover {background: lavender;}
.code {padding: 1px 13px 1px 13px; border:1.5px solid white; border-style: none none double none; font-size:16px;}
@media screen and (max-width: 600px) {
	.column {width: 100%; margin-left:0rem;}
	.poll-card{ width: 100%;}
	.make{width: 20%; font-size:3px;}
	#modal_btn{width: 30%; font-size:3px;}
	.modal_wrap{width: 80%; top: 18%; left:74%; }
	.room_title{font-size:15px;}
	.code{font-size:12px;}
}
</style>
<script>
	window.onload = function() {

		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';
		}
		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
		}

		document.getElementById('modal_btn').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click', offClick);

	};
</script>
</head>

<body>
	<!-- partial:index.partial.html -->
	<!-- Top App Bar -->
	<header class="mdc-top-app-bar" style="background: #6c64a3;">
		<div class="mdc-top-app-bar__row">
			<section
				class="mdc-top-app-bar__section mdc-top-app-bar__section--align-start">
				<button
					class="mdc-top-app-bar__navigation-icon mdc-icon-button material-icons"
					href="#">
					<span class="material-icons">menu</span>
				</button>
				<a class="mdc-top-app-bar__title room_title" style="color: inherit;">${roomDetail.room_name} - ${roomDetail.md_user}</a>
			</section>
			<section class="mdc-top-app-bar__section mdc-top-app-bar__section--align-end" role="toolbar">
				<p class="mdc-top-app-bar__title user code">방 입장코드: ${roomDetail.code}</p>	
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
						<span class="material-icons mdc-list-item__graphic">code</span>${roomDetail.code}</a> 
						<a class="mdc-list-item demo-drawer-list-item" href="/mroom/${roomDetail.room_id}/dash_professor"> 
						<span class="material-icons mdc-list-item__graphic">favorite</span>자료실</a> 
						<a class="mdc-list-item demo-drawer-list-item" href="./main">
						<span class="material-icons mdc-list-item__graphic">exit_to_app</span>방 나가기</a>
						<hr class="mdc-list-divider">
						<a class="mdc-list-item demo-drawer-list-item" href='/delete/${roomDetail.room_id}'>
						<span class="material-icons mdc-list-item__graphic">delete</span>방 파기</a>
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
				<button type='button' id="modal_btn">새로운 투표 생성하기</button>
			</div>
			<div class="black_bg"></div>
			<div class="modal_wrap">
				<div class="modal_close">
					<a href="/mroom">close</a>
				</div>

				<div>
					<form action="index.html" method="post" id="form">
						<p class="ex">투표 제목을 입력하세요.</p>
						<fieldset>
							<input class="marg" type="text" name="name" id="poll_title" />
							<hr>
							<!-- card -->
							<p class="ex">투표 타입을 선택하세요.</p>
							<div class="flex-container merg">
								<div class="card card-1" id="yes" style="height: auto; padding: 15px;">yes/no</div>
								<div class="card card-1" id="abc" style="height: auto; padding: 15px;">a,b,c</div>
								<div class="card card-1" id="onetwo" style="height: auto; padding: 15px;">1,2,3</div>
								<div class="card card-1" id="textt" style="height: auto; padding: 15px;">text</div>
							</div>
							<!-- dynamic add -->
							<div class="form-group merg">
								<form name="add_name" id="add_name form">
									<div class="table-responsive">
										<table class="table1 table-bordered merg" id="dynamic_field">

										</table>
									</div>
								</form>
							</div>

							<!-- timer -->
							<hr>
							<p class="ex">시간을 설정하세요.</p>
							<div class="time-bg merg">
								<div class="time-title">타이머</div>
								<div class="time-form">
									<input class="marg" type="number" min="00" max="24"
										name="hours" size="2" maxlength="2" placeholder='hh'>
									: <input class="marg" type="number" min="00" max="59"
										name="minutes" size="2" maxlength="2" placeholder='mm'>
									: <input class="marg" type="number" min="00" max="59"
										name="seconds" size="2" maxlength="2" placeholder='ss'>
								</div>
							</div>
							<input type="button" name="submit" id="submit"
								class="btn btn-info merg marg" value="Submit" />
						</fieldset>
						
					</form>
				</div>
			</div>
			<div class="row">
				<div class="column">
					<div class="poll-card">
						<div class="parent">
							<p class="question">poll</p>
							<p class="status">진행중</p>
						</div>
						<div class="options">
							<div class="option option-1">
								<div class="analytic">
									<div class="bar"></div>
									<div class="percent">50%</div>
								</div>
								<div class="input">
									<input type="radio" id="option-1" name="option" hidden>
									<label for="option-1">Yes&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i>
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
									<label for="option-2">No&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i></label>
								</div>
							</div>
						</div>
							<button class="end">투표종료</button>
					</div>
				</div>
				<div class="column">
					<div class="poll-card">
						<div class="parent">
							<p class="question" style="display: inline-block">poll</p>
							<p class="status">진행중</p>
						</div>
						<div class="options">
							<div class="option option-1">
								<div class="analytic">
									<div class="bar"></div>
									<div class="percent">50%</div>
								</div>
								<div class="input">
									<input type="radio" id="option-1" name="option" hidden>
									<label for="option-1">Yes&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i>
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
									<label for="option-2">No&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i></label>
								</div>
							</div>
						</div>
							<p class="timer"><span class="material-icons">timer</span>00:01:00</p>
					</div>
				</div>
				<div class="column">
					<div class="poll-card">
						<div class="parent">
							<p class="question" style="display: inline-block">poll</p>
							<p class="status_f">종료</p>
						</div>

						<div class="options">

							<div class="option option-1">
								<div class="analytic">
									<div class="bar"></div>
									<div class="percent">50%</div>
								</div>
								<div class="input">
									<input type="radio" id="option-1" name="option" hidden>
									<label for="option-1">Yes&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i>
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
									<label for="option-2">No&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i></label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="poll-card">
						<div class="parent">
							<p class="question" style="display: inline-block">poll</p>
							<p class="status_f">종료</p>
						</div>

						<div class="options">

							<div class="option option-1">
								<div class="analytic">
									<div class="bar"></div>
									<div class="percent">50%</div>
								</div>
								<div class="input">
									<input type="radio" id="option-1" name="option" hidden>
									<label for="option-1">Yes&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i>
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
									<label for="option-2">No&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i></label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="poll-card">
						<div class="parent">
							<p class="question" style="display: inline-block">poll</p>
							<p class="status_f">종료</p>
						</div>

						<div class="options">

							<div class="option option-1">
								<div class="analytic">
									<div class="bar"></div>
									<div class="percent">50%</div>
								</div>
								<div class="input">
									<input type="radio" id="option-1" name="option" hidden>
									<label for="option-1">Yes&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i>
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
									<label for="option-2">No&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i></label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="poll-card">
						<div class="parent">
							<p class="question" style="display: inline-block">poll</p>
							<p class="status_f">종료</p>
						</div>

						<div class="options">

							<div class="option option-1">
								<div class="analytic">
									<div class="bar"></div>
									<div class="percent">50%</div>
								</div>
								<div class="input">
									<input type="radio" id="option-1" name="option" hidden>
									<label for="option-1">Yes&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i>
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
									<label for="option-2">No&nbsp;<i
										class="fa fa-check tick" aria-hidden="true"></i></label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<!-- app bar -->
	<script src='https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js'></script>
	<script src="/resources/appbar.js"></script>
	<!-- poll -->
	<script src="/resources/poll.js"></script>
	<!-- Custom JS -->
	<script src="/resources/js/timer.js"></script>
	<!-- modal -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
	<script>
		$(document)
				.ready(
						function() {
							var i = 1;

							function getTimeStamp() {
								var d = new Date();

								var s = leadingZeros(d.getFullYear(), 4) + '-'
										+ leadingZeros(d.getMonth() + 1, 2)
										+ '-' + leadingZeros(d.getDate(), 2)
										+ ' ' +

										leadingZeros(d.getHours(), 2) + ':'
										+ leadingZeros(d.getMinutes(), 2) + ':'
										+ leadingZeros(d.getSeconds(), 2);

								return s;
							}

							function leadingZeros(n, digits) {
								var zero = '';
								n = n.toString();

								if (n.length < digits) {
									for (i = 0; i < digits - n.length; i++)
										zero += '0';
								}

								return zero + n;
							}

							$('#poll_title').val(getTimeStamp());

							$("#poll_title").on("click", function() {
								$(this).select();
							});

							//abc
							$('#abc')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><center><button type="button" name="add" id="adda" class="btn btn-success form_btn" style="border-radius: 50px; width: 60%;">+</button></center></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" value="a" class="form-control name_list marg" readonly /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" value="b" class="form-control name_list marg" readonly /></td></tr>');
												
												
											});

							//yes
							$('#yes')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" value="yes" class="form-control name_list marg" readonly /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" value="no" class="form-control name_list marg" readonly /></td></tr>');
											});

							//onetwo
							$('#onetwo')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><center><button type="button" name="add" id="addo" class="btn btn-success form_btn" style="border-radius: 50px; width: 60%;">+</button></center></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" value="1" class="form-control name_list marg" readonly /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" value="2" class="form-control name_list marg" readonly /></td></tr>');
												

											});

							//textt
							$('#textt')
									.click(
											function() {
												while (i > 1) {
													$('#row' + i + '').remove();
													i--;
												}
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><center><button type="button" name="add" id="addt" class="btn btn-success form_btn" style="border-radius: 50px; width: 60%;">+</button></center></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" placeholder="Enter the text" class="form-control name_list marg" /></td></tr>');
												i++;
												$('#dynamic_field')
														.append(
																'<tr id="row'+i+'"><td><input type="text" name="name[]" placeholder="Enter the text" class="form-control name_list marg" /></td></tr>');
												
											});

							

							$(document).on('click', '#adda', function() {
								var vala = String.fromCharCode(97+i-2);
								i++;
								$('#dynamic_field')
										.append(
												'<tr id="row'+i+'"><td><input type="text" name="name[]" value="'+vala+'" class="form-control name_list marg" readonly /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove form_btn1">-</button></td></tr>');
							});

							$(document).on('click', '#addo', function() {
								var valo = i-1;
								i++;
								$('#dynamic_field')
										.append(
												'<tr id="row'+i+'"><td><input type="text" name="name[]" value="'+valo+'" class="form-control name_list marg" readonly /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove form_btn1">-</button></td></tr>');
							});

							$(document).on('click', '#addt', function() {
								i++;
								$('#dynamic_field')
										.append(
												'<tr id="row'+i+'"><td><input type="text" name="name[]" placeholder="Enter the text" class="form-control name_list marg" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove form_btn1">-</button></td></tr>');
							});

							$(document).on('click', '.btn_remove', function() {
								var button_id = $(this).attr("id");
								$('#row' + button_id + '').remove();
							});

							$('#submit').click(function() {
								$.ajax({
									url : "name.php",
									method : "POST",
									data : $('#add_name').serialize(),
									success : function(data) {
										alert(data);
										$('#add_name')[0].reset();
									}
								});
							});

						});
	</script>

</body>
</html>