CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point
#check if java file exists
if ! test -f student-submission/ListExamples.java; then
  echo "File does not exist."
  exit
fi

#copy files to grading-area
cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area
# Then, add here code to compile and run, and do any post-processing of the
# tests
#cd grading-area
cd grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
if [ $? -ne 0 ]; then
    echo "Your submission didn't compile"
    exit
fi
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > JUnit-output.txt

#figure out grade part

TestsRun=`grep -o "Tests run:.." JUnit-output.txt`
TestsFailed=`grep -o "Failures:.." JUnit-output.txt`

if !(grep -q "Failures" JUnit-output.txt); then
    TestsRun=`grep -o "(." JUnit-output.txt`
    a=${TestsRun:1:1}
    echo "All tests passed! Your grade is $a / $a"
    exit
fi

a=${TestsRun:11:1}
b=${TestsFailed:10:1}
TestsPassed=$((a - b))
echo "Your grade is: $TestsPassed / $a"

cd ..