-- SQLZoo: JOIN
-- Section 6 — Completed: 2026-07-07
-- All 13 tasks passed ✓

-- 1. Show matchid and player for all goals scored by Germany
SELECT matchid, player
FROM goal
WHERE teamid LIKE 'GER';

-- 2. Show id, stadium, team1, team2 for game 1012
SELECT DISTINCT id, stadium, team1, team2
FROM game
INNER JOIN goal ON game.id = goal.matchid
WHERE matchid = 1012;

-- 3. Show player, teamid, stadium, mdate for every goal scored by Germany
SELECT player, teamid, stadium, mdate
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE teamid = 'GER';

-- 4. Show team1, team2, player for every goal scored by a player named Mario
SELECT team1, team2, player
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in first 10 minutes
SELECT player, teamid, coach, gtime
FROM goal
INNER JOIN eteam ON eteam.id = goal.teamid
WHERE gtime <= 10;

-- 6. List match dates and team name where Fernando Santos was team1 coach
SELECT mdate, teamname
FROM game
INNER JOIN eteam ON eteam.id = game.team1
WHERE coach = 'Fernando Santos';

-- 7. List players who scored in National Stadium, Warsaw
SELECT player
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

-- 8. Show all players who scored a goal against Germany
SELECT DISTINCT player
FROM game
INNER JOIN goal ON matchid = id
WHERE (team1 = 'GER' OR team2 = 'GER')
  AND teamid != 'GER';

-- 9. Show teamname and total number of goals scored
SELECT teamname, COUNT(player) AS goal
FROM eteam
JOIN goal ON id = teamid
GROUP BY teamname;

-- 10. Show stadium and number of goals scored in each stadium
SELECT stadium, COUNT(player)
FROM game
INNER JOIN goal ON goal.matchid = game.id
GROUP BY stadium;

-- 11. For every match involving POL, show matchid, date and number of goals
SELECT matchid, mdate, COUNT(player)
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate;

-- 12. For every match where GER scored, show matchid, date and number of GER goals
SELECT matchid, mdate, COUNT(player) AS goal
FROM goal
INNER JOIN game ON game.id = goal.matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- 13. List ENG matches with goals scored by each team (CASE WHEN)
SELECT mdate, team1,
  SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT JOIN goal ON matchid = id
WHERE team1 = 'ENG' OR team2 = 'ENG'
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;
