TARGET=main

$(TARGET): main.cpp
	$(CXX) -o$@ -lboost_unit_test_framework $^

hello: hello.cpp
	$(CXX) -o$@ -lboost_unit_test_framework $^

suites: suites.cpp
	$(CXX) -o$@ -lboost_unit_test_framework $^

fixtures: fixtures.cpp
	$(CXX) -o$@ -lboost_unit_test_framework $^

assertions: assertions.cpp
	$(CXX) -o$@ -lboost_unit_test_framework $^

test: $(TARGET)
	-./$(TARGET) --output_format=XML --log_level=test_suite > raw-report.xml
	xmlpretty --PrettyWhiteNewline --PrettyWhiteIndent --CatchEmptyElement raw-report.xml > report.xml

clean:
	rm $(TARGET)
