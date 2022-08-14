# DecodingProlog

In this case, we are working in a setting where every character corresponds with a code for this character. A code is a sequence of 0s and 1s. Our compression technique has one important property: no code is the prefix of another code.

If the character k has 0 as its code, then all codes for other characters must start with a 1 (1 ...) to prevent ambiguity with the code for k.
To keep things simple we assume that for a given N we are encoding the characters 0, 1, 2, ..., (N-1).

The problem is that we know N and we know the encoding for the character sequence 0 1 2 3 ... (N-1), but we lost the codes for the individual characters. So we need your help to reconstruct the individual codes given N.
