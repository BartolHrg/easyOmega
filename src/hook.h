#include "VB.h"


STRUCT(Event) 
    // DECLARE(typed_char AS wchar_t);
    DECLARE(value AS unsigned int);
ENDSTRUCT



/**
 * defined in main.c
 * called on every key stroke
 */
EXTERNAL FUNCTION( myHandle OF (DECLARE(event AS Event*)) AS void );



/** myHandleMedium
 * not part of this header
 * transforms event info to `Event` type
 * implementation something like
 *      DECLARE(my_event AS Event);
 *      // fill `my_event`
 *      handle(event);
 */

