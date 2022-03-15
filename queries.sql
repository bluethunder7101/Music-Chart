--  Query 1:
--  Purpose: Shows all of the Artists, their albums and the songs on those
--  Albums.
--  Expected: A very large table that joins the Artists, Albums, and Songs
--  tables.
 SELECT
	 ARTISTS.ArtistName,
	 ALBUMS.AlbumName,
	 SONGS.SongName
 FROM
     ARTISTS
	 JOIN ALBUMS ON ALBUMS.ArtistID = ARTISTS.ArtistID
	 JOIN SONGS ON ALBUMS.AlbumID = SONGS.AlbumID;

--  Query 2:
--  Purpose: Shows any Genre with songs that is longer then 200 seconds.
--  Expected: A table of Genres with songs longer then 200 seconds and 
--  how many songs that meet this criteria.
 SELECT
 	 ALBUMS.Genre,
     COUNT(ALBUMS.AlbumName) AS "Number of albums with long songs"
 FROM
     ALBUMS
 WHERE
     ALBUMS.ArtistID = ANY (
		 SELECT
			 SONGS.ArtistID
		 FROM
		     SONGS
         WHERE
             SONGS.Seconds > 200
	)
 GROUP BY
     ALBUMS.Genre;

--  Query 3:
--  Purpose: Shows the Profile information of any user located in the USA
--  that has a favorite song that they rated 4 stars or above.
--  Expected: A table of usernames and the song that they have favorited  
--  as well as the rating they gave. Ratings should only be 4 stars and 
--  above.
 SELECT
     USERSFROMUSA.UserName,
     SONGS.SongName,
     SONGS.SongRating
 FROM
     SONGS,
     FAVORITESONGS,
		 (
         SELECT
             PROFILES.UserName,
             PROFILES.UserID
         FROM
             PROFILES
		 WHERE
			 PROFILES.Country = 'USA'
		) USERSFROMUSA
 WHERE
	 FAVORITESONGS.UserID = USERSFROMUSA.UserID
	 AND FAVORITESONGS.FSongID = SONGS.SongID
	 AND SONGS.SongRating > 4;
--  Query 4:
--  Purpose: Shows the Profile information of users that have requested 
--  a sound bite.
--  Expected: an intersected table of users that have both provided a 
--  sound bites, as long as they have provided an email and a country.
--  country and a email and the sound bite information they have requested.
 SELECT
	 UserName,
	 IRLName,
	 Email,
	 Country,
	 SongName,
     StartTime,
	 EndTIme
 FROM
	 (
     SELECT
		 *
     FROM
		 PROFILES
     WHERE
		 IRLName IS NOT NULL
	 ) USERS_WITH_IRL_NAMES
	 RIGHT JOIN REQUESTEDSOUNDBITES ON USERS_WITH_IRL_NAMES.UserID = REQUESTEDSOUNDBITES.UserID
	 RIGHT JOIN SONGS ON SONGS.SongID = REQUESTEDSOUNDBITES.SongID
 INTERSECT
 SELECT
	 UserName,
     IRLName,
	 Email,
	 Country,
	 SongName,
     StartTime,
     EndTIme
 FROM
	 (
     SELECT
		 *
     FROM
		 PROFILES
     WHERE
		 COUNTRY IS NOT NULL
	 ) USERS_WITH_COUNTRY
	 LEFT JOIN REQUESTEDSOUNDBITES ON USERS_WITH_COUNTRY.UserID = REQUESTEDSOUNDBITES.UserID
    LEFT JOIN SONGS ON SONGS.SongID = REQUESTEDSOUNDBITES.SongID;

--  Query 5:
--  Purpose: Shows profile usernames and the albums they have favorited.
--  Expected: A table with the profile usernames and the albums they have
--  favorited accompanied by the albumID.
 SELECT
	 Username,
	 AlbumName,
	 AlbumID
 FROM
	 Profiles
	 INNER JOIN FavoriteAlbums ON Profiles.UserID = FavoriteAlbums.UserID
	 INNER JOIN Albums ON FavoriteAlbums.FAlbumID = Albums.AlbumID;

--  Query 5:
--  Purpose: Shows profile usernames and the podcasts they have favorited.
--  Expected: A table with the profile usernames and the podcast creator names
--  they have favorited accompanied by the PodcastID.
 SELECT
	 Username,
	 Creator,
	 PodcastID
 FROM
	 Profiles
	 INNER JOIN FavoritePodcasts ON Profiles.UserID = FavoritePodcasts.UserID
	 INNER JOIN Podcasts ON FavoritePodcasts.FPodcastID = Podcasts.PodcastID;
 
--  Query 6:
--  Purpose: Shows profile usernames and the songs they have favorited.
--  Expected: A table with the profile usernames and the song names they
--  have favorited accompanied by the SongID.
 SELECT
	 UserName,
	 SongName,
	 SongID
 FROM
	 Profiles
	 INNER JOIN FavoriteSongs ON Profiles.UserID = FavoriteSongs.UserID
	 INNER JOIN Songs ON FavoriteSongs.FSongID = Songs.SongID;

--  Query 7:
--  Purpose: Shows profile usernames and the artists they have favorited.
--  Expected: A table with the profile usernames and the artist names they
--  have favorited accompanied by the ArtistID.
 SELECT
	 Username,
	 ArtistName,
	 ArtistID
 FROM
	 Profiles
	 INNER JOIN FavoriteArtists ON Profiles.UserID = FavoriteArtists.FAArtistID
	 INNER JOIN Artists ON FavoriteArtists.FAArtistID = Artists.ArtistID;