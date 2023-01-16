/*
 Navicat Premium Data Transfer

 Source Server         : localhost_kmitl
 Source Server Type    : PostgreSQL
 Source Server Version : 150001 (150001)
 Source Host           : localhost:5432
 Source Catalog        : rai_apps
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 150001 (150001)
 File Encoding         : 65001

 Date: 09/01/2023 05:50:31
*/
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS "public"."booking";
CREATE TABLE "public"."booking" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "booking_id" uuid,
  "user_id" uuid
)
;

-- ----------------------------
-- Records of booking
-- ----------------------------

-- ----------------------------
-- Table structure for booking_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."booking_details";
CREATE TABLE "public"."booking_details" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "booking" varchar(255) COLLATE "pg_catalog"."default",
  "time_start" date,
  "time_end" date,
  "booking_type" uuid,
  "area_id" uuid
)
;

-- ----------------------------
-- Records of booking_details
-- ----------------------------

-- ----------------------------
-- Table structure for booking_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."booking_type";
CREATE TABLE "public"."booking_type" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "booking_type_name" varchar(255) COLLATE "pg_catalog"."default",
  "area_type" int4,
  "minimum_amount" int4
)
;

-- ----------------------------
-- Records of booking_type
-- ----------------------------

-- ----------------------------
-- Table structure for curriculum
-- ----------------------------
DROP TABLE IF EXISTS "public"."curriculum";
CREATE TABLE "public"."curriculum" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "curriculum" varchar(255) COLLATE "pg_catalog"."default",
  "major_id" uuid
)
;

-- ----------------------------
-- Records of curriculum
-- ----------------------------

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS "public"."faculty";
CREATE TABLE "public"."faculty" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "faculty_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of faculty
-- ----------------------------

-- ----------------------------
-- Table structure for main_room
-- ----------------------------
DROP TABLE IF EXISTS "public"."main_room";
CREATE TABLE "public"."main_room" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "room_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of main_room
-- ----------------------------
INSERT INTO "public"."main_room" VALUES ('b863cf85-71d9-498f-913e-b2dc887d24db', 'test1');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS "public"."major";
CREATE TABLE "public"."major" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "major" varchar(255) COLLATE "pg_catalog"."default",
  "faculty_id" uuid
)
;

-- ----------------------------
-- Records of major
-- ----------------------------

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
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS "public"."seat";
CREATE TABLE "public"."seat" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "seat" varchar(255) COLLATE "pg_catalog"."default",
  "table_id" uuid
)
;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO "public"."seat" VALUES ('045e930e-9221-434d-83bf-96c9f7a29784', '0', 'db123c96-7920-4f84-878b-aea0f811caea');
INSERT INTO "public"."seat" VALUES ('d1a1846d-a230-4c3c-963d-6df7eb47e4bd', '1', 'db123c96-7920-4f84-878b-aea0f811caea');
INSERT INTO "public"."seat" VALUES ('d1b8b294-8705-40a2-a61e-4200eeac51c6', '2', 'db123c96-7920-4f84-878b-aea0f811caea');
INSERT INTO "public"."seat" VALUES ('499ac30b-48b8-4c3e-97a8-77680d4fff68', '3', 'db123c96-7920-4f84-878b-aea0f811caea');
INSERT INTO "public"."seat" VALUES ('dfe01b09-c4ff-4004-b4ba-ea1f7ba77db6', '4', 'db123c96-7920-4f84-878b-aea0f811caea');

-- ----------------------------
-- Table structure for sub_room
-- ----------------------------
DROP TABLE IF EXISTS "public"."sub_room";
CREATE TABLE "public"."sub_room" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "room_sub_name" varchar(255) COLLATE "pg_catalog"."default",
  "room_id" uuid
)
;

-- ----------------------------
-- Records of sub_room
-- ----------------------------
INSERT INTO "public"."sub_room" VALUES ('32625fcd-3a81-4c0a-881b-5d4ec921b279', 'sub_test', 'b863cf85-71d9-498f-913e-b2dc887d24db');

-- ----------------------------
-- Table structure for table
-- ----------------------------
DROP TABLE IF EXISTS "public"."table";
CREATE TABLE "public"."table" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "table_name" varchar(255) COLLATE "pg_catalog"."default",
  "sub_room_id" uuid
)
;

-- ----------------------------
-- Records of table
-- ----------------------------
INSERT INTO "public"."table" VALUES ('db123c96-7920-4f84-878b-aea0f811caea', 'temp', '32625fcd-3a81-4c0a-881b-5d4ec921b279');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS "public"."ticket";
CREATE TABLE "public"."ticket" (
  "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
  "booking_id" uuid,
  "created_at" timestamp(6),
  "expired_at" timestamp(6)
)
;

-- ----------------------------
-- Records of ticket
-- ----------------------------

-- ----------------------------
-- Table structure for user_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_org";
CREATE TABLE "public"."user_org" (
  "user_id" uuid NOT NULL,
  "year_id" int4,
  "curriculum" uuid
)
;

-- ----------------------------
-- Records of user_org
-- ----------------------------

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
  "org_email" varchar(255) COLLATE "pg_catalog"."default",
  "alt_email" varchar(255) COLLATE "pg_catalog"."default",
  "fname" varchar(255) COLLATE "pg_catalog"."default",
  "sname" varchar(255) COLLATE "pg_catalog"."default",
  "nickname" varchar(255) COLLATE "pg_catalog"."default",
  "birthday" date
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('16056f41-6ba5-4c51-9dd7-f77d0a36faaa', 'Tests', '$2a$12$MxBNds/QIADSM01V8wK1uOIFWGFy9p1LYI790EsRvPCa2bOIVMar.', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES ('7d95b752-d821-4c07-97ac-317e307c1309', 'Test23', '$2a$12$INNvK9lAnXzZEolsQyQv.OyiBdLmnVUWpJHGQPubOTP1Ywsq.c8/u', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES ('a0faa119-3d0b-40ac-8bc9-dfa6d20c0946', 'Test', '$2a$12$sALoG/uQgDUK/FMwVRJ4/.tG7XaQ0rZSC8m74DIHeeZ8dmqxxGBCe', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO "public"."users_roles" VALUES ('e8bc51ed-cfe1-4e2a-a45d-fc5d719791c0', '7d95b752-d821-4c07-97ac-317e307c1309', '0aeb81bb-0c3d-4d86-8f90-95a56924492f');
-- ----------------------------
-- Primary Key structure for table booking
-- ----------------------------
ALTER TABLE "public"."booking" ADD CONSTRAINT "booking_pkey1" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table booking_details
-- ----------------------------
ALTER TABLE "public"."booking_details" ADD CONSTRAINT "booking_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table booking_type
-- ----------------------------
ALTER TABLE "public"."booking_type" ADD CONSTRAINT "booking_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table curriculum
-- ----------------------------
ALTER TABLE "public"."curriculum" ADD CONSTRAINT "curriculum_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table faculty
-- ----------------------------
ALTER TABLE "public"."faculty" ADD CONSTRAINT "faculty_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table main_room
-- ----------------------------
ALTER TABLE "public"."main_room" ADD CONSTRAINT "main_room_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table major
-- ----------------------------
ALTER TABLE "public"."major" ADD CONSTRAINT "major_pkey" PRIMARY KEY ("id");

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
-- Primary Key structure for table seat
-- ----------------------------
ALTER TABLE "public"."seat" ADD CONSTRAINT "seat_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sub_room
-- ----------------------------
ALTER TABLE "public"."sub_room" ADD CONSTRAINT "sub_room_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table table
-- ----------------------------
ALTER TABLE "public"."table" ADD CONSTRAINT "table_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ticket
-- ----------------------------
ALTER TABLE "public"."ticket" ADD CONSTRAINT "ticket_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_org
-- ----------------------------
ALTER TABLE "public"."user_org" ADD CONSTRAINT "user_org_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table users_roles
-- ----------------------------
ALTER TABLE "public"."users_roles" ADD CONSTRAINT "users_roles_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table booking
-- ----------------------------
ALTER TABLE "public"."booking" ADD CONSTRAINT "booking_booking_id_fkey" FOREIGN KEY ("booking_id") REFERENCES "public"."booking_details" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."booking" ADD CONSTRAINT "booking_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."ticket" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."booking" ADD CONSTRAINT "booking_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table booking_details
-- ----------------------------
ALTER TABLE "public"."booking_details" ADD CONSTRAINT "booking_details_booking_type_fkey" FOREIGN KEY ("booking_type") REFERENCES "public"."booking_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table curriculum
-- ----------------------------
ALTER TABLE "public"."curriculum" ADD CONSTRAINT "curriculum_major_id_fkey" FOREIGN KEY ("major_id") REFERENCES "public"."major" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table major
-- ----------------------------
ALTER TABLE "public"."major" ADD CONSTRAINT "major_faculty_id_fkey" FOREIGN KEY ("faculty_id") REFERENCES "public"."faculty" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table roles_permission
-- ----------------------------
ALTER TABLE "public"."roles_permission" ADD CONSTRAINT "roles_permission_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."permission_lists" ("permission_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."roles_permission" ADD CONSTRAINT "roles_permission_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles_lists" ("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table seat
-- ----------------------------
ALTER TABLE "public"."seat" ADD CONSTRAINT "seat_table_id_fkey" FOREIGN KEY ("table_id") REFERENCES "public"."table" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table sub_room
-- ----------------------------
ALTER TABLE "public"."sub_room" ADD CONSTRAINT "sub_room_room_id_fkey" FOREIGN KEY ("room_id") REFERENCES "public"."main_room" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table table
-- ----------------------------
ALTER TABLE "public"."table" ADD CONSTRAINT "table_sub_room_id_fkey" FOREIGN KEY ("sub_room_id") REFERENCES "public"."sub_room" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table user_org
-- ----------------------------
ALTER TABLE "public"."user_org" ADD CONSTRAINT "user_org_curriculum_fkey" FOREIGN KEY ("curriculum") REFERENCES "public"."curriculum" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."user_org" ADD CONSTRAINT "user_org_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table users_roles
-- ----------------------------
ALTER TABLE "public"."users_roles" ADD CONSTRAINT "users_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles_lists" ("role_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."users_roles" ADD CONSTRAINT "users_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("user_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
