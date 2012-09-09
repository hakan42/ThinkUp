------------------------------------------------------------------
-- My2Pg 1.32 translated dump
--
------------------------------------------------------------------

BEGIN;




--
-- Sequences for table TU_ENCODED_LOCATIONS
--

CREATE SEQUENCE tu_encoded_locations_id_seq;

--
-- Table structure for table tu_encoded_locations
--

CREATE TABLE tu_encoded_locations (
  id INT4 DEFAULT nextval('tu_encoded_locations_id_seq'),
  short_name varchar(255) NOT NULL,
  full_name varchar(255) NOT NULL,
  latlng varchar(50) NOT NULL,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_favorites
--

CREATE TABLE tu_favorites (
  post_id varchar(80) NOT NULL,
  author_user_id varchar(30) NOT NULL,
  fav_of_user_id varchar(30) NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  fav_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table tu_follower_count
--

CREATE TABLE tu_follower_count (
  network_user_id varchar(30) NOT NULL,
  network varchar(20) NOT NULL,
  DATE date NOT NULL,
  count INT4 NOT NULL
);

--
-- Table structure for table tu_follows
--

CREATE TABLE tu_follows (
  user_id varchar(30) NOT NULL,
  follower_id varchar(30) NOT NULL,
  last_seen timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  first_seen timestamp NOT NULL DEFAULT '0001-01-01 00:00:00',
  active INT4 NOT NULL DEFAULT '1',
  network varchar(20) NOT NULL DEFAULT 'twitter',
  debug_api_call varchar(255) NOT NULL
);

--
-- Table structure for table tu_group_member_count
--

CREATE TABLE tu_group_member_count (
  network varchar(20) NOT NULL,
  member_user_id varchar(30) NOT NULL,
  DATE date NOT NULL,
  count INT4  NOT NULL
);

--
-- Table structure for table tu_group_members
--

CREATE TABLE tu_group_members (
  group_id varchar(50) NOT NULL,
  network varchar(20) NOT NULL,
  member_user_id varchar(30) NOT NULL,
  is_active INT2  NOT NULL DEFAULT '1',
  first_seen TIMESTAMP NOT NULL,
  last_seen TIMESTAMP NOT NULL
);

--
-- Table structure for table tu_groups
--



--
-- Sequences for table TU_GROUPS
--

CREATE SEQUENCE tu_groups_id_seq;

CREATE TABLE tu_groups (
  id INT4 DEFAULT nextval('tu_groups_id_seq'),
  group_id varchar(50) NOT NULL,
  network varchar(20) NOT NULL,
  group_name varchar(50) NOT NULL,
  is_active INT2  NOT NULL DEFAULT '1',
  first_seen TIMESTAMP NOT NULL,
  last_seen TIMESTAMP NOT NULL,
  PRIMARY KEY (id),
  CHECK (is_active>=0)

);

--
-- Table structure for table tu_hashtags
--



--
-- Sequences for table TU_HASHTAGS
--

CREATE SEQUENCE tu_hashtags_id_seq;

CREATE TABLE tu_hashtags (
  id INT4 DEFAULT nextval('tu_hashtags_id_seq'),
  hashtag varchar(255) NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  count_cache INT4 NOT NULL DEFAULT '0',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_hashtags_posts
--

CREATE TABLE tu_hashtags_posts (
  post_id varchar(80) NOT NULL,
  hashtag_id INT4 NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter'
);

--
-- Table structure for table tu_insight_baselines
--

CREATE TABLE tu_insight_baselines (
  DATE date NOT NULL,
  instance_id INT4 NOT NULL,
  slug varchar(100) NOT NULL,
  value INT4 NOT NULL
);

--
-- Table structure for table tu_insights
--



--
-- Sequences for table TU_INSIGHTS
--

CREATE SEQUENCE tu_insights_id_seq;

CREATE TABLE tu_insights (
  id INT4 DEFAULT nextval('tu_insights_id_seq'),
  instance_id INT4 NOT NULL,
  slug varchar(100) NOT NULL,
  prefix varchar(255) NOT NULL,
  text TEXT DEFAULT '' NOT NULL,
  related_data text,
  DATE date NOT NULL,
  emphasis INT4 NOT NULL DEFAULT '0',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_instances
--



--
-- Sequences for table TU_INSTANCES
--

CREATE SEQUENCE tu_instances_id_seq;

CREATE TABLE tu_instances (
  id INT4 DEFAULT nextval('tu_instances_id_seq'),
  network_user_id varchar(30) NOT NULL,
  network_viewer_id varchar(30) NOT NULL,
  network_username varchar(255) NOT NULL,
  last_post_id varchar(80) NOT NULL,
  crawler_last_run timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  total_posts_by_owner INT4 DEFAULT '0',
  total_posts_in_system INT4 DEFAULT '0',
  total_replies_in_system INT4 DEFAULT NULL,
  total_follows_in_system INT4 DEFAULT NULL,
  posts_per_day decimal(7,2) DEFAULT NULL,
  posts_per_week decimal(7,2) DEFAULT NULL,
  percentage_replies decimal(4,2) DEFAULT NULL,
  percentage_links decimal(4,2) DEFAULT NULL,
  earliest_post_in_system TIMESTAMP DEFAULT NULL,
  earliest_reply_in_system TIMESTAMP DEFAULT NULL,
  is_archive_loaded_posts INT4 NOT NULL DEFAULT '0',
  is_archive_loaded_replies INT4 NOT NULL DEFAULT '0',
  is_archive_loaded_follows INT4 NOT NULL DEFAULT '0',
  is_public INT4 NOT NULL DEFAULT '0',
  is_active INT4 NOT NULL DEFAULT '1',
  network varchar(20) NOT NULL DEFAULT 'twitter',
  favorites_profile INT4 DEFAULT '0',
  owner_favs_in_system INT4 DEFAULT '0',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_instances_twitter
--



--
-- Sequences for table TU_INSTANCES_TWITTER
--

CREATE SEQUENCE tu_instances_twitter_id_seq;

CREATE TABLE tu_instances_twitter (
  id INT4 DEFAULT nextval('tu_instances_twitter_id_seq'),
  last_page_fetched_replies INT4 NOT NULL DEFAULT '1',
  last_page_fetched_tweets INT4 NOT NULL DEFAULT '1',
  last_favorite_id varchar(80) DEFAULT NULL,
  last_unfav_page_checked INT4 DEFAULT '0',
  last_page_fetched_favorites INT4 DEFAULT NULL,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_invites
--

CREATE TABLE tu_invites (
  invite_code varchar(10) DEFAULT NULL,
  created_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- Table structure for table tu_links
--



--
-- Sequences for table TU_LINKS
--

CREATE SEQUENCE tu_links_id_seq;

CREATE TABLE tu_links (
  id INT4 DEFAULT nextval('tu_links_id_seq'),
  url varchar(255) NOT NULL,
  expanded_url varchar(255) NOT NULL DEFAULT '',
  title varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  image_src varchar(255) NOT NULL DEFAULT '',
  caption varchar(255) NOT NULL,
  post_key INT4 NOT NULL,
  error varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_links_short
--



--
-- Sequences for table TU_LINKS_SHORT
--

CREATE SEQUENCE tu_links_short_id_seq;

CREATE TABLE tu_links_short (
  id INT4 DEFAULT nextval('tu_links_short_id_seq'),
  link_id INT4 NOT NULL,
  short_url varchar(100)  NOT NULL,
  click_count INT4 NOT NULL,
  first_seen timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_mentions
--



--
-- Sequences for table TU_MENTIONS
--

CREATE SEQUENCE tu_mentions_id_seq;

CREATE TABLE tu_mentions (
  id INT4 DEFAULT nextval('tu_mentions_id_seq'),
  user_id varchar(30) NOT NULL,
  user_name varchar(255) NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  count_cache INT4 NOT NULL DEFAULT '0',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_mentions_posts
--

CREATE TABLE tu_mentions_posts (
  post_id varchar(80) NOT NULL,
  author_user_id varchar(30) NOT NULL,
  mention_id INT4 NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter'
);

--
-- Table structure for table tu_options
--



--
-- Sequences for table TU_OPTIONS
--

CREATE SEQUENCE tu_options_option_id_seq;

CREATE TABLE tu_options (
  option_id INT4 DEFAULT nextval('tu_options_option_id_seq'),
  namespace varchar(50) NOT NULL,
  option_name varchar(50) NOT NULL,
  option_value varchar(255) NOT NULL,
  last_updated TIMESTAMP NOT NULL,
  created TIMESTAMP NOT NULL,
  PRIMARY KEY (option_id)

);

--
-- Table structure for table tu_owner_instances
--



--
-- Sequences for table TU_OWNER_INSTANCES
--

CREATE SEQUENCE tu_owner_instances_id_seq;

CREATE TABLE tu_owner_instances (
  id INT4 DEFAULT nextval('tu_owner_instances_id_seq'),
  owner_id INT4 NOT NULL,
  instance_id INT4 NOT NULL,
  oauth_access_token varchar(255) DEFAULT NULL,
  oauth_access_token_secret varchar(255) DEFAULT NULL,
  auth_error varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_owners
--



--
-- Sequences for table TU_OWNERS
--

CREATE SEQUENCE tu_owners_id_seq;

CREATE TABLE tu_owners (
  id INT4 DEFAULT nextval('tu_owners_id_seq'),
  full_name varchar(200) NOT NULL,
  pwd varchar(255) DEFAULT NULL,
  pwd_salt varchar(255) NOT NULL,
  email varchar(200) NOT NULL,
  activation_code INT4 NOT NULL DEFAULT '0',
  joined DATE NOT NULL DEFAULT '0001-01-01',
  is_activated INT4 NOT NULL DEFAULT '0',
  is_admin INT4 NOT NULL DEFAULT '0',
  last_login DATE NOT NULL DEFAULT '0001-01-01',
  password_token varchar(64) DEFAULT NULL,
  failed_logins INT4 NOT NULL DEFAULT '0',
  account_status varchar(150) NOT NULL DEFAULT '',
  api_key varchar(32) NOT NULL,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_places
--



--
-- Sequences for table TU_PLACES
--

CREATE SEQUENCE tu_places_id_seq;

CREATE TABLE tu_places (
  id INT4 DEFAULT nextval('tu_places_id_seq'),
  place_id varchar(100) DEFAULT NULL,
  place_type varchar(100) DEFAULT NULL,
  name varchar(100) DEFAULT NULL,
  full_name varchar(255) DEFAULT NULL,
  country_code varchar(2) DEFAULT NULL,
  country varchar(100) DEFAULT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  longlat point DEFAULT NULL,
  bounding_box polygon DEFAULT NULL,
  icon varchar(255) DEFAULT NULL,
  map_image varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_places_posts
--



--
-- Sequences for table TU_PLACES_POSTS
--

CREATE SEQUENCE tu_places_posts_id_seq;

CREATE TABLE tu_places_posts (
  id INT4 DEFAULT nextval('tu_places_posts_id_seq'),
  longlat point NOT NULL,
  post_id varchar(80) NOT NULL,
  place_id varchar(100) DEFAULT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_plugins
--



--
-- Sequences for table TU_PLUGINS
--

CREATE SEQUENCE tu_plugins_id_seq;

CREATE TABLE tu_plugins (
  id INT4 DEFAULT nextval('tu_plugins_id_seq'),
  name varchar(255) NOT NULL,
  folder_name varchar(255) NOT NULL,
  description varchar(255) DEFAULT NULL,
  author varchar(255) DEFAULT NULL,
  homepage varchar(255) DEFAULT NULL,
  version varchar(255) DEFAULT NULL,
  is_active INT2 NOT NULL,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_post_errors
--



--
-- Sequences for table TU_POST_ERRORS
--

CREATE SEQUENCE tu_post_errors_id_seq;

CREATE TABLE tu_post_errors (
  id INT4 DEFAULT nextval('tu_post_errors_id_seq'),
  post_id varchar(80) NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  error_code INT4 NOT NULL,
  error_text varchar(255) NOT NULL,
  error_issued_to_user_id varchar(30) NOT NULL,
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_posts
--



--
-- Sequences for table TU_POSTS
--

CREATE SEQUENCE tu_posts_id_seq;

CREATE TABLE tu_posts (
  id INT4 DEFAULT nextval('tu_posts_id_seq'),
  post_id varchar(80) NOT NULL,
  author_user_id varchar(30) NOT NULL,
  author_username varchar(50) NOT NULL,
  author_fullname varchar(50) NOT NULL,
  author_avatar varchar(255) NOT NULL,
  author_follower_count INT4 NOT NULL,
  post_text TEXT DEFAULT '' NOT NULL,
  is_protected INT2 NOT NULL DEFAULT '1',
  source varchar(255) DEFAULT NULL,
  location varchar(255) DEFAULT NULL,
  place varchar(255) DEFAULT NULL,
  place_id varchar(255) DEFAULT NULL,
  geo varchar(255) DEFAULT NULL,
  pub_date TIMESTAMP NOT NULL,
  in_reply_to_user_id varchar(30) DEFAULT NULL,
  in_reply_to_post_id varchar(80) DEFAULT NULL,
  reply_count_cache INT4 NOT NULL DEFAULT '0',
  is_reply_by_friend INT2 NOT NULL DEFAULT '0',
  in_retweet_of_post_id varchar(80) DEFAULT NULL,
  old_retweet_count_cache INT4 NOT NULL DEFAULT '0',
  is_retweet_by_friend INT2 NOT NULL DEFAULT '0',
  reply_retweet_distance INT4 NOT NULL DEFAULT '0',
  network varchar(20) NOT NULL DEFAULT 'twitter',
  is_geo_encoded INT4 NOT NULL DEFAULT '0',
  in_rt_of_user_id varchar(30) DEFAULT NULL,
  retweet_count_cache INT4 NOT NULL DEFAULT '0',
  retweet_count_api INT4 NOT NULL DEFAULT '0',
  favlike_count_cache INT4 NOT NULL DEFAULT '0',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_stream_data
--



--
-- Sequences for table TU_STREAM_DATA
--

CREATE SEQUENCE tu_stream_data_id_seq;

CREATE TABLE tu_stream_data (
  id INT4 DEFAULT nextval('tu_stream_data_id_seq'),
  data TEXT DEFAULT '' NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_stream_procs
--

CREATE TABLE tu_stream_procs (
  process_id INT4 NOT NULL,
  email varchar(100) NOT NULL,
  instance_id INT4 NOT NULL,
  last_report timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (process_id)

);

--
-- Table structure for table tu_user_errors
--



--
-- Sequences for table TU_USER_ERRORS
--

CREATE SEQUENCE tu_user_errors_id_seq;

CREATE TABLE tu_user_errors (
  id INT4 DEFAULT nextval('tu_user_errors_id_seq'),
  user_id varchar(30) NOT NULL,
  error_code INT4 NOT NULL,
  error_text varchar(255) NOT NULL,
  error_issued_to_user_id varchar(30) NOT NULL,
  network varchar(20) NOT NULL DEFAULT 'twitter',
  PRIMARY KEY (id)

);

--
-- Table structure for table tu_users
--



--
-- Sequences for table TU_USERS
--

CREATE SEQUENCE tu_users_id_seq;

CREATE TABLE tu_users (
  id INT4 DEFAULT nextval('tu_users_id_seq'),
  user_id varchar(30) NOT NULL,
  user_name varchar(255) NOT NULL,
  full_name varchar(255) NOT NULL,
  avatar varchar(255) NOT NULL,
  location varchar(255) DEFAULT NULL,
  description text,
  url varchar(255) DEFAULT NULL,
  is_protected INT2 NOT NULL,
  follower_count INT4 NOT NULL,
  friend_count INT4 NOT NULL DEFAULT '0',
  post_count INT4 NOT NULL DEFAULT '0',
  last_updated timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  found_in varchar(100) DEFAULT NULL,
  last_post timestamp NOT NULL DEFAULT '0001-01-01 00:00:00',
  joined timestamp NOT NULL DEFAULT '0001-01-01 00:00:00',
  last_post_id varchar(80) NOT NULL DEFAULT '',
  network varchar(20) NOT NULL DEFAULT 'twitter',
  favorites_count INT4 DEFAULT NULL,
  PRIMARY KEY (id)

);


-- Dump completed on 2012-09-06 10:09:59

--
-- Insert DB Version
--
INSERT INTO tu_options (namespace, option_name, option_value, last_updated, created)
VALUES ('application_options', 'database_version', '1.0.8.1', NOW(), NOW()); 

--
-- Insert DEFAULT plugin(s)
--

INSERT INTO tu_plugins (name , folder_name, description, author, homepage, version, is_active )
VALUES ('Twitter', 'twitter', 'Twitter support', 'Gina Trapani', 'http://thinkupapp.com', '0.01', '1');

INSERT INTO tu_plugins (name , folder_name, description, author, homepage, version, is_active )
VALUES ('Facebook', 'facebook', 'Facebook support', 'Gina Trapani', 'http://thinkupapp.com', '0.01', '1');

INSERT INTO tu_plugins (name , folder_name, description, author, homepage, version, is_active )
VALUES ('Google+', 'googleplus', 'Google+ support', 'Gina Trapani', 'http://thinkupapp.com', '0.01', '1');

INSERT INTO tu_plugins (name , folder_name, description, author, homepage, version, is_active )
VALUES ('Expand URLs', 'expandurls', 'Expand shortened links.', 'Gina Trapani', 'http://thinkupapp.com', '0.01', '1'); 

--
-- Indexes for table TU_POSTS
--
CREATE INDEX post_fulltext ON tu_posts USING gin(to_tsvector('english', post_text));


--
-- Indexes for table TU_POST_ERRORS
--

CREATE INDEX post_id_tu_post_errors_index ON tu_post_errors (post_id,network);

--
-- Indexes for table TU_OWNER_INSTANCES
--

CREATE UNIQUE INDEX owner_instance_id_tu_owner_instances_index ON tu_owner_instances (owner_id,instance_id);

--
-- Indexes for table TU_USER_ERRORS
--

CREATE INDEX user_id_tu_user_errors_index ON tu_user_errors (user_id);

--
-- Indexes for table TU_OWNERS
--

CREATE UNIQUE INDEX email_tu_owners_index ON tu_owners (email);

--
-- Indexes for table TU_PLACES_POSTS
--

CREATE UNIQUE INDEX post_id_tu_places_posts_index ON tu_places_posts (network,post_id);

--
-- Indexes for table TU_INSIGHT_BASELINES
--

CREATE UNIQUE INDEX unique_base_tu_insight_baselines_index ON tu_insight_baselines (date,instance_id,slug);
CREATE INDEX DATE_tu_insight_baselines_index ON tu_insight_baselines (date,instance_id);

--
-- Indexes for table TU_ENCODED_LOCATIONS
--

CREATE INDEX short_name_tu_encoded_locations_index ON tu_encoded_locations (short_name);

--
-- Indexes for table TU_STREAM_PROCS
--

CREATE UNIQUE INDEX owner_instance_tu_stream_procs_index ON tu_stream_procs (email,instance_id);

--
-- Indexes for table TU_GROUPS
--

CREATE INDEX group_network_tu_groups_index ON tu_groups (group_id,network);

--
-- Indexes for table TU_OPTIONS
--

CREATE INDEX namespace_key_tu_options_index ON tu_options (namespace);
CREATE INDEX name_key_tu_options_index ON tu_options (option_name);

--
-- Indexes for table TU_GROUP_MEMBER_COUNT
--

CREATE INDEX member_network_tu_group_member_count_index ON tu_group_member_count (member_user_id,network);

--
-- Indexes for table TU_FAVORITES
--

CREATE UNIQUE INDEX post_faving_user_tu_favorites_index ON tu_favorites (post_id,fav_of_user_id,network);
CREATE INDEX post_id_tu_favorites_index ON tu_favorites (post_id,network);
CREATE INDEX author_user_id_tu_favorites_index ON tu_favorites (author_user_id,network);
CREATE INDEX fav_of_user_id_tu_favorites_index ON tu_favorites (fav_of_user_id,network);

--
-- Indexes for table TU_HASHTAGS
--

CREATE UNIQUE INDEX network_hashtag_tu_hashtags_index ON tu_hashtags (network,hashtag);

--
-- Indexes for table TU_MENTIONS_POSTS
--

CREATE UNIQUE INDEX mention_post_tu_mentions_posts_index ON tu_mentions_posts (mention_id,post_id);
CREATE INDEX post_id_tu_mentions_posts_index ON tu_mentions_posts (network,post_id);
CREATE INDEX author_user_id_tu_mentions_posts_index ON tu_mentions_posts (author_user_id);
CREATE INDEX mention_id_tu_mentions_posts_index ON tu_mentions_posts (mention_id);

--
-- Indexes for table TU_INSIGHTS
--

CREATE INDEX instance_id_tu_insights_index ON tu_insights (instance_id,slug,date);

--
-- Indexes for table TU_MENTIONS
--

CREATE UNIQUE INDEX user_id_tu_mentions_index ON tu_mentions (network,user_id);

--
-- Indexes for table TU_LINKS_SHORT
--

CREATE INDEX link_id_tu_links_short_index ON tu_links_short (link_id);
CREATE INDEX short_url_tu_links_short_index ON tu_links_short (short_url);

--
-- Indexes for table TU_FOLLOWS
--

CREATE UNIQUE INDEX network_follower_user_tu_follows_index ON tu_follows (network,follower_id,user_id);
CREATE INDEX active_tu_follows_index ON tu_follows (network,active,last_seen);
CREATE INDEX network_tu_follows_index ON tu_follows (network,last_seen);
CREATE INDEX user_id_tu_follows_index ON tu_follows (user_id,network,active);

--
-- Indexes for table TU_GROUP_MEMBERS
--

CREATE INDEX group_network_tu_group_members_index ON tu_group_members (group_id,network);
CREATE INDEX member_network_tu_group_members_index ON tu_group_members (member_user_id,network);

--
-- Indexes for table TU_POSTS
--

CREATE UNIQUE INDEX post_network_tu_posts_index ON tu_posts (post_id,network);
CREATE INDEX author_username_tu_posts_index ON tu_posts (author_username);
CREATE INDEX pub_date_tu_posts_index ON tu_posts (pub_date);
CREATE INDEX author_user_id_tu_posts_index ON tu_posts (author_user_id);
CREATE INDEX in_retweet_of_status_id_tu_posts_index ON tu_posts (in_retweet_of_post_id);
CREATE INDEX in_reply_to_user_id_tu_posts_index ON tu_posts (in_reply_to_user_id);
CREATE INDEX post_id_tu_posts_index ON tu_posts (post_id);
CREATE INDEX network_tu_posts_index ON tu_posts (network);
CREATE INDEX is_protected_tu_posts_index ON tu_posts (is_protected);
CREATE INDEX in_reply_to_post_id_tu_posts_index ON tu_posts (in_reply_to_post_id);

--
-- Indexes for table TU_LINKS
--

CREATE UNIQUE INDEX url_tu_links_index ON tu_links (url,post_key);
CREATE INDEX post_key_tu_links_index ON tu_links (post_key);

--
-- Indexes for table TU_HASHTAGS_POSTS
--

CREATE UNIQUE INDEX hashtag_post_tu_hashtags_posts_index ON tu_hashtags_posts (hashtag_id,post_id);
CREATE INDEX post_id_tu_hashtags_posts_index ON tu_hashtags_posts (network,post_id);
CREATE INDEX hashtag_id_tu_hashtags_posts_index ON tu_hashtags_posts (hashtag_id);

--
-- Indexes for table TU_INSTANCES
--

CREATE INDEX network_user_id_tu_instances_index ON tu_instances (network_user_id,network);

--
-- Indexes for table TU_USERS
--

CREATE UNIQUE INDEX user_id_tu_users_index ON tu_users (user_id,network);

--
-- Indexes for table TU_PLACES
--

CREATE UNIQUE INDEX place_id_tu_places_index ON tu_places (place_id,network);

--
-- Sequences for table TU_POST_ERRORS
--

SELECT SETVAL('tu_post_errors_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_post_errors));

--
-- Sequences for table TU_OWNER_INSTANCES
--

SELECT SETVAL('tu_owner_instances_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_owner_instances));

--
-- Sequences for table TU_USER_ERRORS
--

SELECT SETVAL('tu_user_errors_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_user_errors));

--
-- Sequences for table TU_OWNERS
--

SELECT SETVAL('tu_owners_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_owners));

--
-- Sequences for table TU_PLACES_POSTS
--

SELECT SETVAL('tu_places_posts_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_places_posts));

--
-- Sequences for table TU_ENCODED_LOCATIONS
--

SELECT SETVAL('tu_encoded_locations_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_encoded_locations));

--
-- Sequences for table TU_INSTANCES_TWITTER
--

SELECT SETVAL('tu_instances_twitter_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_instances_twitter));

--
-- Sequences for table TU_GROUPS
--

SELECT SETVAL('tu_groups_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_groups));

--
-- Sequences for table TU_OPTIONS
--

SELECT SETVAL('tu_options_option_id_seq',(select case when max(option_id)>0 then max(option_id)+1 else 1 end from tu_options));

--
-- Sequences for table TU_STREAM_DATA
--

SELECT SETVAL('tu_stream_data_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_stream_data));

--
-- Sequences for table TU_HASHTAGS
--

SELECT SETVAL('tu_hashtags_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_hashtags));

--
-- Sequences for table TU_INSIGHTS
--

SELECT SETVAL('tu_insights_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_insights));

--
-- Sequences for table TU_MENTIONS
--

SELECT SETVAL('tu_mentions_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_mentions));

--
-- Sequences for table TU_PLUGINS
--

SELECT SETVAL('tu_plugins_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_plugins));

--
-- Sequences for table TU_LINKS_SHORT
--

SELECT SETVAL('tu_links_short_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_links_short));

--
-- Sequences for table TU_POSTS
--

SELECT SETVAL('tu_posts_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_posts));

--
-- Sequences for table TU_LINKS
--

SELECT SETVAL('tu_links_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_links));

--
-- Sequences for table TU_INSTANCES
--

SELECT SETVAL('tu_instances_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_instances));

--
-- Sequences for table TU_USERS
--

SELECT SETVAL('tu_users_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_users));

--
-- Sequences for table TU_PLACES
--

SELECT SETVAL('tu_places_id_seq',(select case when max(id)>0 then max(id)+1 else 1 end from tu_places));

CREATE OR REPLACE FUNCTION follow_timestamp() RETURNS TRIGGER 
LANGUAGE plpgsql
AS
$$
BEGIN
    NEW.last_seen = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;

CREATE TRIGGER ud_lastseen
  BEFORE UPDATE
  ON tu_follows
  FOR EACH ROW
  EXECUTE PROCEDURE follow_timestamp();


COMMIT;
