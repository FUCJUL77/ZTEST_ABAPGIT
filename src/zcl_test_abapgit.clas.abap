CLASS zcl_test_abapgit DEFINITION
PUBLIC
FINAL
CREATE PUBLIC .
  PUBLIC SECTION.
    CLASS-METHODS get_file_name
      IMPORTING
        iv_logical_filename TYPE string
      RETURNING
        VALUE(rv_file_name) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_test_abapgit IMPLEMENTATION.
  METHOD get_file_name.
    DATA: lv_file_name TYPE string.
    CALL FUNCTION 'FILE_GET_NAME'
      EXPORTING
        logical_filename = iv_logical_filename
      IMPORTING
        file_name        = rv_file_name
      EXCEPTIONS
        file_not_found   = 1
        OTHERS           = 2.
    IF sy-subrc NE 0.
      MESSAGE 'Invalid logical file name!' TYPE 'I'.
      RETURN.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
