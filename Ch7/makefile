PROGRAMS = prog7a prog7b

# If we've supplied a goal on the command line
# then set is as the list of programs we
# already know about
ifneq ($(MAKECMDGOALS),)
	ifneq ($(MAKECMDGOALS),clean)
		PROGRAMS = $(MAKECMDGOALS)
	endif
endif

# The fefault rule if none specified on the command line
all: $(PROGRAMS)
# Make knows how to compile .s files, so all we need to do is link them.
$(PROGRAMS): % : %.o
	ld -o $@ $<

clean:
	rm -f *.o $(PROGRAMS)
