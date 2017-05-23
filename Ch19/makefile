PROGRAMS = prog19a prog19b prog19c prog19d

# If we've supplied a goal on the command line
# then set it as the list of programs we
# already know about
ifneq ($(MAKECMDGOALS),)
	ifneq ($(MAKECMDGOALS),clean)
		ifneq ($(MAKECMDGOALS),debug)
			PROGRAMS = $(MAKECMDGOALS)
		endif
	endif
endif

# The default rule if none specified on the command line
all: $(PROGRAMS)
# Make knows how to compile .s files, so all we need to do is link them.
$(PROGRAMS): % : %.s
	gcc -g -o $@ $<

clean:
	rm -f *.o $(PROGRAMS)
