<?php require_once('config.php'); ?>
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
          <!--  <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Separated link</a>
              </div>
            </li> -->
          </ul>
    			</div>
    		</div>
    	</nav>
    <!-- END -- Add HTML code for the top menu section (navigation bar) --> 
	<div class="jumbotron"> 
		<form action="contents.php">      
			<p>&nbsp;</p> 
            <table class="table table-hover"> 
                <thead> 
                    <tr class="table-success"> 
                        <th scope="col" style="background-color:#1a1a1a; color:#8d8b86">UserID </th> 
                        <th scope="col" style="background-color:#1a1a1a; color:#8d8b86">User Name</th> 
						<th scope="col" style="background-color:#1a1a1a; color:#8d8b86">Name</th> 
                        <th scope="col" style="background-color:#1a1a1a; color:#8d8b86">Email</th>
						<th scope="col" style="background-color:#1a1a1a; color:#8d8b86">Country</th>
						<th scope="col" style="background-color:#1a1a1a; color:#8d8b86">Artist ID</th>
						<th scope="col" style="background-color:#1a1a1a; color:#8d8b86">Artist Name</th>
						<th scope="col" style="background-color:#1a1a1a; color:#8d8b86">Artist Rating</th>
                    </tr>
                </thead> 
                <?php 
					$connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME);				
					if ( mysqli_connect_errno() )  
					{	 
						die( mysqli_connect_error() );   
					}	 
					$sql = "SELECT
								UserID,
								UserName,
								IRLName,
								Email,
								Country,
								ArtistID,
								ArtistName,
								ArtistRating
							FROM
								PROFILES 
								LEFT OUTER JOIN FAVORITEARTISTS ON PROFILES.UserID = FAVORITEARTISTS.FAUserID
								LEFT OUTER JOIN ARTISTS ON ARTISTS.ArtistID = FAVORITEARTISTS.FAArtistID"; 
 
                  if ($result = mysqli_query($connection, $sql))  
                  { 
                      while($row = mysqli_fetch_assoc($result)) 
                      { 
              ?> 
                <tr> 
                    <td><?php echo $row['UserID'] ?></td> 
                    <td><?php echo $row['UserName'] ?></td> 
                    <td><?php echo $row['IRLName'] ?></td>
					<td><?php echo $row['Email'] ?></td>
					<td><?php echo $row['Country'] ?></td>
					<td><?php echo $row['ArtistID'] ?></td>
					<td><?php echo $row['ArtistName'] ?></td>
					<td><?php echo $row['ArtistRating'] ?></td>
                </tr> 
                <?php 
                      } 
                      // release the memory used by the result set 
                      mysqli_free_result($result);  
                  }    
              ?> 
            </table>     
        </form> 
</div> 
</body> 
</html> 