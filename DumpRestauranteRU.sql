CREATE DATABASE  IF NOT EXISTS `restauranteru` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restauranteru`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: restauranteru
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `cardapio`
--

DROP TABLE IF EXISTS `cardapio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardapio` (
  `data_inicio` date NOT NULL,
  `tipo` enum('almoço','janta') NOT NULL,
  `opcao_segunda` int DEFAULT NULL,
  `opcao_terca` int DEFAULT NULL,
  `opcao_quarta` int DEFAULT NULL,
  `opcao_quinta` int DEFAULT NULL,
  `opcao_sexta` int DEFAULT NULL,
  PRIMARY KEY (`data_inicio`,`tipo`),
  KEY `opcao_segunda` (`opcao_segunda`),
  KEY `opcao_terca` (`opcao_terca`),
  KEY `opcao_quarta` (`opcao_quarta`),
  KEY `opcao_quinta` (`opcao_quinta`),
  KEY `opcao_sexta` (`opcao_sexta`),
  CONSTRAINT `cardapio_ibfk_1` FOREIGN KEY (`opcao_segunda`) REFERENCES `opcao_refeicao` (`codigo_opcao_refeicao`) ON DELETE CASCADE,
  CONSTRAINT `cardapio_ibfk_2` FOREIGN KEY (`opcao_terca`) REFERENCES `opcao_refeicao` (`codigo_opcao_refeicao`) ON DELETE CASCADE,
  CONSTRAINT `cardapio_ibfk_3` FOREIGN KEY (`opcao_quarta`) REFERENCES `opcao_refeicao` (`codigo_opcao_refeicao`) ON DELETE CASCADE,
  CONSTRAINT `cardapio_ibfk_4` FOREIGN KEY (`opcao_quinta`) REFERENCES `opcao_refeicao` (`codigo_opcao_refeicao`) ON DELETE CASCADE,
  CONSTRAINT `cardapio_ibfk_5` FOREIGN KEY (`opcao_sexta`) REFERENCES `opcao_refeicao` (`codigo_opcao_refeicao`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardapio`
--

LOCK TABLES `cardapio` WRITE;
/*!40000 ALTER TABLE `cardapio` DISABLE KEYS */;
INSERT INTO `cardapio` VALUES ('2022-01-10','almoço',1,2,3,1,2),('2022-01-10','janta',2,3,4,2,3),('2022-03-15','almoço',3,4,5,3,2),('2022-03-20','almoço',4,5,6,4,5),('2022-03-20','janta',5,6,7,5,6),('2022-03-21','almoço',6,7,8,6,7),('2022-03-21','janta',7,8,9,7,8),('2022-03-22','almoço',8,9,10,8,9),('2022-03-22','janta',9,10,1,2,3),('2022-03-23','almoço',10,6,7,10,1);
/*!40000 ALTER TABLE `cardapio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante`
--

DROP TABLE IF EXISTS `estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudante` (
  `cpf` varchar(14) NOT NULL,
  `matricula` char(9) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `matricula` (`matricula`),
  CONSTRAINT `estudante_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante`
--

LOCK TABLES `estudante` WRITE;
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
INSERT INTO `estudante` VALUES ('121.121.121-12','202310001'),('232.232.232-23','202310002'),('343.343.343-34','202310003'),('454.454.454-45','202310004'),('565.565.565-56','202310005'),('676.676.676-67','202310006'),('787.787.787-78','202310007'),('898.898.898-89','202310008'),('909.909.909-90','202310009'),('010.010.010-00','202310010');
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `cpf` varchar(14) NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `data_admin` date DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('101.101.101-10',4800.00,'2023-01-10'),('111.111.111-11',3000.00,'2023-01-01'),('222.222.222-22',3200.00,'2023-01-02'),('333.333.333-33',3400.00,'2023-01-03'),('444.444.444-44',3600.00,'2023-01-04'),('555.555.555-55',3800.00,'2023-01-05'),('666.666.666-66',4000.00,'2023-01-06'),('777.777.777-77',4200.00,'2023-01-07'),('888.888.888-88',4400.00,'2023-01-08'),('999.999.999-99',4600.00,'2023-01-09');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcao_refeicao`
--

DROP TABLE IF EXISTS `opcao_refeicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcao_refeicao` (
  `codigo_opcao_refeicao` int NOT NULL AUTO_INCREMENT,
  `opcao1` varchar(30) NOT NULL,
  `opcao2` varchar(30) NOT NULL,
  `opcao_vegana` varchar(30) NOT NULL,
  `acompanhamento` varchar(30) NOT NULL,
  `sobremesa` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo_opcao_refeicao`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcao_refeicao`
--

LOCK TABLES `opcao_refeicao` WRITE;
/*!40000 ALTER TABLE `opcao_refeicao` DISABLE KEYS */;
INSERT INTO `opcao_refeicao` VALUES (1,'Frango ao curry','Peixe grelhado','Tofu grelhado','Arroz branco','Gelatina de frutas'),(2,'Costeleta de porco','Strogonoff de frango','Espaguete de abobrinha','Legumes cozidos','Torta de limão'),(3,'Carne assada','Frango à milanesa','Salada de lentilhas','Purê de batata','Sorvete de morango'),(4,'Peixe frito','Filé de frango grelhado','Salada de rúcula','Farofa de bacon','Cheesecake'),(5,'Costelinha de porco','Quibe de abóbora','Salada de grão-de-bico','Cenoura ralada','Tiramisu'),(6,'Salsicha grelhada','Almôndega de carne','Espinafre refogado','Polenta frita','Pavê de chocolate'),(7,'Frango à passarinho','Bife à milanesa','Salada de repolho','Feijão preto','Bolo de cenoura'),(8,'Lasanha de frango','Bife à cavalo','Espaguete com almôndegas','Feijão tropeiro','Pavê de morango'),(9,'Filé de peixe com limão','Frango xadrez','Tofu à milanesa','Salada de couve-flor','Torta de maçã'),(10,'Feijoada','Risoto de cogumelos','Salada de grão-de-bico','Batata gratinada','Mousse de maracujá');
/*!40000 ALTER TABLE `opcao_refeicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_refeicao`
--

DROP TABLE IF EXISTS `ticket_refeicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_refeicao` (
  `ticket_codigo` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('almoço','janta') DEFAULT NULL,
  `data_venda` timestamp NULL DEFAULT NULL,
  `data_consumo` timestamp NULL DEFAULT NULL,
  `usuario` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ticket_codigo`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `ticket_refeicao_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`cpf`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_refeicao`
--

LOCK TABLES `ticket_refeicao` WRITE;
/*!40000 ALTER TABLE `ticket_refeicao` DISABLE KEYS */;
INSERT INTO `ticket_refeicao` VALUES (1,'almoço','2023-09-11 15:30:00','2023-09-11 16:15:00','111.111.111-11'),(2,'janta','2023-09-11 21:45:00',NULL,'222.222.222-22'),(3,'almoço','2023-09-12 15:30:00','2023-09-12 16:15:00','333.333.333-33'),(4,'janta','2023-09-12 21:45:00',NULL,'444.444.444-44'),(5,'almoço','2023-09-13 15:30:00','2023-09-13 16:15:00','555.555.555-55'),(6,'janta','2023-09-13 21:45:00',NULL,'454.454.454-45'),(7,'almoço','2023-09-14 15:30:00','2023-09-14 16:15:00','121.121.121-12'),(8,'janta','2023-09-14 21:45:00',NULL,'232.232.232-23'),(9,'almoço','2023-09-15 15:30:00','2023-09-15 16:15:00','565.565.565-56'),(10,'janta','2023-09-15 21:45:00',NULL,'676.676.676-67');
/*!40000 ALTER TABLE `ticket_refeicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `nome` varchar(30) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf` (`cpf`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('Aluno10','010.010.010-00','2006-07-07','aluno10@email.com','senha20'),('Funcionario10','101.101.101-10','1999-10-10','funcionario10@email.com','senha10'),('Funcionario1','111.111.111-11','1990-01-01','funcionario1@email.com','senha1'),('Aluno1','121.121.121-12','1990-12-12','aluno1@email.com','senha11'),('Funcionario2','222.222.222-22','1991-02-02','funcionario2@email.com','senha2'),('Aluno2','232.232.232-23','1991-01-01','aluno2@email.com','senha12'),('Funcionario3','333.333.333-33','1992-03-03','funcionario3@email.com','senha3'),('Aluno3','343.343.343-34','1992-02-02','aluno3@email.com','senha13'),('Funcionario4','444.444.444-44','1993-04-04','funcionario4@email.com','senha4'),('Aluno4','454.454.454-45','2000-01-01','aluno4@email.com','senha14'),('Funcionario5','555.555.555-55','1994-05-05','funcionario5@email.com','senha5'),('Aluno5','565.565.565-56','2001-02-02','aluno5@email.com','senha15'),('Funcionario6','666.666.666-66','1995-06-06','funcionario6@email.com','senha6'),('Aluno6','676.676.676-67','2002-03-03','aluno6@email.com','senha16'),('Funcionario7','777.777.777-77','1996-07-07','funcionario7@email.com','senha7'),('Aluno7','787.787.787-78','2003-04-04','aluno7@email.com','senha17'),('Funcionario8','888.888.888-88','1997-08-08','funcionario8@email.com','senha8'),('Aluno8','898.898.898-89','2004-05-05','aluno8@email.com','senha18'),('Aluno9','909.909.909-90','2005-06-06','aluno9@email.com','senha19'),('Funcionario9','999.999.999-99','1998-09-09','funcionario9@email.com','senha9');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 21:31:45
