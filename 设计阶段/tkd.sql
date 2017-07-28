/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017-7-28 12:16:45                           */
/*==============================================================*/


/*drop table if exists course;

drop table if exists course_detail;

drop table if exists course_teacher;

drop table if exists museum;

drop table if exists museum_teacher;

drop table if exists parent;

drop table if exists parent_student;

drop table if exists student;

drop table if exists user_info;

==============================================================*/
/* Table: course                                                */
/*==============================================================*/
create table course
(
   course_id            int not null,
   teacher_id           int,
   start_data           date,
   end_data             date,
   money                int,
   primary key (course_id)
);

alter table course comment '';

/*==============================================================*/
/* Table: course_detail                                         */
/*==============================================================*/
create table course_detail
(
   detail_id            int not null,
   course_data          date not null,
   video_path           varchar(500),
   weekday              varchar(1) not null,
   start_time           time,
   end_time             time,
   course_id            int,
   primary key (detail_id)
);

/*==============================================================*/
/* Table: course_teacher                                        */
/*==============================================================*/
create table course_teacher
(
   c_t_id               int,
   teacher_id           int,
   course_id            int
);

/*==============================================================*/
/* Table: museum                                                */
/*==============================================================*/
create table museum
(
   museum_id            int not null,
   address              varchar(80),
   teacher_id           int,
   buile_time           date,
   teacher_count        int,
   area                 varchar(20),
   primary key (museum_id)
);

/*==============================================================*/
/* Table: museum_teacher                                        */
/*==============================================================*/
create table museum_teacher
(
   m_t_id               int not null,
   teacher_id           int,
   museum_id            int,
   primary key (m_t_id)
);

/*==============================================================*/
/* Table: parent                                                */
/*==============================================================*/
create table parent
(
   parent_id            int not null,
   name                 varchar(20) not null,
   pass                 varchar(20) not null,
   phone_num            varchar(20) not null,
   sign_data            timestamp not null,
   permission           int not null,
   primary key (parent_id)
);

alter table parent comment '';

/*==============================================================*/
/* Table: parent_student                                        */
/*==============================================================*/
create table parent_student
(
   p_s_id               int,
   parent_id            int,
   stu_id               int
);

/*==============================================================*/
/* Table: student                                               */
/*==============================================================*/
create table student
(
   stu_id               int not null,
   name                 varchar(20) not null,
   age                  int not null,
   address              varchar(80),
   school               varchar(50),
   sex                  varchar(1) not null,
   rank                 varchar(20),
   start_data           datetime not null,
   parent_id            int,
   phone                varchar(20) not null,
   course_id            int,
   teacher_id           int,
   primary key (stu_id)
);

alter table student comment '';

/*==============================================================*/
/* Table: user_info                                             */
/*==============================================================*/
create table user_info
(
   teacher_id           int not null,
   name                 varchar(20) not null,
   pass                 varchar(20) not null,
   phone_num            varchar(20) not null,
   sign_data            timestamp not null,
   permission           int not null,
   tech_time            varchar(8),
   rank                 varchar(20),
   primary key (teacher_id)
);

alter table user_info comment '';

alter table course_detail add constraint FK_Reference_4 foreign key (course_id)
      references course (course_id) on delete restrict on update restrict;

alter table course_teacher add constraint FK_Reference_7 foreign key (course_id)
      references course (course_id) on delete restrict on update restrict;

alter table course_teacher add constraint FK_Reference_8 foreign key (teacher_id)
      references user_info (teacher_id) on delete restrict on update restrict;

alter table museum_teacher add constraint FK_Reference_3 foreign key (teacher_id)
      references user_info (teacher_id) on delete restrict on update restrict;

alter table museum_teacher add constraint FK_Reference_5 foreign key (museum_id)
      references museum (museum_id) on delete restrict on update restrict;

alter table parent_student add constraint FK_Reference_10 foreign key (stu_id)
      references student (stu_id) on delete restrict on update restrict;

alter table parent_student add constraint FK_Reference_11 foreign key (parent_id)
      references parent (parent_id) on delete restrict on update restrict;

alter table student add constraint FK_Reference_6 foreign key (course_id)
      references course (course_id) on delete restrict on update restrict;

alter table student add constraint FK_Reference_9 foreign key (teacher_id)
      references user_info (teacher_id) on delete restrict on update restrict;

