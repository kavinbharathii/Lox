JFLAG = -d
JC = javac
JVM = java

SRCPATH = lox
OUTPATH = prod
MAIN = lox.Lox
RM = del

all: clean classes run

classes: $(SRCPATH)/*.java
	$(JC) $(JFLAG) . $^

run: classes
	$(JVM) $(MAIN)

scan: classes
	mkdir -p output
	$(JVM) $(MAIN) test/test0.txt > output/output0.txt

clean:
	$(RM) $(SRCPATH)\*.class
