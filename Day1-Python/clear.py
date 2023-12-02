import sys

numDict = {"one":'1', "two":'2', "three":'3', "four":'4', "five":'5', "six":'6', "seven":'7', "eight":'8', "nine":'9'}


with open(sys.argv[1], 'r') as file:
    # for each word
    data = True

    value = 0

    while data:
        # for each word
        data = file.readline()
        data = data.strip()

        if data and len(data) > 0:
            processed = []
            i = 0

            while i < len(data):
                if data[i].isnumeric():
                    processed.append(data[i])

                elif data[i] in ['e', 'f', 'n', 'o', 's', 't']:
                    word = data[i:i+7]
                    for e in range(7):
                        if word in numDict.keys():
                            processed.append(numDict[word])
                            break
                        elif word:
                            word = word[:len(word)-1]
                i += 1

            data = int(processed[0] + processed[-1])
            print(processed)
            print(data)
            value += int(data)
        
    print(value)