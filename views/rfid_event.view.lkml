# The name of this view in Looker is "Rfid Event"
view: rfid_event {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `rcg_big_data.rfid_event`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Asn ID" in Explore.

  dimension: asn_id {
    type: string
    sql: ${TABLE}.asnId ;;
  }

  dimension: confidence {
    type: number
    sql: ${TABLE}.confidence ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_confidence {
    type: sum
    sql: ${confidence} ;;
  }

  measure: average_confidence {
    type: average
    sql: ${confidence} ;;
  }

  dimension: encode_format {
    type: string
    sql: ${TABLE}.encode_format ;;
  }

  dimension: epc {
    type: number
    sql: ${TABLE}.epc ;;
  }

  dimension: epc_state {
    type: string
    sql: ${TABLE}.epcState ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: facility_id {
    type: string
    sql: ${TABLE}.facility_id ;;
  }

  dimension: filter_value {
    type: number
    sql: ${TABLE}.filter_value ;;
  }

  dimension: gtin {
    type: number
    sql: ${TABLE}.gtin ;;
  }

  dimension: last_read {
    type: number
    sql: ${TABLE}.last_read ;;
  }

  dimension: lat {
    type: string
    sql: ${TABLE}.LAT ;;
  }

  dimension: lng {
    type: string
    sql: ${TABLE}.LNG ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: timestmp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestmp ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
