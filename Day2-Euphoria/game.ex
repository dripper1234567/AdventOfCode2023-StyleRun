-- https://www.tutorialspoint.com/euphoria/euphoria_files_io.htm
-- SO HELPFULL

integer gameNum
object line

constant ERROR = 2
constant STDOUT = 1

gameNum = open("values.txt", "r")
if gameNum = -1 then
   puts(ERROR, "couldn't open myfile\n")
else
   puts(STDOUT, "File opend successfully\n")
end if

line = gets(gameNum)
while length(line) > 1 do
    --TODO: FILE DATA PROCESSING
    --printf( STDOUT, "Read content : %s\n", {line})
    line = gets(gameNum)
end while

if gameNum = -1 then
   puts(ERROR, "No need to close the file\n")
else
   close(gameNum)
   puts(STDOUT, "File closed successfully\n")
end if