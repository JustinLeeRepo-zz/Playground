def getData():
    ratingFile = open("fun.txt", "r")
    D = {}
    for line in ratingFile:
        line = line.strip()
        words = line.split()
        if len(words) > 1:
            continue

        rank = int(words[-1])
        splitWords = line.split('"')
        genre = splitWords[2].split()
        for z in range(0, len(genre)-1):
            dictKey = genre[z]
            D[dictKey] = [rank, splitWords[0], splitWords[1]]
    return D

def main():
    bookDict = getData()
    genreInput = input("Enter a cateogry or return to exit: ")
    if genreInput in bookDict:
        mostPopularList = []
        for genre in bookDict:
            if genreInput == genre:
                mostPopularList.append(bookDict[genre])
        mostPopularList.sort()
        mostPopularBook = mostPopularList[0]

        print("The most popular book in ", genreInput, " is ", mostPopularBook[2], " by ", mostPopularBook[1], ", at number ", mostPopularBook[0], ".")
