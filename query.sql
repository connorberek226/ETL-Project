CREATE TABLE TEAM (
    year_ int   NOT NULL,
    league_id VARCHAR   NOT NULL,
    team_id VARCHAR   NOT NULL,
    franchise_id VARCHAR   NOT NULL,
    rank_ int   NOT NULL,
    g_ int   NOT NULL,
    w int   NOT NULL,
    l int   NOT NULL,
    lg_win VARCHAR   NOT NULL,
    ws_win VARCHAR   NOT NULL,
    r int   NOT NULL,
    ab int   NOT NULL,
    h int   NOT NULL,
    double_ int   NOT NULL,
    triple int   NOT NULL,
    hr int   NOT NULL,
    bb int   NOT NULL,
    so int   NOT NULL,
    sb int   NOT NULL,
    ra int   NOT NULL,
    er int   NOT NULL,
    era int   NOT NULL,
    cg int   NOT NULL,
    sho int   NOT NULL,
    sv int   NOT NULL,
    ipouts int   NOT NULL,
    ha int   NOT NULL,
    hra int   NOT NULL,
    bba int   NOT NULL,
    soa int   NOT NULL,
    e int   NOT NULL,
    fp int   NOT NULL,
    name_ VARCHAR(50)   NOT NULL,
    park VARCHAR(50)   NOT NULL,
    bpf int   NOT NULL,
    ppf int   NOT NULL,
    team_id_br VARCHAR   NOT NULL,
    PRIMARY KEY (year_,team_id)
);

CREATE TABLE ALLSTAR (
    player_id VARCHAR   NOT NULL,
    year_ int   NOT NULL,
    game_id VARCHAR   NOT NULL,
    team_id VARCHAR   NOT NULL,
    league_id VARCHAR NOT NULL,
    starting_pos VARCHAR   NOT NULL,
	gp int NOT NULL,
    PRIMARY KEY (player_id, game_id)
);

CREATE TABLE BATTING (
    player_id VARCHAR   NOT NULL,
    year_ int   NOT NULL,
	stint int NOT NULL,
    team_id VARCHAR   NOT NULL,
    league_id VARCHAR   NOT NULL,
    g_ int   NOT NULL,
    ab int   NOT NULL,
    r int   NOT NULL,
    h int   NOT NULL,
	hr int NOT NULL,
    double_ int   NOT NULL,
    triple int   NOT NULL,
    rbi int   NOT NULL,
    sb int   NOT NULL,
    bb int   NOT NULL,
    so int   NOT NULL,
    PRIMARY KEY (player_id, year_, stint)
);

CREATE TABLE PITCHING (
    player_id VARCHAR   NOT NULL,
    year_ int   NOT NULL,
	stint int NOT NULL,
    team_id VARCHAR   NOT NULL,
    league_id VARCHAR   NOT NULL,
    w int   NOT NULL,
    l int   NOT NULL,
    g_ int   NOT NULL,
    gs int   NOT NULL,
    cg int   NOT NULL,
    sho int   NOT NULL,
    sv int   NOT NULL,
    h int   NOT NULL,
    er int   NOT NULL,
    hr int   NOT NULL,
    bb int   NOT NULL,
    so int   NOT NULL,
    era int   NOT NULL,
    hbp int   NOT NULL,
    r int   NOT NULL,
    PRIMARY KEY (player_id, year_, stint)
);

CREATE TABLE PLAYER (
    player_id VARCHAR PRIMARY KEY NOT NULL,
    name_first VARCHAR   NOT NULL,
    name_last VARCHAR   NOT NULL,
    bats VARCHAR   NOT NULL,
    throws VARCHAR   NOT NULL,
    debut date   NULL,
    final_game date   NULL
);

ALTER TABLE TEAM ADD CONSTRAINT fk_TEAM_team_id FOREIGN KEY (team_id)
REFERENCES BATTING (team_id);

ALTER TABLE ALLSTAR ADD CONSTRAINT fk_ALLSTAR_player_id FOREIGN KEY(player_id)
REFERENCES PLAYER (player_id);

ALTER TABLE BATTING ADD CONSTRAINT fk_BATTING_player_id FOREIGN KEY(player_id)
REFERENCES PLAYER (player_id);

ALTER TABLE PITCHING ADD CONSTRAINT fk_PITCHING_player_id FOREIGN KEY(player_id)
REFERENCES PLAYER (player_id);


DROP TABLE ALLSTAR;
DROP TABLE BATTING;
DROP TABLE PITCHING;
DROP TABLE TEAM;
DROP TABLE PLAYER;


SELECT * FROM PITCHING
INNER JOIN BATTING ON BATTING.player_id = PITCHING.player_id AND BATTING.year_ = PITCHING.year_ 
AND BATTING.stint = PITCHING.stint;

SELECT TEAM.year_, TEAM.team_id_br, TEAM.rank_, PLAYER.name_first, PLAYER.name_last
	FROM team
	INNER JOIN allstar ON TEAM.team_id = ALLSTAR.team_id AND TEAM.year_ = ALLSTAR.year_
	INNER JOIN player ON PLAYER.player_id = ALLSTAR.player_id;

SELECT TEAM.year_, TEAM.league_id, TEAM.team_id_br, TEAM.rank_, TEAM.ws_win
FROM team
WHERE (TEAM.league_id <> '0');




