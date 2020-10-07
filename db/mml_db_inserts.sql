use mml_DB;


/************************/
/*        INSERT        */
/************************/

-- INSERT ADMINISTRATOR --
INSERT INTO ADMINISTRATOR (admin_id, email, nick, passwd) VALUES (0, 'afouteda@esei.uvigo.es', 'afouteda', '123pswd');
INSERT INTO ADMINISTRATOR (admin_id, email, nick, passwd) VALUES (0, 'atenea.fdez@outlook.com', 'AteeSkyes', '123pswd');


-- INSERT MODERATOR --
INSERT INTO MODERATOR (mod_id, email, nick, passwd) VALUES (0, 'afouteda@esei.uvigo.es', 'afouteda', '123pswd');
INSERT INTO MODERATOR (mod_id, email, nick, passwd) VALUES (0, 'atenea.fdez@outlook.com', 'AteeSkyes', '123pswd');

-- INSERT PATCH_NOTES --
-- INSERT INTO PATCH_NOTES (id, admin_id, date_time, content) VALUES ('PN01102020', 1, CURRENT_DATE, 'Pruebas de SQL');
-- DELETE FROM PATCH_NOTES WHERE id = 'PN01102020';