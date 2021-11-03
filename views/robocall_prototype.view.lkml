# The name of this view in Looker is "Robocall Prototype"
view: robocall_prototype {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `rcg_big_data.robocall_prototype`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "A Number" in Explore.

  dimension: a_number {
    type: number
    sql: REPLACE(cast (${TABLE}.a_number AS STRING), ',', '')  ;;
    label: "a_number"
    link: {
      label: "Details"
      url: "https://localhost:9998/customer?q={{ value }}&asn={{ robocall_prototype.anumber._value }}&e={{ robocall_prototype.anumber._value }}&f={{ robocall_prototype.anumber._value }}"
      icon_url: "https://looker.com/favicon.ico"
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
      label: "Send this to slack channel"
      url: "https://hooks.zapier.com/hooks/catch/1662138/tvc3zj/"

      param: {
        name: "user_dash_link"
        value: "https://demo.looker.com/dashboards/160?Email={{ robocall_prototype.anumber._value }}"
      }

      form_param: {
        name: "Message"
        type: textarea
        default: "Hey,
        Could you check out order #{{value}}. It's saying its {{ robocall_prototype.anumber._value }},
        but the customer is reaching out to us about it.
        ~{{ robocall_prototype.anumber._value }}"
      }

      form_param: {
        name: "Recipient"
        type: select
        default: "zevl"
        option: {
          name: "zevl"
          label: "Zev"
        }
        option: {
          name: "slackdemo"
          label: "Slack Demo User"
        }

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
    html: <a href='http://www.google.com?q={{ robocall_prototype.anumber._value }}'><img src='https://raw.githubusercontent.com/rcgtechrepo/looker-public/main/audio1.png'></a>;;

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
  }
}
