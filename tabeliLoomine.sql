CREATE TABLE toidumine(
    toidumine_id int PRIMARY KEY AUTO_INCREMENT,
    toidumine_nimi varchar(100));

CREATE TABLE yhik(
    yhik_id int PRIMARY KEY AUTO_INCREMENT,
    yhik_nimi varchar(100));

CREATE TABLE kasutaja(
    kasutaja_id int PRIMARY KEY AUTO_INCREMENT,
    eesnimi varchar(50),
    perenimi varchar(50),
    email varchar(150)
    );
CREATE TABLE kategooria(
  kategooria_id int PRIMARY KEY AUTO_INCREMENT,
  kategooria_nimi varchar(50)
  );

CREATE TABLE retsept(
    retsept_id int PRIMARY KEY AUTO_INCREMENT,
    retsepti_nimi varchar(100),
    kirjeldus varchar(200),
    juhend varchar(500),
    sisestatud_kp date,
    kasutaja_id int,
    kategooria_id int,
    FOREIGN KEY (kasutaja_id) REFERENCES kasutaja(kasutaja_id),
    FOREIGN KEY (kategooria_id) REFERENCES kategooria(kategooria_id)
    );

CREATE TABLE koostis(
    koostis_id int PRIMARY KEY AUTO_INCREMENT,
    kogus int,
	retsept_retsept_id int,
    toidumine_id int,
    yhik_id int,
    FOREIGN KEY (toidumine_id) REFERENCES toidumine(toidumine_id), 
    FOREIGN KEY (yhik_id) REFERENCES yhik(yhik_id),
    FOREIGN KEY (retsept_retsept_id) REFERENCES retsept(retsept_id)
);
