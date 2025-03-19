"!@testing ZI_FE_BOOKING_001554
CLASS ltc_zi_fe_booking_001554 DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA environment TYPE REF TO if_cds_test_environment.

    DATA td_zfe_abook_001554 TYPE STANDARD TABLE OF zfe_abook_001554 WITH EMPTY KEY.
    DATA act_results         TYPE STANDARD TABLE OF zi_fe_booking_001554 WITH EMPTY KEY.

    CLASS-METHODS class_setup RAISING cx_static_check.
    CLASS-METHODS class_teardown.

    METHODS setup                RAISING cx_static_check.
    METHODS prepare_testdata.
    METHODS aunit_for_cds_method FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_zi_fe_booking_001554 IMPLEMENTATION.
  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZI_FE_BOOKING_001554' ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD aunit_for_cds_method.
    prepare_testdata( ).

    SELECT * FROM zi_fe_booking_001554
      INTO TABLE @act_results.

    cl_abap_unit_assert=>fail( msg = 'Place your assertions here' ).
  ENDMETHOD.

  METHOD prepare_testdata.
    " Prepare test data for 'zfe_abook_001554'
    td_zfe_abook_001554 = VALUE #( ( client = '100' ) ).

    environment->insert_test_data( i_data = td_zfe_abook_001554 ).
  ENDMETHOD.
ENDCLASS.
