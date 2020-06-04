<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="{{ first_name }} {{ last_name }}">
	<meta name="description" content="Personal website for {{ first_name }} {{ last_name }}">
	<title>{{ first_name }} {{ last_name }}</title>
	<link rel="icon" type="image/x-icon" href="assets/img/favicons/favicon.ico" sizes="16x16 24x24 32x32 48x48 64x64">
	<link rel="mask-icon" href="assets/img/favicons/safari-pinned-tab.svg" color="#0078d7">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-57.png" sizes="57x57">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-60.png" sizes="60x60">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-72.png" sizes="72x72">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-76.png" sizes="76x76">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-114.png" sizes="114x114">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-120.png" sizes="120x120">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-144.png" sizes="144x144">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-152.png" sizes="152x152">
	<link rel="apple-touch-icon-precomposed" href="assets/img/favicons/favicon-180.png" sizes="180x180">
	<meta name="msapplication-TileColor" content="#0078d7">
	<meta name="msapplication-TileImage" content="assets/img/favicons/favicon-144.png">
	<meta name="application-name" content="{{ first_name }} {{ last_name }}">
	<meta name="msapplication-tooltip" content="personal website">
	<meta name="msapplication-config" content="assets/img/favicons/ieconfig.xml">
	<link rel="icon" type="image/png" href="assets/img/favicons/favicon-32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="assets/img/favicons/favicon-96.png" sizes="96x96">
	<link rel="icon" type="image/png" href="assets/img/favicons/favicon-128.png" sizes="128x128">
	<link rel="icon" type="image/png" href="assets/img/favicons/favicon-195.png" sizes="195x195">
	<link rel="icon" type="image/png" href="assets/img/favicons/favicon-196.png" sizes="196x196">
	<link rel="icon" type="image/png" href="assets/img/favicons/favicon-228.png" sizes="228x228">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/style.css"> </head>

<body>
	<main class="wrapper">
		<a href="{{ site_source_url }}" class="github-corner" aria-label="View source on Github">
			<svg width="80" height="80" viewBox="0 0 250 250" aria-hidden="true">
				<path d="M0,0 L115,115 L130,115 L142,142 L250,250 L250,0 Z"></path>
				<path d="M128.3,109.0 C113.8,99.7 119.0,89.6 119.0,89.6 C122.0,82.7 120.5,78.6 120.5,78.6 C119.2,72.0 123.4,76.3 123.4,76.3 C127.3,80.9 125.5,87.3 125.5,87.3 C122.9,97.6 130.6,101.9 134.4,103.2" fill="currentColor" style="transform-origin: 130px 106px;" class="octo-arm"></path>
				<path d="M115.0,115.0 C114.9,115.1 118.7,116.5 119.8,115.4 L133.7,101.6 C136.9,99.2 139.9,98.4 142.2,98.6 C133.8,88.0 127.5,74.4 143.8,58.0 C148.5,53.4 154.0,51.2 159.7,51.0 C160.3,49.4 163.2,43.6 171.4,40.1 C171.4,40.1 176.1,42.5 178.8,56.2 C183.1,58.6 187.2,61.8 190.9,65.4 C194.5,69.0 197.7,73.2 200.1,77.6 C213.8,80.2 216.3,84.9 216.3,84.9 C212.7,93.1 206.9,96.0 205.4,96.6 C205.1,102.4 203.0,107.8 198.3,112.5 C181.9,128.9 168.3,122.5 157.7,114.1 C157.9,116.9 156.7,120.9 152.7,124.9 L141.0,136.5 C139.8,137.7 141.6,141.9 141.8,141.8 Z" fill="currentColor" class="octo-body"></path>
			</svg>
		</a>
		<style>
		.github-corner:hover .octo-arm {
			animation: octocat-wave 560ms ease-in-out
		}

		@keyframes octocat-wave {
			0%,
			100% {
				transform: rotate(0)
			}
			20%,
			60% {
				transform: rotate(-25deg)
			}
			40%,
			80% {
				transform: rotate(10deg)
			}
		}

		@media (max-width:500px) {
			.github-corner:hover .octo-arm {
				animation: none
			}
			.github-corner .octo-arm {
				animation: octocat-wave 560ms ease-in-out
			}
		}
		</style>
		<div class="navbar">
			<ul>
				<li> <a href="{{ resume_url }}">resume</a> </li>
			</ul>
		</div>
		<div class="container center-child">
			<div class="hero"> <img src="{{ profile_url }}"> </div>
		</div>
		<div class="container center-child hug-bottom hug-top">
			<div class="hero">
				<div class="container center-child hug-top"> <span class="badge badge-blue">Currently Looking</span> </div>
				<p>{{ introduction }}</p>
			</div>
		</div>
		<div class="container center-child hug-top hug-bottom">
			<ul class="social">
				<li>
					<a href="{{ twitter_url }}" class="social-icon"> <i class="fa fa-twitter"></i></a>
				</li>
				<li>
					<a href="{{ github_url }}" class="social-icon"> <i class="fa fa-github"></i></a>
				</li>
				<li>
					<a href="{{ linkedin_url }}" class="social-icon"> <i class="fa fa-linkedin"></i></a>
				</li>
			</ul>
		</div>
		<div class="container center-child hug-top">
			<p>{{ footer }}</p>
		</div>
	</main>
</body>

</html>
