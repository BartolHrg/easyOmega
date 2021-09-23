#define IF if (
#define THEN ) {
#define ELSEIF } else if (
#define ELSE } else {
#define ENDIF }

#define DO do {
#define ALLTHEWHILE } while (
#define ENDDO );
#define WHILE while (
#define DOTHIS ) {
#define ENDWHILE }
#define FOR for (
#define ENDFOR }

#define SCOPE {
#define ENDSCOPE }

#define AS ,
#define OF ,

#define ___DECLARE(var, type) type var
#define DECLARE(var_AS_type) ___DECLARE(var_AS_type)

#define ___CAST(exp, type) ((type) (exp))
#define CAST(expression_AS_type) ___CAST(expression_AS_type)

#define	___FUNCTION(name, args, type) ___DECLARE(name args, type)
#define FUNCTION(name_OF_args_AS_type) ___FUNCTION(name_OF_args_AS_type)
#define STARTFUNCTION {
#define ENDFUNCTION }

#define ___FUNCTION_POINTER(name, args) (*name) args
#define FUNCTION_POINTER(name_OF_args) ___FUNCTION_POINTER(name_OF_args)

// FUNCTION( FUNCTION_POINTER( ff( DECLARE(x AS double), DECLARE(y AS float)) OF (DECLARE(n AS int) OF DECLARE(k AS short))) AS float );
// DECLARE_AS_FUNCTION(f(double x, float y) AS ((int n, short k) AS float));
// g(char) -> ( (short) -> ( (int) -> long ) )
// long (*)(int i);
// (*g(char c))(short h)
// DEC_AS_FUN(g(char c) AS ((short h) AS))
// DECLARE_AS_FUNCTION(DECLARE_AS_FUNCTION( g(DECLARE(c AS char)) AS ((DECLARE(h AS short)) AS)) AS ((DECLARE(i AS int)) AS long));
// FUNCTION(FUNCTION_POINTER(FUNCTION_POINTER(G(char) OF (short)) OF (int)) AS long);



#define STRUCT(name) typedef struct name name; struct name {
#define ENDSTRUCT };

// float (*(*f( double x, float y)) (int n, short k))(void* p);
// FUNCTION( FUNCTION_POINTER( FUNCTION_POINTER( f( DECLARE(x AS double), DECLARE(y AS float) ) OF (DECLARE(n AS int), DECLARE(k AS short)) ) OF (DECLARE(p AS void*)) ) AS float)
