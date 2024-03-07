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
CREATE TABLE tehtud(
    tehtud_id int PRIMARY KEY AUTO_INCREMENT,
    tehtud_kp date,
    retsept_id int,
    FOREIGN KEY (retsept_id) REFERENCES retsept(retsept_id)
    );


INSERT INTO kategooria(kategooria_nimi) VALUES('maitseroheline'),('teravili'),('kondiitritoode'),('piimatooted'),('joogid');
INSERT INTO toidumine(toidumine_nimi) VALUES('vees'),('piim'),('suhkur'),('teraviljatooted'),('glüteen');
INSERT INTO yhik(yhik_nimi) VALUES('klaas'),('kg'),('tk'),('ml'),('g');
INSERT INTO kasutaja(eesnimi, perenimi, email) VALUES('Aleksander','Milishenko','alex.milishenko@gmail.com'),('Nikita','Kuleba','nikita.kuleba22@gmail.com'),('Lev','Jegorov','lev.jegorov@gmail.com'),('Roman','Sergejeev','roman.sergejeev@gmail.com'),('Nikita','Guljaev','nikita.guljaev@gmail.com');
INSERT INTO retsept(retsepti_nimi,kirjeldus,juhend,sisestatud_kp,kasutaja_id,kategooria_id) VALUES('Ananassimahl','Ananassi küpsetest viljadest saadav ananassimahla kasulikkus on inimestele teada juba iidsetest aegadest, kui tegemist on naturaalse värske tootega.','ananassimahl - selle koostises on aine bromelain, mis on vajalik kehakaalu langetamiseks, sest üks gramm bromelaiini võib põletada 900 g rasva.','12.03.2024',5,1),('Suvepalett','Seda salatit võib serveerida ühises salatis, aga meil oli külalisi ja ma otsustasin seekord taldrikutes portsjon teha.','tomatid 6 tk.
maisikonserv 4 spl. l. soola maitse järgi palsamiäädikas 1 spl. l. sinep prantsuse 2 spl. l. oliiviõli 8 spl. l. porgand noor 3 tk.
petersell 1 kimp paprika bulgaaria 2 tk.
basiilik sidrunimahl 4 oksa sidrunimahl 4 tl. kurgid"','18.03.2024',1,2),('Tatrapuder hautisega','	
	Tatar on kaugel kõrgest köögist. See ei valmista tavaliselt peeneid kalleid roogasid, kuid see ei muuda seda vähem väärtuslikuks. Eriti raske on ette kujutada ilma tatrata vene kööki - siin kasutatakse seda toodet kõikjal. Tatrast saab kergesti valmistada lahjasid kotlette, pajaroogasid ja isegi magustoite. Ja muidugi, kuhu ilma pudruta? See serveeritakse lauale lisandina, segatakse seente, köögiviljade, hakkliha, munade, juustu ja maitserohelisega. Samuti soovitame õppida tatrapudru retsepti hautisega. See lihtne ja täisväärtuslik roog sobib suurepäraselt teie pere igapäevamenüüsse. Soovitame võtta kvaliteetset lihatainast kontrollitud tootjalt.','"tatar 1 klaas sibul rukki 1 tk.
vesi 1 1⁄2 tassi porgandit 1 tk.
hautis 1 purk soola maitse järgi pipar maitse järgi taimeõli rafineeritud 2 spl. l."','03.03.2024',2,3),('Kook maasikasiirupi ja sidrunikoorega','Lihtsalt õrn biskviitkook. Magus hapukoorega. Lihtsalt ilma põhjuseta) meil on kodus traditsioon- alati peab olema midagi maitsvat tee juurde)','"tuhksuhkur 200 g värvainet toidu punane 1 näputäis hapukoort 25% 200 g sidruneid 1⁄2 tk.
Tainas vesi 100 ml suhkrut 130 g jahu 150 g pehmendajat 1 tl soola 1 näpuotsatäis vanillisuhkrut 1 tl kanamune 5 tk.
Lisaks maasikasiirup 150 ml kommi 7 tk.
Bese 7 tk."','01.03.2024',3,4),('Bruschetta küpsetatud kõrvitsaga','Kõrvitsahooaeg jätkub! Proovige neid bruschette, ei kahetse:)','Põhileivad 4 tükki kõrvits 100 g brõns serbia 40 g provaani ürte 1 näpuotsatäis','02.03.2024',4,5);

INSERT INTO tehtud(tehtud_kp,retsept_id) VALUES('16.03.2024',1),('16.03.2024',2),('12.03.2024',3),('17.03.2024',4),('25.03.2024',5);
INSERT INTO koostis(kogus,retsept_retsept_id,toidumine_id,yhik_id) VALUES(5,1,1,1),(2,2,3,2),(4,1,5,3),(2,4,4,2),(8,3,2,5);






		
		
		
