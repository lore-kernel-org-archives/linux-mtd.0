Received: from pony1.arc.nasa.gov ([128.102.31.31] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192xfQ-0005Qc-Hf
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 19:17:56 +0100
Received: from mail.arc.nasa.gov (airborne.arc.nasa.gov [128.102.173.254])
	by mail.arc.nasa.gov (8.9.3p2/8.9.3) with ESMTP id LAA22058
	for <linux-mtd@lists.infradead.org>;
	Tue, 8 Apr 2003 11:17:23 -0700 (PDT)
Message-ID: <3E9312BF.50009@mail.arc.nasa.gov>
Date: Tue, 08 Apr 2003 11:19:43 -0700
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: DoC + GRUB booting problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've got a 256M DoC2000 I'm trying to set up with GRUB as a boot disk, 
and I'm not making much headway.  I downloaded both GRUB and MTD from 
CVS, patched GRUB and built it successfully.  I loaded the resulting 
grub_firmware to the DOC using the M-Systems DFORMAT utility (latest 
version, 5.1.4).  When I boot the system, I can see the BIOS accessing 
the DOC (looking for BIOS extensions, I presume), but there is no 
sign-on message from GRUB.  Eventually, the BIOS gives up and says "no 
operating system found".

I re-formatted the DOC with the TrueFFS boot image supplied by M-Systems 
as part of their DOS utilities package, and the TrueFFS drivers do sign on.

I wrote a small piece of C code to check out the grub_firmware image, 
and its checksums are correct according to the README_DiskOnChip file in 
the patched GRUB build tree.  The TrueFFS images do not have the correct 
checksums, but they appear to work anyway.

I grabbed an image of the BIOS extension by booting into DOS and using 
DOS DEBUG.  I have disassembled the BIOS boot code (included below) and 
found some conflicts with the README_DiskOnChip info:

1. The IPL in the BIOS extension loads 0x3000 bytes, not 0x2000 bytes.
2. The IPL doesn't necessarily load the SPL to address 0x2000:0.  It 
looks for a 64Kbyte block containing nothing but 0's between 0x2000:0 
and 0xA000:0 and uses that block if it is found, otherwise it uses 0x5800:0.
3. The IPL looks for a 4-byte sequence (0x84 0xA8 0xAC 0xA0) in the SPL 
image before it loads it.  I don't have any DoC documentation of the 
access registers, so I can't tell where it starts looking, and I don't 
know where the IPL starts loading the image if it doesn't find the 
signature its looking for.

I have attached the disassembled code, together with some snippets from 
the BIOS boot specification and the doc_stage1 code from the GRUB stage1 
directory.  The code was disassembled using the Borland Turbo debugger, 
so the operand ordering is
<operator>    <destination>, <source>
unlike the gcc ordering.  Also, data segment references are offset from 
code segment references by (minus) 0x100 bytes, causing a bit of 
confusion with data embedded in the code segment.

If anybody has a canned solution, I'd love to see it.  If someone has 
DOC documentation that sheds light on what the IPL is doing, I can 
probably get this working.

Thanks,
Ted Hildum

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Disassembled code + comments:

Option ROM header

    0:  55                              Signature byte 1
    1:  AA                              Signature byte 2
    2:  10                              Option ROM length in 512-byte blocks
    3:  EB 42 00 00   (jmp 147)         Initialization entry point
    7:  'DiskOnChip(C)', 0, '23', 0     Reserved
   18:  0000                            Offset to PCI data structure
   1A:  0027                            Offset to PnP expansion header
  
  
   1C:  00 00 00 00 00 00 00 00 00 30 55    ???

PnP Expansion header structure

   27:  '$PnP'                          PnP signature bytes
   2B:  01                              Structure revision
   2C:  02                              Length in 16-byte increments
   2D:  0000                            Offset of next header, 0 if none
   2F:  00                              Reserved
   30:  A7                              checksum
   31:  6D 1A 01 10                     Device identifier
   35:  0007                            Pointer to manufacturer string
   37:  0007                            Pointer to name string
   39:  01 80 00                        Device type code
   3C:  94                              Device indicators
   3D:  0069                            Boot Connection Vector, 0 if none
   3F:  0000                            Disconnection vector, 0 if none
   41:  0000                            Bootstrap entry vector, 0 if none
   43:  0000                            Reserved
   45:  0000                            Static resource information 
vector, 0 if none

Starting at offset 47:
initialization:
  cs:0147 50             push   ax
  cs:0148 2EA11A00       mov    ax,cs:[001A]
  cs:014C 0BC0           or     ax,ax            ;Check to see if there 
is a PnP expansion header
  cs:014E 58             pop    ax
  cs:014F 7418           je     0169            ;If no PnP expansion 
header, jump to BCV
 
  cs:0151 1E             push   ds                ;Otherwise, see 
whether we're being called
  cs:0152 57             push   di                ;    by a PnP-aware BIOS
  cs:0153 56             push   si
  cs:0154 51             push   cx
  cs:0155 0E             push   cs
  cs:0156 1F             pop    ds
  cs:0157 BE2700         mov    si,0027            ;offset of PnP signature
  cs:015A B90400         mov    cx,0004            ;4 bytes
  cs:015D F3A6           rep cmpsb                ;Compare these bytes 
with those at ES:DI
  cs:015F 59             pop    cx                ;    (points to PnP 
check structure)
  cs:0160 5E             pop    si
  cs:0161 5F             pop    di
  cs:0162 1F             pop    ds
  cs:0163 7504           jne    0169            ;if miscompare, jump to BCV
  cs:0165 B82001         mov    ax,0120            ;otherwise, return 
0x120 in AX
  cs:0168 CB             retf                    ;    ( say there is an 
IPL device attached )


;    ROM initialization return status bits
;    AX Bit Description
;        8        1 = IPL Device supports INT 13h Block Device format
;        7        1 = Output Device supports INT 10h Character Output
;        6        1 = Input Device supports INT 9h Character Input
;        5:4        00 = No IPL device attached
;                01 = Unknown whether or not an IPL device is attached
;                10 = IPL device attached
;                    (RPL devices have a connection).
;                11 = Reserved
;        3:2        00 = No Display device attached
;                01 = Unknown whether or not a Display device is attached
;                10 = Display device attached
;                11 = Reserved
;        1:0        00 = No Input device attached
;                01 = Unknown whether or not an Input device is attached
;                10 = Input device attached
;                11 = Reserved



Starting at offset 69:

Bootstrap connection vector entry point:
  cs:0169 9C             pushf                ;Save the world
  cs:016A 50             push   ax
  cs:016B 53             push   bx
  cs:016C 51             push   cx
  cs:016D 52             push   dx
  cs:016E 56             push   si
  cs:016F 57             push   di
  cs:0170 55             push   bp
  cs:0171 1E             push   ds
  cs:0172 06             push   es
 ;--------------------------------------------------------------------------------------------
 ;Starting at 2000:0 and going up to A000:0, look for a block of memory 
0x10000 in size
 ;with all zeroes in it.  ES contains the segment of this block on exit.
  cs:0173 BAC01F         mov    dx,1FC0        ; start looking at blocks 
at 2000
  cs:0176 33C0           xor    ax,ax        ;AX = 0
  cs:0178 8EC0           mov    es,ax        ;ES = 0

  cs:017A 33FF           xor    di,di        ; set DI = 0
  cs:017C 83C240         add    dx,0040        ;
  cs:017F 8EDA           mov    ds,dx        ; next 1K block
  cs:0181 81FA00A0       cmp    dx,A000
  cs:0185 741A           je     01A1        ; quit when we reach A000
  cs:0187 33F6           xor    si,si        ;SI = 0, beginning of 1K block
  cs:0189 B90002         mov    cx,0200        ;CX = 200 (512 decimal)
  cs:018C FC             cld                ;string instructions 
increment index registers
  cs:018D AD             lodsw                ;DS:[SI++] --> AX
  cs:018E 0BC0           or     ax,ax
  cs:0190 75E8           jne    017A        ;if a non-zero word was 
found, go to next block
  cs:0192 E2F9           loop   018D        ;get next word
  cs:0194 83FF00         cmp    di,0000
  cs:0197 7502           jne    019B        ;if this is first block with 
all zeroes, set ES
  cs:0199 1E             push   ds
  cs:019A 07             pop    es
  cs:019B 47             inc    di            ;increment count of empty 
1K blocks
  cs:019C 83FF40         cmp    di,0040
  cs:019F 72DB           jb     017C        ;fall through if we have 64K 
of zeroes
 ;--------------------------------------------------------------------------------------------
  cs:01A1 83FF40         cmp    di,0040
  cs:01A4 7305           jnb    01AB        ;if we found 64K of zeroes, 
use that address
  cs:01A6 BA0058         mov    dx,5800
  cs:01A9 8EC2           mov    es,dx        ;otherwise, use 5800:0
  cs:01AB 0E             push   cs
  cs:01AC 1F             pop    ds            ;DS points to this BIOS 
extension
  cs:01AD 8BEC           mov    bp,sp
  cs:01AF 83EC04         sub    sp,0004        ;allocate some space on 
the stack
  cs:01B2 8CC0           mov    ax,es
  cs:01B4 8C46FE         mov    [bp-02],es    ;store ES in allocated 
variable
  cs:01B7 C746FCD400     mov    word ptr [bp-04],00D4    ; store 0xD4 in 
allocated variable
  cs:01BC 0E             push   cs            ;push segment for far 
return after near call
  cs:01BD E81400         call   01D4
  cs:01C0 8B46FE         mov    ax,[bp-02]   
  cs:01C3 8EC0           mov    es,ax        ;ES has returned value from 
call
  cs:01C5 33FF           xor    di,di        ;DI = 0
  cs:01C7 B90080         mov    cx,8000        ;32K count into CX
  cs:01CA 33C0           xor    ax,ax        ;AX = 0
  cs:01CC FC             cld
  cs:01CD F3AB           rep stosw            ;Fill 64K segment with 
zeroes (clean up what we've used)
  cs:01CF 8BE5           mov    sp,bp        ;de-allocate stack space
  cs:01D1 E99200         jmp    0266
 ;-------------------------------------------------------------------------------------------- 

 ;    On entry, stack looks like this:
 ;                        stored ES seg value
 ;                        0xD4
 ;                        stored CS
 ;                SP -->    IP for return
 ;
  cs:01D4 55             push   bp
  cs:01D5 8BEC           mov    bp,sp
  cs:01D7 2EA12000       mov    ax,cs:[0020]    ;location contains 0
  cs:01DB 0BC0           or     ax,ax
  cs:01DD 7503           jne    01E2            ;if non-zero use it to 
load DS
  cs:01DF 8B4604         mov    ax,[bp+04]        ;otherwise use CS 
value off stack
  cs:01E2 8ED8           mov    ds,ax
  cs:01E4 BB0000         mov    bx,0000            ;index register BX = 0
  cs:01E7 C687031000     mov    byte ptr [bx+1003],00    ;Floor select 
register
  cs:01EC C687021085     mov    byte ptr [bx+1002],85    ;DoC control 
register
  cs:01F1 C687021085     mov    byte ptr [bx+1002],85
  cs:01F6 BE0008         mov    si,0800           
  cs:01F9 B1FF           mov    cl,FF            ;DoC command in cl 
(NAND_CMD_RESET maybe?)
  cs:01FB E87A00         call   0278            ;Some DOC operation.  
Issue command?
 
 
 ;This routine probably gets the block number of the binary partition in DX
  cs:01FE FC             cld
  cs:01FF 06             push   es
  cs:0200 0E             push   cs
  cs:0201 07             pop    es
  cs:0202 2E8B162200     mov    dx,cs:[0022]    ; 0 --> DX
  cs:0207 46             inc    si
  cs:0208 4E             dec    si
  cs:0209 81FA0008       cmp    dx,0800
  cs:020D 7D20           jge    022F            ;escape from comparison 
routine
  cs:020F BF7101         mov    di,0171        ;This is offset of 4-byte 
signature string 84 A8 AC A0 at cs:271
  cs:0212 B150           mov    cl,50
  cs:0214 E86100         call   0278            ;issue DOC command?
 
  cs:0217 83C210         add    dx,0010
  cs:021A B108           mov    cl,08
  cs:021C E85C00         call   027B            ;issue DOC command?
 
  cs:021F B90400         mov    cx,0004
  cs:0222 E85000         call   0275            ;issue DOC command?
 
  cs:0225 84871D10       test   [bx+101D],al
 
  cs:0229 A6             cmpsb                    ;compare with 
signature bytes
  cs:022A 75DC           jne    0208            ;next block   
  cs:022C 4E             dec    si
  cs:022D E2FA           loop   0229
  cs:022F 07             pop    es
 
 ;This routine reads the contents of the binary partition into memory, 
accumulating
 ;a checksum as it goes.
  cs:0230 4A             dec    dx
  cs:0231 32E4           xor    ah,ah
  cs:0233 B100           mov    cl,00            ;DoC command 0 
(NAND_CMD_READ0 ?)
  cs:0235 E84000         call   0278
  cs:0238 2E8B0E2400     mov    cx,cs:[0024]    ;0x3000 --> CX
  cs:023D 33FF           xor    di,di            ;DI = 0
  cs:023F F7C1FF01       test   cx,01FF           
  cs:0243 750B           jne    0250            ;should fall through 
every 256 loops
  cs:0245 42             inc    dx
  cs:0246 E83200         call   027B            ;shift window to next block
  cs:0249 E82900         call   0275
  cs:024C 84871D10       test   [bx+101D],al
  cs:0250 AC             lodsb                    ;DS:[SI] --> AL
  cs:0251 02E0           add    ah,al            ;accumulate checksum
  cs:0253 AA             stosb                    ;AL --> ES:[DI]
  cs:0254 4E             dec    si                ;keep SI pointing to 
same location
  cs:0255 E2E8           loop   023F            ;do this CX times
  cs:0257 2E3A262600     cmp    ah,cs:[0026]    ;checksum == 0x55 ?
  cs:025C 7506           jne    0264            ;fail exit if not
  cs:025E 5D             pop    bp
  cs:025F 06             push   es                ;segmment of 
transferred code --> stack
  cs:0260 33C0           xor    ax,ax
  cs:0262 50             push   ax                ;offset of transferred 
code --> stack
  cs:0263 CB             retf                    ;Use far return to jump 
to ES:0
  cs:0264 5D             pop    bp
  cs:0265 CB             retf                    ;Fail exit if bad checksum
 ;--------------------------------------------------------------------------------------------
  cs:0266 07             pop    es            ;Restore the world
  cs:0267 1F             pop    ds
  cs:0268 5D             pop    bp
  cs:0269 5F             pop    di
  cs:026A 5E             pop    si
  cs:026B 5A             pop    dx
  cs:026C 59             pop    cx
  cs:026D 5B             pop    bx
  cs:026E 58             pop    ax
  cs:026F 9D             popf
  cs:0270 CB             retf                ;Return to caller
 
 
  cs:0271 84 A8 AC A0                        ;Bytes to be tested for in 
boot image
  cs:0275 E99916         jmp    1911
  cs:0278 E98516         jmp    1900
  cs:027B E9B916         jmp    1937


  cs:1900 C68704100B     mov    byte ptr [bx+1004],0B    ;WP+CLE+CE --> 
DoC_CDSNControl
  cs:1905 880C           mov    [si],cl
  cs:1907 C6871E1000     mov    byte ptr [bx+101E],00    ;DoC_WritePipeTerm
  cs:190C C687041009     mov    byte ptr [bx+1004],09    ;DoC_CDSNControl

  cs:1911 F687201080     test   byte ptr [bx+1020],80    ;DoC_NOP
  cs:1916 F687201080     test   byte ptr [bx+1020],80    ;DoC_NOP
  cs:191B F687201080     test   byte ptr [bx+1020],80    ;DoC_NOP
  cs:1920 F687201080     test   byte ptr [bx+1020],80    ;DoC_NOP
  cs:1925 F687041080     test   byte ptr [bx+1004],80    ;DoC_CDSNControl
  cs:192A 74F9           je     1925
  cs:192C F687201080     test   byte ptr [bx+1020],80    ;DoC_NOP
  cs:1931 F687201080     test   byte ptr [bx+1020],80    ;DoC_NOP
  cs:1936 C3             ret

  cs:1937 C68704100D     mov    byte ptr [bx+1004],0D    ;WP+ALE+CE --> 
DoC_CDSNControl
  cs:193C 880C           mov    [si],cl
  cs:193E 8814           mov    [si],dl
  cs:1940 8834           mov    [si],dh
  cs:1942 F6871C1020     test   byte ptr [bx+101C],20    ;DoC_ConfigInput
  cs:1947 7403           je     194C
  cs:1949 C60400         mov    byte ptr [si],00
  cs:194C C6871E1000     mov    byte ptr [bx+101E],00    ;DoC_WritePipeTerm
  cs:1951 C687041009     mov    byte ptr [bx+1004],09    ;WP + CE --> 
DoC_CDSNControl
  cs:1956 C3             ret
 
  cs:1957 7A00           jp     1959
  cs:1959 0000           add    [bx+si],al
  cs:195B 0000           add    [bx+si],al
  cs:195D 0000           add    [bx+si],al
  cs:195F 0000           add    [bx+si],al
  cs:1961 0000           add    [bx+si],al
  cs:1963 0000           add    [bx+si],al

-----------------------------------------------------------------------------------
Snippets from doc_stage1:

    /* Some macros to make it obvious what we're accessing */
#define BXREG            DoC_CDSNControl
#define DoC_ChipID 0x1000
#define DoC_DOCStatus 0x1001
#define DoC_DOCControl 0x1002
#define DoC_FloorSelect 0x1003
#define DoC_CDSNControl 0x1004
#define DoC_CDSNDeviceSelect 0x1005
#define DoC_ECCConf 0x1006
#define DoC_2k_ECCStatus 0x1007

#define DoC_CDSNSlowIO 0x100d
#define DoC_ECCSyndrome0 0x1010
#define DoC_ECCSyndrome1 0x1011
#define DoC_ECCSyndrome2 0x1012
#define DoC_ECCSyndrome3 0x1013
#define DoC_ECCSyndrome4 0x1014
#define DoC_ECCSyndrome5 0x1015
#define DoC_AliasResolution 0x101b
#define DoC_ConfigInput 0x101c
#define DoC_ReadPipeInit 0x101d
#define DoC_WritePipeTerm 0x101e
#define DoC_LastDataRead 0x101f
#define DoC_NOP 0x1020

#define BX_ChipID        (DoC_ChipID - BXREG)(%bx)
#define BX_DOCControl        (DoC_DOCControl - BXREG)(%bx)
                /* "movb (%bx), %al" takes only 2 bytes */
#define BX_CDSNControl        (%bx)
#define BX_SlowIO        (DoC_CDSNSlowIO - BXREG)(%bx)
#define BX_ReadPipeInit        (DoC_ReadPipeInit - BXREG)(%bx)
#define BX_LastDataRead        (DoC_LastDataRead - BXREG)(%bx)

#define CDSN_CTRL_FR_B 0x80
#define CDSN_CTRL_ECC_IO 0x20
#define CDSN_CTRL_FLASH_IO 0x10
#define CDSN_CTRL_WP 8
#define CDSN_CTRL_ALE 4
#define CDSN_CTRL_CLE 2
#define CDSN_CTRL_CE 1

    /* doc_cmd:      Send a command to the flash chip */
doc_cmd:
    /* Enable CLE line to flash ( movb    0x1B, (bx)  ) */
    movb    $CDSN_CTRL_FLASH_IO + CDSN_CTRL_WP + CDSN_CTRL_CLE + 
CDSN_CTRL_CE, BX_CDSNControl
    /* Dummy */
    incw    BX_ChipID
    /* Write the actual command */
    movb    %ah,BX_SlowIO
    movb    %ah,(%si)
    /* Disable CLE */
    incw    BX_ChipID
    movb    $CDSN_CTRL_FLASH_IO + CDSN_CTRL_WP + CDSN_CTRL_CE, 
BX_CDSNControl

    /* doc_wait:     Wait for the DiskOnChip to be ready */
doc_wait:
    incw    BX_ChipID
l38:
    testb   $0x80,BX_CDSNControl
    jz      l38
    ret
--------------------------------------------------------------------------------------------------------------------------
