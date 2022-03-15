/*  
 ***********************************************************************
 Project Phase II
 Group 4 (LiveSQL)
 This SQL Script was tested on Oracle LiveSQL. To run, simply load this 
 script file and run.
 ***********************************************************************`
 */
--
--  ***********************************************************************
--  PART A
--  ***********************************************************************
-- 	Creation of DATABASE
DROP DATABASE IF EXISTS `musicstore`;
CREATE DATABASE if NOT EXISTS `musicstore`;
USE `musicstore`;

--  Table that stores the music artists in our database. 
--  Must have ArtistID (PrimaryKey) and ArtistName.
--  An optional ArtistRating can be included but must have a value between
--  1 and 5.
CREATE TABLE Artists (
  ArtistID INT NOT NULL,
  ArtistName VARCHAR(20) NOT NULL,
  ArtistRating DECIMAL(3, 2) CHECK (ArtistRating >= 1 AND ArtistRating <= 5),
  PRIMARY KEY (ArtistID)
);

--  Table that stores the music album in our database. 
--  Must have AlbumID (PrimaryKey) and AlbumName.
--  A Genre may be included, if not added a default value of UNKNOWN will 
--  be added.
--  An optional AlbumRating can be included but must have a value between 
--  1 and 5.
--  This table references the ARTISTS table and each tuple must include a
--  foreign key of the ArtistID associated with the album.
CREATE TABLE Albums (
  AlbumID INT NOT NULL,
  AlbumName VARCHAR(30) NOT NULL,
  Genre VARCHAR(30) DEFAULT 'UNKNOWN',
  Year INT NOT NULL,
  AlbumRating DECIMAL(3, 2) CHECK(
    AlbumRating >= 1
    AND AlbumRating <= 5
  ),
  ArtistID INT NOT NULL,
  PRIMARY KEY (AlbumID),
  FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID) ON DELETE CASCADE
);

--  Table that stores the music songs in our database. 
--  Must have SongID (PrimaryKey), SongName, and Seconds values.
--  An optional SongRating can be included but must have a value 
--  between 1 and 5.
--  This table references the ARTISTS and ALBUMS table and each tuple
--  must include foreign keys of the ArtistID and AlbumID associated
--  with the artist or album respectively.
CREATE TABLE Songs (
  SongID INT NOT NULL,
  Seconds INT NOT NULL,
  SongName VARCHAR(20) NOT NULL,
  SongRating DECIMAL(3, 2) CHECK(
    SongRating >= 1
    AND SongRating <= 5
  ),
  ArtistID INT NOT NULL,
  AlbumID INT NOT NULL,
  PRIMARY KEY (SongID),
  FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID) ON DELETE CASCADE,
  FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID) ON DELETE CASCADE
);

--  Table that stores the user profiles in our database. 
--  Must have UserID (PrimaryKey) and a UserName.
--  Optional values of Email, Country, and IRLName can be provided if 
--  the user wishes. If not the values will default to "Choose not to
--  list".
CREATE TABLE Profiles (
  UserID INT NOT NULL,
  Email VARCHAR(30) DEFAULT 'Choose not to list',
  Country VARCHAR(30) DEFAULT 'Choose not to list',
  UserName VARCHAR(20) NOT NULL,
  IRLName VARCHAR(30) DEFAULT 'Choose not to list',
  Password VARCHAR(30) NOT NULL,
  PRIMARY KEY (UserID)
);

--  Table that stores the podcasts in our database. 
--  Must have PodcastID (PrimaryKey) and a Creator.
--  An optional PRating can be included but must have a value between 
--  1 and 5.
--  An optional Genre can be added to the tuple. If it is not included
--  a default value of "UNKNOWN" will be given.
CREATE TABLE Podcasts (
  PodcastID INT NOT NULL,
  Creator VARCHAR(30) NOT NULL,
  Genre VARCHAR(30) DEFAULT 'UNKNOWN',
  PRating DECIMAL(3, 2) CHECK(
    PRating >= 1
    AND PRating <= 5
  ),
  PRIMARY KEY (PodcastID)
);

--  Table that stores the Favorite Songs of all the users in our
--  database. 
--  Must have a UserID and a SongID. Both of these values make up a
--  primary key and both reference a Profile and a Song.
--  A User may also add a rating to their favorite song but that 
--  Rating must be a value between 1 and 5.
CREATE TABLE FavoriteSongs (
  FSongRating DECIMAL(3, 2) CHECK(
    FSongRating >= 1
    AND FSongRating <= 5
  ),
  UserID INT NOT NULL,
  FSongID INT NOT NULL,
  PRIMARY KEY (UserID, FSongID),
  FOREIGN KEY (UserID) REFERENCES Profiles(UserID) ON DELETE CASCADE,
  FOREIGN KEY (FSongID) REFERENCES Songs(SongID) ON DELETE CASCADE
);

--  Table that stores the Favorite Podcasts of all the users in our
--  database. 
--  Must have a UserID and a FPodcastID. Both of these values make 
--  up a primary key and both reference a Profile and a Podcast.
--  A user may also add a rating to their favorite podcast but that 
--  Rating must be a value between 1 and 5.
CREATE TABLE FavoritePodcasts (
  FPRating DECIMAL(3, 2) CHECK(
    FPRating >= 1
    AND FPRating <= 5
  ),
  UserID INT NOT NULL,
  FPodcastID INT NOT NULL,
  PRIMARY KEY (UserID, FPodcastID),
  FOREIGN KEY (UserID) REFERENCES Profiles(UserID) ON DELETE CASCADE,
  FOREIGN KEY (FPodcastID) REFERENCES Podcasts(PodcastID) ON DELETE CASCADE
);

--  Table that stores the Favorite Albums of all the users in our
--  database. 
--  Must have a UserID and a FAlbumID. Both of these values make 
--  up a primary key and both reference a Profile and a Album.
--  A user may also add a rating to their favorite album but that 
--  Rating must be a value between 1 and 5.
CREATE TABLE FavoriteAlbums (
  FARating DECIMAL(3, 2) CHECK(
    FARating >= 1
    AND FARating <= 5
  ),
  UserID INT NOT NULL,
  FAlbumID INT NOT NULL,
  PRIMARY KEY (UserID, FAlbumID),
  FOREIGN KEY (UserID) REFERENCES Profiles(UserID) ON DELETE CASCADE,
  FOREIGN KEY (FAlbumID) REFERENCES Albums(AlbumID) ON DELETE CASCADE
);

--  Table that stores the Favorite Artists of all the users in our
--  database. 
--  Must have a UserID and a FAArtistID. Both of these values make 
--  up a primary key and both reference a Profile and an Artist.
CREATE TABLE FavoriteArtists (
  FAUserID INT NOT NULL,
  FAArtistID INT NOT NULL,
  PRIMARY KEY (FAUserID, FAArtistID),
  FOREIGN KEY (FAUserID) REFERENCES Profiles(UserID) ON DELETE CASCADE,
  FOREIGN KEY (FAArtistID) REFERENCES Artists(ArtistID) ON DELETE CASCADE
);

--  Table that stores the Requested Sound bites from the users. 
--  Must have a SoundBiteID, a StartTime, and an EndTime.
--  Must include foreign keys of a UserID and a SongID which 
--  reference the user that requested the sound bite and the song
--  of which the sound bite is to be created from.
CREATE TABLE RequestedSoundBites (
  SoundBiteID INT NOT NULL,
  StartTime INT NOT NULL,
  EndTime INT NOT NULL,
  UserID INT NOT NULL,
  SongID INT NOT NULL,
  PRIMARY KEY (SoundBiteID),
  FOREIGN KEY (UserID) REFERENCES Profiles(UserID) ON DELETE CASCADE,
  FOREIGN KEY (SongID) REFERENCES Songs(SongID) ON DELETE CASCADE
);

--
--  ***********************************************************************
--  PART B
--  ***********************************************************************
-- 
--  Sample Data for the Artists table.
--  There are 10 tuples all with distinct Artist names and ArtistIDs
--  Artist rating are provided but are arbitrary as of now.
INSERT INTO
  Artists
VALUES
  (1, 'Aerosmith', 5.00);

INSERT INTO
  Artists
VALUES
  (2, 'Lil Pump', 1.01);

INSERT INTO
  Artists
VALUES
  (3, 'Linkin Park', 3.00);

INSERT INTO
  Artists
VALUES
  (4, 'Jennifer Lopez', 4.55);

INSERT INTO
  Artists
VALUES
  (5, 'Polo G', 2.50);

INSERT INTO
  Artists
VALUES
  (6, 'Imagine Dragons', 2.67);

INSERT INTO
  Artists
VALUES
  (7, 'Eminem', 5.00);

INSERT INTO
  Artists
VALUES
  (8, 'Rihanna', 5.00);

INSERT INTO
  Artists
VALUES
  (9, 'Dr. Dre', 5.00);

INSERT INTO
  Artists
VALUES
  (10, 'Taylor Swift', 3.66);

--  Sample Data for the Albums table.
--  There are 10 tuples all with distinct Album names and AlbumIDs.
--  Album ratings are provided but are arbitrary as of now.
--  Creation years have been provided for each album.
--  Genres have been provided for most Albums, ones that have not
--  have null values in the Genre column.
--  Each album is associated with an ArtistID.
INSERT INTO
  Albums
VALUES
  (1, 'Get a Grip', 'Rock', 1993, 5.00, 1);

INSERT INTO
  Albums
VALUES
  (2, 'Harverd Dropout', 'Rap', 2019, 1.00, 2);

INSERT INTO
  Albums
VALUES
  (
    3,
    'Hybrid Theory',
    'Alternative',
    2000,
    5.00,
    3
  );

INSERT INTO
  Albums
VALUES
  (4, 'This Is Me... Then', NULL, 2002, 4.55, 4);

INSERT INTO
  Albums
VALUES
  (5, 'Hall of Fame', 'Rap', 2021, 3.22, 5);

INSERT INTO
  Albums
VALUES
  (6, 'Night Visions', 'Alternative', 2012, 4.0, 6);

INSERT INTO
  Albums
VALUES
  (7, 'Eminem Show', 'Rap', 2002, 5.00, 7);

INSERT INTO
  Albums
VALUES
  (
    8,
    'Good Girls Gone Bad: Reloaded',
    'Pop',
    2008,
    5.00,
    8
  );

INSERT INTO
  Albums
VALUES
  (9, '2001', 'Rap', 2001, 5.00, 9);

INSERT INTO
  Albums
VALUES
  (10, '1989', 'Pop', 2014, 3.66, 10);

--  Sample Data for the Songs table.
--  There are 10 tuples all with distinct Song names and SongIDs.
--  Song ratings are provided but are arbitrary as of now.
--  Creation years have been provided for each album.
--  Lengths of songs in Seconds have been provided for all Songs.
--  Each Song is associated with an AlbumID and an ArtistID.
INSERT INTO
  Songs
VALUES
  (1, 238, 'Get a Grip', 3.66, 1, 1);

INSERT INTO
  Songs
VALUES
  (2, 168, 'Trash Rap Song', 1.0, 2, 2);

INSERT INTO
  Songs
VALUES
  (3, 186, 'Numb', 5.00, 3, 3);

INSERT INTO
  Songs
VALUES
  (4, 194, 'Dear Ben', 4.75, 4, 4);

INSERT INTO
  Songs
VALUES
  (5, 166, 'Rap Star', 3.25, 5, 5);

INSERT INTO
  Songs
VALUES
  (6, 175, 'Demons', 2.50, 6, 6);

INSERT INTO
  Songs
VALUES
  (7, 290, 'Without Me', 5.0, 7, 7);

INSERT INTO
  Songs
VALUES
  (8, 276, 'Umbrella', 4.95, 8, 8);

INSERT INTO
  Songs
VALUES
  (9, 222, 'Forgot About Dre', 2.22, 9, 9);

INSERT INTO
  Songs
VALUES
  (10, 219, 'Shake It Off', 1.75, 10, 10);

--  Sample Data for the Profiles table.
--  There are 10 tuples all with distinct UserNames and UserIDs.
--  Emails are provided for most Profiles and those that do not
--  have an email are filled with a NULL value in that column.
--  IRLNames are provided for most Profiles and those that do not
--  have an IRLNames are filled with a NULL value in that column.
--  A Country are provided for most Profiles and those that do not
--  have an A Country are filled with a NULL value in that column.
INSERT INTO
  Profiles
VALUES
  (1, 'cathy@gmail.com', 'USA', 'thecath', 'Cathy', 123);

INSERT INTO
  Profiles
VALUES
  (2, NULL, NULL, 'BlueBolt', NULL, 'bolt');

INSERT INTO
  Profiles
VALUES
  (3, 'goUSA@gmail.com', 'USA', 'TeamUSA', NULL, 'America');

INSERT INTO
  Profiles
VALUES
  (
    4,
    'purplepanther@gmail.com',
    NULL,
    'purplepanther',
    'Eric',
    'ericlovespurplepanthers'
  );

INSERT INTO
  Profiles
VALUES
  (
    5,
    'jamesmorimoto@gmail.com',
    'USA',
    'mynamejames',
    'James',
    'james123'
  );

INSERT INTO
  Profiles
VALUES
  (
    6,
    'therealaleshia@gmail.com',
    'USA',
    'Ale$hia',
    'Aleshia',
    '@le$shi@'
  );

INSERT INTO
  Profiles
VALUES
  (7, 'theGUY@gmail.com', NULL, 'someguy', NULL,'aguy');

INSERT INTO
  Profiles
VALUES
  (
    8,
    'edward@gmail.com',
    'USA',
    'GOEDWARD',
    'Edward',
    'twilight'
  );

INSERT INTO
  Profiles
VALUES
  (
    9,
    'stewie2k@gmail.com',
    'USA',
    'Stewie2k',
    'Stewie',
    '2kstewie'
  );

INSERT INTO
  Profiles
VALUES
  (
    10,
    'Naf-fly@gmail.com',
    'USA',
    'NAF-FLY',
    'Keith',
    '1234'

  );

--  Sample Data for the Podcasts table.
--  There are 10 tuples all with distinct Creators and PodcastIds.
--  Genres are provided for all of the Podcast and are not distinct.
--  Podcast ratings are provided but are arbitrary as of now.
INSERT INTO
  Podcasts
VALUES
  (
    1,
    'James Morimoto',
    'Very Bad to stay up Late',
    5.00
  );

INSERT INTO
  Podcasts
VALUES
  (2, 'Anna Skelley', 'True Crime', 5.00);

INSERT INTO
  Podcasts
VALUES
  (3, 'Aidan Pintuff', 'Fake News', 1.00);

INSERT INTO
  Podcasts
VALUES
  (
    4,
    'Cody Peradotto',
    'Very Bad to stay up Late',
    2.50
  );

INSERT INTO
  Podcasts
VALUES
  (
    5,
    'Dayton McGuire',
    'Very Bad to stay up Late',
    3.75
  );

INSERT INTO
  Podcasts
VALUES
  (6, 'Aidan Swenson', 'News', 5.00);

INSERT INTO
  Podcasts
VALUES
  (7, 'Dawsyn Holt', 'Comedy', 1.00);

INSERT INTO
  Podcasts
VALUES
  (8, 'Kaitlan Harbough', 'News', 2.00);

INSERT INTO
  Podcasts
VALUES
  (9, 'Matt Brawn', 'Daily History', 4.55);

INSERT INTO
  Podcasts
VALUES
  (10, 'Lacey Gifford', 'Cool Facts', 5.00);

--  Sample Data for the FavoriteSongs table.
--  There are 10 tuples.
--  The Primary keys are made up of Foreign key references to one 
--  UserID and one SongID.
--  There is also a Song Rating that the user has given between the 
--  values 1 and 5.
INSERT INTO
  FavoriteSongs
VALUES
  (5.00, 1, 1);

INSERT INTO
  FavoriteSongs
VALUES
  (4.66, 2, 2);

INSERT INTO
  FavoriteSongs
VALUES
  (4.33, 3, 3);

INSERT INTO
  FavoriteSongs
VALUES
  (4.23, 4, 4);

INSERT INTO
  FavoriteSongs
VALUES
  (4.77, 5, 5);

INSERT INTO
  FavoriteSongs
VALUES
  (3.99, 6, 6);

INSERT INTO
  FavoriteSongs
VALUES
  (4.89, 7, 7);

INSERT INTO
  FavoriteSongs
VALUES
  (4.61, 8, 8);

INSERT INTO
  FavoriteSongs
VALUES
  (4.76, 9, 9);

INSERT INTO
  FavoriteSongs
VALUES
  (5.00, 10, 10);

--  Sample Data for the FavoritePodcasts table.
--  There are 10 tuples.
--  The Primary keys are made up of Foreign key references to one 
--  UserID and one PodcastID.
--  There is also a Podcast Rating that the user has given between the 
--  values 1 and 5.
INSERT INTO
  FavoritePodcasts
VALUES
  (5.00, 10, 10);

INSERT INTO
  FavoritePodcasts
VALUES
  (3.90, 9, 9);

INSERT INTO
  FavoritePodcasts
VALUES
  (2.85, 8, 8);

INSERT INTO
  FavoritePodcasts
VALUES
  (4.66, 7, 7);

INSERT INTO
  FavoritePodcasts
VALUES
  (4.99, 6, 6);

INSERT INTO
  FavoritePodcasts
VALUES
  (4.34, 5, 5);

INSERT INTO
  FavoritePodcasts
VALUES
  (4.66, 4, 4);

INSERT INTO
  FavoritePodcasts
VALUES
  (3.23, 3, 3);

INSERT INTO
  FavoritePodcasts
VALUES
  (1.0, 2, 2);

INSERT INTO
  FavoritePodcasts
VALUES
  (1.0, 1, 1);

--  Sample Data for the FavoriteAlbums table.
--  There are 10 tuples.
--  The Primary keys are made up of Foreign key references to one 
--  UserID and one AlbumID.
--  There is also a Album Rating that the user has given between the 
--  values 1 and 5.
INSERT INTO
  FavoriteAlbums
VALUES
  (5.00, 9, 9);

INSERT INTO
  FavoriteAlbums
VALUES
  (3.33, 10, 10);

INSERT INTO
  FavoriteAlbums
VALUES
  (2.00, 7, 7);

INSERT INTO
  FavoriteAlbums
VALUES
  (4.59, 8, 8);

INSERT INTO
  FavoriteAlbums
VALUES
  (4.72, 5, 5);

INSERT INTO
  FavoriteAlbums
VALUES
  (3.68, 6, 6);

INSERT INTO
  FavoriteAlbums
VALUES
  (2.99, 3, 3);

INSERT INTO
  FavoriteAlbums
VALUES
  (4.93, 4, 4);

INSERT INTO
  FavoriteAlbums
VALUES
  (5.00, 1, 1);

INSERT INTO
  FavoriteAlbums
VALUES
  (4.23, 2, 2);

INSERT INTO
  FavoriteArtists
VALUES
  (1, 10);

INSERT INTO
  FavoriteArtists
VALUES
  (2, 9);

--  Sample Data for the FavoriteArtists table.
--  There are 10 tuples.
--  The Primary keys are made up of Foreign key references to one 
--  UserID and one ArtistID.
--  There is also a Artist Rating that the user has given between the 
--  values 1 and 5.
INSERT INTO
  FavoriteArtists
VALUES
  (3, 8);

INSERT INTO
  FavoriteArtists
VALUES
  (4, 7);

INSERT INTO
  FavoriteArtists
VALUES
  (5, 6);

INSERT INTO
  FavoriteArtists
VALUES
  (6, 5);

INSERT INTO
  FavoriteArtists
VALUES
  (7, 4);

INSERT INTO
  FavoriteArtists
VALUES
  (8, 3);

INSERT INTO
  FavoriteArtists
VALUES
  (9, 2);

INSERT INTO
  FavoriteArtists
VALUES
  (10, 1);

--  Sample Data for the RequestedSoundBites table.
--  There are 10 tuples with one SoundBiteID as the Primary Key.
--  There are two foreign Keys that Reference the UserID which made the
--  sound bite request and the SongID for the Song which the sound bite
--  is to be taken from
--  There is also a start time and end time for snip of the sound bite
--  to be taken from.
INSERT INTO
  RequestedSoundBites
VALUES
  (1, 22, 42, 1, 2);

INSERT INTO
  RequestedSoundBites
VALUES
  (2, 15, 20, 2, 3);

INSERT INTO
  RequestedSoundBites
VALUES
  (3, 51, 60, 3, 4);

INSERT INTO
  RequestedSoundBites
VALUES
  (4, 65, 72, 4, 5);

INSERT INTO
  RequestedSoundBites
VALUES
  (5, 7, 11, 5, 6);

INSERT INTO
  RequestedSoundBites
VALUES
  (6, 55, 77, 6, 7);

INSERT INTO
  RequestedSoundBites
VALUES
  (7, 15, 22, 7, 8);

INSERT INTO
  RequestedSoundBites
VALUES
  (8, 57, 70, 8, 9);

INSERT INTO
  RequestedSoundBites
VALUES
  (9, 71, 85, 9, 10);

INSERT INTO
  RequestedSoundBites
VALUES
  (10, 20, 25, 10, 1);

--
--  ***********************************************************************
--  PART C
--  ***********************************************************************
-- 
--  Query 1:
--  Purpose: Shows all of the Artists, their albums and the songs on those
--  Albums.
--  Expected: A very large table that joins the Artists, Albums, and Songs
--  tables.
-- SELECT
--   ARTISTS.ArtistName,
--   ALBUMS.AlbumName,
--   SONGS.SongName
-- FROM
--   ARTISTS
--   JOIN ALBUMS ON ALBUMS.ArtistID = ARTISTS.ArtistID
--   JOIN SONGS ON ALBUMS.AlbumID = SONGS.AlbumID;
--
--  Query 2:
--  Purpose: Shows any Genre with songs that is longer then 200 seconds.
--  Expected: A table of Genres with songs longer then 200 seconds and 
--  how many songs that meet this criteria.
-- SELECT
-- 	 ALBUMS.Genre,
--   COUNT(ALBUMS.AlbumName) AS "Number of albums with long songs"
-- FROM
--   ALBUMS
-- WHERE
--   ALBUMS.ArtistID = ANY (
--     SELECT
--       SONGS.ArtistID
--     FROM
--       SONGS
--     WHERE
--       SONGS.Seconds > 200
--   )
-- GROUP BY
--   ALBUMS.Genre;
--
--  Query 3:
--  Purpose: Shows the Profile information of any user located in the USA
--  that has a favorite song that they rated 4 stars or above.
--  Expected: A table of usernames and the song that they have favorited  
--  as well as the rating they gave. Ratings should only be 4 stars and 
--  above.
-- SELECT
--   USERSFROMUSA.UserName,
--   SONGS.SongName,
--   SONGS.SongRating
-- FROM
--   SONGS,
--   FAVORITESONGS,
--   (
--     SELECT
--       PROFILES.UserName,
--       PROFILES.UserID
--     FROM
--       PROFILES
--     WHERE
--       PROFILES.Country = 'USA'
--   ) USERSFROMUSA
-- WHERE
--   FAVORITESONGS.UserID = USERSFROMUSA.UserID
--   AND FAVORITESONGS.FSongID = SONGS.SongID
--   AND SONGS.SongRating > 4;
--
--  Query 4:
--  Purpose: Shows a full list of user profiles as well as the Artists 
--  they have favorited and the actual data of the artist from the 
--  artist table.
--  Expected: A large table of user information and the artists they
--  have favorited and the artist information.
-- SELECT
--   UserID,
--   UserName,
--   IRLName,
--   Email,
--   Country,
--   ArtistID,
--   ArtistName,
--   ArtistRating
-- FROM
--   PROFILES FULL
--   OUTER JOIN FAVORITEARTISTS ON PROFILES.UserID = FAVORITEARTISTS.FAUserID FULL
--   OUTER JOIN ARTISTS ON ARTISTS.ArtistID = FAVORITEARTISTS.FAArtistID 
--
--  Query 5:
--  Purpose: Shows the Profile information of users that have requested 
--  a sound bite.
--  Expected: an intersected table of users that have both provided a 
--  sound bites, as long as they have provided an email and a country.
--  country and a email and the sound bite information they have requested.
-- SELECT
--   UserName,
--   IRLName,
--   Email,
--   Country,
--   SongName,
--   StartTime,
--   EndTIme
-- FROM
--   (
--     SELECT
--       *
--     FROM
--       PROFILES
--     WHERE
--       IRLName IS NOT NULL
--   ) USERS_WITH_IRL_NAMES
--   RIGHT JOIN REQUESTEDSOUNDBITES ON USERS_WITH_IRL_NAMES.UserID = REQUESTEDSOUNDBITES.UserID
--   RIGHT JOIN SONGS ON SONGS.SongID = REQUESTEDSOUNDBITES.SongID
-- INTERSECT
-- SELECT
--   UserName,
--   IRLName,
--   Email,
--   Country,
--   SongName,
--   StartTime,
--   EndTIme
-- FROM
--   (
--     SELECT
--       *
--     FROM
--       PROFILES
--     WHERE
--       COUNTRY IS NOT NULL
--   ) USERS_WITH_COUNTRY
--   LEFT JOIN REQUESTEDSOUNDBITES ON USERS_WITH_COUNTRY.UserID = REQUESTEDSOUNDBITES.UserID
--   LEFT JOIN SONGS ON SONGS.SongID = REQUESTEDSOUNDBITES.SongID;
--
--  Query 6:
--  Purpose: Shows Artists and the number of Albums associated with them.
--  Expected: A table with artists and the number of albums associated 
--  with them.
-- SELECT
--   a.ArtistName "Artist Name",
--   COUNT(al.AlbumID) "Albums Released"
-- FROM
--   Artists a
--   JOIN Albums al ON a.ArtistID = al.ArtistID
-- GROUP BY
--   a.ArtistName;
--
--  Query 7:
--  Purpose: Shows profile usernames and the albums they have favorited.
--  Expected: A table with the profile usernames and the albums they have
--  favorited accompanied by the albumID.
-- SELECT
--   Username,
--   AlbumName,
--   AlbumID
-- FROM
--   Profiles
--   INNER JOIN FavoriteAlbums ON Profiles.UserID = FavoriteAlbums.UserID
--   INNER JOIN Albums ON FavoriteAlbums.FAlbumID = Albums.AlbumID;
--
--  Query 8:
--  Purpose: Shows profile usernames and the podcasts they have favorited.
--  Expected: A table with the profile usernames and the podcast creator names
--  they have favorited accompanied by the PodcastID.
-- SELECT
--   Username,
--   Creator,
--   PodcastID
-- FROM
--   Profiles
--   INNER JOIN FavoritePodcasts ON Profiles.UserID = FavoritePodcasts.UserID
--   INNER JOIN Podcasts ON FavoritePodcasts.FPodcastID = Podcasts.PodcastID;
--
--  Query 9:
--  Purpose: Shows profile usernames and the songs they have favorited.
--  Expected: A table with the profile usernames and the song names they
--  have favorited accompanied by the SongID.
-- SELECT
--   UserName,
--   SongName,
--   SongID
-- FROM
--   Profiles
--   INNER JOIN FavoriteSongs ON Profiles.UserID = FavoriteSongs.UserID
--   INNER JOIN Songs ON FavoriteSongs.FSongID = Songs.SongID;
--
--  Query 10:
--  Purpose: Shows profile usernames and the artists they have favorited.
--  Expected: A table with the profile usernames and the artist names they
--  have favorited accompanied by the ArtistID.
-- SELECT
--   Username,
--   ArtistName,
--   ArtistID
-- FROM
--   Profiles
--   INNER JOIN FavoriteArtists ON Profiles.UserID = FavoriteArtists.FAArtistID
--   INNER JOIN Artists ON FavoriteArtists.FAArtistID = Artists.ArtistID;