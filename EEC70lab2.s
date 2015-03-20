#Justin Lee(#997416419)

.data
n_count:	.word 0
n:		.word
i:		.word
sum:		.word 0
avg:		.word 0
max:		.word 0
min:		.word 0
ch:		.word
newline:	.byte '\n'

getnumbers_ra:	.word
minimum_ra:	.word
maximum_ra:	.word
average_ra:	.word


str1:		.asciiz "Enter a number of trials: "
str2:		.asciiz "Enter a value: "
str3:		.asciiz "Maximum = "
str4:		.asciiz "Minimum = "
str5:		.asciiz "Average = "



.text
__start:	la	getnumbers_ra, rtn1
		b	getnumbers
rtn1:		la	average_ra, rtn2
		b	average
rtn2:		puts 	str5
		put	avg
		put	newline
		puts	str4
		put	min
		put	newline
		puts	str3
		put	max
		put	newline
rtn3:		done



getnumbers:	move	n_count, 0
		puts	str1
		get	n_count
		
		move 	i, 0
for:		bge 	i, n_count, endfor
		puts	str2
		get	n
		
		add	sum, sum, n

		bnez	i, end_if
		move 	max, n
		move	min, n
end_if:
		ble	n, max, endif
		move	max, n
endif:
		bge	n, min, end
		move	min, n
end:
		add	i, i, 1
		b	for	

endfor:		b	getnum_rtn
		
getnum_rtn:	b	(getnumbers_ra)




average:	div	avg, sum, n_count
		b	(average_ra)
