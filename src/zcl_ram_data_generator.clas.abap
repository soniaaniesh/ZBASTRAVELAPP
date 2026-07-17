CLASS zcl_bas_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES:
      if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_bas_DATA_GENERATOR IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

    " delete existing entries in the database table
    DELETE FROM zbas_travel_m.
    DELETE FROM zbas_booking_m.
    DELETE FROM zbas_booksuppl_m.
    COMMIT WORK.
    " insert travel demo data
    INSERT zbas_travel_m FROM (
        SELECT *
          FROM /dmo/travel_m
      ).
    COMMIT WORK.

    " insert booking demo data
    INSERT zbas_booking_m FROM (
        SELECT *
          FROM   /dmo/booking_m
*            JOIN zbas_travel_m AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.
    INSERT zbas_booksuppl_m FROM (
        SELECT *
          FROM   /dmo/booksuppl_m
*            JOIN zbas_travel_m AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.

    out->write( 'Travel and booking demo data inserted.').


  ENDMETHOD.
ENDCLASS.
