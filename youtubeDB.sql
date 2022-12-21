CREATE TABLE "Channel" (
  "channel_id" int,
  "user_id" int,
  "about" varchar(5000),
  "subscribers" int,
  "username" varchar(100),
  "channel_banner" bytea,
  PRIMARY KEY ("channel_id")
);

CREATE TABLE "Post" (
  "post_id" int,
  "channel_id" int,
  "upload_date" timestamp,
  "views" int,
  "likes" int,
  "dislikes" int,
  "content" varchar(5000),
  "comment_id" int,
  "image" bytea,
  PRIMARY KEY ("post_id"),
  CONSTRAINT "FK_Post.channel_id"
    FOREIGN KEY ("channel_id")
      REFERENCES "Channel"("channel_id")
);

CREATE TABLE "Premium_subscription" (
  "transaction_id" int,
  "subscription_date" date,
  "expiry_date" date,
  PRIMARY KEY ("transaction_id")
);

CREATE TABLE "User" (
  "user_id" int,
  "username" varchar(100),
  "profile_picture" bytea,
  "language" varchar(20),
  "region" varchar(20),
  PRIMARY KEY ("user_id")
);

CREATE TABLE "Video" (
  "video_id" int,
  "user_id" int,
  "upload_date" timestamp,
  "views" int,
  "likes" int,
  "dislikes" int,
  "description" varchar(5000),
  "comment_id" int,
  "caption" text,
  "thumbnail" bytea,
  "title" varchar(100),
  "category" varchar(50),
  "length" int,
  PRIMARY KEY ("video_id"),
  CONSTRAINT "FK_Video.user_id"
    FOREIGN KEY ("user_id")
      REFERENCES "User"("user_id")
);

CREATE TABLE "Comment" (
  "user_id" int,
  "comment_id" int,
  "video_id" int,
  "likes" int,
  "dislikes" int,
  "repliy_count" int,
  "date" timestamp,
  "text" varchar(5000),
  PRIMARY KEY ("comment_id"),
  CONSTRAINT "FK_Comment.comment_id"
    FOREIGN KEY ("comment_id")
      REFERENCES "Video"("comment_id"),
  CONSTRAINT "FK_Comment.user_id"
    FOREIGN KEY ("user_id")
      REFERENCES "User"("user_id"),
  CONSTRAINT "FK_Comment.comment_id"
    FOREIGN KEY ("comment_id")
      REFERENCES "Post"("comment_id")
);

CREATE TABLE "Playlist" (
  "list_id" int,
  "name" varchar(100),
  "thumbnail" bytea,
  "date" date,
  PRIMARY KEY ("list_id")
);

CREATE TABLE "Notification" (
  "notif_id" int,
  "user_id" int,
  "content" varchar(500),
  "date" timestamp,
  PRIMARY KEY ("notif_id"),
  CONSTRAINT "FK_Notification.user_id"
    FOREIGN KEY ("user_id")
      REFERENCES "User"("user_id")
);

CREATE TABLE "Livestream" (
  "channel_id" int,
  "stream_id" int,
  "date" timestamp,
  "captions" text,
  "description" varchar(5000),
  "title" varchar(100),
  "likes" int,
  "dislikes" int,
  PRIMARY KEY ("stream_id")
);

CREATE TABLE "Livechat" (
  "chat_id" int,
  "stream_id" int,
  "user_id" int,
  "text" varchar(500),
  "date" timestamp,
  PRIMARY KEY ("chat_id"),
  CONSTRAINT "FK_Livechat.user_id"
    FOREIGN KEY ("user_id")
      REFERENCES "User"("user_id")
);

CREATE TABLE "VidList" (
  "video_id" int,
  "vidlist_id" int,
  "list_id" int,
  PRIMARY KEY ("vidlist_id"),
  CONSTRAINT "FK_VidList.video_id"
    FOREIGN KEY ("video_id")
      REFERENCES "Video"("video_id"),
  CONSTRAINT "FK_VidList.list_id"
    FOREIGN KEY ("list_id")
      REFERENCES "Playlist"("list_id")
);

CREATE TABLE "UserSub" (
  "user_id" int,
  "usersub_id" int,
  "transaction_id" int,
  PRIMARY KEY ("usersub_id"),
  CONSTRAINT "FK_UserSub.user_id"
    FOREIGN KEY ("user_id")
      REFERENCES "User"("user_id"),
  CONSTRAINT "FK_UserSub.transaction_id"
    FOREIGN KEY ("transaction_id")
      REFERENCES "Premium_subscription"("transaction_id")
);

CREATE TABLE "ChanList" (
  "channel_id" int,
  "chanlist_id" int,
  "list_id" int,
  PRIMARY KEY ("chanlist_id"),
  CONSTRAINT "FK_ChanList.channel_id"
    FOREIGN KEY ("channel_id")
      REFERENCES "Channel"("channel_id"),
  CONSTRAINT "FK_ChanList.list_id"
    FOREIGN KEY ("list_id")
      REFERENCES "Playlist"("list_id")
);

