# TO-DO List

This file is for recording upcoming changes and features that are being added to track them.

## IN PROCESS:

- Test hardware behavior without RTC installed (RAM only)

- SPACE option in PT3PLAY.ROM song playback doesn't go to next song. Also, second PSG is not yet supported.

- AquaLite: Add a second virtual AY-3-8910 (8913), responding in IO ports $F8 & $F9

- AquaLite: Populate FAT directory entry DIR_WrtTime and DIR_WrtDate when reading directory

- AquaLite: Update RTC emulation
  - When $3821 is accessed for read populate $3821-$3929 with $FF, cc, ss, mm, HH, 1, DD, MM, YY
  - Add option for RTC installed or not

- Modify dos.asm to read and write USB file timestamp
  - Added dtm_to_fts and fts_to_dtm routines to dtm_lib.asm
  - Modify dos.asm to call rtc_read and dtm_lib.asm routines

- Add MKDIR and RMDIR to dos.asm
  - Vefiry this is feasible
  - Add accompanying routines to CH376.asm

- Transition in-line documentation (;;;) to Markdown format.

## COMPLETE:

- PSG() now accepts registers in the 16-31 range for a second AY-3-8913.

- Test/Tweak, document KEY() function

- Created FRCADR - FRCINT replacement that accepts -32768 through 65535
  - Replaced FRCINT with FRCADR in IN/OUT/CALL
  - Override PEEK and POKE to use a 16bit unsigned integer as well a 16 Bit Signed.
  - LOAD, SAVE, etc - use FRCADR instead of FRCINT
  - Modified FRCADR to TM Error if argument is string

- VER() - Return version and revision

- DTM$() - Get DateTime from RTC

- SDTM "YYMMDDHHMMSS" - Set DateTime on RTC

- CLS - Specify Screen Colors

- Fix: Allowed spaces between FN name and "(" in USB BASIC functions

- DEC("FFFF") - Hex to Decimal (unsigned)

- Extend FRMEVL to parse unsigned hex 16 bit hex literals prefixed with dollar sign
  - not doing binary at this time, 9 to 17 character literals seem less useful than just using hex

- Multi-byte POKE addr, byte, byte, STEP count, byte, byte...
  - Does NOT work with numeric arrays, i.e. poke a()
  - DOES work with factored numeric array values, i.e. poke a(0),a(1),a(2),a(3)

- POKE addr TO addr, byte

- DEEK and DOKE -16 bit PEEK and POKE
  -  Modified DOKE to accept list of words

- Implement DEF FN and ATN()

- Stand-alone PT3 Player works both on actual hardware and AquaLite in MX mode.

- Fix issue where no result is returned from DTM$() after a successfull SDTM is made.

- ATN() function returning incorrect results (added 11 MAY 2023)

- SAVE for CAQ and BAS will save their known headers and then the payload 
  - SAVE for Array should behave as originally designed; should behave similarly to how CSAVE for arrays works
  - added 15 bytes of $00 at end, written by CSAVE, required by CLOAD

- SAVE for any other filetype (raw) will require a valid start address and length, otherwise SN Error; no HEADER will be added to the beginning

- LOAD for Basic program and Array are loaded into their expected locations
  - BASIC Program and Array Files are both CAQ format (header and tail)
  - Can have any file suffix, including BAS or CAQ

- LOAD for any other filetype (raw) will require a valid target address, otherwise SN Error

- RUN for Basic program file (CAQ format) loads them where expected, then runs them

- RUN for all other file types gives an filetype mismatch ?FC error
