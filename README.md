Necula Eduard-Ionut 322 CA @ 2020

Implementing algorithms:

1. One Time Pad
2. Caesar Cipher
3. Vigenere Cipher
4. StrStr
5. Binary to Hexadecimal

One Time Pad

About:
The cipher shows a message with a key. The message and the key have the same message. It is discussed character by character. The result of the chatter is put in another line.

Implementation:
1) Take the first byte from the message, (located in the esi register), and put it in the bl register.
2) Take the first byte from the key (located in the edi register).
3) The values ​​are stored and the resulting byte is placed in the edx register.
4) Go to the next byte in edx.
4) The operation is repeated for each byte, as long as the string length is different from 0.


Caesar Cipher

About:
Caesar cipher receives a message and a key. Each letter of the alphabet is exchanged as many times as the key. The end result is in another row. Only the letters are exchanged, not the special characters.

Implementation:

1) Take the first byte of the message (in esi), and put it in the bl register.
2) For each byte, a hole is made that iterates the character to the length of the key. (This solution is not very effective, I could add to my character the key value, but I did not have time to change).
3) If my byte is a special character I move on to the next character, and I display the special character on the screen.
4) The operation is repeated for each byte, as long as the string length is different from 0.


Vigenere Cipher

About:
Vigenere Cipher receives a message and a key. If the key is not the same length as the message, the key is repeated until the message and key are the same length. Each letter in the message is swapped with the position corresponding to the letter in the key. Only the alphabetical letters are exchanged, not the special characters.

Implementation:

1) Take the first byte of the message (in esi), and put it in the bl register.
2) Check if the byte is the letter of the alphabet or special character. If it is a special character, it is displayed on the screen.
3) For each letter of the alphabet, the position in the alphabet of the key is added.
4) The positions are reached by subtracting the value of the character from the key with the value of the character from the message. And this value adds up to the message.
5) If you pass Z you reach A.
6) If we pass z we arrive at a.
7) All the above operations are repeated until the message length ends.


StrStr

About:

Looking for a string in another string. If it is found, the string is returned, if the string length is not returned + 1;

Implementation:

1. Compare character by character until the desired string is found.
2. If not found, the character returns the length of the string + 1.



Binary to Hexadecimal

Details:
Converts from binary to hexadecimal

Implementation:
1. Take 4-bit strings and turn their representation into hexadecimal.
2. Repeat step 1 until the binary string ends
3. The hexadecimal representation is displayed.