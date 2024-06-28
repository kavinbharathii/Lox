JFLAG = -d
JC = javac
JVM = java

SRCPATH = lox
TOOLPATH = tool
OUTPATH = prod
MAIN = lox.Lox
TOOL = tool.GenerateAst

RM = del

# Phony rules exclude their directory name counterparts and forces them to build
.PHONY: all tool clean

all: clean classes tool run 

classes: $(SRCPATH)/*.java
	$(JC) $(JFLAG) . $^

run: classes
	$(JVM) $(MAIN)

# scan: classes
# 	mkdir -p output
# 	$(JVM) $(MAIN) test/test0.txt > output/output0.txt

tool: $(TOOLPATH)/*.java
	$(JC) $(JFLAG) . $^
	$(JVM) $(TOOL) $(SRCPATH)

clean:
	$(RM) $(SRCPATH)\*.class
	$(RM) $(TOOLPATH)\*.class
