-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: penjualanmobil
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `inventaris`
--

DROP TABLE IF EXISTS `inventaris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventaris` (
  `ID_Inventaris` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Mobil` int(11) DEFAULT NULL,
  `Jumlah` int(11) NOT NULL,
  `Tanggal_Update` date NOT NULL,
  PRIMARY KEY (`ID_Inventaris`),
  KEY `ID_Mobil` (`ID_Mobil`),
  CONSTRAINT `inventaris_ibfk_1` FOREIGN KEY (`ID_Mobil`) REFERENCES `mobil` (`ID_Mobil`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventaris`
--

LOCK TABLES `inventaris` WRITE;
/*!40000 ALTER TABLE `inventaris` DISABLE KEYS */;
INSERT INTO `inventaris` VALUES (1,1,10,'2023-01-01'),(2,2,5,'2023-01-05'),(3,3,8,'2023-01-10'),(4,4,12,'2023-01-15'),(5,5,4,'2023-01-20'),(6,6,3,'2023-01-25'),(7,7,2,'2023-01-30'),(8,8,2,'2023-02-01'),(9,9,6,'2023-02-05'),(10,10,5,'2023-02-10'),(11,1,10,'2023-02-15'),(12,2,5,'2023-02-20'),(13,3,8,'2023-02-25'),(14,4,12,'2023-03-01'),(15,5,4,'2023-03-05'),(16,6,3,'2023-03-10'),(17,7,2,'2023-03-15'),(18,8,2,'2023-03-20'),(19,9,6,'2023-03-25'),(20,10,5,'2023-03-30');
/*!40000 ALTER TABLE `inventaris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `karyawan` (
  `ID_Karyawan` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Karyawan` varchar(100) NOT NULL,
  `Jabatan` varchar(50) NOT NULL,
  `Telepon` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Karyawan`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karyawan`
--

LOCK TABLES `karyawan` WRITE;
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
INSERT INTO `karyawan` VALUES (1,'Karyawan 1','Sales','08123456751','karyawan1@example.com'),(2,'Karyawan 2','Sales','08123456752','karyawan2@example.com'),(3,'Karyawan 3','Sales','08123456753','karyawan3@example.com'),(4,'Karyawan 4','Sales','08123456754','karyawan4@example.com'),(5,'Karyawan 5','Sales','08123456755','karyawan5@example.com'),(6,'Karyawan 6','Manager','08123456756','karyawan6@example.com'),(7,'Karyawan 7','Manager','08123456757','karyawan7@example.com'),(8,'Karyawan 8','Staff','08123456758','karyawan8@example.com'),(9,'Karyawan 9','Staff','08123456759','karyawan9@example.com'),(10,'Karyawan 10','Staff','08123456760','karyawan10@example.com');
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `ID_Kategori` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES (1,'MPV'),(2,'SUV'),(3,'Sedan'),(4,'Hatchback'),(5,'Crossover'),(6,'Pickup'),(7,'Minivan'),(8,'Coupe'),(9,'Convertible'),(10,'Wagon');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `komisi`
--

DROP TABLE IF EXISTS `komisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komisi` (
  `ID_Komisi` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Karyawan` int(11) DEFAULT NULL,
  `ID_Penjualan` int(11) DEFAULT NULL,
  `Jumlah_Komisi` decimal(15,2) NOT NULL,
  PRIMARY KEY (`ID_Komisi`),
  KEY `ID_Karyawan` (`ID_Karyawan`),
  KEY `ID_Penjualan` (`ID_Penjualan`),
  CONSTRAINT `komisi_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`),
  CONSTRAINT `komisi_ibfk_2` FOREIGN KEY (`ID_Penjualan`) REFERENCES `penjualan` (`ID_Penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `komisi`
--

LOCK TABLES `komisi` WRITE;
/*!40000 ALTER TABLE `komisi` DISABLE KEYS */;
INSERT INTO `komisi` VALUES (1,1,1,2500000.00),(2,2,2,5000000.00),(3,3,3,2300000.00),(4,4,4,2400000.00),(5,5,5,5500000.00),(6,6,6,8000000.00),(7,7,7,15000000.00),(8,8,8,12000000.00),(9,9,9,3500000.00),(10,10,10,6000000.00);
/*!40000 ALTER TABLE `komisi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobil`
--

DROP TABLE IF EXISTS `mobil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobil` (
  `ID_Mobil` int(11) NOT NULL AUTO_INCREMENT,
  `Merk` varchar(100) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Tahun` year(4) NOT NULL,
  `Harga` decimal(15,2) NOT NULL,
  `Stok` int(11) NOT NULL,
  `ID_Kategori` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Mobil`),
  KEY `ID_Kategori` (`ID_Kategori`),
  CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`ID_Kategori`) REFERENCES `kategori` (`ID_Kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobil`
--

LOCK TABLES `mobil` WRITE;
/*!40000 ALTER TABLE `mobil` DISABLE KEYS */;
INSERT INTO `mobil` VALUES (1,'Toyota','Avanza',2022,250000000.00,10,1),(2,'Honda','CR-V',2023,500000000.00,5,2),(3,'Suzuki','Ertiga',2022,230000000.00,8,1),(4,'Daihatsu','Xenia',2022,240000000.00,12,1),(5,'Nissan','X-Trail',2023,550000000.00,4,2),(6,'Mitsubishi','Pajero',2023,800000000.00,3,2),(7,'BMW','X5',2023,1500000000.00,2,3),(8,'Mercedes-Benz','C-Class',2023,1200000000.00,2,3),(9,'Kia','Seltos',2023,350000000.00,6,2),(10,'Ford','Ranger',2023,600000000.00,5,4);
/*!40000 ALTER TABLE `mobil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobil_promo`
--

DROP TABLE IF EXISTS `mobil_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobil_promo` (
  `ID_Mobil_Promo` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Mobil` int(11) DEFAULT NULL,
  `ID_Promo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Mobil_Promo`),
  KEY `ID_Mobil` (`ID_Mobil`),
  KEY `ID_Promo` (`ID_Promo`),
  CONSTRAINT `mobil_promo_ibfk_1` FOREIGN KEY (`ID_Mobil`) REFERENCES `mobil` (`ID_Mobil`),
  CONSTRAINT `mobil_promo_ibfk_2` FOREIGN KEY (`ID_Promo`) REFERENCES `promo` (`ID_Promo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobil_promo`
--

LOCK TABLES `mobil_promo` WRITE;
/*!40000 ALTER TABLE `mobil_promo` DISABLE KEYS */;
INSERT INTO `mobil_promo` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `mobil_promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `ID_Pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `Nama` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telepon` varchar(15) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Pelanggan`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (1,'Andi','andi@example.com','08123456701','Jl. Merdeka No. 1'),(2,'Budi','budi@example.com','08123456702','Jl. Merdeka No. 2'),(3,'Citra','citra@example.com','08123456703','Jl. Merdeka No. 3'),(4,'Dika','dika@example.com','08123456704','Jl. Merdeka No. 4'),(5,'Eka','eka@example.com','08123456705','Jl. Merdeka No. 5'),(6,'Fajar','fajar@example.com','08123456706','Jl. Merdeka No. 6'),(7,'Gita','gita@example.com','08123456707','Jl. Merdeka No. 7'),(8,'Hadi','hadi@example.com','08123456708','Jl. Merdeka No. 8'),(9,'Ika','ika@example.com','08123456709','Jl. Merdeka No. 9'),(10,'Joko','joko@example.com','08123456710','Jl. Merdeka No. 10'),(11,'Kiki','kiki@example.com','08123456711','Jl. Merdeka No. 11'),(12,'Lina','lina@example.com','08123456712','Jl. Merdeka No. 12'),(13,'Maya','maya@example.com','08123456713','Jl. Merdeka No. 13'),(14,'Nina','nina@example.com','08123456714','Jl. Merdeka No. 14'),(15,'Omar','omar@example.com','08123456715','Jl. Merdeka No. 15'),(16,'Putu','putu@example.com','08123456716','Jl. Merdeka No. 16'),(17,'Qori','qori@example.com','08123456717','Jl. Merdeka No. 17'),(18,'Rina','rina@example.com','08123456718','Jl. Merdeka No. 18'),(19,'Sari','sari@example.com','08123456719','Jl. Merdeka No. 19'),(20,'Tina','tina@example.com','08123456720','Jl. Merdeka No. 20');
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran` (
  `ID_Pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Penjualan` int(11) DEFAULT NULL,
  `Metode_Pembayaran` varchar(50) NOT NULL,
  `Jumlah_Pembayaran` decimal(15,2) NOT NULL,
  `Tanggal_Pembayaran` date NOT NULL,
  PRIMARY KEY (`ID_Pembayaran`),
  KEY `ID_Penjualan` (`ID_Penjualan`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_Penjualan`) REFERENCES `penjualan` (`ID_Penjualan`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` VALUES (1,1,'Tunai',250000000.00,'2023-01-10'),(2,2,'Transfer',500000000.00,'2023-01-12'),(3,3,'Kartu Kredit',230000000.00,'2023-01-15'),(4,4,'Tunai',240000000.00,'2023-01-18'),(5,5,'Transfer',550000000.00,'2023-01-20'),(6,6,'Kartu Kredit',800000000.00,'2023-01-22'),(7,7,'Tunai',1500000000.00,'2023-01-25'),(8,8,'Transfer',1200000000.00,'2023-01-28'),(9,9,'Kartu Kredit',350000000.00,'2023-01-30'),(10,10,'Tunai',600000000.00,'2023-02-01'),(11,11,'Transfer',400000000.00,'2023-02-03'),(12,12,'Kartu Kredit',450000000.00,'2023-02-05'),(13,13,'Tunai',500000000.00,'2023-02-07'),(14,14,'Transfer',600000000.00,'2023-02-09'),(15,15,'Kartu Kredit',700000000.00,'2023-02-11'),(16,16,'Tunai',800000000.00,'2023-02-13'),(17,17,'Transfer',900000000.00,'2023-02-15'),(18,18,'Kartu Kredit',1000000000.00,'2023-02-17'),(19,19,'Tunai',1100000000.00,'2023-02-19'),(20,20,'Transfer',1200000000.00,'2023-02-21');
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembelian`
--

DROP TABLE IF EXISTS `pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembelian` (
  `ID_Pembelian` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Mobil` int(11) DEFAULT NULL,
  `ID_Supplier` int(11) DEFAULT NULL,
  `Tanggal_Pembelian` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Harga_Satuan` decimal(15,2) NOT NULL,
  PRIMARY KEY (`ID_Pembelian`),
  KEY `ID_Mobil` (`ID_Mobil`),
  KEY `ID_Supplier` (`ID_Supplier`),
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`ID_Mobil`) REFERENCES `mobil` (`ID_Mobil`),
  CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`ID_Supplier`) REFERENCES `supplier` (`ID_Supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembelian`
--

LOCK TABLES `pembelian` WRITE;
/*!40000 ALTER TABLE `pembelian` DISABLE KEYS */;
INSERT INTO `pembelian` VALUES (1,1,1,'2023-01-01',10,200000000.00),(2,2,2,'2023-01-05',5,450000000.00),(3,3,3,'2023-01-10',8,230000000.00),(4,4,4,'2023-01-15',12,240000000.00),(5,5,5,'2023-01-20',4,550000000.00),(6,6,6,'2023-01-25',3,800000000.00),(7,7,7,'2023-01-30',2,1500000000.00),(8,8,8,'2023-02-01',2,1200000000.00),(9,9,9,'2023-02-05',6,350000000.00),(10,10,10,'2023-02-10',5,600000000.00),(11,1,1,'2023-02-15',10,200000000.00),(12,2,2,'2023-02-20',5,450000000.00),(13,3,3,'2023-02-25',8,230000000.00),(14,4,4,'2023-03-01',12,240000000.00),(15,5,5,'2023-03-05',4,550000000.00),(16,6,6,'2023-03-10',3,800000000.00),(17,7,7,'2023-03-15',2,1500000000.00),(18,8,8,'2023-03-20',2,1200000000.00),(19,9,9,'2023-03-25',6,350000000.00),(20,10,10,'2023-03-30',5,600000000.00);
/*!40000 ALTER TABLE `pembelian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penjualan`
--

DROP TABLE IF EXISTS `penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penjualan` (
  `ID_Penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `ID_Mobil` int(11) DEFAULT NULL,
  `Tanggal_Penjualan` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Total_Harga` decimal(15,2) NOT NULL,
  PRIMARY KEY (`ID_Penjualan`),
  KEY `ID_Pelanggan` (`ID_Pelanggan`),
  KEY `ID_Mobil` (`ID_Mobil`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`),
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`ID_Mobil`) REFERENCES `mobil` (`ID_Mobil`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penjualan`
--

LOCK TABLES `penjualan` WRITE;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
INSERT INTO `penjualan` VALUES (1,1,1,'2023-01-10',1,250000000.00),(2,2,2,'2023-01-12',1,500000000.00),(3,3,3,'2023-01-15',1,230000000.00),(4,4,4,'2023-01-18',1,240000000.00),(5,5,5,'2023-01-20',1,550000000.00),(6,6,6,'2023-01-22',1,800000000.00),(7,7,7,'2023-01-25',1,1500000000.00),(8,8,8,'2023-01-28',1,1200000000.00),(9,9,9,'2023-01-30',1,350000000.00),(10,10,10,'2023-02-01',1,600000000.00),(11,11,1,'2023-02-03',1,400000000.00),(12,12,2,'2023-02-05',1,450000000.00),(13,13,3,'2023-02-07',1,500000000.00),(14,14,4,'2023-02-09',1,600000000.00),(15,15,5,'2023-02-11',1,700000000.00),(16,16,6,'2023-02-13',1,800000000.00),(17,17,7,'2023-02-15',1,900000000.00),(18,18,8,'2023-02-17',1,1000000000.00),(19,19,9,'2023-02-19',1,1100000000.00),(20,20,10,'2023-02-21',1,1200000000.00);
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promo`
--

DROP TABLE IF EXISTS `promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo` (
  `ID_Promo` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Promo` varchar(100) NOT NULL,
  `Diskon` decimal(5,2) NOT NULL,
  `Tanggal_Mulai` date NOT NULL,
  `Tanggal_Selesai` date NOT NULL,
  PRIMARY KEY (`ID_Promo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo`
--

LOCK TABLES `promo` WRITE;
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
INSERT INTO `promo` VALUES (1,'Promo 1',10.00,'2023-01-01','2023-01-31'),(2,'Promo 2',15.00,'2023-02-01','2023-02-28'),(3,'Promo 3',20.00,'2023-03-01','2023-03-31'),(4,'Promo 4',25.00,'2023-04-01','2023-04-30'),(5,'Promo 5',30.00,'2023-05-01','2023-05-31'),(6,'Promo 6',5.00,'2023-06-01','2023-06-30'),(7,'Promo 7',10.00,'2023-07-01','2023-07-31'),(8,'Promo 8',15.00,'2023-08-01','2023-08-31'),(9,'Promo 9',20.00,'2023-09-01','2023-09-30'),(10,'Promo 10',25.00,'2023-10-01','2023-10-31');
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servis`
--

DROP TABLE IF EXISTS `servis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servis` (
  `ID_Servis` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Mobil` int(11) DEFAULT NULL,
  `Tanggal_Servis` date NOT NULL,
  `Deskripsi` text NOT NULL,
  `Biaya` decimal(15,2) NOT NULL,
  PRIMARY KEY (`ID_Servis`),
  KEY `ID_Mobil` (`ID_Mobil`),
  CONSTRAINT `servis_ibfk_1` FOREIGN KEY (`ID_Mobil`) REFERENCES `mobil` (`ID_Mobil`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servis`
--

LOCK TABLES `servis` WRITE;
/*!40000 ALTER TABLE `servis` DISABLE KEYS */;
INSERT INTO `servis` VALUES (1,1,'2023-01-15','Ganti Oli',50000.00),(2,2,'2023-01-20','Perawatan Rutin',100000.00),(3,3,'2023-01-25','Ganti Ban',300000.00),(4,4,'2023-01-30','Cek Rem',150000.00),(5,5,'2023-02-05','Ganti Filter Udara',75000.00),(6,6,'2023-02-10','Cek Mesin',200000.00),(7,7,'2023-02-15','Ganti Busi',60000.00),(8,8,'2023-02-20','Cek Suspensi',120000.00),(9,9,'2023-02-25','Ganti Oli Transmisi',80000.00),(10,10,'2023-03-01','Perawatan AC',250000.00),(11,1,'2023-03-05','Cek Sistem Pembuangan',90000.00),(12,2,'2023-03-10','Ganti Lampu',50000.00),(13,3,'2023-03-15','Cek Sistem Kelistrikan',110000.00),(14,4,'2023-03-20','Ganti Radiator',300000.00),(15,5,'2023-03-25','Cek Ban',70000.00),(16,6,'2023-03-30','Ganti Wiper',40000.00),(17,7,'2023-04-05','Cek Rem',150000.00),(18,8,'2023-04-10','Ganti Oli',50000.00),(19,9,'2023-04-15','Perawatan Rutin',100000.00),(20,10,'2023-04-20','Ganti Ban',300000.00);
/*!40000 ALTER TABLE `servis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `ID_Supplier` int(11) NOT NULL AUTO_INCREMENT,
  `Nama_Supplier` varchar(100) NOT NULL,
  `Telepon` varchar(15) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Supplier A','08123456701','Jl. Industri No. 1'),(2,'Supplier B','08123456702','Jl. Perdagangan No. 2'),(3,'Supplier C','08123456703','Jl. Bisnis No. 3'),(4,'Supplier D','08123456704','Jl. Komersial No. 4'),(5,'Supplier E','08123456705','Jl. Ekonomi No. 5'),(6,'Supplier F','08123456706','Jl. Perusahaan No. 6'),(7,'Supplier G','08123456707','Jl. Usaha No. 7'),(8,'Supplier H','08123456708','Jl. Dagang No. 8'),(9,'Supplier I','08123456709','Jl. Jual Beli No. 9'),(10,'Supplier J','08123456710','Jl. Distribusi No. 10');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `ID_Transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Penjualan` int(11) DEFAULT NULL,
  `ID_Pembayaran` int(11) DEFAULT NULL,
  `Tanggal_Transaksi` date NOT NULL,
  PRIMARY KEY (`ID_Transaksi`),
  KEY `ID_Penjualan` (`ID_Penjualan`),
  KEY `ID_Pembayaran` (`ID_Pembayaran`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_Penjualan`) REFERENCES `penjualan` (`ID_Penjualan`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`ID_Pembayaran`) REFERENCES `pembayaran` (`ID_Pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (1,1,1,'2023-01-10'),(2,2,2,'2023-01-12'),(3,3,3,'2023-01-15'),(4,4,4,'2023-01-18'),(5,5,5,'2023-01-20'),(6,6,6,'2023-01-22'),(7,7,7,'2023-01-25'),(8,8,8,'2023-01-28'),(9,9,9,'2023-01-30'),(10,10,10,'2023-02-01'),(11,11,11,'2023-02-03'),(12,12,12,'2023-02-05'),(13,13,13,'2023-02-07'),(14,14,14,'2023-02-09'),(15,15,15,'2023-02-11'),(16,16,16,'2023-02-13'),(17,17,17,'2023-02-15'),(18,18,18,'2023-02-17'),(19,19,19,'2023-02-19'),(20,20,20,'2023-02-21');
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulasan`
--

DROP TABLE IF EXISTS `ulasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ulasan` (
  `ID_Ulasan` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `ID_Mobil` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Komentar` text,
  `Tanggal_Ulasan` date NOT NULL,
  PRIMARY KEY (`ID_Ulasan`),
  KEY `ID_Pelanggan` (`ID_Pelanggan`),
  KEY `ID_Mobil` (`ID_Mobil`),
  CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`),
  CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`ID_Mobil`) REFERENCES `mobil` (`ID_Mobil`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulasan`
--

LOCK TABLES `ulasan` WRITE;
/*!40000 ALTER TABLE `ulasan` DISABLE KEYS */;
INSERT INTO `ulasan` VALUES (1,1,1,5,'Sangat puas dengan mobil ini!','2023-01-11'),(2,2,2,4,'Mobil bagus, tapi agak mahal.','2023-01-13'),(3,3,3,5,'Performa luar biasa!','2023-01-15'),(4,4,4,3,'Cukup baik, tapi bisa lebih baik.','2023-01-17'),(5,5,5,4,'Nyaman untuk perjalanan jauh.','2023-01-19'),(6,6,6,5,'Sangat merekomendasikan!','2023-01-21'),(7,7,7,4,'Kualitas sangat baik.','2023-01-23'),(8,8,8,5,'Sangat puas dengan fitur-fitur yang ada.','2023-01-25'),(9,9,9,3,'Mobilnya oke, tapi konsumsi BBM tinggi.','2023-01-27'),(10,10,10,4,'Desain yang menarik.','2023-01-29'),(11,11,1,5,'Sangat nyaman dan aman.','2023-02-01'),(12,12,2,4,'Performa mesin sangat baik.','2023-02-03'),(13,13,3,5,'Sangat puas dengan pelayanan.','2023-02-05'),(14,14,4,4,'Mobil ini sangat cocok untuk keluarga.','2023-02-07'),(15,15,5,5,'Sangat baik untuk perjalanan jauh.','2023-02-09'),(16,16,6,4,'Kualitas suara audio sangat baik.','2023-02-11'),(17,17,7,5,'Sangat merekomendasikan untuk dibeli.','2023-02-13'),(18,18,8,4,'Cukup baik, tapi bisa lebih baik.','2023-02-15'),(19,19,9,5,'Sangat puas dengan fitur keselamatan.','2023-02-17'),(20,20,10,4,'Desain interior yang menarik.','2023-02-19');
/*!40000 ALTER TABLE `ulasan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 14:22:18
