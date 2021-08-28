CREATE DATABASE `ceyapmgdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- tables
-- Table: Message_Inbox
USE ceyapmgdb;

CREATE TABLE `Message_Inbox` (
    `id` int NOT NULL,
    `is_read` bool NOT NULL,
    `message_id` int NOT NULL,
    `recipient_id` int NOT NULL,
    `team_id` int NOT NULL,
    CONSTRAINT `Message_Inbox_pk` PRIMARY KEY (`id`)
);

-- Table: Messages
CREATE TABLE `Messages` (
    `id` int NOT NULL,
    `subject` varchar(64) NOT NULL,
    `body` text NOT NULL,
    `created_date` date NOT NULL,
    `Messages_id` int NULL,
    CONSTRAINT `Messages_pk` PRIMARY KEY (`id`)
);

-- Table: assigned
CREATE TABLE `assigned` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_account_id` int NOT NULL,
    `team_id` int NOT NULL,
    `task_id` int NOT NULL,
    CONSTRAINT `assigned_pk` PRIMARY KEY (`id`)
);

-- Table: client_partner
CREATE TABLE `client_partner` (
    `id` int NOT NULL AUTO_INCREMENT,
    `cp_name` varchar(255) NOT NULL,
    `cp_address` varchar(255) NOT NULL,
    `cp_details` text NOT NULL,
    CONSTRAINT `client_partner_pk` PRIMARY KEY (`id`)
) COMMENT 'list of business entities we work with on a project';

-- Table: on_project
CREATE TABLE `on_project` (
    `id` int NOT NULL AUTO_INCREMENT,
    `project_id` int NOT NULL,
    `client_partner_id` int NOT NULL,
    `date_start` date NOT NULL,
    `date_end` date NULL,
    `is_client` bool NOT NULL,
    `is_partner` bool NOT NULL,
    `description` text NOT NULL,
    CONSTRAINT `on_project_pk` PRIMARY KEY (`id`)
) COMMENT 'list of all clients and partners related with projects';

-- Table: preceding_task
CREATE TABLE `preceding_task` (
    `id` int NOT NULL AUTO_INCREMENT,
    `task_id` int NOT NULL,
    `preceding_task_id` int NOT NULL,
    UNIQUE INDEX `preceding_task_ak_1` (`task_id`,`preceding_task_id`),
    CONSTRAINT `preceding_task_pk` PRIMARY KEY (`id`)
);

-- Table: project
CREATE TABLE `project` (
    `id` int NOT NULL AUTO_INCREMENT,
    `project_name` varchar(128) NOT NULL,
    `start_date` date NOT NULL,
    `end_date` date NOT NULL,
    `project_description` text NOT NULL,
    CONSTRAINT `project_pk` PRIMARY KEY (`id`)
);

-- Table: project_manager
CREATE TABLE `project_manager` (
    `id` int NOT NULL AUTO_INCREMENT,
    `project_id` int NOT NULL,
    `user_account_id` int NOT NULL,
    UNIQUE INDEX `project_manager_ak_1` (`project_id`,`user_account_id`),
    CONSTRAINT `project_manager_pk` PRIMARY KEY (`id`)
);

-- Table: task
CREATE TABLE `task` (
    `id` int NOT NULL AUTO_INCREMENT,
    `task_name` varchar(255) NOT NULL,
    `project_id` int NOT NULL,
    `priority` int NOT NULL COMMENT 'e.g. 1 to 5',
    `description` text NULL,
    `start_date` date NOT NULL,
    `end_date` date NOT NULL,
    `planned_budget` decimal(8,2) NOT NULL,
    `actual_budget` date NULL,
    `is_task_completed` boolean NOT NULL,
    CONSTRAINT `task_pk` PRIMARY KEY (`id`)
) COMMENT 'list of all takss (group of activities) on projects';

-- Table: team
CREATE TABLE `team` (
    `id` int NOT NULL AUTO_INCREMENT,
    `team_name` varchar(128) NOT NULL,
    `is_active` boolean NOT NULL,
    UNIQUE INDEX `team_ak_1` (`team_name`),
    CONSTRAINT `team_pk` PRIMARY KEY (`id`)
);

-- Table: team_member
CREATE TABLE `team_member` (
    `id` int NOT NULL AUTO_INCREMENT,
    `team_id` int NOT NULL,
    `is_active` boolean NOT NULL,
    `user_account_id` int NOT NULL,
    UNIQUE INDEX `team_member_ak_1` (`team_id`),
    CONSTRAINT `team_member_pk` PRIMARY KEY (`id`)
) COMMENT 'grouping employees in team in case we want to assign whole team to a task';

-- Table: user_account
CREATE TABLE `user_account` (
    `id` int NOT NULL AUTO_INCREMENT,
    `username` varchar(64) NOT NULL,
    `password` varchar(64) NOT NULL,
    `email` varchar(255) NOT NULL,
    `first_name` varchar(64) NOT NULL,
    `last_name` varchar(64) NOT NULL,
    `is_active` boolean NOT NULL,
    `registration_time` timestamp NOT NULL,
    UNIQUE INDEX `user_account_ak_1` (`username`),
    UNIQUE INDEX `user_account_ak_2` (`email`),
    CONSTRAINT `user_account_pk` PRIMARY KEY (`id`)
) COMMENT 'list of all users that will have access to the database';

-- foreign keys
-- Reference: Message_Inbox_Messages (table: Message_Inbox)
ALTER TABLE `Message_Inbox` ADD CONSTRAINT `Message_Inbox_Messages` FOREIGN KEY `Message_Inbox_Messages` (`message_id`)
    REFERENCES `Messages` (`id`);

-- Reference: Message_Inbox_team (table: Message_Inbox)
ALTER TABLE `Message_Inbox` ADD CONSTRAINT `Message_Inbox_team` FOREIGN KEY `Message_Inbox_team` (`team_id`)
    REFERENCES `team` (`id`);

-- Reference: Message_Inbox_user_account (table: Message_Inbox)
ALTER TABLE `Message_Inbox` ADD CONSTRAINT `Message_Inbox_user_account` FOREIGN KEY `Message_Inbox_user_account` (`recipient_id`)
    REFERENCES `user_account` (`id`);

-- Reference: Messages_Messages (table: Messages)
ALTER TABLE `Messages` ADD CONSTRAINT `Messages_Messages` FOREIGN KEY `Messages_Messages` (`Messages_id`)
    REFERENCES `Messages` (`id`);

-- Reference: assigned_task (table: assigned)
ALTER TABLE `assigned` ADD CONSTRAINT `assigned_task` FOREIGN KEY `assigned_task` (`task_id`)
    REFERENCES `task` (`id`);

-- Reference: assigned_user_account (table: assigned)
ALTER TABLE `assigned` ADD CONSTRAINT `assigned_user_account` FOREIGN KEY `assigned_user_account` (`user_account_id`)
    REFERENCES `user_account` (`id`);

-- Reference: on_project_client_partner (table: on_project)
ALTER TABLE `on_project` ADD CONSTRAINT `on_project_client_partner` FOREIGN KEY `on_project_client_partner` (`client_partner_id`)
    REFERENCES `client_partner` (`id`);

-- Reference: on_project_project (table: on_project)
ALTER TABLE `on_project` ADD CONSTRAINT `on_project_project` FOREIGN KEY `on_project_project` (`project_id`)
    REFERENCES `project` (`id`);

-- Reference: preceding_task_task1 (table: preceding_task)
ALTER TABLE `preceding_task` ADD CONSTRAINT `preceding_task_task1` FOREIGN KEY `preceding_task_task1` (`task_id`)
    REFERENCES `task` (`id`);

-- Reference: preceding_task_task2 (table: preceding_task)
ALTER TABLE `preceding_task` ADD CONSTRAINT `preceding_task_task2` FOREIGN KEY `preceding_task_task2` (`preceding_task_id`)
    REFERENCES `task` (`id`);

-- Reference: project_manager_project (table: project_manager)
ALTER TABLE `project_manager` ADD CONSTRAINT `project_manager_project` FOREIGN KEY `project_manager_project` (`project_id`)
    REFERENCES `project` (`id`);

-- Reference: project_manager_user_account (table: project_manager)
ALTER TABLE `project_manager` ADD CONSTRAINT `project_manager_user_account` FOREIGN KEY `project_manager_user_account` (`user_account_id`)
    REFERENCES `user_account` (`id`);

-- Reference: task_project (table: task)
ALTER TABLE `task` ADD CONSTRAINT `task_project` FOREIGN KEY `task_project` (`project_id`)
    REFERENCES `project` (`id`);

-- Reference: team_member_team (table: team_member)
ALTER TABLE `team_member` ADD CONSTRAINT `team_member_team` FOREIGN KEY `team_member_team` (`team_id`)
    REFERENCES `team` (`id`);

-- Reference: team_member_user_account (table: team_member)
ALTER TABLE `team_member` ADD CONSTRAINT `team_member_user_account` FOREIGN KEY `team_member_user_account` (`user_account_id`)
    REFERENCES `user_account` (`id`);

-- End of file.

