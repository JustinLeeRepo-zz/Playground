from __future__ import print_function
import string

fr = open('mondial-schema.sql', 'r')
fw = open('GDTPSV.DOT', 'a')
firstLine = fr.readline()
firstLine = firstLine.strip('\n')
firstLine = firstLine.split(",")

data = []
i = 0
for line in fr:
	line = line.strip('\n')
	line = line.strip('(')
	splitLine = line.split(' ')

#check for entity
	if(splitLine[0] == 'CREATE' and splitLine[1] == 'TABLE'):
		entityName = splitLine[2]
		data.append([])
		data[i].append(entityName)
#must be attributes
#add attribute(first element each line) but check for "CHECK" and skip if so
	elif('VARCHAR' in line or 'NUMERIC' in line ):
		if(splitLine[0] == ''):
			if('PRIMARY KEY' in line):
				splitLine[1]+='_PK'
			data[i].append(splitLine[1])
		else:
			if('PRIMARY KEY' in line):
				splitLine[0]+='_PK'
			data[i].append(splitLine[0])
	elif('PRIMARY KEY (' in line):
		val = line.split('(',1)[1].split(')')[0]
		for a in range(len(data[i])):
			if(data[i][a] in val):
				data[i][a]+='_PK'
#		for attribute in data[i]:
#			if(attribute in val):
#				attribute += '_PK'
#				print(attribute)
#check for ;
	if(');' in line):
		if('TYPE' not in line):
			print(data[i])
			i+=1
