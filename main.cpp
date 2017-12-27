#include <itt_notify.hpp>

ITT_DOMAIN("my_domain");

int main(int argc, char* argv[]){
    ITT_FUNCTION_TASK();
    ITT_ARG("argc", argc);
    ITT_ARG("argv", argv);

    for (size_t i = 0; i < 5; ++i)
    {
        ITT_SCOPE_TASK("Loop");
        ITT_ARG("i", i);

        ITT_COUNTER("i", i);
    }
    
    ITT_MARKER("broke out of loop", scope_thread);
    return EXIT_SUCCESS;
}
