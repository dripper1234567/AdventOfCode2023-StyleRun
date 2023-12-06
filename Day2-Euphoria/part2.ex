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


-- Sum of possible games
integer TOTAL = 0

sequence lines = read_lines(gameNum)
sequence data

sequence accepted
-- todo: add one of each accepted number to this, then print over the sequence post read, will show if any nasties are getting in.

for u = 1 to length(lines) do
    data = split(lines[u], ": ")

    -- reset line vals
    integer RED = 1
    integer GREEN = 1
    integer BLUE = 1

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

                -- convert value
                integer value = to_number(singular[1])

                -- check if num is min for row
                if singular[2][1] = 'r' and value > RED then
                    RED = value
                elsif singular[2][1] = 'b' and value > BLUE then
                    BLUE = value
                elsif singular[2][1] = 'g' and value > GREEN then
                    GREEN = value
                end if
            end for
        end for
    end if

    -- clear 'inf' value
    if RED = 9999999999999 then
        RED = 0
    end if
    if BLUE = 9999999999999 then
        BLUE = 0
    end if
    if GREEN = 9999999999999 then
        GREEN = 0
    end if

    TOTAL += (RED * BLUE * GREEN)
end for

printf(STDOUT, "Min value power : %d\n", {TOTAL})

if gameNum = -1 then
   puts(ERROR, "No need to close the file\n")
else
   close(gameNum)
   puts(STDOUT, "File closed successfully\n")
end if