/********************************************************************************/
/*																				*/
/*	Peter Schellhorn	Capstone - BCS260		Deliverable II					*/
/*																				*/
/*	PS Movies -  Create Tables													*/
/*																				*/
/*																				*/
/*																				*/
/********************************************************************************/

/*Order of tables
MOVIE

PERSON
MOVIE_DIRECTOR
ACTOR
CHARACTER

GENRE
MOVIE_GENRE
MOVIE_REMAKE
MOVIE_PRODUCTION_COMPANY

MOVIE_QUOTE*/

--CREATE DATABASE PS_MOVIES

-- didn't base auto increment numbers on future needs 
--------------------------------------

/*1********************************************************/
CREATE TABLE MOVIE(
	MovieID				Int			NOT NULL  IDENTITY(1,1),
	MovieTitle			Char(60)	NOT NULL,
	MovieReleaseYear	Char(20)	NOT NULL,
	MovieMinutes		Int			NOT NULL,
	MovieBoxOffice		Int			NOT NULL,
	CONSTRAINT			MOVIE_PK	PRIMARY KEY(MovieID)
);


CREATE TABLE PERSON(
	PersonID			Int			NOT NULL IDENTITY(101,1),
	PersonFirstName		Char(30)	NOT NULL,
	PersonLastName		Char(40)	NOT NULL,
	PersonDOB			Date		NULL,
	CONSTRAINT			PERSON_PK	PRIMARY KEY(PersonID)
);

CREATE TABLE ACTOR(
	ActorID				Int				NOT NULL IDENTITY(201,1),
	PersonID			Int				NOT NULL,
	ActorStageName		Char(50)			NULL,
	CONSTRAINT			ACTOR_PK		PRIMARY KEY(ActorID),
	CONSTRAINT			ACTOR_PID_FK	FOREIGN KEY(PersonID)
									REFERENCES PERSON(PersonID)
	
);


CREATE TABLE CHARACTER(
	CharacterID			Int 			NOT NULL IDENTITY(301,1),
	ActorID				Int 			NOT NULL,
	MovieID				Int				NOT NULL,
	CharacterFirstName	Char(50)			NOT NULL,
	CharacterLastName	Char(50)			NULL,
	CONSTRAINT			CHARACTER_PK	PRIMARY KEY(CharacterID),
	CONSTRAINT			CHAR_ACT_FK		FOREIGN KEY(ActorID)
									REFERENCES ACTOR(ActorID),
	CONSTRAINT			CHAR_MOV_FK	FOREIGN KEY(MovieID)
									REFERENCES MOVIE(MovieID)
);



CREATE TABLE MOVIE_REMAKE(
	MovieRemakeID	Int				NOT NULL IDENTITY(401,1),
	MovieID 		Int				NOT NULL,
	OriginalMovieID Int				NULL	,
	CONSTRAINT		MOV_REMAKE_PK	PRIMARY KEY(MovieRemakeID),
	CONSTRAINT		MOV_REMAKE_MOV_FK	FOREIGN KEY(MovieID)	
							REFERENCES MOVIE(MovieID),
	/*CONSTRAINT		OrigMOV_FK	FOREIGN KEY(OriginalMovieID)	
							REFERENCES MOVIE(MovieID)*/
);

CREATE TABLE PRODUCTION_COMPANY(
	CompanyID			Int		NOT NULL IDENTITY(501,1),
	CompanyName			Char(50)	NOT NULL,
	CompanyAddress		Char(50)	NULL,
	CompanyCity			Char(50)	NULL,
	CompanyState		Char(50)	NULL,
	CompanyZip			Int			NULL,
	CONSTRAINT		MPC_PK	PRIMARY KEY(CompanyID),
	
);

CREATE TABLE PRODUCTION_COMPANY_MOVIE(
	CompanyID			Int		NOT NULL,
	MovieID			Int			NOT NULL,
	CONSTRAINT MOV_COM_MOV_PK PRIMARY KEY (CompanyID,MovieID),
	CONSTRAINT MCM_COM_FK FOREIGN KEY (CompanyID) 
		REFERENCES PRODUCTION_COMPANY(CompanyID)
		ON UPDATE NO ACTION
		ON DELETE CASCADE,
	CONSTRAINT MCM_MOV_FK FOREIGN KEY(MovieID)
		REFERENCES MOVIE(MovieID)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
		);


CREATE TABLE MOVIE_QUOTE(
	MovieQuoteID	Int			NOT NULL IDENTITY(601,1),
	MovieID			Int			NOT NULL,
	CharacterID		Int			NOT NULL,
	MovieQuoteText	char(300)		NOT NULL,
	
	CONSTRAINT		MQ_PK			PRIMARY KEY(MovieQuoteID),
	CONSTRAINT		MQ_MOV_FK		FOREIGN KEY(MovieID)
										REFERENCES MOVIE(MovieID),
	CONSTRAINT		MQ_CHARID_FK	FOREIGN KEY(CharacterID)
										REFERENCES CHARACTER(CharacterID)
	

);

CREATE TABLE GENRE(
	GenreID 		Int			NOT NULL IDENTITY(701,1) PRIMARY KEY,
	GenreTitle			varchar(50)			
);

CREATE TABLE MOVIE_GENRE(
	MovieID			Int	 NOT NULL,
	GenreID 		Int	 NOT NULL,
	CONSTRAINT MOVIE_GENRE_PK PRIMARY KEY (MovieID,  GenreID),
	CONSTRAINT MOVIE_GENRE_FK FOREIGN KEY (GenreID) 
		REFERENCES GENRE(GenreID)
		ON UPDATE NO ACTION
		ON DELETE CASCADE,
	CONSTRAINT MOVIE_ID_FK FOREIGN KEY(MovieID)
		REFERENCES MOVIE(MovieID)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
		);



CREATE TABLE MOVIE_DIRECTOR(
	PersonID		Int	 NOT NULL,
	MovieID			Int	 NOT NULL,
	CONSTRAINT MOVIE_DIRECTOR_PK PRIMARY KEY (PersonID,MovieID),
	CONSTRAINT MOV_DIR_PID_FK FOREIGN KEY (PersonID) 
		REFERENCES PERSON(PersonID)
		ON UPDATE NO ACTION
		ON DELETE CASCADE,
	CONSTRAINT MOVIE_ID_FK FOREIGN KEY(MovieID)
		REFERENCES MOVIE(MovieID)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
		);



/*
Drop Table MOVIE_REMAKE;
Drop Table MOVIE_GENRE;
Drop Table GENRE;
Drop Table ACTOR;
Drop Table CHARACTER;
Drop Table MOVIE_DIRECTOR;
Drop Table PRODUCTION_COMPANY;
Drop Table PRODUCTION_COMPANY_MOVIE;
Drop Table MOVIE_QUOTE;
Drop Table PERSON;
Drop Table MOVIE;


/*
















