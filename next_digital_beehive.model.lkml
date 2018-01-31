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

explore: t3016_seg_agg_cid_day {
  label: "1) HKAD & TWAD Content Imp Summary (historical by day)"
  view_label: "1. CID Views"
  sql_always_where:  ${c3016_product} in ('Apple Daily', 'AppleDaily', 'ADAILY', 'Apple Daily TW', 'ADAILY-IPAD', 'Apple Daily-IPAD') and ${c3016_region} in ('HK', 'TW') ;;
  join: t1025_reg_prod_cid_title_join {
    view_label: "2. Current Title & Author"
    sql_on: c3016_cid  = ${t1025_reg_prod_cid_title_join.c1025_cid} and c3016_product = ${t1025_reg_prod_cid_title_join.c1025_product} and c3016_region = ${t1025_reg_prod_cid_title_join.c1025_region} and c3016_imp_type = t1025_reg_prod_cid_title_join.c1025_imp_type  ;;
    relationship: many_to_one
    type: inner
  }
}

explore: view_agg_with_article {
  label: "2) HKAD & TWAD Content Summary by CID (2 mths by day)"
  view_label: "1. Article & Video Views - Summary"
  sql_always_where:  ${product} = 'Apple Daily' and ${region} in ('HK', 'TW') ;;
    join: t1025_reg_prod_cid_title_join {
    view_label: "3. Current Title & Author"
    sql_on: c8002_cid  = ${t1025_reg_prod_cid_title_join.c1025_cid} and c8002_product = ${t1025_reg_prod_cid_title_join.c1025_product} and c8002_region = ${t1025_reg_prod_cid_title_join.c1025_region} and ${view_agg_with_article.view_type} = ${t1025_reg_prod_cid_title_join.imp_type}  ;;
    relationship: many_to_one
    type: inner
  }
  join: content {
    view_label: "2. Content Object Meta Data"
    sql_on: c8002_cid = ${content.cid} and c8002_region = ${content.region} and c8002_product = ${content.product} and ${content.video_length} > 0 ;;
    relationship: many_to_one
    type: left_outer
  }
}

#explore: t8002_contentview {}

explore: contentview_bh {
  label: "3) HKAD & TWAD Content Views Detail (2 mths by time)"
  view_label: "1. All Content Views"
  sql_always_where:  ${product} = 'Apple Daily' and ${region} in ('HK', 'TW') ;;
    join: content {
    view_label: "4. Content Object Meta Data"
    sql_on: ${cid} = ${content.cid} and ${region} = ${content.region} and ${product} = ${content.product} and ${content.video_length} > 0 ;;
    relationship: many_to_one
    type: left_outer
  }
  join: t1025_reg_prod_cid_title_join {
    view_label: "5. Current Title & Author"
    sql_on: c8002_cid  = ${t1025_reg_prod_cid_title_join.c1025_cid} and c8002_product = ${t1025_reg_prod_cid_title_join.c1025_product} and c8002_region = ${t1025_reg_prod_cid_title_join.c1025_region} and c8002_action = ${t1025_reg_prod_cid_title_join.imp_type}  ;;
    relationship: many_to_one
    type: inner
  }
}

explore: t8050_user_content_by_day {
  label: "4) HKAD & TWAD Content Summary by Users (2 mths by day)."
  view_label: "1. Content & Users"
  join: t1025_reg_prod_cid_title_join {
    view_label: "3. Current Title & Author"
#    sql_on: ${t8050_user_content_by_day.content_id} = ${t1025_reg_prod_cid_title.c1025_cid} and ${t8050_user_content_by_day.product} = ${t1025_reg_prod_cid_title.c1025_product} and ${t8050_user_content_by_day.region} = ${t1025_reg_prod_cid_title.c1025_region} and ${t8050_user_content_by_day.view_type} = ${t1025_reg_prod_cid_title.imp_type}  ;;
    sql_on: ${t8050_user_content_by_day.content_id} = ${t1025_reg_prod_cid_title_join.c1025_cid} and ${t8050_user_content_by_day.product} = ${t1025_reg_prod_cid_title_join.c1025_product} and ${t8050_user_content_by_day.region} = ${t1025_reg_prod_cid_title_join.c1025_region} and ${t8050_user_content_by_day.view_type} =  decode(t1025_reg_prod_cid_title_join.c1025_imp_type,'I','PAGEVIEW','V','VIDEOVIEW','unknown') ;;
    relationship: many_to_one
    type: inner
  }
  join: content {
    view_label: "2. Content Object Meta Data"
    sql_on: c8050_cid = ${content.cid} and c8050_product = ${content.product} and c8050_region = ${content.region} and ${content.video_length} > 0 ;;
    relationship: many_to_one
    type: left_outer
  }
}


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
