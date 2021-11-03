# The name of this view in Looker is "Creditcard"
view: creditcard {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `rcg_big_data.creditcard`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.Class ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.Time ;;
  }

  dimension: v1 {
    type: number
    sql: ${TABLE}.V1 ;;
  }

  dimension: v10 {
    type: number
    sql: ${TABLE}.V10 ;;
  }

  dimension: v11 {
    type: number
    sql: ${TABLE}.V11 ;;
  }

  dimension: v12 {
    type: number
    sql: ${TABLE}.V12 ;;
  }

  dimension: v13 {
    type: number
    sql: ${TABLE}.V13 ;;
  }

  dimension: v14 {
    type: number
    sql: ${TABLE}.V14 ;;
  }

  dimension: v15 {
    type: number
    sql: ${TABLE}.V15 ;;
  }

  dimension: v16 {
    type: number
    sql: ${TABLE}.V16 ;;
  }

  dimension: v17 {
    type: number
    sql: ${TABLE}.V17 ;;
  }

  dimension: v18 {
    type: number
    sql: ${TABLE}.V18 ;;
  }

  dimension: v19 {
    type: number
    sql: ${TABLE}.V19 ;;
  }

  dimension: v2 {
    type: number
    sql: ${TABLE}.V2 ;;
  }

  dimension: v20 {
    type: number
    sql: ${TABLE}.V20 ;;
  }

  dimension: v21 {
    type: number
    sql: ${TABLE}.V21 ;;
  }

  dimension: v22 {
    type: number
    sql: ${TABLE}.V22 ;;
  }

  dimension: v23 {
    type: number
    sql: ${TABLE}.V23 ;;
  }

  dimension: v24 {
    type: number
    sql: ${TABLE}.V24 ;;
  }

  dimension: v25 {
    type: number
    sql: ${TABLE}.V25 ;;
  }

  dimension: v26 {
    type: number
    sql: ${TABLE}.V26 ;;
  }

  dimension: v27 {
    type: number
    sql: ${TABLE}.V27 ;;
  }

  dimension: v28 {
    type: number
    sql: ${TABLE}.V28 ;;
  }

  dimension: v3 {
    type: number
    sql: ${TABLE}.V3 ;;
  }

  dimension: v4 {
    type: number
    sql: ${TABLE}.V4 ;;
  }

  dimension: v5 {
    type: number
    sql: ${TABLE}.V5 ;;
  }

  dimension: v6 {
    type: number
    sql: ${TABLE}.V6 ;;
  }

  dimension: v7 {
    type: number
    sql: ${TABLE}.V7 ;;
  }

  dimension: v8 {
    type: number
    sql: ${TABLE}.V8 ;;
  }

  dimension: v9 {
    type: number
    sql: ${TABLE}.V9 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
