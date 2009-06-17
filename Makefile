TARGETS=main hello suites fixtures assertions

all: $(TARGETS)

test: $(addprefix run-,$(TARGETS))

%: %.cpp
	$(CXX) -o$@ -lboost_unit_test_framework $^

run-%: %
	-./$^ --output_format=XML --log_level=test_suite > $(^)-report.xml

clean:
	rm $(TARGETS) *-report.xml
