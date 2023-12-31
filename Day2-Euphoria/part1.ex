-- https://www.tutorialspoint.com/euphoria/euphoria_files_io.htm
-- SO HELPFULL
-- clear; flatpak-spawn --host eui game


include std/sequence.e
include std/convert.e
include std/io.e

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

sequence lines = read_lines(gameNum)
sequence data

sequence accepted
-- todo: add one of each accepted number to this, then print over the sequence post read, will show if any nasties are getting in.

for u = 1 to length(lines) do
    data = split(lines[u], ": ")

    -- Check if the id is to be summed
    integer ISTRUE = 1

    --printf( STDOUT, "%s\n", {data[2]})
    if length(data) > 0 then
        -- Remove the game tag
        data = data[2]
        -- Split the games
        data = split(data, "; ")

        for i = 1 to length(data) do
            sequence entries = split(data[i], ", ")

            for e = 1 to length(entries) do
                sequence singular = split(entries[e], " ")
                integer COL = 999

                -- set check to the colour given
                if singular[2][1] = 'r' then
                    COL = RED
                elsif singular[2][1] = 'b' then
                    COL = BLUE
                elsif singular[2][1] = 'g' then
                    COL = GREEN
                end if

                -- check that colour val against given 
                if to_number(singular[1]) > COL then
                    ISTRUE = 0
                    exit
                end if
            end for
        end for
    end if

    -- if the ID should be summed
    if ISTRUE = 1 then
        TOTAL += u
    end if
end for

printf(STDOUT, "Total Real Games : %d\n", {TOTAL})

if gameNum = -1 then
   puts(ERROR, "No need to close the file\n")
else
   close(gameNum)
   puts(STDOUT, "File closed successfully\n")
end if