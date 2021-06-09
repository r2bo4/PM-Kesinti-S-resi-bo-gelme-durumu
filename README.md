# PM-Kesinti-Suresi-bosgelme-durumu
Create a implementation for BAdI NOTIF_EVENT_SAVE to calculate the duration. Structure CS_VIQMEL will contain the necessary data. Use transaction SE19 and create custom code for method CHANGE_DATA_AT_SAVE of BAdI NOTIF_EVENT_SAVE. The following example code can be used:

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


