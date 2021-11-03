# The name of this view in Looker is "Feeds"
view: feeds {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `rcg_big_data.feeds`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cat Confidence" in Explore.

  dimension: cat_confidence {
    type: number
    sql: ${TABLE}.cat_confidence ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cat_confidence {
    type: sum
    sql: ${cat_confidence} ;;
  }

  measure: average_cat_confidence {
    type: average
    sql: ${cat_confidence} ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: dates {
    type: string
    sql: ${TABLE}.dates ;;
  }

  dimension: feed_src {
    type: string
    sql: ${TABLE}.feed_src ;;
  }

  dimension: magnitude {
    type: number
    sql: ${TABLE}.magnitude ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: texts {
    type: string
    sql: ${TABLE}.texts ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
