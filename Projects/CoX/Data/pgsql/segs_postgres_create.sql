CREATE TABLE "table_versions" (
	"id" serial NOT NULL,
	"table_name" varchar NOT NULL UNIQUE,
	"version" integer NOT NULL,
	"last_update" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT table_versions_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



INSERT INTO table_versions VALUES(1,'table_versions',0,'2017-11-11 08:55:54');
INSERT INTO table_versions VALUES(2,'accounts',0,'2017-11-11 08:55:54');
INSERT INTO table_versions VALUES(3,'game_servers',0,'2017-11-11 09:12:37');
INSERT INTO table_versions VALUES(4,'bans',0,'2017-11-11 09:12:37');



CREATE TABLE "accounts" (
	"id" serial NOT NULL,
	"username" TEXT NOT NULL UNIQUE,
	"access_level" integer NOT NULL DEFAULT '1',
	"creation_date" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"passw" bytea NOT NULL,
	CONSTRAINT accounts_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



INSERT INTO accounts VALUES(1,'segsadmin',1,'2017-11-11 17:41:19','7365677331323300000000000000'::bytea);


CREATE TABLE "bans" (
	"id" serial NOT NULL,
	"account_id" integer NOT NULL,
	"offending_ip" varchar(39) NOT NULL,
	"started" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"reason" varchar(1024) NOT NULL,
	CONSTRAINT bans_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "game_servers" (
	"id" serial NOT NULL,
	"addr" varchar(39) NOT NULL,
	"port" integer NOT NULL,
	"name" varchar(100) NOT NULL,
	"token" integer NOT NULL,
	CONSTRAINT game_servers_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "bans" ADD CONSTRAINT "bans_fk0" FOREIGN KEY ("account_id") REFERENCES "accounts"("id");
