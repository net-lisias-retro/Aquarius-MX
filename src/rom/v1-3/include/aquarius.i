;====================================================================
;         Mattel Aquarius Hardware and System ROM Definitions
;====================================================================
; based on work by Kenny Millar and V D Steenovan
;
;
; 2015-11-4  V0.0 created by Bruce Abbott
; 2015-11-13 V0.1 changed ROWCOUNT to LISTCNT to avoid conflict with
;                 BLBASIC graphics variable ROWCOUNT
; 2016-01-18 V0.2 added macros for RST instructions
; 2016-1-30  V0.3 added PROGST (start of BASIC program area) using
;                 'set' directive. This can be overridden to extend
;                 the system variable area.
; 2017-05-06 V0.4 compute equates for buffer lengths
; 2017-06-12 V1.0 bumped to release version
; 2023-04-11 V1.1 Revised color names to more common values
;
;-------------------------------------------------------------------
;                            IO Ports
;-------------------------------------------------------------------
;   Address         Write                         Read
;      FC       bit 0 = Speaker & tape out    bit 0 = Tape in
;      FD       bit 0 = CP/M memory map       bit 0 = Vertical sync
;      FE       bit 0 = Printer TXD           bit 0 = Printer CTS
;      FF     bits7-0 = Exp bus lock       bits 0-6 = Keyboard
;

; string variable entry
; byte
;  0  variable name eg. 'A' = A$
;  1  null
;  2  string length
;  3  null
;  5  string text pointer low byte
;  6          ''          high byte

; constants:

CTRLC     = $03
BKSPC     = $08
LF        = $0A
CR        = $0D

; colors
BLACK     = 0
RED       = 1
GREEN     = 2
YELLOW    = 3
BLUE      = 4
MAGENTA   = 5
CYAN      = 6
WHITE     = 7
GREY      = 8
DKCYAN    = 9
DKMAGENTA = 10
DKBLUE    = 11
LTYELLOW  = 12
DKGREEN   = 13
DKRED     = 14
DKGREY    = 15

;-------------------------------------------------------------------
;                         Screen RAM
;-------------------------------------------------------------------
; 1k for characters followed by 1k for color attributes.
; 1000 visible characters on screen, leaving 24 unused bytes at end.
; First character in screen also sets the border character and color.
; The first row (40 bytes), and first & last columns of each row are
; normally filled with spaces, giving an effective character matrix
; of 38 columns x 24 rows.

CHRRAM   = $3000 ; 12288           start of character RAM
;          $33E7 ; 13287           end of character RAM
                 ;                 24 unused bytes
COLRAM   = $3400 ; 13312           Start of colour RAM
;          $37E7 ; 14311           end of color RAM
                 ;                 24 unused bytes

;-------------------------------------------------------------------
;                       System Variables
;-------------------------------------------------------------------
;Name    location Decimal alt name          description
CURCOL   = $3800 ; 14336  TTYPOS   Current cursor column
CURRAM   = $3801 ; 14337  CHRPOS   Position in CHARACTER RAM of cursor
USRJMP   = $3803 ; 14339  USRGO    JMP instruction for USR.
USRADDR  = $3804 ; 14340  USRAL    address of USR() function
                 ; 14341  USRAH
UDFADDR  = $3806 ; 14342  HOKDSP   RST $30 vector, hooks into various system routines
                 ; 14343
LISTCNT  = $3808 ; 14344  ROWCOUNT Counter for lines listed (pause every 23 lines)
LASTFF   = $3809 ; 14345  PTOLD    Last protection code sent to port($FF)
LSTASCI  = $380a ; 14346  CHARQ    ASCII value of last key pressed.
KWADDR   = $380b ; 14347  SKEY     Address of keyword in the keyword table.
                 ; 14348
CURHOLD  = $380d ; 14349  BUFO     holds character under the cursor.
LASTKEY  = $380E ; 14350           SCAN CODE of last key pressed
SCANCNT  = $380f ; 14351           number of SCANS key has been down for
FDIV     = $3810 ; 14352           subroutine for division ???
                 ;  ...
RANDOM   = $381F ; 14367           used by random number generator
RNDTAB   = $3821 ; 14369           Unused 32 byte Random Number Table 
                 ; ...
LPTLST   = $3845 ; 14405           last printer operation status
PRNCOL   = $3846 ; 14406  LPTPOS   The current printer column (0-131).
CHANNEL  = $3847 ; 14407  PRTFLG   Channel: 0=screen, 1=printer.
LINLEN   = $3848 ; 14408           line length (initially set to 40 ???)
CLMLST   = $3849 ; 14409           position of last comma column
RUBSW    = $384A ; 14410           rubout switch
STKTOP   = $384B ; 14411           high address of stack. followed by string storage space
                 ; 14412
CURLIN   = $384D ; 14413           current BASIC line number (-1 in direct mode)
                 ; 14414
BASTART  = $384F ; 14415  TXTTAB   pointer to start of BASIC program
                 ; 14416
CASNAM   = $3851 ; 14417           tape filename (6 chars)
CASNM2   = $3857 ; 14423           tape read filename (6 chars)
CASFL2   = $385D ; 14429           tape flag
CASFL3   = $385E ; 14430           tape flag (break key check)
BUFMIN   = $385F ; 14431           buffer used by INPUT statement
LINBUF   = $3860 ; 14432  BUF      line input buffer (73 bytes).
                 ;  ...

BUFEND   = $38A9 ; 14505           end of line unput buffer
DIMFLG   = $38AA ; 14506           dimension flag 1 = array
VALTYP   = $38AB ; 14507           Type Indicator 0=numeric 1=string
DORES    = $38AC ; 14508           flag for crunch
RAMTOP   = $38AD ; 14509  MEMSIZ   Address of top of physical RAM.
                 ; 14510
STRBUF   = $38AF ; 14511           18 bytes used by string functions
                 ;  ...
FRETOP   = $38C1 ; 14529           pointer to top of string space
                 ; 14530
SYSTEMP  = $38C3 ; 14531  TEMP     temp space used by FOR etc.
                 ;  ...
DATLIN   = $38c9 ; 14537           address of current DATA line
                 ; 14538
FORFLG   = $38CB ; 14439           flag FOR:, GETVAR: 0=variable, 1=array

TMPSTAT  = $38ce ; 14540           temp holder of next statement address
                 ;  ...
CONTLIN  = $38d2 ; 14546,7         Line number to CONTinue from.
CONTPOS  = $38d4 ; 14548,9         address of line to CONTinue from.
BASEND   = $38d6 ; 14550  VARTAB   variable table (end of BASIC program)
                 ; 14551
ARYTAB   = $38D8 ; 14552           start of array table
                 ; 14553
ARYEND   = $38DA ; 14554           end of array table
                 ; 14555
RESTORE  = $38DC ; 14556           Address of line last RESTOREd
                 ; 14557
;          $38DE ; 14558           pointer and flag for arrays
                 ;  ...
                 ;                 Floating Point Accumulator
FACLO    = $38E4 ; 14564  FPNUM    Low Order of Mantissa
FACMO    = $38E5 ; 14565           Middle Order of Mantissa
FACHO    = $38E6 ; 14566           High Order of Mantissa
FAC      = $38E7 ; 14567           Exponent 

FBUFFR   = $38E8 ; 14568           Floating Point String Buffer 

RESHO    = $38F6 ; 14582           Result of Multiplier and Divider
RESMO    = $38F7 ; 14583
RESLO    = $38F8 ; 14584

SAVSTK   = $38F9 ; 14585           used by keybord routine
                 ;  ...
PROGST   = $3900 ; 14592           NULL before start of BASIC program

; end of system variables = start of BASIC program in stock Aquarius
;          $3901 ; 14593

; buffer lengths
LINBUFLEN   = DIMFLG-LINBUF
STRBUFLEN   = FRETOP-STRBUF
SYSTEMPLEN  = DATLIN-SYSTEMP
TMPSTATLEN  = CONTLIN-TMPSTAT
FBUFFRLEN   = RESHO-FBUFFR

;----------------------------------------------------------------------------
;                          system routines
;----------------------------------------------------------------------------
;
; RST $08,xx SYNCHK    syntax error if char at (HL) is not eqaul to xx
; RST $10    GETNXT    get char at (HL)+, Carry set if '0' to '9'
; RST $18    PRNTCHR   print char in A
; RST $20    CMPHLDE   compare HL to DE. Z if equal, C if DE is greater
; RST $28    TSTSIGN   test sign of floating point number
; RST $30,xx CALLUDF   hooks into various places in the ROM (identified by xx)
; RST $38    CALLUSR   maskable interrupt handler
; RST $66       -      NMI entry point. No code in ROM for this, do NOT use it!

PRNCHR      = $1d94  ; print character in A
PRNCHR1     = $1d72  ; print character in A with pause/break at end of page
PRNCRLF     = $19ea  ; print CR+LF
PRINTSTR    = $0e9d  ; print null-terminated string
PRINTINT    = $1675  ; print 16 bit integer in HL

SCROLLUP    = $1dfe  ; scroll the screen up 1 line
SVCURCOL    = $1e3e  ; save cursor position (HL = address, A = column)

LINEDONE    = $19e5  ; line entered (CR pressed)
FINDLIN     = $049f  ; find address of BASIC line (DE = line number)

FRMNUM      = $0972  ; Evaluate Numeric Formula
FRMEVL      = $0985  ; Evaluate Formula
EVAL        = $09FD  ; Evaluate Variable, Constant, or Function Call
PARCHK      = $0A37  ; Evaluate Formula in Parentheses
LABBCK      = $0A49  ; Functions that don't return string values come back here
GETBYT      = $0B54  ; Evaluate Numeric Formula between 0 and 255
GIVINT      = $0B21  ; Float Integer MSB=[A], LSB=[C] into Floating Point Accumulator
FLOATB      = $0B22  ; Float Integer MSB=[A], LSB=[B] into Floating Point Accumulator
FLOATD      = $0B23  ; Float Integer MSB=[A], LSB=[D] into Floating Point Accumulator
SNGFLT      = $0B36  ; Float Unsigned Byte in A

RETSTR      = $0e2f  ; return string in HL from function  
CRTST       = $0e5f  ; create string (HL = text ending with NULL)
QSTR        = $0e60  ; create string (HL = text starting with '"')
GETFLNM     = $1006  ; get tape filename string (out: DE = filename, A = 1st char)
GETVAR      = $10d1  ; get variable (out: BC = addr, DE = len)

GETLEN      = $0ff7  ; get string length (in: (FACLO) = string block)
                     ;                   (out: HL = string block, A = length)
FRESTR      = $0FC6  ; Free up temporary string
FREFAC      = $0fc9
CHKNUM      = $0975  ; Issue "TM" Error if result is not a number
TSTSTR      = $0976  ; error if evaluated expression not string
CHKTYP      = $0977  ; error if type mismatch

FRCINT      = $0682  ; Convert Floating Point Accumulator AC to Signed Integer in DE
STRTOVAL    = $069c  ; DE = value of decimal number string at HL-1 (65529 max)
STR2INT     = $069d  ; DE = value of decimal number string at HL
INT2STR     = $1679  ; convert 16 bit ingeter in HL to text at FPSTR (starts with ' ')

KEYWAIT     = $1a33  ; wait for keypress (out: A = key)
UKEYCHK     = $1e7e  ; get current key pressed (through UDF)
KEYCHK      = $1e80  ; get current key pressed (direct)
CLRKEYWT    = $19da  ; flush keyboard buffer and wait for keypress

CHKSTK      = $0ba0  ; check for stack space (in: C = number of words required)


;-----------------------------------------------------------------------------
;                         RST  macros
;-----------------------------------------------------------------------------
SYNCHK  MACRO char
        RST    $08    ; syntax error if char at (HL) is not equal to next byte
        db    'char'
        ENDM

GETNEXT MACRO
        RST    $10    ; get next char and test for numeric
        ENDM

PRNTCHR MACRO
        RST   $18     ; print char in A
        ENDM

CMPHLDE MACRO
        RST   $20     ; compare HL to DE. Z if equal, C if HL < DE
        ENDM

;ASCII codes
CTRLC   = $03   ; ^C = break
CTRLG   = $07   ; ^G = bell
BKSPC   = $08   ; backspace
TAB     = $09   ; TAB
LF      = $0A   ; line feed
CR      = $0D   ; carriage return
CTRLS   = $13   ; ^S = wait for key
CTRLU   = $15   ; ^U = abandon line
CTRLX   = $18   ; ^X = undo line

;----------------------------------------------------------------------------
;                         BASIC Error Codes
;----------------------------------------------------------------------------
; code is offset to error name (2 characters)
;
;name        code            description
NF_ERR  =    $00             ; NEXT without FOR
SN_ERR  =    $02             ; Syntax error
RG_ERR  =    $04             ; RETURN without GOSUB
OD_ERR  =    $06             ; Out of DATA
FC_ERR  =    $08             ; Function Call error
OV_ERR  =    $0A             ; Overflow
OM_ERR  =    $0C             ; Out of memory
UL_ERR  =    $0E             ; Undefined line number
BS_ERR  =    $10             ; Bad subscript
DD_ERR  =    $12             ; Re-DIMensioned array
DZ_ERR  =    $14             ; Division by zero (/0)
ID_ERR  =    $16             ; Illegal direct
TM_ERR  =    $18             ; Type mismatch
OS_ERR  =    $1A             ; out of string space
LS_ERR  =    $1C             ; String too long
ST_ERR  =    $1E             ; String formula too complex
CN_ERR  =    $20             ; Cant CONTinue
UF_ERR  =    $22             ; UnDEFined FN function
MO_ERR  =    $24             ; Missing operand


;----------------------------------------------------------------------------
;     jump addresses for BASIC errors (returns to command prompt)
;----------------------------------------------------------------------------
ERROR_SN    = $03c4  ;   syntax error
                     ;   return without gosub
                     ;   out of data
ERROR_FC    = $0697  ;   function code error
ERROR_OV    = $03d3  ;   overflow
ERROR_OM    = $0bb7  ;   out of memory
ERROR_UL    = $06f3  ;   undefined line number
ERROR_BS    = $11cd  ;   bad subscript
ERROR_DD    = $03cd  ;   re-dimensioned array
ERROR_DIV0  = $03c7  ;   divide by zero
ERROR_ID    = $0b4F  ;   illegal direct
ERROR_TM    = $03d9  ;   type mismatch
ERROR_OS    = $0CEF  ;   out of string space
                     ;   string to long
ERROR_ST    = $0E97  ;   string formula too complex
ERROR_CN    = $0C51  ;   cant continue
ERROR_UF    = $03d0  ;   undefined function
                     ;   missing operand

; process error code, E = code (offset to 2 char error name)
DO_ERROR    = $03db

; Standard BASIC Statement Tokens
POKETK      = $94   ; POKE Token
PEEKTK      = $C1   ; PEEK Token

;-------------------------------------------------
;          AquBASIC Binary File Header
;-------------------------------------------------
; Embeds load address into binary file.
;
; benign code can be executed without affecting
; any registers.
;
BINHEADER macro addr
    CP    A        ; $BF resets Carry flag
    JP    C,$-1    ; $DA nnnn (load address)
    endm
