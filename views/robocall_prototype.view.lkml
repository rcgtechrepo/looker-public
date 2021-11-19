# The name of this view in Looker is "Robocall Prototype"
view: robocall_prototype {

  # to be used for all fields in this view.
  #sql_table_name: `rcg_big_data.robocall_prototype`

  derived_table: {
    sql: SELECT
        * from rcg_big_data.robocall_prototype
       ;;
    persist_for: "24 hours"  ## Best practice would be to use `datagroup_trigger: ecommerce_etl` but we don't here for snowflake costs
  }


  dimension: a_number {
    type: string
    sql: REGEXP_REPLACE(cast(${TABLE}.a_number AS STRING), r',', '')  ;;
    label: "a_number"
    link: {
      label: "Details"
      url: "https://localhost:9998/customer?q={{ value }}&asn={{ robocall_prototype.a_number._value }}&e={{ robocall_prototype.a_number._value }}&f={{ robocall_prototype.a_number._value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "Dashboard {{value}}"
      url: "/dashboards/thelook::brand_analytics?Brand%20Name={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_a_number {
    type: sum
    sql: ${a_number} ;;
  }

  measure: average_a_number {
    type: average
    sql: ${a_number} ;;
  }

  dimension: callback_record {
    type: string
    label: "callback_record"
    sql: ${TABLE}.callback_record ;;
  }

  dimension: category {
    type: number
    label: "category"
    sql: ${TABLE}.category ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: detection {
    type: time
    label: "detection"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.detection_date ;;
  }

  dimension: google_search {
    type: string
    label : "google_search"
    sql: ${TABLE}.google_search ;;

    action: {
      label: "Create Report"
      url: "https://hooks.zapier.com/hooks/catch/1662138/tvc3zj/"

      param: {
        name: "user_dash_link"
        value: "https://demo.looker.com/dashboards/160?Email={{ robocall_prototype.detection._value }}"
      }

      form_param: {
        name: "Number"
        type: select
        default: "{{ robocall_prototype.a_number._value }}"
        option: {
          name: "zevl"
          label: "Zev"
        }
        option: {
          name: "slackdemo"
          label: "Slack Demo User"
        }
      }

      form_param: {
        name: "Category"
        type: select
        default: "{{ robocall_prototype.a_number._value  }}"
        option: {
          name: "{{ robocall_prototype.a_number._value }}"
          label: "Zev"
        }
        option: {
          name: "slackdemo"
          label: "Slack Demo User"
        }
      }

      form_param: {
        name: "Detection Date"
        type: select
        default: "{{ robocall_prototype.a_number._value }}"
        option: {
          name: "{{ robocall_prototype.a_number._value }}"
          label: "Zev"
        }
        option: {
          name: "slackdemo"
          label: "Slack Demo User"
        }
      }

      form_param: {
        name: "Message"
        type: textarea
        default: "Please investigate #{{ robocall_prototype.a_number._value }}"
      }
    }
  }

  dimension: in_calls {
    type: string
    label : "in_calls"
    sql: ${TABLE}.in_calls ;;
  }

  dimension: lat {
    type: string
    label: "lat"
    sql: ${TABLE}.LAT ;;
  }

  dimension: length {
    type: number
    label: "length"
    sql: ${TABLE}.length ;;
  }

  dimension: lng {
    type: string
    sql: ${TABLE}.LNG ;;
  }

  dimension: nomrobo_category {
    type: string
    label: "nomrobo_category"
    #sql: ${TABLE}.nomrobo_category ;;
    html: <a target="_blank" href='https://www2.cs.uic.edu/~i101/SoundFiles/gettysburg.wav?q={{ robocall_prototype.a_number._value }}'><img src='https://raw.githubusercontent.com/rcgtechrepo/looker-public/main/audio3.png'></a>;;

  }

  dimension: out_calls {
    type: string
    label: "out_calls"
    sql: ${TABLE}.out_calls ;;
  }

  dimension: score {
    type: number
    label: "score"
    sql: ${TABLE}.score ;;
  }

  dimension: yp_request {
    type: number
    label: "yp_request"
    sql: ${TABLE}.yp_request ;;

  }

  measure: count {
    type: count
    drill_fields: []
    link: {
      label: "New User's Behavior by Traffic Source"
      url: "
      {% assign vis_config = '{
      \"type\": \"looker_column\",
      \"show_value_labels\": true,
      \"y_axis_gridlines\": true,
      \"show_view_names\": false,
      \"y_axis_combined\": false,
      \"show_y_axis_labels\": true,
      \"show_y_axis_ticks\": true,
      \"show_x_axis_label\": false,
      \"value_labels\": \"legend\",
      \"label_type\": \"labPer\",
      \"font_size\": \"13\",
      \"colors\": [
      \"#1ea8df\",
      \"#a2dcf3\",
      \"#929292\"
      ],
      \"hide_legend\": false,
      \"y_axis_orientation\": [
      \"left\",
      \"right\"
      ],
      \"y_axis_labels\": [
      \"Average Sale Price ($)\"
      ]
      }' %}
      {{ robocall_prototype.anumber._value }}&vis_config={{ vis_config | encode_uri }}&sorts=users.average_lifetime_orders+descc&toggle=dat,pik,vis&limit=5000"
    }
  }
}
