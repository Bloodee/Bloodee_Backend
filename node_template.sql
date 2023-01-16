/*
 Navicat Premium Data Transfer

 Source Server         : localhost_5432
 Source Server Type    : PostgreSQL
 Source Server Version : 150001 (150001)
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150001 (150001)
 File Encoding         : 65001

 Date: 21/12/2022 01:14:07
*/

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ----------------------------
-- Table structure for permission_lists
-- ----------------------------
DROP TABLE IF EXISTS "public"."permission_lists";
CREATE TABLE "public"."permission_lists" (
  "permission_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "permission_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of permission_lists
-- ----------------------------
INSERT INTO "public"."permission_lists" VALUES ('ecb8b936-dff4-4c38-b219-ca191ef269f7', 'test');
INSERT INTO "public"."permission_lists" VALUES ('3ae1c8bf-81a9-4460-97d3-075e4264ab80', 'temp');

-- ----------------------------
-- Table structure for roles_lists
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles_lists";
CREATE TABLE "public"."roles_lists" (
  "role_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "role_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of roles_lists
-- ----------------------------
INSERT INTO "public"."roles_lists" VALUES ('0aeb81bb-0c3d-4d86-8f90-95a56924492f', 'SUPERADMIN');

-- ----------------------------
-- Table structure for roles_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles_permission";
CREATE TABLE "public"."roles_permission" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "role_id" uuid,
  "permission_id" uuid
)
;

-- ----------------------------
-- Records of roles_permission
-- ----------------------------
INSERT INTO "public"."roles_permission" VALUES ('cfe1aa63-effb-497c-a764-954f5206e1ed', '0aeb81bb-0c3d-4d86-8f90-95a56924492f', 'ecb8b936-dff4-4c38-b219-ca191ef269f7');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "user_id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "username" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "account_status" varchar(255) COLLATE "pg_catalog"."default",
  "google_iud" varchar(255) COLLATE "pg_catalog"."default",
  "org_email" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('a0faa119-3d0b-40ac-8bc9-dfa6d20c0946', 'Test', '$2a$12$sALoG/uQgDUK/FMwVRJ4/.tG7XaQ0rZSC8m74DIHeeZ8dmqxxGBCe', NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES ('16056f41-6ba5-4c51-9dd7-f77d0a36faaa', 'Tests', '$2a$12$MxBNds/QIADSM01V8wK1uOIFWGFy9p1LYI790EsRvPCa2bOIVMar.', 'active', NULL, NULL);

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."users_roles";
CREATE TABLE "public"."users_roles" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "user_id" uuid,
  "role_id" uuid
)
;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO "public"."users_roles" VALUES ('1a02f375-62cc-4412-82b6-dc0c89683de9', 'a0faa119-3d0b-40ac-8bc9-dfa6d20c0946', '0aeb81bb-0c3d-4d86-8f90-95a56924492f');
INSERT INTO "public"."users_roles" VALUES ('a7b2c30d-e314-4bd0-93d5-b8802beac875', '16056f41-6ba5-4c51-9dd7-f77d0a36faaa', '0aeb81bb-0c3d-4d86-8f90-95a56924492f');


-- ----------------------------
-- Primary Key structure for table permission_lists
-- ----------------------------
ALTER TABLE "public"."permission_lists" ADD CONSTRAINT "permission_lists_pkey" PRIMARY KEY ("permission_id");

-- ----------------------------
-- Primary Key structure for table roles_lists
-- ----------------------------
ALTER TABLE "public"."roles_lists" ADD CONSTRAINT "roles_lists_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table roles_permission
-- ----------------------------
ALTER TABLE "public"."roles_permission" ADD CONSTRAINT "roles_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table users_roles
-- ----------------------------
ALTER TABLE "public"."users_roles" ADD CONSTRAINT "users_roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table roles_permission
-- ----------------------------
ALTER TABLE "public"."roles_permission" ADD CONSTRAINT "roles_permission_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."permission_lists" ("permission_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."roles_permission" ADD CONSTRAINT "roles_permission_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles_lists" ("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table users_roles
-- ----------------------------
ALTER TABLE "public"."users_roles" ADD CONSTRAINT "users_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles_lists" ("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."users_roles" ADD CONSTRAINT "users_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
