-- https://www.tutorialspoint.com/euphoria/euphoria_files_io.htm
-- SO HELPFULL
include std/sequence.e

-- SECTION: File Interp
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

-- VALUE CONST
constant RED = 12
constant GREEN = 13
constant BLUE = 14

-- Sum of possible games
integer TOTAL = 0
-- current game
integer COUNT = 1

line = gets(gameNum)

printf(STDOUT, "PRINT STARTS HERE")
loop do
    printf(STDOUT, "LOOOOOOOOOOOP")
    sequence nocolon = split(line, ": ")
    if length(nocolon) > 0 then
        nocolon = nocolon[2]
        nocolon = split(nocolon, ", ")
        printf( STDOUT, "Total Real Games : %s\n", {nocolon[1]})
        -- FOR THE LENGTH OF SPLIT ON SEMICOLON
            -- ISTRUE = TRUE
            -- FOR THE LENGTH OF SPLIT ON COMMA
                -- SPLIT ON SPACE

                -- IF 2 = red AND 1 > RED
                    -- ISTRUE = FALSE
                    -- EXIT

                -- ELIF 2 = blue AND 1 > BLUE
                    -- ISTRUE = FALSE
                    -- EXIT

                -- ELIF 2 = green AND 1 > GREEN
                    -- ISTRUE = FALSE
                    -- EXIT

            -- if ISTRUE
                -- TOTAL += COUNT

        -- COUNT += 1
        line = gets(gameNum)
    end if

until find("�", line) > 0 
end loop

printf( STDOUT, "Total Real Games : %s\n", {TOTAL})

if gameNum = -1 then
   puts(ERROR, "No need to close the file\n")
else
   close(gameNum)
   puts(STDOUT, "File closed successfully\n")
end if