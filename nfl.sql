-- 1. List the names of all NFL teams'
SELECT name FROM teams;

/*
 Buffalo Bills
 Miami Dolphins
 New England Patriots
 New York Jets
 Baltimore Ravens
 Cincinnati Bengals
 Cleveland Browns
 Pittsburgh Steelers
 Houston Texans
 Indianapolis Colts
 Jacksonville Jaguars
 Tennessee Titans
 Denver Broncos
 Kansas City Chiefs
 Oakland Raiders
 San Diego Chargers
 Dallas Cowboys
 New York Giants
 Philadelphia Eagles
 Washington Redskins
 Chicago Bears
 Detroit Lions
 Green Bay Packers
 Minnesota Vikings
 Atlanta Falcons
 Carolina Panthers
 New Orleans Saints
 Tampa Bay Buccaneers
 Arizona Cardinals
 St. Louis Rams
 San Francisco 49ers
 Seattle Seahawks
*/

-- 2. List the stadium name and head coach of all NFC teams
SELECT name, head_coach FROM teams WHERE conference = 'NFC';

/*
         name         |  head_coach   
----------------------+---------------
 Dallas Cowboys       | Jason Garrett
 New York Giants      | Tom Coughlin
 Philadelphia Eagles  | Chip Kelly
 Washington Redskins  | Jay Gruden
 Chicago Bears        | Marc Trestman
 Detroit Lions        | Jim Caldwell
 Green Bay Packers    | Mike McCarthy
 Minnesota Vikings    | Mike Zimmer
 Atlanta Falcons      | Mike Smith
 Carolina Panthers    | Ron Rivera
 New Orleans Saints   | Sean Payton
 Tampa Bay Buccaneers | Lovie Smith
 Arizona Cardinals    | Bruce Arians
 St. Louis Rams       | Jeff Fisher
 San Francisco 49ers  | Jim Harbaugh
 Seattle Seahawks     | Pete Carroll
*/

-- 3. List the head coaches of the AFC South
SELECT head_coach FROM teams WHERE conference = 'AFC' AND division = 'South';

/*   head_coach   
----------------
 Bill OBrien
 Chuck Pagano
 Gus Bradley
 Ken Whisenhunt */

-- 4. The total number of players in the NFL

SELECT COUNT(*) FROM players;

-- 1532

-- 5. The team names and head coaches of the NFC North and AFC East
SELECT name, head_coach FROM teams WHERE conference = 'AFC' AND division = 'East' OR conference = 'NFC' AND division = 'North';

/*
         name         |   head_coach   
----------------------+----------------
 Buffalo Bills        | Doug Marrone
 Miami Dolphins       | Joe Philbin
 New England Patriots | Bill Belichick
 New York Jets        | Rex Ryan
 Chicago Bears        | Marc Trestman
 Detroit Lions        | Jim Caldwell
 Green Bay Packers    | Mike McCarthy
 Minnesota Vikings    | Mike Zimmer
(8 rows)

*/

-- 6. The 50 players with the highest salaries
SELECT name FROM players ORDER BY salary DESC LIMIT 50;

/*
          name           
-------------------------
 Peyton Manning
 Drew Brees
 Dwight Freeney
 Elvis Dumervil
 Michael Vick
 Sam Bradford
 Jared Allen
 Matt Ryan
 Matthew Stafford
 Tamba Hali
 Jake Long
 Nnamdi Asomugha
 Trent Williams
 Vincent Jackson
 Cliff Avril
 Calais Campbell
 Joe Thomas
 Brent Grimes
 Peyton Manning (buyout)
 Chris Long
 Philip Rivers
 Jason Smith
 David Harris
 Wes Welker
 Davin Joseph
 Dwayne Bowe
 Asante Samuel
 Brandon Marshall
 Ndamukong Suh
 Tony Romo
 Julius Peppers
 Anthony Spencer
 Karlos Dansby
 Jordan Gross
 Tyson Jackson
 Adrian Peterson
 Champ Bailey
 Chris Johnson
 Aaron Rodgers
 Jason Peters
 Eric Wright
 Steve Smith
 Santonio Holmes
 Jay Cutler
 Matt Forte
 Ray Rice
 Brian Urlacher
 Johnathan Joseph
 Gary Brackett
 Ed Reed
*/

-- 7. The average salary of all NFL players
SELECT AVG(salary) FROM players;

/*
         avg          
----------------------
 1579692.539817232376

*/

-- 8. The names and positions of players with a salary above 10_000_000
SELECT name, position FROM players WHERE salary > 10000000;

/*
          name           | position 
-------------------------+----------
 Jake Long               | T
 Joe Thomas              | T
 Dwight Freeney          | DE
 Peyton Manning (buyout) | QB
 Peyton Manning          | QB
 Elvis Dumervil          | DE
 Tamba Hali              | DE
 Philip Rivers           | QB
 Michael Vick            | QB
 Nnamdi Asomugha         | CB
 Trent Williams          | T
 Matthew Stafford        | QB
 Cliff Avril             | DE
 Jared Allen             | DE
 Matt Ryan               | QB
 Brent Grimes            | CB
 Drew Brees              | QB
 Vincent Jackson         | WR
 Calais Campbell         | DE
 Sam Bradford            | QB
 Chris Long              | DE
*/

-- 9. The player with the highest salary in the NFL
SELECT name, salary FROM players WHERE salary = (SELECT MAX(salary) FROM players);

/*
     name      |  salary  
----------------+----------
 Peyton Manning | 18000000
*/

-- 10. The name and position of the first 100 players with the lowest salaries
SELECT name, position FROM players ORDER BY salary ASC LIMIT 100;

/*
          name          | position 
------------------------+----------
 Phillip Dillard        | 
 Eric Kettani           | RB
 Austin Sylvester       | RB
 Greg Orton             | WR
 Jerrod Johnson         | QB
 McLeod Bethel-Thompson | QB
 Jonathan Crompton      | QB
 Travon Bellamy         | CB
 Caleb King             | RB
 Mike Mohamed           | LB
 Kyle Nelson            | LS
 John Malecki           | G
 Nathan Bussey          | LB
 Robert James           | LB
 Markell Carter         | DE
 Aaron Lavarias         | DT
 Mark Dell              | WR
 Ronald Johnson         | WR
 Doug Worthington       | DT
 Derrick Jones          | WR
 Sealver Siliga         | DT
 Chase Beeler           | C
 Kenny Wiggins          | T
 Konrad Reuland         | TE
 Michael Wilhoite       | LB
 Garrett Chisolm        | G
 Juamorris Stewart      | WR
 Chad Spann             | RB
 Trevis Turner          | T
 Justin Medlock         | KR
 Armon Binns            | WR
 Derek Hall             | T
 Shaky Smithson         | WR
 Armando Allen          | RB
 DAndre Goodwin         | WR
 Jeremy Beal            | DE
 Brett Brackett         | TE
 Shaun Draughn          | RB
 John Clay              | RB
 Tristan Davis          | RB
 Curtis Holcomb         | CB
 Jimmy Young            | WR
 Kevin Cone             | WR
 Cory Nelms             | CB
 Ben Guidugli           | TE
 David Gilreath         | WR
 Dontavia Bogan         | WR
 Joe Hastings           | WR
 Marshall McFadden      | LB
 Kade Weston            | DT
 Kyle Hix               | T
 Mark LeGree            | S
 Mike Hartline          | QB
 Jameson Konz           | WR

*/

-- 11. The average salary for a DE in the nfl
SELECT AVG(salary) FROM players WHERE position = 'DE';

-- 2161326.37704918032

-- 12. The names of all the players on the Buffalo Bills

/*
add id col to teams table

ALTER TABLE teams ADD id SERIAL; 
*/

SELECT AVG(salary) FROM players JOIN teams ON players.team_id = teams.id AND teams.name LIKE 'Buffalo Bills';

-- 1337052.966101694915

-- 13. The total salary of all players on the New York Giants
SELECT SUM(salary) FROM players JOIN teams ON players.team_id = teams.id AND teams.name LIKE 'New York Giants';

-- 74179466

-- 14. The player with the lowest salary on the Green Bay Packers
SELECT players.name, players.salary FROM players JOIN teams ON players.team_id = teams.id AND teams.name LIKE 'Green Bay Packers' ORDER BY players.salary ASC LIMIT 1;

-- Shaky Smithson