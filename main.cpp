#include <itt_notify.hpp>
#include <thread>

ITT_DOMAIN("my_domain");

void foo(){
  ITT_FUNCTION_TASK();
  //ITT_SCOPE_REGION("foo");
  for (size_t i = 0; i < 5; ++i){
    ITT_SCOPE_TASK("Loop");
    ITT_ARG("i", i);
    ITT_COUNTER("i", i);
  }
  ITT_MARKER("broke out of loop", scope_thread);
}

int main(int argc, char* argv[]){
    ITT_FUNCTION_TASK();
    ITT_ARG("argc", argc);
    ITT_ARG("argv", argv);
    auto t = std::thread{foo};
    foo();
    t.join();
    return EXIT_SUCCESS;
}
