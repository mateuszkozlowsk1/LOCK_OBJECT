*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZPRANKS.........................................*
DATA:  BEGIN OF STATUS_ZPRANKS                       .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZPRANKS                       .
CONTROLS: TCTRL_ZPRANKS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZPRANKS                       .
TABLES: ZPRANKS                        .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
