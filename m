Received: from 235-216.205.122.dellhost.com ([216.205.122.235] helo=imagequestdesign.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17UXVz-0003A9-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Jul 2002 19:57:39 +0100
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: [patch] doc_stage1.S : GRUB on DoC
Date: Tue, 16 Jul 2002 14:52:42 -0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Ilguiz Latypov <ilatypov@superbt.com>
Message-Id: <200207161454984.SM02488@there>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm not sure if this should be posted here, or maybe to the GRUB project, but 
the following are some changes to doc_stage1.S and doc_stage1.h.

This patch is against GRUB 0.92, with Ilguiz's latest (06-21) changes applied.

These changes consolidate two files (doc_stage1.S and doc_stage1b.S) into one 
file.  The main purpose of these changes is to eliminate the compile-time 
options that were required to differentiate between the 256-byte-page and 
512-byte-page DoC Millennium.  This is now done at run-time by checking the 
DoC's device ID, eliminating the need for a "stage 1b".

This is necessary for the Millennium because the entire M-Sys IPL is replaced 
by GRUB.  The DoC 2000 GRUB code placed 256-byte-page code at offset 0x100, 
and 512-byte-page code at 0x200, relying on the IPL to jump to the correct 
code.

These changes *should* also work for the DoC 2000, but I have not verified 
this.  Changes will be necessary to the makefile and/or makecsum.c to 
duplicate whatever code is at 0x100..0x1FF to 0x200..0x2FF.

Ilguiz -- is the DOC_MIL_KEEP_IPL option still used?



--- doc_stage1.S.orig   Tue Jul 16 14:24:03 2002
+++ doc_stage1.S        Tue Jul 16 14:23:43 2002
@@ -40,7 +40,7 @@
         */
        .byte 0x55, 0xAA        /* BIOS extension signature */
        .byte 0x10              /* BIOS extension size in 512 byte blocks */
-       /*
+       /*                                       
         * The checksum byte at offset 511 of every copy of IPL is the
         * complement to 0 of first 511 bytes.  This is because of 2 facts:
         * a) the sum of bytes in the BIOS extension window is supposed to 
@@ -56,7 +56,7 @@
 #else
        pushw   %ds
 #endif
-       cld
+       cld 
        MSG(doc_bios_scan_start_string)
 
        /*
@@ -71,7 +71,7 @@
        /* What we need to do is:
           1. Check the current end-of-memory in the BIOS
           2. Reduce it by the amount of memory we need for our INT 19h 
-          3. Return, and wait for our INT 19h to be called.
+          3. Return, and wait for our INT 18h/19h to be called.
        */
 
                /* Find top of memory */
@@ -87,7 +87,7 @@
        shlw    $6,%ax
        movw    %ax,%es
 
-               /* Set up our shiny new INT 19h handler */
+               /* Set up our shiny new INT 18h or 19h handler */
        movw    %es, (DOC_BIOS_HOOK * 4 + 2)
        movw    $doc_bios_boot_hook, (DOC_BIOS_HOOK * 4)
 
@@ -99,7 +99,7 @@
        xorw    %di,%di
        rep
        movsw
-
+       
                /* Store the DiskOnChip segment */
        popw    %es:doc_seg
        lret
@@ -107,6 +107,7 @@
 
 doc_bios_boot_hook:
        cld
+       
                /* Say hello */
        MSG(doc_bios_hook_execed_string)
 #ifndef SHOW_INFO
@@ -135,9 +136,8 @@
        movb    $NAND_CMD_RESET, %ah
        call    doc_cmd
 
-
-               /********* Display chip ID and segment ***************/
 #ifdef SHOW_INFO
+               /********* Display chip ID and segment ***************/
        pushw   %bx
        pushw   %si
 
@@ -170,30 +170,102 @@
 #endif         /* defined(SHOW_INFO) */
                /*****************************************************/
 
-               /* 
-                  Basically, we know that the DiskOnChip IPL ROM will 
-                  load only the first 256 bytes of each 512-byte page
-                  from a 512-byte-page device, but it'll load _all_
-                  the data from a 256-byte-page device.
-                  
-                  Therefore, we put the code to handle 256-byte-page
-                  devices at offset 0x100, where we know it won't get
-                  loaded if we're actually on a 512-byte-page device.
-                  We put the code to handle 512-byte-page devices at
-                  0x200, in the knowledge that it'll get loaded to 
-                  offset 0x100 if it's appropriate.
-
-                  Now, we don't have to probe the device, we just 
-                  jump to the code at 0x100, because we _know_ that 
-                  the IPL ROM will have loaded the correct code there.
-                  
-                  This is SICK. I love it. 
-               */
+       /* figure out if we have a 256-byte or 512-byte device:
+       ** 
+       ** Basically, we know that the DiskOnChip 2000 IPL ROM will 
+       ** load only the first 256 bytes of each 512-byte page
+       ** from a 512-byte-page device, but it'll load 
+       ** the data from a 256-byte-page device.
+       **
+       ** Therefore, we'll put a copy of the code that normally resides
+       ** at offset 0x100..0x1FF at 0x200.  This way, the correct
+       ** code will be there, regardless of which device we have.
+       **
+       ** The DoC Millennium is slightly different -- here, we are
+       ** actually replacing the IPL, so this code duplication isn't
+       ** necessary.
+       */
 
-       jmp     stage1b
+       movb    $NAND_CMD_READID, %ah
+       call    doc_cmd
 
-       /* Routines used by both 256- and 512- byte/page loaders. */
+       /* Use existing block read routine to get Manufacturer &
+       ** Chip ID.  Overkill, but saves code space.  */  
+
+       movw    $1, %cx         /* read just one page */
+       movw    $GRUBSTART, %ax
+       movw    %ax, %es
+       movw    $0, %di
+       call    read_block
+
+       movw    %es:0,%ax               /* id/mfr in first 2 bytes */
+
+#ifdef SHOW_INFO
+
+       /* Display Chip ID and Manufacturer Code */
+
+       pushw   %ax
+       pushw   %bx
+       pushw   %si
+       call    phword
+       MSG(eol_string)
+       popw    %si
+       popw    %bx
+       popw    %ax
+
+#endif
+
+       /* Look at the device ID code to determine if we have 256 byte pages.
+       ** Based on the "nand_flash_dev" table in ../stage2/bdev_diskonchip.c,
+       ** there are currently only two ID codes that are 256: 0x64 and 0xea. 
+       ** All the other types of chips have 512 byte pages. */
+       
+       cmpb    $0x64,%ah
+       je      have_256
+
+       cmpb    $0xEA,%ah
+       jne     get_grub
+
+have_256:
+
+       movb    $1,%cs:page256
+
+get_grub:
+
+       /* Load %CX with the number of 256-byte blocks to load */       
+       movw    $LOADLEN, %cx
+
+       /* Set up our target address for writing stage2 */
+       movw    $GRUBLOADSEG, %ax
+       movw    %ax, %es
+       movw    $GRUBLOADOFS, %di
+
+       /* Stage2 proper starts at offset 0x300 on the flash. We
+          have defined the load address GRUBLOADSEG so that
+          we're loading this to 0x8000:0000 or 0x8000:0200, 
+          depending on whether this is old or GNU Grub, 
+          respectively.
+       */
+
+#ifdef DOC_MIL_KEEP_IPL
+       cmpw    $DoC_2k_CDSN_IO, %si
+       je      mil_spec_end3
+       /* Keep Millennium's original IPL in the first 1K of flash */
+       addw    $0x400, %di
+       mil_spec_end3:
+#endif
 
+       call    copy_grub
+
+good:  
+       MSG(msgjmp)
+               /* Run it:       jmpf 0:8200 */
+       .byte   0xea
+       .word   GRUBSTART,0
+
+       
+       /* Routines used by both 256- and 512- byte/page loaders. */
+       
                 /* doc_cmd:      Send a command to the flash chip */
 doc_cmd:
                 /* Enable CLE line to flash */
@@ -214,7 +286,114 @@
         testb   $0x80,BX_CDSNControl
         jz      l38
         ret
-                
+
+       /* copy_grub: copies GRUB code from flash to RAM */
+
+ copy_grub:
+
+       /* 256 bytes/page: Send new READ0 command
+       ** 512 bytes/page: READ0 or READ1, depending on address */
+
+       xorb   %ah, %ah
+       call    is_256_byte
+       je      send_cmd
+
+       movw    %di, %ax
+       andb    $1,%ah
+
+ send_cmd:
+
+       call    doc_cmd
+
+ read_block:
+
+       /* Start of new block. Set address */
+       movb    $CDSN_CTRL_FLASH_IO + CDSN_CTRL_WP + CDSN_CTRL_ALE + 
CDSN_CTRL_CE, BX_CDSNControl
+       incw    BX_ChipID
+
+       /* For 256 bytes/page, we send bits 0-7, then 8-15, then 16-23 */
+       /* For 512, We send bits 0-7, then 9-16, then 17-23 */
+       /* Yes bit 8 is missing. Read the NAND flash specs */           
+
+       movw    %di,%dx
+       
+       /* Bits 0-7 are always zero */
+       movb    $0,BX_SlowIO
+       movb    $0,(%si)
+
+       /* Bits 8-15 (256), or Bits 9-16 (512) */
+
+       call    is_256_byte
+       je      adrbytemid
+
+       shrw    $1,%dx
+       .byte   0x80, 0xce /* orb adrbit16, %dh */
+ adrbit16:     
+       .byte   0
+
+ adrbytemid:
+
+       movb    %dh,BX_SlowIO
+       movb    %dh,(%si)
+
+       /* Bits 16-23 (256), or Bits 17-24 (512) */
+
+       .byte   0xb2 /* movb adrbytehi, %dl */
+ adrbytehi:
+       .byte   0
+
+       movb    %dl,BX_SlowIO
+       movb    %dl,(%si)
+
+       /* Clear the ALE line to the flash chip */
+       movb    $CDSN_CTRL_FLASH_IO + CDSN_CTRL_WP + CDSN_CTRL_CE, 
BX_CDSNControl
+       call    doc_wait
+
+       pushw   %cx             /* Store the 'blocks remaining' count */
+       movw    $0x100, %cx     /* Set up to copy 0x100 bytes */
+       cmpw    $DoC_2k_CDSN_IO, %si
+       je      mil_spec_end1
+       testb   BX_ReadPipeInit, %al /* Millennium should use the */
+       decw    %cx             /* LastDataRead register - Pipeline Reads */
+ mil_spec_end1:
+
+ readbyte:     
+       movsb                   /* movb (%si), %al ; stosb would be more */
+       decw    %si             /* obvious, but would take an extra byte. */
+       loop    readbyte
+
+       cmpw    $DoC_2k_CDSN_IO, %si
+       je      mil_spec_end2
+       movb    BX_LastDataRead, %al
+       stosb
+ mil_spec_end2:
+
+       testw   $0xffff, %di    /* Check if we've done a whole 0x10000 bytes 
*/
+       jnz     endloop         /* No - continue regardless */
+
+       /* Yes - increase %es */
+       movw    %es, %cx
+       addb    $0x10, %ch
+       movw    %cx, %es
+
+       call    is_256_byte
+       je      inc_hibyte
+
+       addb    $0x80, %cs:adrbit16     /* Increase bit 16 */
+       jnc     endloop         /* Did it overflow? */
+
+ inc_hibyte:
+       incb    %cs:adrbytehi           /* If so, increase the high byte too 
*/
+
+ endloop:      
+       popw    %cx             /* Restore the 'blocks remaining' count */
+       loop    copy_grub       /* Loop till completely done */
+       ret
+
+ is_256_byte:
+       cmpb    $1,%cs:page256
+       ret
+
 
 /*
  * message: write the string pointed to by %si
@@ -229,34 +408,64 @@
         */
 1:
        call    printchar
-.globl message; message:
+message:
        lodsb   %cs:(%si)
        cmpb    $0, %al
        jne     1b      /* if not end of string, jmp to display */
        ret
 
-.globl printspace; printspace:
+#ifdef SHOW_INFO
+       /* Hex output routines, used at one point in debugging */       
+phword:
+        pushw   %ax
+        xchgb   %al,%ah
+        call    phbyte
+        movb    %ah,%al
+        call    phbyte
+        popw    %ax
+        ret
+
+phbyte:
+        pushw   %ax
+        movb    %al, %ah
+        shrb    $4,%al
+        call    phnibble
+        movb    %ah, %al
+        call    phnibble
+        popw    %ax
+        ret
+
+phnibble:
+        pushw   %ax
+        andb    $0xf,%al
+        addb    $48,%al
+        cmpb    $57,%al
+        jna     ph1
+        add     $7,%al
+ph1:    call   printchar
+        popw    %ax
+        ret
+
+printspace:
        mov     $' ', %al
-.globl printchar; printchar:
+printchar:
        movb    $0xe, %ah
        movw    $0x0001, %bx
        int     $0x10
        ret
 
+#endif         /* defined(SHOW_INFO) */
+
 doc_seg:       .word 0
+page256:       .byte   0
 
 doc_bios_hook_execed_string:   .string "DoC"
-doc_2k_string: .string "2000"
-doc_mil_string:        .string "Mil"
-eol_string:    .string "\r\n"
-doc_bios_scan_start_string:    .string "DoC found\r\n"
-
-       .org 0x100
-stage1b:       
-
-.globl doc_wait
-.globl doc_cmd
-.globl message
-.globl phword
-.globl phbyte
+doc_2k_string:                 .string "2000"
+doc_mil_string:                        .string "Mil"
+eol_string:                            .string "\r\n"
+doc_bios_scan_start_string:            .string "DoC found\r\n"
+msgjmp:                                .string "Jumping to Grub\n\r"
+
+       .org 0x1ff
+       .byte 0 /* checksum */
 

--- doc_stage1.h.orig   Tue Jul 16 14:40:15 2002
+++ doc_stage1.h        Tue Jul 16 14:24:14 2002
@@ -74,6 +74,7 @@
        
 #define NAND_CMD_READ0 0
 #define NAND_CMD_READ1 1
+#define NAND_CMD_READID 0x90
 #define NAND_CMD_RESET 0xff
 
 #include "stage2_size.h"


--- Makefile.orig       Tue Jul 16 14:25:46 2002
+++ Makefile    Tue Jul 16 14:25:42 2002
@@ -332,17 +332,8 @@
 
 # DoC Millennium firmware build
 
-doc_stage1b-$(DOC_MIL_PAGE).o: doc_stage1b.S doc_stage1.h \
-               stage2_size.h Makefile
-       $(CC) -o doc_stage1b-$(DOC_MIL_PAGE).o $(STAGE1_CFLAGS) \
-               -DPAGE$(DOC_MIL_PAGE) -fno-builtin -nostdinc -c doc_stage1b.S
-
-doc_stage1-$(DOC_MIL_PAGE).o: doc_stage1.o doc_stage1b-$(DOC_MIL_PAGE).o
-       $(LD) -N -Ttext 0 -o doc_stage1-$(DOC_MIL_PAGE).o \
-               doc_stage1.o doc_stage1b-$(DOC_MIL_PAGE).o
-
-doc_stage1: doc_stage1-$(DOC_MIL_PAGE).bin
-       cp -f doc_stage1-$(DOC_MIL_PAGE).bin doc_stage1
+doc_stage1: doc_stage1.bin
+       cp -f doc_stage1.bin doc_stage1
 
 # DoC 2000 firmware build
 
