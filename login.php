<?php require_once('config.php'); ?>
<!-- TCSS 445 : Autumn 2020 -->
<!-- Assignment 4 Template -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Assignment 4 Demo</title>
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
      <a class="nav-link" href="index.php">Home
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
  <?php
  $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);
  if ( mysqli_connect_errno() )
  {
    die( mysqli_connect_error() );

  }

  if(isset($_POST['submit'])) {
    $sql = mysqli_query($connection,
    "SELECT * FROM Profiles WHERE username='"
    . $_POST["UserName"] . "' AND
    Password='" . $_POST["Password"] . "'    ");

    $num = mysqli_num_rows($sql);

    if($num > 0) {
        $row = mysqli_fetch_array($sql);
        header("location:userpage.php");
        exit();
    }
    else {
?>
<hr>
<font class="d-flex justify-content-center align-items-center container"; color="red"><b>
        <h3>Sorry Invalid Username and Password</h3>
    </b>
</font>
<hr>

<?php
      }
}
?>
  ?>


    <div class="d-flex justify-content-center align-items-center container ">
    <form action="login.php" method="post">
    <fieldset>
      <legend>Login</legend>
      <div class="form-group">
        <label class="col-form-label mt-4" for="inputDefault">User Name</label>
        <input type="text" class="form-control" placeholder="UserName" name="UserName">
      </div>
      <div class="form-group">

        <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
        <input type="Password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="Password">
      </div>
      <button type="submit" name="submit" class="btn btn-primary" value="Login">Submit</button>
    </fieldset>

        </form>
	</div>
</div>
</body>
</html>
