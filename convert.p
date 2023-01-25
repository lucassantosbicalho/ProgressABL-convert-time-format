FUNCTION fcConvertTimeFormat RETURNS CHARACTER (INPUT pNumericTime AS INTEGER, INPUT pFormat AS CHARACTER).
    // Converte numeric time to format HHhMM or HHMM 
    // INPUT pNumericTime = Time in numeric format. Ie. 08h00 = 8 * 3600 = 28800
    // INPUT pFormat = "h" ou "". Se "h" funcao retorna HHhMM. Se "" funcao retorna HHMM
    // OUTPUT hora em formato char do tipo HHhMM ou HHMM
    DEFINE VARIABLE intH AS INTEGER NO-UNDO.
    DEFINE VARIABLE intM AS INTEGER NO-UNDO.
    DEFINE VARIABLE decH AS DECIMAL NO-UNDO.
    IF pFormat <> "h" AND pFormat <> "" THEN RETURN "".
    decH = pNumericTime / 3600.
    intH = TRUNCATE(decH, 0).
    intM = TRUNCATE((decH - intH) * 60, 0).
    RETURN SUBSTITUTE("&1&2&3", STRING(intH,"99"), pFormat, STRING(intM,"99")).     
END FUNCTION.

MESSAGE fcConvertTimeFormat(28800, "h") VIEW-AS ALERT-BOX. // Expected 08h00
MESSAGE fcConvertTimeFormat(29400, "h") VIEW-AS ALERT-BOX. // Expected 08h10
