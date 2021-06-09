method IF_EX_NOTIF_EVENT_SAVE~CHANGE_DATA_AT_SAVE.
IF CS_VIQMEL-AUSZT is initial.
*   Only execute if breakdown time is not already set
     IF ( CS_VIQMEL-MSAUS = 'X' ) AND ( CS_VIQMEL-AUSVN <> 0 ) AND ( CS_VIQMEL-AUSBS >= CS_VIQMEL-AUSVN ).
*       Only if breakdown indicator is set, valid start date, end date not less than start date
        CS_VIQMEL-AUSZT = ( CS_VIQMEL-AUSBS - CS_VIQMEL-AUSVN ) * 24 * 60 * 60.
        CS_VIQMEL-AUSZT = CS_VIQMEL-AUSZT
                  + ( CS_VIQMEL-AUZTB - CS_VIQMEL-AUZTV ).
    ENDIF.
ENDIF.

endmethod.
