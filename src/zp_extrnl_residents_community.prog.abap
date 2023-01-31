*&---------------------------------------------------------------------*
*& Report zp_extrnl_residents_community
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zp_extrnl_residents_community.

TYPES: BEGIN OF ty_community,
         residentid   TYPE zpcommunity-residentid,
         lastname     TYPE zpcommunity-lastname,
         flatnumb     TYPE zpcommunity-flatnumb,
         buildingnumb TYPE zpcommunity-buildingnumb,
         phonenumb    TYPE zpcommunity-phonenumb,
         datofjoin    TYPE zpcommunity-datofjoin,
         rank         TYPE zpcommunity-rank.
TYPES: END OF ty_community.



DATA: lt_community  TYPE STANDARD TABLE OF ty_community.

lt_community = VALUE #( ( residentid = 1  lastname = 'Kowalska'    flatnumb = 24  buildingnumb = 2 phonenumb = 693999345 datofjoin = '20210520' rank = 'CHAIRMAN' )
                        ( residentid = 2  lastname = 'Jabonski'    flatnumb = 11  buildingnumb = 4 phonenumb = 573946824 datofjoin = '20190202' )
                        ( residentid = 3  lastname = 'Lewandowska' flatnumb = 61  buildingnumb = 1 phonenumb = 668225853 datofjoin = '20230120' )
                        ( residentid = 4  lastname = 'Nowak'       flatnumb = 3   buildingnumb = 3 phonenumb = 792256912 datofjoin = '20220601' )
                        ( residentid = 5  lastname = 'Kowalczyk'   flatnumb = 15  buildingnumb = 1 phonenumb = 967844677 datofjoin = '20210610' )
                        ( residentid = 6  lastname = 'Kozlowski'   flatnumb = 19  buildingnumb = 4 phonenumb = 549246226 datofjoin = '20210527' rank = 'VICE-CHAIRMAN' )
                        ( residentid = 7  lastname = 'Szymański'   flatnumb = 33  buildingnumb = 4 phonenumb = 693433156 datofjoin = '20210418' )
                        ( residentid = 8  lastname = 'Mazur'       flatnumb = 9   buildingnumb = 4 phonenumb = 726488215 datofjoin = '20190227' )
                        ( residentid = 9  lastname = 'Jankowski'   flatnumb = 19  buildingnumb = 1 phonenumb = 500354367 datofjoin = '20200415' )
                        ( residentid = 10 lastname = 'Woźniak'     flatnumb = 41  buildingnumb = 2 phonenumb = 669562399 datofjoin = '20201220' rank = 'TREASURER' )
                        ( residentid = 11 lastname = 'Kwiatkowska' flatnumb = 38  buildingnumb = 2 phonenumb = 446377543 datofjoin = '20210314' )
                        ( residentid = 12 lastname = 'Pawlowski'   flatnumb = 3   buildingnumb = 1 phonenumb = 515678333 datofjoin = '20220326' )
                        ( residentid = 13 lastname = 'Joźwiak'     flatnumb = 2   buildingnumb = 1 phonenumb = 666785331 datofjoin = '20230218' )
                        ( residentid = 14 lastname = 'Wiśniewska'  flatnumb = 11  buildingnumb = 3 phonenumb = 612356788 datofjoin = '20190418' )
                        ( residentid = 15 lastname = 'Kowalski'    flatnumb = 13  buildingnumb = 1 phonenumb = 808402322 datofjoin = '20201127' )
                        ).


MODIFY zpcommunity FROM TABLE lt_community.

IF sy-subrc = 0.
  MESSAGE 'OK' TYPE 'S'.
ELSE.
  MESSAGE 'ERROR' TYPE 'I'.
ENDIF.
