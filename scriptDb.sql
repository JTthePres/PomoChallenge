/*
    Script sql per creare il database e riempirlo.
    Nota: usando la cifratura della password, con conseguente decifratura al momento di login, non è possibile accedere tramite login
    agli account qui definiti, in quanto qui vengono inseriti manualmente senza cifrare le password 

*/
CREATE TABLE utente (
    username VARCHAR(20) NOT NULL,
    paswd VARCHAR(70) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE task (
    username VARCHAR(40) NOT NULL,
    keyhash VARCHAR(32) NOT NULL,
    title VARCHAR(25) NOT NULL,
    pomodori INT NOT NULL,
    note VARCHAR(115),
    donepomodori INT NOT NULL,
    ind INT NOT NULL,
    tim INT NOT NULL,
    PRIMARY KEY (username,keyhash),
    FOREIGN KEY (username) REFERENCES utente(username) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE endedtask (
    username VARCHAR(40) NOT NULL,
    keyhash VARCHAR(32) NOT NULL,
    title VARCHAR(25) NOT NULL,
    pomodori INT NOT NULL,
    note VARCHAR(115),
    dat VARCHAR(10) NOT NULL,
    tim INT NOT NULL,
    ora VARCHAR(8) NOT NULL,
    PRIMARY KEY (username,keyhash),
    FOREIGN KEY (username) REFERENCES utente(username) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE richieste (
    richiedente VARCHAR(40) NOT NULL,
    accettante VARCHAR(40) NOT NULL,
    PRIMARY KEY (richiedente,accettante),
    FOREIGN KEY (richiedente) REFERENCES utente(username) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (accettante) REFERENCES utente(username) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE amici (
    utentea VARCHAR(40) NOT NULL,
    utenteb VARCHAR(40) NOT NULL,
    PRIMARY KEY (utentea,utenteb),
    FOREIGN KEY (utentea) REFERENCES utente(username) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (utenteb) REFERENCES utente(username) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE imgutente(
    utente VARCHAR(40) NOT NULL,
    percorso VARCHAR (255) NOT NULL,
    PRIMARY KEY (utente),
    FOREIGN KEY (utente) REFERENCES utente(username) ON UPDATE CASCADE ON DELETE CASCADE
);

insert into utente values ('max','Password.1=');
insert into utente values ('max1','Password.1=');
insert into utente values ('max2','Password.1=');
insert into utente values ('max3','Password.1=');
insert into utente values ('max4','Password.1=');
insert into utente values ('max5','Password.1=');
insert into utente values ('max6','Password.1=');
insert into utente values ('marco','Password.1=');
insert into utente values ('luca','Password.1=');
insert into utente values('jcp','Password.1=');
insert into utente values('ale','Password.1=');
insert into utente values('fra','Password.1=');
insert into utente values('mauriziosarri','Password.1=');

insert into amici values ('luca','marco');
insert into amici values('luca','max');
insert into amici values('luca','max1');
insert into amici values('max','max3');
insert into amici values('max','max4');
insert into amici values('max','max5');
insert into amici values('max','max6');



INSERT INTO endedtask(username, keyhash, title, pomodori, note, dat, tim,ora)
	VALUES ('luca', '0123456778', '12-05-2023', 1, '', '12-05-2023', 3, '03:00:00' );
INSERT INTO endedtask(username, keyhash, title, pomodori, note, dat, tim,ora)
	VALUES ('luca', '0123456781', '12-04-2023', 1, '', '12-04-2023', 3, '13:00:00' );
INSERT INTO endedtask(username, keyhash, title, pomodori, note, dat, tim,ora)
	VALUES ('luca', '0123456782', '12-06-2023', 1, '', '12-06-2023', 3, '23:00:00' );
INSERT INTO endedtask(username, keyhash, title, pomodori, note, dat, tim,ora)
	VALUES ('luca', '0123456783', '10-05-2023', 1, '', '10-05-2023', 3, '00:00:00' );
INSERT INTO endedtask(username, keyhash, title, pomodori, note, dat, tim,ora)
	VALUES ('luca', '0123456784', '11-05-2023', 1, '', '11-05-2023', 3, '08:00:00' );
INSERT INTO endedtask(username, keyhash, title, pomodori, note, dat, tim,ora)
	VALUES ('luca', '01234567852', '12-05-2023', 1, '', '12-05-2023', 5, '03:00:00' );
INSERT INTO endedtask(username, keyhash, title, pomodori, note, dat, tim,ora)
	VALUES ('luca', '012345678554', '12-05-2023', 1, '', '12-05-2023', 3, '13:00:00' );
    
insert into utente values ('luca1','Password.1=');
insert into utente values ('luca2','Password.1=');
insert into utente values ('luca3','Password.1=');
insert into utente values ('luca4','Password.1=');
insert into utente values ('luca5','Password.1=');
insert into utente values ('luca6','Password.1=');
insert into utente values ('luca7','Password.1=');
insert into utente values ('luca8','Password.1=');
insert into utente values ('luca9','Password.1=');


insert into amici values ('luca1','jcp');
insert into amici values('luca2','jcp');
insert into amici values('luca3','jcp');
insert into amici values('luca4','jcp');
insert into amici values('luca5','jcp');
insert into amici values('luca6','jcp');
insert into amici values('luca7','jcp');
insert into amici values('luca8','jcp');
insert into amici values('luca9','jcp');
insert into utente values ('groot', 'Password.1=');
insert into utente values ('mario', 'Password.1=');
insert into utente values ('anna', 'Password.1=');
insert into utente values ('maria', 'Password.1=');
insert into utente values ('maradona', 'Password.1=');
insert into utente values ('0CarbonatoDiCalcio', 'Password.1=');
insert into utente values ('cristiano_Ronaldo7', 'Password.1=');
insert into utente values ('LizThaQueen96', 'Password.1=');
insert into utente values ('rolexShakira', 'Password.1=');
insert into utente values ('il_cuoco_e_la_spezia', 'Password.1=');
insert into utente values ('giacomo01', 'Password.1=');
insert into utente values ('WallE', 'Password.1=');
insert into utente values ('paola', 'Password.1=');
insert into utente values ('gerry_scotti', 'Password.1=');
insert into utente values ('MichaelJJ', 'Password.1=');
insert into utente values ('Marilyn', 'Password.1=');
insert into utente values ('HackMargherita', 'Password.1=');
insert into utente values ('zio_Walt', 'Password.1=');
insert into utente values ('elio', 'Password.1=');
insert into utente values ('giovanna', 'Password.1=');



insert into endedtask values ('ale', '0', 'Elettronica', 2, 'Nota importante', '31-05-2023', 50, '11:00');
insert into endedtask values ('ale', '01', 'Palestra', 1, 'Nota importante', '31-05-2023', 25, '10:00');
insert into endedtask values ('ale', '012', 'Spesa', 2, 'Nota importante', '30-05-2023', 25, '12:00');
insert into endedtask values ('ale', '013', 'Ltw ', 5, 'Nota importante', '29-05-2023', 75, '14:00');
insert into endedtask values ('ale', '01zc', 'Studio', 6, 'Nota importante', '25-05-2023', 35, '21:00');
insert into endedtask values ('ale', '01v d', 'Reti di calcolatori', 2, 'Nota importante', '27-05-2023', 38, '18:00');
insert into endedtask values ('ale', '01sf', 'Riposo', 2, 'Nota importante', '14-05-2023', 13, '14:00');
insert into endedtask values ('ale', '01bd', 'Relax', 1, 'Nota importante', '23-05-2023', 40, '14:00');
insert into endedtask values ('ale', '01a<v', 'Passeggiata', 3, 'Nota importante', '12-05-2023', 45, '08:00');
insert into endedtask values ('ale', '01bzbd', 'film', 5, 'Nota importante', '12-05-2023', 130, '23:00');
insert into endedtask values ('ale', '01ztjts', 'Cena', 2, 'Nota importante', '25-05-2023', 33, '20:00');
insert into endedtask values ('ale', '01ntrs', 'pulizie', 6, 'Nota importante', '18-05-2023', 149, '15:00');
INSERT INTO endedtask VALUES ('ale', '04<br', 'Storia dopo cena', 7, 'Ricerca da fare', '30-05-2023', 26, '22:00');
INSERT INTO endedtask VALUES ('ale', '05<br', 'Inglese prima di dormire', 10, 'Vocabolario da studiare', '03-05-2023', 22, '21:00');
INSERT INTO endedtask VALUES ('ale', '02<br', 'Fisica nel pomeriggio', 25, 'Riassunto da consegnare', '02-04-2023', 27, '15:00');
INSERT INTO endedtask VALUES ('ale', '014', 'Preparare cena', 3, 'Nota importante', '15-04-2023', 59, '17:00');
INSERT INTO endedtask VALUES ('ale', '015', 'Allenamento', 3, 'Nota importante', '06-03-2023', 15, '16:00');
INSERT INTO endedtask VALUES ('ale', '013sf', 'Pulizia casa', 2, 'Nota importante', '14-03-2023', 70, '12:00');
insert into endedtask values ('ale', '01awg', 'studio per esame', 7, 'Nota importante', '3-03-2023', 25, '19:00');
insert into endedtask values ('ale', '01ymns', 'fondamenti di ia', 5, 'Nota importante', '28-01-2023', 25, '17:00');
insert into endedtask values ('ale', '01<rb', 'studio intenso', 14, 'Nota importante', '12-05-2023', 225, '14:00');
INSERT INTO endedtask VALUES ('ale', '017', 'Task di prova', 11, 'Nota importante', '11-05-2023', 75, '12:00');
INSERT INTO endedtask VALUES ('ale', '018', 'Task di prova', 13, 'Nota importante', '01-05-2023', 25, '09:00');
INsERT INTO endedtask VALUES ('ale', '020', 'Task di prova', 17, 'Nota importante', '12-05-2023', 45, '12:00');
INSERT INTO endedtask VALUES ('ale', '019', 'Task di prova', 15, 'Nota importante', '25-05-2023', 125, '12:00');
INSERT INTO endedtask VALUES ('ale', '01<gDra7', 'Task di prova', 11, 'Nota importante', '11-01-2023', 75, '12:00');
INSERT INTO endedtask VALUES ('ale', '01dw28', 'Task di prova', 13, 'Nota importante', '02-04-2023', 200, '09:00');
INsERT INTO endedtask VALUES ('ale', '02dw0', 'Task di prova', 17, 'Nota importante', '12-02-2023', 55, '12:00');
INSERT INTO endedtask VALUES ('ale', '0FeWDFW19', 'Task di prova', 15, 'Nota importante', '25-01-2023', 105, '12:00');
INSERT INTO endedtask VALUES ('ale', '01dafww28', 'Task di prova', 13, 'Nota importante', '02-04-2023', 100, '09:00');
INSERT INTO endedtask VALUES ('ale', '01dafww6a66628', 'ripasso', 2, 'Nota importante', '02-04-2023', 10, '08:00');




INSERT INTO endedtask VALUES ('groot', '01<ghtsgfehftaDra7', 'Task di prova', 11, 'Nota importante', '11-01-2023', 100005, '12:00');
INSERT INTO endedtask VALUES ('paola', '01dafwsgsew28', 'Task di prova', 13, 'Nota importante', '02-04-2023', 6000, '09:00');
INsERT INTO endedtask VALUES ('luca', '02segadw0', 'Task di prova', 17, 'Nota importante', '12-02-2023', 1255, '12:00');
INSERT INTO endedtask VALUES ('mario', '0FeawwwwwwfwfWDFW19', 'Task di prova', 15, 'Nota importante', '25-01-2023', 177705, '12:00');
INSERT INTO endedtask VALUES ('giacomo01', '0FeawwwwwawdwfwfWDFW19', 'Task di prova', 15, 'Nota importante', '25-01-2023', 175805, '12:00');
INSERT INTO endedtask VALUES ('jcp', '01<ghawddehftra7', 'Task di prova', 11, 'Nota importante', '11-01-2023',667, '12:00');
INSERT INTO endedtask VALUES ('mauriziosarri', '01dafsew', 'Task di prova', 13, 'Nota importante', '02-04-2023', 6000, '09:00');
INsERT INTO endedtask VALUES ('Marilyn', '02sega674dw0', 'Task di prova', 17, 'Nota importante', '12-02-2023', 1355, '12:00');
INSERT INTO endedtask VALUES ('mario', 'wwfwfWDFW19', 'Task di prova', 15, 'Nota importante', '25-01-2023', 17705, '12:00');
INSERT INTO endedtask VALUES ('giacomo01', '0FeawwwwwawdDFW19', 'Task di prova', 15, 'Nota importante', '25-01-2023', 170805, '12:00');
INSERT INTO endedtask VALUES ('anna', '01dafww666628', 'Task di prova', 13, 'Nota importante', '02-04-2023', 2450, '09:00');





INSERT INTO amici VALUES ('jcp', 'gerry_scotti');
INSERT INTO amici VALUES ('anna', 'ale');
INSERT INTO amici VALUES ('ale', 'MichaelJJ');
INSERT INTO amici VALUES ('jcp', 'groot');
INSERT INTO amici VALUES ('groot', 'giacomo01');
INSERT INTO amici VALUES ('elio', 'groot');
INSERT INTO amici VALUES ('giovanna', 'jcp');


