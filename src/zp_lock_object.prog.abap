*&---------------------------------------------------------------------*
*& Report zp_lock_object
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_lock_object.


SELECT * FROM zpcommunity INTO TABLE @DATA(lt_community).

DATA(lt_fieldcat) = VALUE slis_t_fieldcat_alv( ( fieldname = 'residentid'       key =  abap_true )
                                               ( fieldname = 'lastname'         key  = abap_true )
                                               ( fieldname = 'flatnumb'      )
                                               ( fieldname = 'buildingnumb'  )
                                               ( fieldname = 'phonenumb'     )
                                               ( fieldname = 'datofjoin'     )
                                               ( fieldname = 'rank'             edit = abap_true ) ).

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program      = sy-repid
    i_callback_user_command = 'SAVE'
    it_fieldcat             = lt_fieldcat
  TABLES
    t_outtab                = lt_community
  EXCEPTIONS
    program_error           = 1                " Program errors
    OTHERS                  = 2.
IF sy-subrc <> 0.
  MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
ENDIF.

CALL FUNCTION 'DEQUEUE_EZP_LO_COMMUNITY'.

FORM save USING rcomm TYPE sy-ucomm sel TYPE slis_selfield.

  CASE sy-ucomm.
    WHEN '&DATA_SAVE'.

      LOOP AT lt_community INTO DATA(ls_community).

        CALL FUNCTION 'ENQUEUE_EZP_LO_COMMUNITY'
          EXPORTING
            mode_zpcommunity = 'X'              " Lock mode for table ZPCOMMUNITY
            residentid       =  ls_community-residentid                " 01th enqueue argument
            lastname         =  ls_community-lastname               " 02th enqueue argument
          EXCEPTIONS
            foreign_lock     = 1                " Object already locked
            system_failure   = 2                " Internal error from enqueue server
            others           = 3
          .
        IF sy-subrc <> 0.
         MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
           WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.

      ENDLOOP.

      MODIFY zpcommunity FROM TABLE lt_community.
  ENDCASE.

ENDFORM.





*cl_demo_output=>display(
*  EXPORTING
*    data = lt_community
*).
