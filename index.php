<!-- TCSS 445 : Autumn 2020 --> 
<!-- Project Phase 3 Script to display home page --> 
<!-- James Morimoto, Brandon Rosario, Lynda Tanielu, Eyob Fenta-->
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
              <a class="nav-link" href="favoritedartistsbyuser.php">Favorited Artists By User</a>
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
              <a class="btn btn-outline-light" href="#">Login</a>
            </li>
          </ul>
			</div>
		</div>
    	</nav>
    <!-- END -- Add HTML code for the top menu section (navigation bar) --> 
	<div class="jumbotron"> 
	<!-- Home page messages -->
        <h1 class="display-3">Welcome to Music Chart!</h1> 
        <p class="lead">You can use this website to view various artists, songs, and albums and keep track of your favorites! To get started look to the top of the page and use the navigation bar.<p> 
        <hr class="my-4"> 
        <p>It uses MySQL DBMS and PHP to retrieve data from the database</p> 
        <p class="lead"> 
			<a class="btn btn-primary btn-lg" href="#" role="button">Thank you for visiting!</a> 
        </p> 
</div> 
</body> 
</html> 