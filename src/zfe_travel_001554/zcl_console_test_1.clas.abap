CLASS zcl_console_test_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    DATA out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.

CLASS zcl_console_test_1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT FROM /dmo/flight
      FIELDS carrier_id                                                    AS idx,
             zhv_get_weekday( input_date = flight_date )                   AS day,
             connection_id,
             client,
             concat_with_space( CAST(  price AS CHAR ), currency_code, 1 ) AS price1
      ORDER BY flight_date
      INTO TABLE @DATA(lt_flights)
      UP TO 12 ROWS.
    IF sy-subrc = 0.
      out->write( lt_flights ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
