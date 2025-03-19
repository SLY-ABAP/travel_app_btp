CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PROTECTED SECTION.
    METHODS new_message REDEFINITION.
    METHODS new_message_with_text REDEFINITION.
  PRIVATE SECTION.
    METHODS:
      calculatebookingid FOR DETERMINE ON SAVE
        IMPORTING
          keys FOR  Booking~CalculateBookingID,
      comp.
ENDCLASS.


CLASS lhc_booking IMPLEMENTATION.
  METHOD calculatebookingid.
    comp( ).
  ENDMETHOD.

  METHOD new_message_with_text.
  ENDMETHOD.

  METHOD new_message.
  ENDMETHOD.

  METHOD comp.
    IF 1 = 3.
    ELSE.
      " TODO: variable is assigned but never used (ABAP cleaner)
      DATA(lk) = '44'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
