# Define the database connection to be used for this model.
connection: "google_big_query"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: robocall_main_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: robocall_main_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Robocall Main"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: cases {}

explore: feeds {}

explore: rfid_event_error_records {
  join: rfid_event_error_records__attributes {
    view_label: "Rfid Event Error Records: Attributes"
    sql: LEFT JOIN UNNEST(${rfid_event_error_records.attributes}) as rfid_event_error_records__attributes ;;
    relationship: one_to_many
  }
}

explore: creditcard {}

explore: robocall_prototype {}

explore: test_2_14 {}

explore: crime_geo {}

explore: rfid_event {}
