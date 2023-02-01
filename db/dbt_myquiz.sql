-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Fev-2023 às 18:26
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbt_myquiz`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alternativas`
--

CREATE TABLE `alternativas` (
  `id` int(11) NOT NULL,
  `resposta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pergunta_id` int(11) NOT NULL,
  `val_resposta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `alternativas`
--

INSERT INTO `alternativas` (`id`, `resposta`, `pergunta_id`, `val_resposta`) VALUES
(1, 'Legenda', 1, 2),
(2, 'Conto', 1, 2),
(3, 'Lenda', 1, 1),
(4, 'Legendário', 1, 2),
(5, '10', 2, 2),
(6, '8', 2, 2),
(7, '12', 2, 2),
(8, '11', 2, 1),
(9, 'Os V', 3, 2),
(10, 'Os Y', 3, 1),
(11, 'Os X', 3, 2),
(12, 'Os W', 3, 2),
(13, 'Moxico', 4, 2),
(14, 'Namibe', 4, 1),
(15, 'Huíla', 4, 2),
(16, 'Cunene', 4, 2),
(17, 'Malange', 5, 1),
(18, 'Bié', 5, 2),
(19, 'Luanda', 5, 2),
(20, 'Bengo', 5, 2),
(21, 'Filipinas', 6, 2),
(22, 'Indonésia', 6, 1),
(23, 'Bahamas', 6, 2),
(24, 'Maldivas', 6, 2),
(25, 'Oxigênio', 7, 2),
(26, 'Nitrogênio', 7, 2),
(27, 'Dióxido de ferro', 7, 2),
(28, 'Dióxido de carbono', 7, 1),
(29, 'Oceano Índico', 8, 1),
(30, 'Oceano Pacífico', 8, 2),
(31, 'Oceano Atlântico', 8, 2),
(32, 'Oceano Ártico', 8, 2),
(33, 'Noé', 9, 2),
(34, 'Jesus Cristo', 9, 2),
(35, 'Matusalém', 9, 1),
(36, 'Abel', 9, 2),
(37, 'não se olha o rabo', 10, 2),
(38, 'bonito lhe parece', 10, 2),
(39, 'tem medo de água fria', 10, 2),
(40, 'não se olha os dentes', 10, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas`
--

CREATE TABLE `perguntas` (
  `id` int(11) NOT NULL,
  `pergunta` varchar(220) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controlo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `perguntas`
--

INSERT INTO `perguntas` (`id`, `pergunta`, `controlo`) VALUES
(1, 'O que a palavra legend significa em português?', 0),
(2, 'Qual o número máximo de jogadores em cada time numa partida de futebol?', 0),
(3, 'Quais são os cromossomos que determinam o sexo masculino?', 0),
(4, 'Em que província está localizado a Serra da Leba?', 0),
(5, 'A Palanca Negra é encontrada exclusivamente na província de:', 0),
(6, 'Qual é o maior arquipélago da terra?', 0),
(7, 'Que substância é absorvida pelas plantas e expirada por todos seres vivos?', 0),
(8, 'Em que oceano fica Madagascar?', 0),
(9, 'Quem viveu, segundo a Bíblia, 969 anos?', 0),
(10, 'Complete o provérbio \"A cavalo dado...\"', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alternativas`
--
ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alternativas`
--
ALTER TABLE `alternativas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `perguntas`
--
ALTER TABLE `perguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
