#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Fixtures
#include <boost/test/unit_test.hpp>

struct Massive
{
    int m;

    Massive() : m(2)
    {
        BOOST_TEST_MESSAGE("setup mass");
    }

    ~Massive()
    {
        BOOST_TEST_MESSAGE("teardown mass");
    }
};

BOOST_FIXTURE_TEST_SUITE(Physics, Massive)

BOOST_AUTO_TEST_CASE(specialTheory)
{
    int e = 32;
    int c = 4;

    BOOST_CHECK(e == m * c * c);
}

BOOST_AUTO_TEST_CASE(newton2)
{
    int f = 10;
    int a = 5;

    BOOST_CHECK(f == m * a);
}

BOOST_AUTO_TEST_SUITE_END()

