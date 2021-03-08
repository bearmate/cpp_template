#include <catch2/catch.hpp>

// Intellisense fix for https://github.com/Microsoft/vscode-cpptools/issues/1069
#if __INTELLISENSE__
#    pragma diag_suppress 2486
#endif

unsigned int Factorial(unsigned int number) {
    return number <= 1 ? number : Factorial(number - 1) * number;
}

TEST_CASE("Factorials are computed", "[factorial]") {
    REQUIRE(Factorial(1) == 1);
    REQUIRE(Factorial(2) == 2);
    REQUIRE(Factorial(3) == 6);
    REQUIRE(Factorial(10) == 3628800);
}
