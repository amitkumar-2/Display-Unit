-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dunitv2
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assigned_parts`
--

DROP TABLE IF EXISTS `assigned_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_parts` (
  `line_id` varchar(3) NOT NULL,
  `part_id` varchar(20) NOT NULL,
  `part_name` varchar(20) NOT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_parts`
--

LOCK TABLES `assigned_parts` WRITE;
/*!40000 ALTER TABLE `assigned_parts` DISABLE KEYS */;
INSERT INTO `assigned_parts` VALUES ('1','1','TPMS'),('2','2','Moto_OCR_234'),('3','1','Vivo_PCB_x48'),('4','4','Speaker_wb_22f'),('5','3','POCO_ram'),('6','6','NYLON_ARC_CARD'),('7','4','Speaker_wb_22f'),('8','8','Vivo_ram_pcb'),('9','4','Speaker_wb_22f'),('10','8','Vivo_ram_pcb');
/*!40000 ALTER TABLE `assigned_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chart_parameters`
--

DROP TABLE IF EXISTS `chart_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chart_parameters` (
  `process_id` varchar(2) NOT NULL,
  `USL` varchar(45) NOT NULL,
  `LSL` varchar(45) NOT NULL,
  `A2` varchar(45) NOT NULL,
  `D2` varchar(45) NOT NULL,
  `D3` varchar(45) NOT NULL,
  `D4` varchar(45) NOT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chart_parameters`
--

LOCK TABLES `chart_parameters` WRITE;
/*!40000 ALTER TABLE `chart_parameters` DISABLE KEYS */;
INSERT INTO `chart_parameters` VALUES ('2','375','355','0.58','2.33','0','2.11');
/*!40000 ALTER TABLE `chart_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checksheet`
--

DROP TABLE IF EXISTS `checksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checksheet` (
  `param_id` varchar(20) NOT NULL,
  `specification` varchar(300) NOT NULL,
  `control_method` varchar(300) NOT NULL,
  `frequency` varchar(300) NOT NULL,
  `param_value` varchar(400) NOT NULL,
  `parav_value_hindi` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checksheet`
--

LOCK TABLES `checksheet` WRITE;
/*!40000 ALTER TABLE `checksheet` DISABLE KEYS */;
INSERT INTO `checksheet` VALUES ('1','प्लान के अनुसार','visual','प्रतिदिन','Plan के अनुसार Part assy & Child parts Working Table पर रखें|','फर्श साफ है?'),('2','कार्यस्थल रहित होना चाहिए।','Visual','प्रतिदिन','अपने कार्यस्थल को साफ करे|','मेज साफ है?'),('3','अनावश्यक Part / material Working Table पर न हो','Visual','प्रतिदिन','कार्य करने से पहले Working table पर से अनावश्यक Part / material हटा दे, और उसे उसकी जगह पर रखें।','सब कुछ सही जगह पर है?'),('4','Dirty Tray Area','Visual','प्रतिदिन','Dirty tray को लाइन पर use ना करे उसको उसकी निर्धारित जगह पर सफाई के लिए रख दे |','सभी हिस्से संरचित हैं?'),('5','Fixture / Machine Condition OK, No loose connections','visual','प्रतिदिन','चेक करे कि Fixture / Machine Condition OK हो और उसके सभी Connections ठीक हो,  Loose ना हो।   ','कंप्यूटर चल रहा है?'),('6','Verification Tag / Calibration Tag','Visual','प्रतिदिन','चेक करे कि Fixture / Machine में लगे Calibration / Verification Tag कि Date Expire ना हो। ','नेटवर्क ठीक है?'),('7','लाल / हरा SIGNAL (As per Work instruction)','Wrist Band tester','प्रतिदिन','चेक करे कि ESD Wrist Band OK हो।(Where Applicable)','वाईफ़ाई काम कर रहा है?'),('8','कार्य करते समय(As per Work instruction)','Visual','प्रतिदिन','ESD wrist band पहने।','फ़्लोर इंचार्ज समय पर मौजूद है?'),('9','Shop Floor पर उपलब्ध हो। (As per Work instruction)','Visual','प्रतिदिन','Face mask पहने। (Where Applicable)','स्क्रीन चालू है?'),('10','कार्य करते समय ','Visual','प्रतिदिन','ESD Jacket & Cap, ESD Gloves/Finger coats पहने। ','कुर्सी संयोजित और साफ है?'),('11','कार्य शुरू करने से पहले ।','Visual','प्रतिदिन','चेक करे कि Red Drawer मे NG Parts रखने के लिए Tray उपलब्ध हो |','none'),('12','Reject Tag, OK Tag, Abnormal Situation Tag etc.','Visual','प्रतिदिन','चेक करे कि Drawer मैं जरुरत के अनुसार सभी  टैग & PPE\'s उपलब्ध हो |  ','none'),('13','कार्य शुरू करने से पहले ।','Visual','प्रतिदिन','चेक करे कि Drawer मैं कोई भी अनुपयोगी वस्तु न हो।','none'),('14','Setup & FPA, Daily monthly Rejection sheet,Control Charts etc.','Visual','प्रतिदिन','चेक करे कि कार्यस्थल पर जरूरत के अनुसार सभी Documents उपलब्ध हो |','none'),('15','कार्य शुरू करने से पहले ।','Visual','प्रतिदिन','चेक करे कि  Line पर OK/NG Master sample उपलब्ध हो और उसकी Date Expire न हो |','none'),('16','Tea break & Lunch','Visual','प्रतिदिन','Tea Break और Lunch मैं बाहर जाते समय अपने Setup / System को OFF करके जाए।','none'),('17','Tea break & Lunch','Visual','प्रतिदिन','Tea Break और Lunch मैं बाहर जाते समय अपने LIGHT को OFF करके जाए।','none'),('18','Tea break & Lunch','Visual','प्रतिदिन','Tea Break & Lunch मैं यदि Shop Floor के अंदर हो तो Jacket & Cap पहन के रखे।','none'),('19','OK/NG','Visual / Manual','प्रतिदिन','FRL (Pressure gauge) मैं लगी Pin को Push करके 10~12 Sec तक Air को निकाले, यदि Air के साथ पानी भी आ रहा हो तो तुरंत अपने सुपरवाइज़र को सूचित करें | (Where FRL Applicable)','none'),('20','OK/NG','सुपरवाइज़र के द्वारा','प्रतिदिन','चेक करें कि रिजेक्ट हुए Parts के Hand over का तरीका सही हो।','none'),('21','Shop Floor पर उपलब्ध हो। ','Visual','प्रतिदिन','ESD Shoes/Sleepers पहने | (Where Applicable)','none'),('22','Shop Floor पर उपलब्ध हो और Valid Date Expire ना हो।','Visual','प्रतिदिन','Skill level Card को चेक करें कि उसकी Valid Date Expire ना हो।','none'),('23','OK/NG','Visual','प्रतिदिन','चेक करें कि ESD Shoes / Sleepers OK हो | (Where Applicable)','none'),('24','OK/NG','Visual','प्रतिदिन','हर शिफ्ट में कार्य शुरू करने से पहले  POGO Pins ठीक से सफाई करें रें | (Where Applicable) ','none'),('25','OK/NG','Visual','प्रतिदिन','कार्य शुरू करने से पहले Curing Rack कि condition चेक करें कि Timer सही से कार्य कर रहे हो रेक Damage ना हो | (Where Applicable) ','none');
/*!40000 ALTER TABLE `checksheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checksheet_data`
--

DROP TABLE IF EXISTS `checksheet_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checksheet_data` (
  `param_id` int NOT NULL AUTO_INCREMENT,
  `station_id` varchar(25) DEFAULT NULL,
  `employee_id` varchar(45) DEFAULT NULL,
  `employee_name` varchar(45) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `p1` varchar(550) DEFAULT NULL,
  PRIMARY KEY (`param_id`)
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checksheet_data`
--

LOCK TABLES `checksheet_data` WRITE;
/*!40000 ALTER TABLE `checksheet_data` DISABLE KEYS */;
INSERT INTO `checksheet_data` VALUES (225,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 18:13:30','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(224,'F1 L1 S1','E01','Arun Kumar','Wednesday, February 28, 2024 18:12:29','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(223,'F1 L1 S1','E01','Arun Kumar','Wednesday, February 28, 2024 18:08:49','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(222,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 18:02:45','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(221,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 18:00:50','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(220,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 17:57:01','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(219,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 17:55:07','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(218,'F1 L1 S1','E01','Arun Kumar','Wednesday, February 28, 2024 16:40:47','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(217,'F1 L1 S1','E01','Arun Kumar','Wednesday, February 28, 2024 16:36:47','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(216,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 16:28:42','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(215,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 16:23:57','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(214,'F1 L1 S1','E01','Arun Kumar','Wednesday, February 28, 2024 16:16:49','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(213,'F1 L1 S2','E02','Vinay Kapoor','Wednesday, February 28, 2024 16:14:29','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(212,'F1 L1 S1','E01','Arun Kumar','Wednesday, February 28, 2024 16:13:18','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status'),(211,'F1 L1 S1','E01','Arun Kumar','Wednesday, February 28, 2024 16:10:33','status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status,status');
/*!40000 ALTER TABLE `checksheet_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floors`
--

DROP TABLE IF EXISTS `floors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floors` (
  `floor_id` varchar(3) NOT NULL,
  `user_assigned` varchar(15) DEFAULT NULL,
  `number_of_lines` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`floor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floors`
--

LOCK TABLES `floors` WRITE;
/*!40000 ALTER TABLE `floors` DISABLE KEYS */;
INSERT INTO `floors` VALUES ('1','E01','1'),('2','E02','4'),('3','E03','5');
/*!40000 ALTER TABLE `floors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `image_id` varchar(45) NOT NULL,
  `process_id` varchar(45) NOT NULL,
  `image_url` varchar(300) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('1','1','https://drive.usercontent.google.com/download?id=1WOQrMAoTG9sk3tjaxi2LsjnVtLcA_r84&export=download'),('2','1','https://drive.usercontent.google.com/download?id=1wPRnCUzdihdy89rlax1unDcx_2U4WOWQ&export=download'),('3','2','https://drive.usercontent.google.com/download?id=1J3p4m2zuVje0ANfqk4naAeFUfgjcbYYG&export=download'),('4','2','https://drive.usercontent.google.com/download?id=1pCKQvSK6HyyRRzBtoVORUdVLZ6U2sTLP&export=download');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_admin`
--

DROP TABLE IF EXISTS `login_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_admin` (
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `employee_code` varchar(15) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  `building_id` varchar(45) DEFAULT NULL,
  `floor_id` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`employee_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_admin`
--

LOCK TABLES `login_admin` WRITE;
/*!40000 ALTER TABLE `login_admin` DISABLE KEYS */;
INSERT INTO `login_admin` VALUES ('Rahul','Dev','E01','amzi2','1','1'),('Ajay','Sinha','E02','amzi2','1','2'),('Manish','Pal','E03','amzi2','3','1'),('Veena','Debu','E04','amzi2','1','4'),('Saroj','Nagar','E05','amzi2','2','6');
/*!40000 ALTER TABLE `login_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_data`
--

DROP TABLE IF EXISTS `login_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_data` (
  `employee_code` varchar(20) NOT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `station_id` varchar(20) DEFAULT NULL,
  `process_id` varchar(20) DEFAULT NULL,
  `in_timestamp` varchar(45) DEFAULT NULL,
  `out_timestamp` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_data`
--

LOCK TABLES `login_data` WRITE;
/*!40000 ALTER TABLE `login_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_operator`
--

DROP TABLE IF EXISTS `login_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_operator` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `employee_code` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `skill` varchar(10) NOT NULL,
  `islogin` varchar(1) NOT NULL,
  PRIMARY KEY (`employee_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_operator`
--

LOCK TABLES `login_operator` WRITE;
/*!40000 ALTER TABLE `login_operator` DISABLE KEYS */;
INSERT INTO `login_operator` VALUES ('Arun','Kumar','E01','amzi','9','0'),('Vinay','Kapoor','E02','amzi','4','0'),('Hima','Pandey','E03','amzi','10','0'),('Anjali','Shukla','E04','amzi','7','0'),('Jyoti','Pandey','E05','amzi','1','0'),('Amzad','Khan','E06','amzi','4','0'),('Amit','Kumar','E07','amzi','3','0'),('Rahul','Gandhi','E08','amzi','5','0'),('Modi','Sen','E09','amzi','7','0'),('Shalu','Tola','E10','amzi','9','0'),('Lola','Kriss','E11','amzi','8','0'),('Ven','Tup','E12','amzi','8','0'),('Chil','Pil','E13','amzi','4','0'),('Mia','Sen','E14','amzi','2','0'),('Amber','watts','E15','amzi','10','0'),('Anjali','Shukla','E16','amzi','6','0'),('Jyoti','Pandey','E17','amzi','5','0'),('Amzad','Khan','E18','amzi','6','0'),('Amit','Kumar','E19','amzi','9','0'),('Modi','Sen','E20','amzi','7','0'),('Shalu','Tola','E21','amzi','9','0'),('Lola','Kriss','E22','amzi','8','0'),('Ven','Tup','E23','amzi','8','0'),('Chil','Pil','E24','amzi','4','0'),('Mia','Sen','E25','amzi','2','0');
/*!40000 ALTER TABLE `login_operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
  `parm_id` varchar(50) NOT NULL,
  `process_id` varchar(45) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `type` varchar(45) NOT NULL,
  `min` varchar(45) NOT NULL,
  `max` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `isfillable` varchar(45) NOT NULL,
  PRIMARY KEY (`parm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` VALUES ('1','1','Check that camera based TV Monitor is working','setting','none','none','none','0'),('10','2','Power Supply Voltage','setting','12','12','V','0'),('11','2','Air Pressure ','setting','2','4',' kgf/cm2','0'),('12','2','Verification with OK','setting','none','none','none','0'),('13','2','Verification with NG','setting','none','none','none','0'),('14','2','Pin voltage at Pin 1','actual','4.8','5.2','V','0'),('15','2','Pin voltage at Pin 2','actual','4.8','5.2','V','0'),('16','2','Pin voltage at Pin 3','actual','0','0','V','0'),('17','2','Pin voltage at Pin 4','actual','4.8','4.8','V','0'),('18','2','Dark Current','actual','0','2','mA','1'),('19','2','Crystal Frequency (X1)','actual','8','8','MHz','0'),('2','1','Magnifying lens is working condition ','setting','none','none','none','0'),('20','2','Select cyclone - For TSC 04 & 05 : 51-00-2305-3','setting','none','none','none','0'),('21','2','Select cyclone - For TSC 02 : 51-00-2629-3','setting','none','none','none','0'),('22','2','Program selection - For TSC 2 - TSC 02','setting','none','none','none','0'),('23','2','Program selection - For TSC 04 & 05 - NEXON & Q5','setting','none','none','none','0'),('24','2','Poka Yoke Verification -  1. Part can\'t fix in wrong direction on test setup.','setting','none','none','none','0'),('25','2','Poka Yoke Verification - 2.  If programing not done in part, Red / Fail indication show on cyclone.','setting','none','none','none','0'),('26','2','Check 2 Parts (Programme success green/ Pass indication)','actual','none','none','none','0'),('3','1','Verify No component damage','actual','none','none','none','0'),('4','1','No dry solder','actual','none','none','none','0'),('5','1','No shorting','actual','none','none','none','0'),('6','1','No component missing','actual','none','none','none','0'),('7','1','No solder crack','actual','none','none','none','0'),('8','1','No solde ball','actual','none','none','none','0'),('9','1','No unwanted solder material','actual','none','none','none','0');
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `part_id` varchar(20) NOT NULL,
  `floor_id` varchar(3) DEFAULT NULL,
  `part_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`part_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES ('1','1','TPMS'),('2','1','Moto_OCR_234'),('3','2','POCO_ram'),('4','2','Speaker_wb_22f'),('5','1','Processor_PCB_2'),('6','3','NYLON_ARC_CARD'),('7','1','graphic_card_VCX'),('8','1','Vivo_ram_pcb'),('9','2','Vivo_PCB_10'),('10','1','OREO_Graphic_card'),('11','1','Conductor_2'),('12','10','REY_LIGHT'),('13','1','VR_headset_PCB'),('14','2','AUTO_part'),('15','1','Auto_ORC_cable'),('16','1','Graphic_Audio_part');
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_data`
--

DROP TABLE IF EXISTS `process_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_data` (
  `process_data_id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(45) DEFAULT NULL,
  `process_id` varchar(20) DEFAULT NULL,
  `station_id` varchar(20) DEFAULT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `p1` varchar(1000) DEFAULT NULL,
  `p2` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`process_data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=554 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_data`
--

LOCK TABLES `process_data` WRITE;
/*!40000 ALTER TABLE `process_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processes`
--

DROP TABLE IF EXISTS `processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processes` (
  `process_id` varchar(10) NOT NULL,
  `process_name` varchar(100) NOT NULL,
  `prrocess_skill` varchar(25) NOT NULL,
  `part_id` varchar(25) NOT NULL,
  `is_last` varchar(45) NOT NULL,
  `is_chart_available` varchar(45) NOT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processes`
--

LOCK TABLES `processes` WRITE;
/*!40000 ALTER TABLE `processes` DISABLE KEYS */;
INSERT INTO `processes` VALUES ('1','Visual inspection of PCB Assy','9','1','0','0'),('2','Voltage & Dark current check & IC Programming @ 12 V','6','1','1','1');
/*!40000 ALTER TABLE `processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readings`
--

DROP TABLE IF EXISTS `readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `readings` (
  `reading_id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(45) NOT NULL,
  `process_id` varchar(45) NOT NULL,
  `station_id` varchar(45) NOT NULL,
  `timestamp` varchar(45) NOT NULL,
  `reading_values` varchar(45) NOT NULL,
  PRIMARY KEY (`reading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readings`
--

LOCK TABLES `readings` WRITE;
/*!40000 ALTER TABLE `readings` DISABLE KEYS */;
/*!40000 ALTER TABLE `readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejected_reason`
--

DROP TABLE IF EXISTS `rejected_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rejected_reason` (
  `process_id` int NOT NULL,
  `process_name` varchar(45) NOT NULL,
  `r1` varchar(45) DEFAULT NULL,
  `r2` varchar(45) DEFAULT NULL,
  `r3` varchar(45) DEFAULT NULL,
  `r4` varchar(45) DEFAULT NULL,
  `r5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejected_reason`
--

LOCK TABLES `rejected_reason` WRITE;
/*!40000 ALTER TABLE `rejected_reason` DISABLE KEYS */;
INSERT INTO `rejected_reason` VALUES (1,'Coating','Not proper height','Not good width','Very thin layer','Colour not matching',NULL),(2,'Hardware','Very Heavy','Weight not proper',NULL,NULL,NULL),(3,'AUdacity','Too loud','Sound not proper','torn speakers',NULL,NULL),(4,'Coating','Bad colour','Too much thickness',NULL,NULL,NULL),(5,'Wiring','Wrong wire','Not proper',NULL,NULL,NULL),(6,'Touchup','Bad','Very bad','worse','worst',NULL),(7,'Cables','No electricity','power fluctuation','torn cables','Too much diameter','Too much length'),(8,'Friction','too much friction','too less friction',NULL,NULL,NULL),(9,'Flexibility','Bad flexifibility','too stirr','less flexible','too much flexible',NULL),(10,'Polish','not shiny','very much shiny',NULL,NULL,NULL),(11,'Decibel','Audio less',NULL,NULL,NULL,NULL),(12,'Pressure','Too much pressure','Too less pressure',NULL,NULL,NULL);
/*!40000 ALTER TABLE `rejected_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift_timings`
--

DROP TABLE IF EXISTS `shift_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_timings` (
  `shift_name` varchar(50) NOT NULL,
  `shift_start_time` time NOT NULL,
  `shift_end_time` time NOT NULL,
  `tea_break_1_start` time NOT NULL,
  `tea_break_1_end` time NOT NULL,
  `lunch_start` time NOT NULL,
  `lunch_end` time NOT NULL,
  `tea_break_2_start` time NOT NULL,
  `tea_break_2_end` time NOT NULL,
  PRIMARY KEY (`shift_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift_timings`
--

LOCK TABLES `shift_timings` WRITE;
/*!40000 ALTER TABLE `shift_timings` DISABLE KEYS */;
INSERT INTO `shift_timings` VALUES ('Shift A','07:30:00','04:00:00','10:00:00','10:10:00','12:00:00','12:30:00','02:40:00','02:50:00');
/*!40000 ALTER TABLE `shift_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `station_id` varchar(20) NOT NULL,
  `station_num` varchar(45) DEFAULT NULL,
  `e_one` varchar(25) NOT NULL,
  `e_one_name` varchar(25) DEFAULT NULL,
  `e_one_skill` varchar(25) DEFAULT NULL,
  `e_two` varchar(25) DEFAULT NULL,
  `e_two_name` varchar(25) DEFAULT NULL,
  `e_two_skill` varchar(25) DEFAULT NULL,
  `process_id` varchar(25) DEFAULT NULL,
  `process_name` varchar(100) DEFAULT NULL,
  `process_skill` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES ('F1 L1 S1','1','E01','Arun Kumar','9','E05','Jyoti Pandey','1','1','Visual inspection of PCB Assy','9'),('F1 L1 S2','2','E02','Vinay Kapoor','4','E06','Amzad Khan','4','2','Voltage & Dark current check & IC Programming @ 12 V','6');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_assigned`
--

DROP TABLE IF EXISTS `task_assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_assigned` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `floor_id` varchar(3) NOT NULL,
  `line_id` varchar(3) NOT NULL,
  `part_id` varchar(45) NOT NULL,
  `part_name` varchar(45) DEFAULT NULL,
  `prev_quantity` varchar(5) DEFAULT NULL,
  `quantity` varchar(5) DEFAULT NULL,
  `assigned_for_date` varchar(45) DEFAULT NULL,
  `is_task_completed` varchar(45) DEFAULT NULL,
  `parts_completed` varchar(45) DEFAULT NULL,
  `parts_filled` varchar(45) DEFAULT NULL,
  `parts_passed` varchar(45) DEFAULT NULL,
  `parts_failed` varchar(45) DEFAULT NULL,
  `approved` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_assigned`
--

LOCK TABLES `task_assigned` WRITE;
/*!40000 ALTER TABLE `task_assigned` DISABLE KEYS */;
INSERT INTO `task_assigned` VALUES (99,'1','1','1','TPMS','0','11','2024-02-28','1','11','0','7','4','1');
/*!40000 ALTER TABLE `task_assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testrupd`
--

DROP TABLE IF EXISTS `testrupd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testrupd` (
  `id` varchar(45) NOT NULL,
  `p1` varchar(45) DEFAULT NULL,
  `p2` varchar(45) DEFAULT NULL,
  `p3` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testrupd`
--

LOCK TABLES `testrupd` WRITE;
/*!40000 ALTER TABLE `testrupd` DISABLE KEYS */;
/*!40000 ALTER TABLE `testrupd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testwheel`
--

DROP TABLE IF EXISTS `testwheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testwheel` (
  `id` varchar(45) NOT NULL,
  `p1` varchar(45) DEFAULT NULL,
  `p2` varchar(45) DEFAULT NULL,
  `p3` varchar(45) DEFAULT NULL,
  `p4` varchar(45) DEFAULT NULL,
  `p5` varchar(45) DEFAULT NULL,
  `p6` varchar(45) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testwheel`
--

LOCK TABLES `testwheel` WRITE;
/*!40000 ALTER TABLE `testwheel` DISABLE KEYS */;
/*!40000 ALTER TABLE `testwheel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timings`
--

DROP TABLE IF EXISTS `timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timings` (
  `floor_id` varchar(3) NOT NULL,
  `time_start` varchar(25) DEFAULT NULL,
  `time_end` varchar(25) DEFAULT NULL,
  `time_start2` varchar(25) DEFAULT NULL,
  `time_end2` varchar(25) DEFAULT NULL,
  `lunch_start` varchar(25) DEFAULT NULL,
  `lunch_end` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`floor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timings`
--

LOCK TABLES `timings` WRITE;
/*!40000 ALTER TABLE `timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_f1`
--

DROP TABLE IF EXISTS `work_f1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_f1` (
  `work_id` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(45) DEFAULT NULL,
  `station_id` varchar(25) DEFAULT NULL,
  `process_id` varchar(25) NOT NULL,
  `part_id` varchar(25) NOT NULL,
  `timestamp` varchar(45) DEFAULT NULL,
  `floor_id` varchar(3) DEFAULT NULL,
  `line_id` varchar(3) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `remark` varchar(450) DEFAULT NULL,
  `isfilled` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=MyISAM AUTO_INCREMENT=561 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_f1`
--

LOCK TABLES `work_f1` WRITE;
/*!40000 ALTER TABLE `work_f1` DISABLE KEYS */;
INSERT INTO `work_f1` VALUES (560,'99','F1 L1 S2','2','1','Wednesday, February 28, 2024 18:13:57','1','1','1','','','1'),(559,'99','F1 L1 S2','2','1','Wednesday, February 28, 2024 18:13:55','1','1','1','','','1'),(558,'99','F1 L1 S2','2','1','Wednesday, February 28, 2024 18:13:54','1','1','1','','','1'),(557,'99','F1 L1 S2','2','1','Wednesday, February 28, 2024 18:13:42','1','1','0','Not good width','','1');
/*!40000 ALTER TABLE `work_f1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 18:40:55
