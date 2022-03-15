<?php require_once('config.php');
 ?>

<!-- TCSS 445 : Autumn 2020 -->
<!-- Assignment 4 Template -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Music Chart</title>
        <!-- add a reference to the external stylesheet -->
        <link rel="stylesheet" href="https://bootswatch.com/4/lux/bootstrap.min.css">
    </head>

<body>
	<!-- START -- Add HTML code for the top menu section (navigation bar) -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container-fluid">
        <a class="navbar-brand"><img id="charted-logo" src="charted-1.png"width="100px" height="100px" ></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
		<!-- Creates Navigation bar -->
        <div class="collapse navbar-collapse" id="navbarColor01">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link active" href="index.php">Home
                <span class="visually-hidden"></span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contents.php">Contents</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="longersongs.php">Genres With Longer Songs</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="usersfourplussongs.php">Users With 4+ Rated Songs</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="requestedsoundbites.php">Users Who Have Requested Soundbytes</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="numberofalbumsperartist.php">Number of Albums Per Artists</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="userfavoritealbums.php">Users Favorited Albums</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="usersfavoritepodcast.php">Users Favorited Podcasts</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="usersfavoritesongs.php">Users Favorited Songs</a>
            </li>
			<li class="nav-item">
              <a class="nav-link" href="usersfavoritedartists.php">Users Favorited Artists</a>
            </li>
            <li class="nav-item">
              <a class="btn btn-outline-light" href="login.php">Login</a>
            </li>
          </ul>
			</div>
		</div>
    	</nav>
    <!-- END -- Add HTML code for the top menu section (navigation bar) -->
	<div >
	<!-- Home page messages -->
  <div class="d-flex justify-content-center align-items-center container ">

      <a href="">
        <img  src="favsongs.png" width="250px" height="250px">
     </a>

     <a href="">
        <img  src="favartist.png" width="250px" height="250px">
     </a>

      <a href="">
         <img  src="favalbums.png" width="250px" height="250px">
      </a>

      <a href="">
         <img  src="favpodcasts.png" width="250px" height="250px">
      </a>

  </div>
</div>
</div>
</body>
</html>