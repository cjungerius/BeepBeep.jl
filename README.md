# Beeper
Julia implementation of the R package [`beepR`](https://github.com/rasmusab/beepr): A utility which can play audio notifications when, e.g., your code has finished running. 

## Usage
beep(sound = 1)

Arguments
`sound` character string or number specifying what sound to be played by either specifying one of the built in sounds, specifying the path to a wav file, or specifying a valid URL refering to a wav file. The default is 1. Possible sounds are:

1. "ping"
2. "coin"
3. "fanfare"
4. "complete"
5. "treasure"
6. "ready"
7. "shotgun"
8. "mario"
9. "wilhelm"
10. "facebook"
11. "sword"

If `sound` does not match any of the sounds above, or is not a valid path/URL, a random sound will be played.

