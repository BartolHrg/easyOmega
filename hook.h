#include "VB.h"
#include <wchar.h>


STRUCT(Event) 
    DECLARE(typed_char AS wchar_t);
    DECLARE(value AS unsigned int);
ENDSTRUCT



/**
 * defined in main.c
 * called on every key stroke
 */
extern FUNCTION( myHandle OF (DECLARE(event AS Event*)) AS void );



/** handleMedium
 * transforms event info to `Event` type
 * implementation something like
 *      DECLARE(my_event AS Event);
 *      // fill `my_event`
 *      handle(event);
 */

/** cleanup
 * called at the closing of the application
 */