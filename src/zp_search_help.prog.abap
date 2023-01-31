*&---------------------------------------------------------------------*
*& Report zp_search_help
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_search_help.


PARAMETERS: pa_test TYPE zpcommunity-rank.

TYPES: ty_community TYPE zpcommunity.

DATA: lt_community TYPE STANDARD TABLE OF ty_community.

SELECT * FROM zpcommunity
WHERE  rank = @pa_test
INTO CORRESPONDING FIELDS OF TABLE @lt_community.


cl_demo_output=>display(
  EXPORTING
    data = lt_community

).
