Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13U9qq-0006Zs-00
	for mtd-list@infradead.org; Wed, 30 Aug 2000 16:32:32 +0100
Received: from passion.cygnus.co.uk ([194.130.39.73] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13U9qj-0006Zm-00
	for mtd@infradead.org; Wed, 30 Aug 2000 16:32:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <16105.967648027@passion.cygnus.co.uk> 
References: <16105.967648027@passion.cygnus.co.uk>  <1512880772E@mamao.cetuc.puc-rio.br> <20000828185018.A2777@localhost> 
Cc: miguel@cetuc.puc-rio.br, Ciro Cattuto <ciro@prosa.it>, mtd@infradead.org
Subject: Re: GRUB on DOC: 2Mb issues 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 Aug 2000 17:31:36 +0100
Message-ID: <30881.967653096@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  I can hack this up and get it to work on the 512-byte devices if you
> like.

I've hacked it up. It doesn't yet work but I'm going home. I've committed 
the changes to makecsum.c, and that should now work on both types of device 
- it definitely works on the 512-byte-page devices.

The actual Grub loader code doesn't yet work so I haven't yet committed it. 
It's horribly ugly too. Patch below.


Index: doc_stage1.S
===================================================================
RCS file: /home/cvs/mtd/grub/doc_stage1.S,v
retrieving revision 1.8
diff -u -r1.8 doc_stage1.S
--- doc_stage1.S	2000/06/01 00:49:18	1.8
+++ doc_stage1.S	2000/08/30 15:30:51
@@ -29,19 +29,18 @@
  *  defines for the code go here
  */
 
+#define LOADLEN (((STAGE2_SIZE + 0xff) & ~0xff) >> 8)
+#define GRUBLOADOFS	0x300
+
 #ifdef OLDGRUB /* Loading Erich's old grub */
 
-#define LOADLEN (((STAGE2_SIZE + 0xff) & ~0xff) >> 8)
-#define GRUBSTART 0x8000
-#define GRUBLOADSEG	0x7e0
-#define GRUBLOADOFS	0x200
+#define GRUBSTART	0x8000
+#define GRUBLOADSEG	0x7d0
 
 #else /* Loading FSF grub */
 
-#define LOADLEN (((((STAGE2_SIZE + 0xff) & ~0xff) + 0x200)) >> 8)
-#define GRUBSTART 0x8200
-#define GRUBLOADSEG	0x800
-#define GRUBLOADOFS	0x000
+#define GRUBSTART	0x8200
+#define GRUBLOADSEG	0x7f0
 
 #endif
 
@@ -103,7 +102,7 @@
 	movw	$int19,0x0064
 
 		/* Copy ourself into the new segment we've just reserved */
-	movw	$0x80, %cx
+	movw	$0x200, %cx
 	cld
 	pushw	%cs
 	popw	%ds
@@ -127,18 +126,14 @@
 		/* Set up our target address for writing stage2 */
 	movw	$GRUBLOADSEG, %ax
 	movw	%ax, %es
-#if	GRUBLOADOFS == 0
-	xorw	%di, %di
-#else
 	movw	$GRUBLOADOFS, %di
-#endif
 
-		/* Contents of DiskOnChip are loaded at 0000:8000 */
-		/* The first 0x200 bytes of this is in fact this bootloader,
-		 *   and it replaces the bootloader which CVS grub has now
-		 *   added to the beginning of stage2
-		 * Stage2 proper starts at 0x08200, which is convenient.
-		 */
+		/* Stage2 proper starts at offset 0x300 on the flash. We
+		   have defined the load address GRUBLOADSEG so that
+		   we're loading this to 0x8000:0000 or 0x8000:0200, 
+		   depending on whether this is old or GNU Grub, 
+		   respectively.
+		*/
 
 	cld
 
@@ -157,12 +152,157 @@
 
 		/* Load %CX with the number of 256-byte blocks to load */	
 	movw	$LOADLEN, %cx
+
+		/* 
+		   Basically, we know that the DiskOnChip IPL ROM will 
+		   load only the first 256 bytes of each 512-byte page
+		   from a 512-byte-page device, but it'll load _all_
+		   the data from a 256-byte-page device.
+		   
+		   Therefore, we put the code to handle 256-byte-page
+		   devices at offset 0x100, where we know it won't get
+		   loaded if we're actually on a 512-byte-page device.
+		   We put the code to handle 512-byte-page devices at
+		   0x200, in the knowledge that it'll get loaded to 
+		   offset 0x100 if it's appropriate.
+
+		   Now, we don't have to probe the device, we just 
+		   jump to the code at 0x100, because we _know_ that 
+		   the IPL ROM will have loaded the correct code there.
+		   
+		   This is SICK. I love it. 
+		*/
+
+	jmp	mainloop
+
+	/* Routines used by both 256- and 512- byte/page loaders.
+
+                /* doc_cmd:      Send a command to the flash chip */
+doc_cmd:
+                /* Enable CLE line to flash */
+        movb    $CSDN_CTRL_FLASH_IO + CSDN_CTRL_WP + CSDN_CTRL_CLE + CSDN_CTRL_CE, BX_CSDNControl
+                /* Dummy */
+        incw    -4(%bx)
+                /* Write the actual command */
+        movb    %ah,BX_SlowIO
+        movb    %ah,(%si)
+
+                /* doc_wait:     Wait for the DiskOnChip to be ready */
+doc_wait:
+        incw    BX_ChipID
+l38:    
+        testb   $0x80,BX_CSDNControl
+        jz      l38
+        test    BX_CSDNControl,%dx
+        ret
+                
+
+/*
+ * message: write the string pointed to by %si
+ *
+ *   WARNING: trashes %si, %ax, and %bx
+ */
+
+	/*
+	 * Use BIOS "int 10H Function 0Eh" to write character in teletype mode
+	 *	%ah = 0xe	%al = character
+	 *	%bh = page	%bl = foreground color (graphics modes)
+	 */
+1:
+	movw	$0x0001, %bx
+	movb	$0xe, %ah
+	int	$0x10		/* display a byte */
+
+message:
+	lodsb
+	cmpb	$0, %al
+	jne	1b	/* if not end of string, jmp to display */
+	ret
+
+	/* Hex output routines, used at one point in debugging */	
+
+doc_seg:	.word 0
+	
+int19_execed_string:	.string "Loading GRUB from DiskOnChip\n\r"
+
+
+
+	
+	
+		/* Code for 256-byte-page devices. */
+	.org 0x100
+mainloop:	
+mainloop256:
+                /* We're still reading a block */
+//      testw   $0xff, %di
+//      jnz     readbyte
+
+                /* Send new READ0 command */
+
+        movw    %di, %ax
+        xorb    %ah, %ah
+        call    doc_cmd
+
+                /* Start of new block. Set address */
+        movb    $CSDN_CTRL_FLASH_IO + CSDN_CTRL_WP + CSDN_CTRL_ALE + CSDN_CTRL_CE, BX_CSDNControl
+        incw    BX_ChipID
+
+                /* We sent bits 0-7, then 8-15, then 16-23 */
+        movw    %di, %dx
+                /* Bits 0-7 are always zero */
+        movb    $0,BX_SlowIO
+        movb    $0,SI_CSDN_IO
+                        /* Bits 8-15 */
+        movb    %dh,BX_SlowIO
+        movb    %dh,SI_CSDN_IO
+                /* Bits 16-23 */
+        .byte   0xb2 /* movb adrbytehi, %dl */
+adrbytehi256:
+        .byte   0
+        movb    %dl,BX_SlowIO
+        movb    %dl,SI_CSDN_IO
+
+                /* Clear the ALE line to the flash chip */
+        movb    $CSDN_CTRL_FLASH_IO + CSDN_CTRL_WP + CSDN_CTRL_CE, BX_CSDNControl
+        call    doc_wait
+
+        pushw   %cx             /* Store the 'blocks remaining' count */
+        movw    $0x100, %cx     /* Set up to copy 0x100 bytes */
+readbyte256:       
+        testb   BX_SlowIO,%al   /* dummy read */
+        movsb                   /* movb SI_CSDN_IO ;  stosb would be more obvious, */
+        decw    %si             /*  but would take an extra byte. */
+        loop    readbyte256
+
+
+        testw   $0xffff, %di    /* Check if we've done a whole 0x10000 bytes */
+        jnz     endloop256      /* No - continue regardless */
+                /* Yes - increase %es */
+        movw    %es, %cx
+        addb    $0x10, %ch
+        movw    %cx, %es
+
+        incb    %cs:adrbytehi256           /* If so, increase the high byte too */
+
+endloop256:        
+        popw    %cx             /* Restore the 'blocks remaining' count */
+        loop    mainloop256     /* Loop till completely done */
+good256:   
+                /* Run it:       jmpf 0:2000 */
+
+       .byte   0xea
+        .word   GRUBSTART,0
 
-mainloop:
-		/* We're still reading a block */
-//	testw	$0xff, %di
-//	jnz	readbyte
+	.org 0x1ff
+	.byte 0 /* checksum */
 
+	
+	
+		/* Code for 512-byte-page devices. */
+
+	.org 0x200
+mainloop512:
+
 		/* Send new READ command - is it READ0 or READ1? */
 
 	movw	%di, %ax
@@ -188,7 +328,7 @@
 	movb	%dh,SI_CSDN_IO
 		/* Bits 17-23 are also zero */
 	.byte	0xb2 /* movb adrbytehi, %dl */
-adrbytehi:
+adrbytehi512:
 	.byte	0
 	movb	%dl,BX_SlowIO
 	movb	%dl,SI_CSDN_IO
@@ -199,117 +339,34 @@
 
 	pushw	%cx		/* Store the 'blocks remaining' count */
 	movw	$0x100, %cx	/* Set up to copy 0x100 bytes */
-readbyte:	
+readbyte512:	
 	testb	BX_SlowIO,%al	/* dummy read */
 	movsb			/* movb SI_CSDN_IO ;  stosb would be more obvious, */
 	decw	%si		/*  but would take an extra byte. */
-	loop	readbyte
+	loop	readbyte512
 
 
 	testw	$0xffff, %di	/* Check if we've done a whole 0x10000 bytes */
-	jnz	endloop		/* No - continue regardless */
+	jnz	endloop512		/* No - continue regardless */
 		/* Yes - increase %es */
 	movw	%es, %cx
 	addb	$0x10, %ch
 	movw	%cx, %es
 
 	addb	$0x80, %cs:adrbit16	/* Increase bit 16 */
-	jnc	endloop			/* Did it overflow? */
-	incb	%cs:adrbytehi		/* If so, increase the high byte too */
+	jnc	endloop512			/* Did it overflow? */
+	incb	%cs:adrbytehi512		/* If so, increase the high byte too */
 
-endloop:	
+endloop512:	
 	popw	%cx		/* Restore the 'blocks remaining' count */
-	loop	mainloop	/* Loop till completely done */
-good:	
+	loop	mainloop512	/* Loop till completely done */
+good512:	
 		/* Run it:	 jmpf 0:2000 */
 
 	.byte	0xea
 	.word	GRUBSTART,0
-
-		/* doc_cmd:	 Send a command to the flash chip */
-doc_cmd:
-		/* Enable CLE line to flash */
-	movb	$CSDN_CTRL_FLASH_IO + CSDN_CTRL_WP + CSDN_CTRL_CLE + CSDN_CTRL_CE, BX_CSDNControl
-		/* Dummy */
-	incw	-4(%bx)
-		/* Write the actual command */
-	movb	%ah,BX_SlowIO
-	movb	%ah,(%si)
 
-		/* doc_wait:	 Wait for the DiskOnChip to be ready */
-doc_wait:
-	incw	BX_ChipID
-l38:	
-	testb	$0x80,BX_CSDNControl
-	jz	l38
-	test	BX_CSDNControl,%dx
-	ret
-		
+	.org 0x2ff
+	.byte 0 /* checksum */
 
 	
-doc_seg:	.word 0
-	
-int19_execed_string:	.string "Loading GRUB from DiskOnChip\n\r"
-
-/*
- * message: write the string pointed to by %si
- *
- *   WARNING: trashes %si, %ax, and %bx
- */
-
-	/*
-	 * Use BIOS "int 10H Function 0Eh" to write character in teletype mode
-	 *	%ah = 0xe	%al = character
-	 *	%bh = page	%bl = foreground color (graphics modes)
-	 */
-1:
-	movw	$0x0001, %bx
-	movb	$0xe, %ah
-	int	$0x10		/* display a byte */
-
-message:
-	lodsb
-	cmpb	$0, %al
-	jne	1b	/* if not end of string, jmp to display */
-	ret
-
-	/* Hex output routines, used at one point in debugging */	
-#if 0
-phword:
-	pushw	%ax
-	xchgb	%al,%ah
-	call	phbyte
-	movb	%ah,%al
-	call	phbyte
-	popw	%ax
-	ret
-
-
-phbyte:
-	pushw	%ax
-	movb	%al, %ah
-	shrb	$4,%al
-	call	phnibble
-	movb	%ah, %al
-	call	phnibble
-	popw	%ax
-	ret
-
-phnibble:
-	pushw	%ax
-	andb	$0xf,%al
-	addb	$48,%al
-	cmpb	$57,%al
-	jna	ph1
-	add	$7,%al
-ph1:	mov	$0xe,%ah
-	int	$0x10
-	popw	%ax
-	ret
-#endif
-
-#if 0
-		/* Cause an error if this code was too large. */
-	.org 0xff
-	.byte 0 /* Placement of checksum byte */
-#endif	




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
