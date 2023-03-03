-- SQL ifadelerinizi buraya yazınız.

CREATE TABLE `yazar`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL
);
ALTER TABLE
    `yazar` ADD PRIMARY KEY `yazar_id_primary`(`id`);
CREATE TABLE `kitap`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `sayfasayisi` INT UNSIGNED NOT NULL,
    `puan` INT UNSIGNED NOT NULL,
    `yazar_id` INT UNSIGNED NOT NULL,
    `tur_id` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `kitap` ADD PRIMARY KEY `kitap_id_primary`(`id`);
CREATE TABLE `islem`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrenci_id` INT UNSIGNED NOT NULL,
    `kitap_id` INT UNSIGNED NOT NULL,
    `atarih` TEXT NOT NULL,
    `vtarih` TEXT NOT NULL
);
ALTER TABLE
    `islem` ADD PRIMARY KEY `islem_id_primary`(`id`);
CREATE TABLE `ogrenci`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL,
    `dtarih` TEXT NOT NULL,
    `cinsiyet` TEXT NOT NULL,
    `sinif` TEXT NOT NULL,
    `puan` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `ogrenci` ADD PRIMARY KEY `ogrenci_id_primary`(`id`);
CREATE TABLE `tur`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ad` BIGINT NOT NULL
);
ALTER TABLE
    `tur` ADD PRIMARY KEY `tur_id_primary`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazar_id_foreign` FOREIGN KEY(`yazar_id`) REFERENCES `yazar`(`id`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_tur_id_foreign` FOREIGN KEY(`tur_id`) REFERENCES `tur`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitap_id_foreign` FOREIGN KEY(`kitap_id`) REFERENCES `kitap`(`id`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrenci_id_foreign` FOREIGN KEY(`ogrenci_id`) REFERENCES `ogrenci`(`id`);
---------------------
--SORULAR
--1

ALTER TABLE `ogrenci` 
ADD COLUMN `sehir` VARCHAR(25) NULL AFTER `puan`;

--2
ALTER TABLE `ogrenci`
CHANGE COLUMN `dtarih` `dtarih` DATETIME NOT NULL;

ALTER TABLE `islem`
CHANGE COLUMN `atarih` `atarih` DATETIME NOT NULL;

--3

ALTER TABLE `ogrenci` 
ADD COLUMN `dogum_yeri` VARCHAR(45) NOT NULL DEFAULT 'Türkiye' AFTER `puan`;

--4

ALTER TABLE `ogrenci`
DROP COLUMN `puan`;

--5

CREATE TABLE `kiz_ogrenciler` AS (
    SELECT * FROM ogrenci where cinsiyet="K"
);

--6

DROP TABLE `kiz_ogrenciler` ;

--7

CREATE TABLE `kiz_yurdu` (
id INT PRIMARY KEY AUTO_INCREMENT,
ad TEXT NOT NULL 
);

INSERT INTO `kiz_yurdu` (id,ad) VALUES ('1','Yenişehir')

CREATE TABLE `kiz_yurdu_ogrenciler` as (
    SELECT "1" as yurt_id, ogrno as OgrenciID from ogrenci where cinsiyet="K"
);

SELECT * FROM ogrenci 
	inner join kiz_yurdu_ogrenciler on ogrenci.id=kiz_yurdu_ogrenciler.OgrenciID
    inner join kiz_yurdu on kiz_yurdu.id= kiz_yurdu_ogrenciler.yurt_id;

--8

ALTER TABLE `kiz_ogrenciler`
RENAME TO `kogrenciler`;

--9

ALTER TABLE `yazar`
CHANGE COLUMN `ad` `name` VARCHAR(45) NOT NULL;

--10

ALTER TABLE `yazar`
ADD COLUMN `ulke` VARCHAR(100) NOT NULL DEFAULT 'Türkiye',
ADD COLUMN `universite` TEXT NULL 


