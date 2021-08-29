USE ceyapmgdb;

-- foreign keys
ALTER TABLE `Message_Inbox`
    DROP FOREIGN KEY `Message_Inbox_Messages`;

ALTER TABLE `Message_Inbox`
    DROP FOREIGN KEY `Message_Inbox_team`;

ALTER TABLE `Message_Inbox`
    DROP FOREIGN KEY `Message_Inbox_user_account`;

ALTER TABLE `Messages`
    DROP FOREIGN KEY `Messages_Messages`;

ALTER TABLE `assigned`
    DROP FOREIGN KEY `assigned_task`;

ALTER TABLE `assigned`
    DROP FOREIGN KEY `assigned_user_account`;

ALTER TABLE `on_project`
    DROP FOREIGN KEY `on_project_client_partner`;

ALTER TABLE `on_project`
    DROP FOREIGN KEY `on_project_project`;

ALTER TABLE `preceding_task`
    DROP FOREIGN KEY `preceding_task_task1`;

ALTER TABLE `preceding_task`
    DROP FOREIGN KEY `preceding_task_task2`;

ALTER TABLE `project_manager`
    DROP FOREIGN KEY `project_manager_project`;

ALTER TABLE `project_manager`
    DROP FOREIGN KEY `project_manager_user_account`;

ALTER TABLE `task`
    DROP FOREIGN KEY `task_project`;

ALTER TABLE `team_member`
    DROP FOREIGN KEY `team_member_team`;

ALTER TABLE `team_member`
    DROP FOREIGN KEY `team_member_user_account`;

-- tables
DROP TABLE `Message_Inbox`;

DROP TABLE `Messages`;

DROP TABLE `assigned`;

DROP TABLE `client_partner`;

DROP TABLE `on_project`;

DROP TABLE `preceding_task`;

DROP TABLE `project`;

DROP TABLE `project_manager`;

DROP TABLE `task`;

DROP TABLE `team`;

DROP TABLE `team_member`;

DROP TABLE `user_account`;

DROP database ceyapmgdb;

-- End of file.

