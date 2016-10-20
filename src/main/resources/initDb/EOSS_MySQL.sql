/*TABLE STRUCTURE FOR TABLE MENU */

CREATE TABLE MENU (
  ID INT(32) NOT NULL PRIMARY KEY,
  PID INT(32) DEFAULT NULL,
  NAME VARCHAR(100) NOT NULL,
  LEAF INT(11) NOT NULL,
  PATH VARCHAR(1000) DEFAULT NULL,
  LEV INT(11) DEFAULT NULL,
  URL VARCHAR(1000) DEFAULT NULL,
  TARGET VARCHAR(100) DEFAULT NULL,
  CREATE_DATETIME VARCHAR(19) NOT NULL
);

/*DATA FOR THE TABLE MENU */

INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (1,-1,'菜单根目录',0,'--',0,NULL,NULL,'2012-12-15 18:08:07');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (2,1,'系统管理',0,'1#2',1,NULL,NULL,'2012-12-13 13:46:00');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (3,1,'业务管理',0,'1#3',1,NULL,NULL,'2012-12-13 13:53:10');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (4,2,'菜单管理',0,'1#2#4',2,NULL,NULL,'2012-12-13 16:00:02');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (5,2,'用户管理',0,'1#2#5',2,NULL,NULL,'2012-12-13 16:00:02');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (6,2,'角色管理',0,'1#2#6',2,NULL,NULL,'2012-12-13 16:00:02');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (7,4,'菜单添加',1,'1#2#4#7',3,'/eoss/system/menuAdd.jsp','centerFrame','2012-12-13 16:00:02');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (8,2,'权限管理',0,'1#2#8',2,NULL,NULL,'2012-12-16 13:59:33');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (9,4,'菜单查询',1,'1#2#4#9',3,'/eoss/menu/queryMenuPage.ac','centerFrame','2012-12-16 14:15:20');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (10,8,'权限添加',1,'1#2#8#10',3,'/eoss/system/permissionAdd.jsp','centerFrame','2012-12-20 14:58:29');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (13,8,'权限查询',1,'1#2#8#13',3,'/eoss/permission/queryPermissionPage.ac','centerFrame','2012-12-20 16:28:03');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (14,6,'角色添加',1,'1#2#6#14',3,'/eoss/system/roleAdd.jsp','centerFrame','2012-12-22 12:36:14');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (15,6,'角色查询',1,'1#2#6#15',3,'/eoss/role/queryRolePage.ac','centerFrame','2012-12-22 14:29:28');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (16,5,'用户添加',1,'1#2#5#16',3,'/eoss/system/userAdd.jsp','centerFrame','2012-12-22 18:34:26');
INSERT  INTO MENU(ID,PID,NAME,LEAF,PATH,LEV,URL,TARGET,CREATE_DATETIME) VALUES (17,5,'用户查询',1,'1#2#5#17',3,'/eoss/user/queryUserPage.ac','centerFrame','2012-12-22 19:56:13');

/*TABLE STRUCTURE FOR TABLE ROLE */

CREATE TABLE ROLE (
  ID INT(11) NOT NULL PRIMARY KEY,
  NAME VARCHAR(100) NOT NULL,
  CREATE_DATETIME VARCHAR(19) NOT NULL
);

/*DATA FOR THE TABLE ROLE */

INSERT  INTO ROLE(ID,NAME,CREATE_DATETIME) VALUES (1,'系统管理员','2012-12-22 16:27:04');

/*TABLE STRUCTURE FOR TABLE ROLE_PERMISSION */

CREATE TABLE ROLE_PERMISSION (
  PERMISSION_ID INT(11) NOT NULL,
  ROLE_ID INT(11) NOT NULL
);

/*DATA FOR THE TABLE ROLE_PERMISSION */

INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (7,1);
INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (9,1);
INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (16,1);
INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (17,1);
INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (14,1);
INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (15,1);
INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (10,1);
INSERT  INTO ROLE_PERMISSION(PERMISSION_ID,ROLE_ID) VALUES (13,1);

/*TABLE STRUCTURE FOR TABLE USERS */

CREATE TABLE USERS (
  ID INT(11) NOT NULL PRIMARY KEY,
  NAME VARCHAR(100) NOT NULL,
  PWD VARCHAR(32) NOT NULL,
  CREATE_DATETIME VARCHAR(19) NOT NULL
);

/*DATA FOR THE TABLE USERS */

INSERT  INTO USERS(ID,NAME,PWD,CREATE_DATETIME) VALUES (1,'admin','96e79218965eb72c92a549dd5a330112','2012-12-22 19:25:48');

/*TABLE STRUCTURE FOR TABLE USERS_ROLE */

CREATE TABLE USERS_ROLE (
  USERS_ID INT(11) NOT NULL,
  ROLE_ID INT(11) NOT NULL
);

/*DATA FOR THE TABLE USERS_ROLE */

INSERT  INTO USERS_ROLE(USERS_ID,ROLE_ID) VALUES (1,1);