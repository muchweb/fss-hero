'use strict'

lyrics = [
	'Join us now and share the so- -o- -ftware;'
	'You\'ll- be- -e free, ha- -cke- -ers, you\'ll- be- fre- -e- -e.'
	'Join us now and share the so- -o- -ftware;'
	'You\'ll- be- -e free, ha- -cke- -ers, you\'ll- be- free.'

#	'Hoar- -ders can get piles of mo- -one- -ey,'
#	'That is tru- -ue, hackers, that is true.'
#	'But they cannot help their neighbors;'
#	'That\'s not good, hackers, that\'s not good.'
#
#	'When we have enough free software'
#	'At our call, hackers, at our call,'
#	'We\'ll kick out those dirty licenses'
#	'Ever more, hackers, ever more.'
#
#	'Join us now and share the software;'
#	'You\'ll be free, hackers, you\'ll be free.'
#	'Join us now and share the software;'
#	'You\'ll be free, hackers, you\'ll be free.'
]
	.join ' '
	.split ' '

sequence = [
	'D-CB-A- B-CBAG- G--A--B C--B-BD A--A--- D-CB---'
	'D-CB-A- B-CBAG- G--A--B C--B-BD A--A--- A------'
]
	.join ''
	.split ' '
	.join ''
	.split ''

bpm = 205
delay = (1000 * 60) / bpm

console.log '-------------------------'
console.log ' The Free Software Song'
console.log '      by Richard Stallman'
console.log '-------------------------'
console.log "       BPM: #{bpm}"
console.log '-------------------------'

counter = 1
interval = setInterval ->
	return clearInterval interval if lyrics.length is 0
	note = sequence.shift()
	text = if note isnt '-' then lyrics.shift() else ''
	console.log new Array(counter).join(' '),
		note,
		new Array(8 - counter).join(' '),
		'|',
		text
	sequence.push note
	counter++
	counter = 1 if counter > 7
, delay
