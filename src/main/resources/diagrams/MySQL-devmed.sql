CREATE TABLE `contato`(
    `id` VARCHAR(36) NOT NULL,
    `celular` VARCHAR(100) NULL,
    `email` VARCHAR(100) NULL,
    `id_cliente` VARCHAR(36) NOT NULL,
    `telefone` VARCHAR(100) NULL,
    `tipo_cliente` VARCHAR(2) NOT NULL
);
ALTER TABLE
    `contato` ADD PRIMARY KEY(`id`);
CREATE TABLE `consulta`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_agenda` VARCHAR(36) NOT NULL,
    `observacao` BIGINT NULL,
    `valor` DECIMAL(5, 2) NOT NULL
);
CREATE TABLE `endereco`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `tipo` VARCHAR(50) NULL,
    `logradouro` VARCHAR(255) NOT NULL,
    `numero` VARCHAR(50) NOT NULL,
    `complemento` VARCHAR(255) NULL,
    `bairro` VARCHAR(255) NOT NULL,
    `cidade` VARCHAR(255) NOT NULL,
    `uf` VARCHAR(2) NOT NULL,
    `cep` VARCHAR(255) NOT NULL,
    `id_cliente` VARCHAR(36) NOT NULL
);
CREATE TABLE `paciente`(
    `id` VARCHAR(36) NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `CPF` BIGINT NOT NULL,
    `sexo` VARCHAR(1) NOT NULL,
    `altura` DECIMAL(1, 2) NOT NULL,
    `peso` DECIMAL(2, 1) NOT NULL,
    `data_nascimento` DATE NOT NULL
);
ALTER TABLE
    `paciente` ADD PRIMARY KEY(`id`);
CREATE TABLE `medico`(
    `id` VARCHAR(36) NOT NULL,
    `nome` VARCHAR(255) NULL,
    `CRM` BIGINT NULL,
    `UF` CHAR(2) NULL
);
ALTER TABLE
    `medico` ADD PRIMARY KEY(`id`);
CREATE TABLE `agenda`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_cliente` VARCHAR(36) NULL,
    `tipo_cliente` CHAR(2) NOT NULL,
    `data` DATE NOT NULL,
    `hora` TIMESTAMP NOT NULL
);
ALTER TABLE
    `consulta` ADD CONSTRAINT `consulta_id_foreign` FOREIGN KEY(`id`) REFERENCES `agenda`(`id`);
ALTER TABLE
    `contato` ADD CONSTRAINT `contato_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `paciente`(`id`);
ALTER TABLE
    `medico` ADD CONSTRAINT `medico_id_foreign` FOREIGN KEY(`id`) REFERENCES `agenda`(`id`);
ALTER TABLE
    `contato` ADD CONSTRAINT `contato_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `medico`(`id`);
ALTER TABLE
    `endereco` ADD CONSTRAINT `endereco_id_foreign` FOREIGN KEY(`id`) REFERENCES `paciente`(`id`);
ALTER TABLE
    `endereco` ADD CONSTRAINT `endereco_id_foreign` FOREIGN KEY(`id`) REFERENCES `medico`(`id`);
ALTER TABLE
    `paciente` ADD CONSTRAINT `paciente_id_foreign` FOREIGN KEY(`id`) REFERENCES `agenda`(`id`);