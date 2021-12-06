/********************************************************************************/
/*																				*/
/*	Peter Schellhorn	Capstone - BCS260		Deliverable IV					*/
/*																				*/
/*	PS Movies -  Queries														*/
/*																				*/
/********************************************************************************/

/*1********************************************************/
SELECT *
FROM Movie;

/*2********************************************************/
SELECT *
FROM Person;

/*3********************************************************/
SELECT *
FROM Actor;

/*4********************************************************/
SELECT *
FROM Character;

/*5********************************************************/
SELECT *
FROM PRODUCTION_COMPANY;

/*6********************************************************/
SELECT *
FROM Genre;

/*7********************************************************/
SELECT *
FROM Movie_Quote;

/*8********************************************************/
SELECT *
FROM MOVIE_REMAKE;

/*9********************************************************/
Select Movie.MovieID, MovieTitle, CharacterFirstName, CharacterLastName
From Character Inner JOIN Movie
on Movie.MovieId=Character.MovieId
Where Character.MovieID=2 or Character.MovieID=3;

/*10********************************************************/
Select Movie.MovieID, CharacterID,MovieTitle, CharacterFirstName, CharacterLastName
From Character Inner JOIN Movie
on Movie.MovieId=Character.MovieId
Group by CharacterID, Movie.MovieID,MovieTitle,CharacterFirstName,CharacterLastName;

/*11********************************************************/
Select Character.CharacterID, MovieTitle, MovieQuoteText
From Character Inner JOIN Movie_Quote
on Character.CharacterID=Movie_Quote.CharacterID
Inner JOIN MOVIE
on Movie.MovieId=Character.MovieId
Where Movie_Quote.CharacterID=309;

/*12********************************************************/
Select Movie.MovieID, MovieTitle, GenreTitle
From Movie Inner JOIN Movie_Genre
on Movie.MovieID=Movie_Genre.MovieID
Inner JOIN Genre
on Movie_Genre.GenreID=Genre.GenreID
Where Genre.GenreTitle = 'Action';

/*13********************************************************/
Select Movie.MovieID, MovieTitle, GenreTitle
From Movie Inner JOIN Movie_Genre
on Movie.MovieID=Movie_Genre.MovieID
Inner JOIN Genre
on Movie_Genre.GenreID=Genre.GenreID
Where Movie_Genre.GenreID = 731 and MovieMinutes > 100 ;

/*14********************************************************/
Select Movie.MovieID, MovieTitle, Person.PersonID, PersonFirstName as 'DirectorFirstName',PersonLastName as 'DirectorLastName'
From Movie Inner JOIN MOVIE_DIRECTOR
on Movie.MovieID=MOVIE_DIRECTOR.MovieID
Inner JOIN Person
on Person.PersonID=MOVIE_DIRECTOR.PersonID
Group By Movie.MovieID,Person.PersonID,MovieTitle, PersonFirstName,PersonLastName;

/*15********************************************************/
Select Movie.MovieID, MovieTitle, Person.PersonID, PersonFirstName as 'DirectorFirstName',PersonLastName as 'DirectorLastName'
From Movie Inner JOIN MOVIE_DIRECTOR
on Movie.MovieID=MOVIE_DIRECTOR.MovieID
Inner JOIN Person
on Person.PersonID=MOVIE_DIRECTOR.PersonID
Where MovieBoxOffice > 999999999;

/*16********************************************************/
Select Movie.MovieID, MovieTitle, Person.PersonID, PersonFirstName as 'DirectorFirstName',PersonLastName as 'DirectorLastName'
From Movie Inner JOIN MOVIE_DIRECTOR
on Movie.MovieID=MOVIE_DIRECTOR.MovieID
Inner JOIN Person
on Person.PersonID=MOVIE_DIRECTOR.PersonID
Where MovieReleaseYear < 1990;

/*17********************************************************/
Select Movie.MovieID,Production_Company.CompanyID , MovieTitle, CompanyName
From Movie Inner JOIN Production_Company_Movie
on Movie.MovieID=Production_Company_Movie.MovieID
Inner JOIN Production_Company
on Production_Company_Movie.CompanyID=Production_Company.CompanyID
Group By Movie.MovieID,Production_Company.CompanyID,MovieTitle, CompanyName;

/*18********************************************************/
Select Movie.MovieID,Production_Company.CompanyID , MovieTitle, CompanyName
From Movie Inner JOIN Production_Company_Movie
on Movie.MovieID=Production_Company_Movie.MovieID
Inner JOIN Production_Company
on Production_Company_Movie.CompanyID=Production_Company.CompanyID
Where MovieBoxOffice < 100000000;

/*19********************************************************/
Select Movie.MovieID,Production_Company.CompanyID , MovieTitle, CompanyName
From Movie Inner JOIN Production_Company_Movie
on Movie.MovieID=Production_Company_Movie.MovieID
Inner JOIN Production_Company
on Production_Company_Movie.CompanyID=Production_Company.CompanyID
Where MovieTitle = 'The GodFather';

/*20********************************************************/
Select COUNT(Movie.MovieID) as 'Number of Drama Movies'
From Movie Inner JOIN Movie_Genre
on Movie.MovieID=Movie_Genre.MovieID
Inner JOIN Genre
on Movie_Genre.GenreID=Genre.GenreID
Where Genre.Genretitle = 'Drama';

