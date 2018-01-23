connection: "nd_snowflake_analytics"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: next_digital_beehive_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: next_digital_beehive_default_datagroup

explore: t8002_contentview {}

# - explore: miss_nxtu

# - explore: t1021_cid_title_day_template

# - explore: t1023_animated_video

# - explore: t1023_animated_video_orig

# - explore: t1025_reg_prod_cid_title

# - explore: t1025_reg_prod_cid_title_bak

# - explore: t1050_report_metrics

# - explore: t3016_seg_agg_cid_day

# - explore: t3016_seg_agg_cid_day_bak

# - explore: t3029_cid_all_titles_day

# - explore: t3029_cid_all_titles_day_201708

# - explore: t4004_dashboard_rt_min_template

# - explore: t4005_etw_event

# - explore: t4006_dashboard_rt_hour

# - explore: t4006_dashboard_rt_hour_qa

# - explore: t4006_dashboard_rt_hour_template

# - explore: t4007_dashboard_yesterday

# - explore: t4008_beacon_event

# - explore: t4050_beacon_group

# - explore: t4051_beacon_merchant

# - explore: t4052_beacon_shop

# - explore: t4053_beacon_category

# - explore: t4054_beacon_district

# - explore: t4055_beacon_location

# - explore: t5000_open

# - explore: t5000_ua_connect_open

# - explore: t5001_first_open

# - explore: t5001_ua_connect_first_open

# - explore: t5002_push_body

# - explore: t5002_ua_connect_push_body

# - explore: t5003_send

# - explore: t5003_ua_connect_send

# - explore: t5004_ua_connect_uninstall

# - explore: t5004_uninstall

# - explore: t5005_ua_connect_tag_change

# - explore: t5006_ua_connect_location

# - explore: t5008_ua_device_tags

# - explore: t5009_ua_device_crossref

# - explore: t5010_ua_connect_event

# - explore: t6000_active_users

# - explore: t6001_active_users_platform

# - explore: t8000_content

# - explore: t8000_content_article

# - explore: t8000_content_bak

# - explore: t8000_content_template

# - explore: t8000_content_tmp

# - explore: t8000_content_video

# - explore: t8001_user_crossref

# - explore: t8001_user_crossref_template

# - explore: t8002_contentview_20180121

# - explore: t8002_contentview_20180122

# - explore: t8002_contentview_20180123

# - explore: t8002_contentview_curr_day

# - explore: t8002_contentview_template

# - explore: t8002_contentview_today

# - explore: t8002_contentview_us_can

# - explore: t8002_omo

# - explore: t8003_user_product

# - explore: t8003_user_product_20171006

# - explore: t8003_user_product_activity_stage

# - explore: t8003_user_product_bak

# - explore: t8003_user_product_new

# - explore: t8003_user_product_orig

# - explore: t8003_user_product_remove_orphans

# - explore: t8003_user_product_stage

# - explore: t8003_user_product_temp

# - explore: t8011_user_location

# - explore: t8012_aff_loc_day_part

# - explore: t8012_affinity_location

# - explore: t8013_user_affinity_location

# - explore: t8014_user_campaign

# - explore: t8014_user_campaign_bak

# - explore: t8015_contentview_agg

# - explore: t8016_err_seg_value

# - explore: t8020_user_content_preference

# - explore: t8021_user_churning_prediction

# - explore: t8021_user_churning_prediction_bak

# - explore: t8021_user_churning_prediction_prd

# - explore: t8022_user_segment_list

# - explore: t8023_user_segments

# - explore: t8023_user_segments_template

# - explore: t8024_content_preference_control

# - explore: t8024_content_preference_control_bak

# - explore: t8025_user_gender_prediction

# - explore: t8026_user_age_prediction

# - explore: t8027_user_product_orphans

# - explore: t8030_hk_geo_names

# - explore: t8031_tw_geo_names

# - explore: t8050_user_content_by_day

# - explore: t8050_user_content_by_day_20171101

# - explore: t8050_user_content_by_day_bak

# - explore: t8055_user_activty_by_day

# - explore: t8056_user_activity_by_day

# - explore: t8057_userprofile_age_gender

# - explore: tb_superloyal

# - explore: tb_temp

# - explore: ua_connect_event

# - explore: ua_connect_first_open

# - explore: ua_connect_location

# - explore: ua_connect_open

# - explore: ua_connect_push_body

# - explore: ua_connect_send

# - explore: ua_connect_tag_change

# - explore: ua_connect_temp_tags

# - explore: ua_connect_uninstall

# - explore: ua_device_crossref

# - explore: ua_device_tags
