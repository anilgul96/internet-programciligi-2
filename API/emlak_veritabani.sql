-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 06 May 2023, 11:48:30
-- Sunucu sürümü: 10.4.27-MariaDB
-- PHP Sürümü: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `emlak_veritabani`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_ilanlar`
--

CREATE TABLE `tbl_ilanlar` (
  `Id` int(11) NOT NULL,
  `ilan_baslik` longtext NOT NULL,
  `ilan_detay` longtext NOT NULL,
  `ilan_fiyat` longtext NOT NULL,
  `ilan_goruntuleme` int(11) NOT NULL,
  `ilan_turu_Id` int(11) NOT NULL,
  `ilan_resim` longtext NOT NULL,
  `ilan_kategori_Id` int(11) NOT NULL,
  `tarih` datetime(6) NOT NULL,
  `ekleyen_kullanici_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tbl_ilanlar`
--

INSERT INTO `tbl_ilanlar` (`Id`, `ilan_baslik`, `ilan_detay`, `ilan_fiyat`, `ilan_goruntuleme`, `ilan_turu_Id`, `ilan_resim`, `ilan_kategori_Id`, `tarih`, `ekleyen_kullanici_Id`) VALUES
(1, 'Migros\'a Koşarak 5 Dk 2+1 Ev', 'string fmdsokdslkmglkdfn gnfldnglfdnlkg njkldfgnlkfdnglk fdnkgnfdjklgn dfkjngdfnjkg ndfg', '100000', 0, 2, 'resim.png', 1, '2023-05-06 09:37:44.038000', 1),
(2, 'Migros\'a Koşarak 5 Dk 2+1 Ev', 'string fmdsokdslkmglkdfn gnfldnglfdnlkg njkldfgnlkfdnglk fdnkgnfdjklgn dfkjngdfnjkg ndfg', '100000', 0, 2, 'resim.png', 1, '2023-05-06 09:37:44.038000', 1),
(3, 'Denize Sıfır Daire', 'string fmdsokdslkmglkdfn gnfldnglfdnlkg njkldfgnlkfdnglk fdnkgnfdjklgn dfkjngdfnjkg ndfg', '150000', 0, 1, 'resim.png', 1, '2023-05-06 09:37:44.038000', 1),
(4, 'Bu Fırsat Kaçmaz Devren Satılık Dükkan', 'string fmdsokdslkmglkdfn gnfldnglfdnlkg njkldfgnlkfdnglk fdnkgnfdjklgn dfkjngdfnjkg ndfg', '25000000', 0, 3, 'resim.png', 1, '2023-05-06 09:37:44.038000', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_kategoriler`
--

CREATE TABLE `tbl_kategoriler` (
  `Id` int(11) NOT NULL,
  `kategori_adi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tbl_kategoriler`
--

INSERT INTO `tbl_kategoriler` (`Id`, `kategori_adi`) VALUES
(1, 'Daire'),
(2, 'Villa'),
(3, 'Dükkan');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_kategori_ara`
--

CREATE TABLE `tbl_kategori_ara` (
  `Id` int(11) NOT NULL,
  `ilan_Id` int(11) NOT NULL,
  `kategori_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tbl_kategori_ara`
--

INSERT INTO `tbl_kategori_ara` (`Id`, `ilan_Id`, `kategori_Id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_kullanicilar`
--

CREATE TABLE `tbl_kullanicilar` (
  `Id` int(11) NOT NULL,
  `ad` longtext NOT NULL,
  `kullanici_adi` longtext NOT NULL,
  `sifre` longtext NOT NULL,
  `yetki_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tbl_kullanicilar`
--

INSERT INTO `tbl_kullanicilar` (`Id`, `ad`, `kullanici_adi`, `sifre`, `yetki_Id`) VALUES
(1, 'Anıl Gül', 'agul', 'string562565256', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_turler`
--

CREATE TABLE `tbl_turler` (
  `Id` int(11) NOT NULL,
  `tur_adi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tbl_turler`
--

INSERT INTO `tbl_turler` (`Id`, `tur_adi`) VALUES
(1, 'Satılık'),
(2, 'Kiralık'),
(3, 'Devren');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20230506093505_DbInit', '7.0.5');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `tbl_ilanlar`
--
ALTER TABLE `tbl_ilanlar`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `tbl_kategoriler`
--
ALTER TABLE `tbl_kategoriler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `tbl_kategori_ara`
--
ALTER TABLE `tbl_kategori_ara`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `tbl_kullanicilar`
--
ALTER TABLE `tbl_kullanicilar`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `tbl_turler`
--
ALTER TABLE `tbl_turler`
  ADD PRIMARY KEY (`Id`);

--
-- Tablo için indeksler `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `tbl_ilanlar`
--
ALTER TABLE `tbl_ilanlar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `tbl_kategoriler`
--
ALTER TABLE `tbl_kategoriler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tbl_kategori_ara`
--
ALTER TABLE `tbl_kategori_ara`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tbl_kullanicilar`
--
ALTER TABLE `tbl_kullanicilar`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `tbl_turler`
--
ALTER TABLE `tbl_turler`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
