Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14XsFt-0004sH-00
	for mtd-list@infradead.org; Tue, 27 Feb 2001 22:06:01 +0000
Received: from cherry.napri.sk ([194.1.128.4] ident=postfix)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14XsFr-0004sB-00
	for mtd@infradead.org; Tue, 27 Feb 2001 22:05:59 +0000
Received: from ham.pkx.sk (gw.pkx.sk [194.1.139.234])
	by cherry.napri.sk (Postfix) with ESMTP id ED0CB39010
	for <mtd@infradead.org>; Tue, 27 Feb 2001 23:05:54 +0100 (CET)
Received: (from kundrat@localhost)
	by ham.pkx.sk (8.9.3/8.9.3/Debian/GNU) id WAA02063
	for mtd@infradead.org; Tue, 27 Feb 2001 22:55:23 +0100
Date: Tue, 27 Feb 2001 22:55:23 +0100
From: Peter Kundrat <kundrat@kundrat.sk>
To: mtd@infradead.org
Subject: Re: lilo kernel params failure
Message-ID: <20010227225523.A743@napri.sk>
References: <3A9B09BD.C3D3CB68@tg-embedded.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wac7ysb48OaltWcw"
In-Reply-To: <3A9B09BD.C3D3CB68@tg-embedded.com>; from dant@tg-embedded.com on Mon, Feb 26, 2001 at 08:58:21PM -0500
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii

On Mon, Feb 26, 2001 at 08:58:21PM -0500, dant@tg-embedded.com wrote:
> I have been strugling with this for some time now.
> 
> It looks like a failure of lilo to pass kernel params ( append="...." )
> But we have been through the code and fail to find a reason.
> this happens with the lilo-mtd in the cvs /patches area and we have
> patched 21 with the same results.
> We are using DoC  2000 with kernel 2.4.2 though this has been happening
> for months really.
> Anyone have any ideas?

I sent a patch here few months ago for lilo-mtd, i havent checked if it
got applied. Attached again, just for case. 
Another option is to use lilo available from m-sys (this one is a bit newer 
version if i recall correctly).

pkx

-- 
Peter Kundrat
peter@kundrat.sk
peter-work@kundrat.sk (a copy goes to work)

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lilo-ebda-pkx.patch"

diff -ur lilo.orig/lilo.h lilo/lilo.h
--- lilo.orig/lilo.h	Fri Dec  4 19:55:31 1998
+++ lilo/lilo.h	Sun Aug 27 02:40:46 2000
@@ -149,10 +151,12 @@
 FIRSTSEG  = 0x9A00
 STACKSEG  = 0x9000
 SECONDSEG = 0x9B00			! second stage loader segment
+PARMLINE  = 0x2A00			! parameter line construction area off.
 #else
 FIRSTSEG  = 0x8A00
 STACKSEG  = 0x8000
 SECONDSEG = 0x8B00			! second stage loader segment
+PARMLINE  = 0xD000			! parameter line construction area off. (0x98000)
 #endif
 
 INITSEG   = DEF_INITSEG			! we move boot here - out of the way
@@ -164,7 +168,6 @@
 DFLCMD	  = 0x2600			! default command line
 MAP	  = 0x2000			! map load area offset
 KEYTABLE  = 0x2800			! keyboard translation table offset
-PARMLINE  = 0x2a00			! parameter line construction area off.
 SECOND	  = 0x1000			! second stage loader load address
 SECOND_SS = 0xB000			! second as seen from SS:0000
 SLA_SIZE  = 0x9E00			! setup load area size
diff -ur lilo.orig/second.S lilo/second.S
--- lilo.orig/second.S	Sat Dec  5 00:20:07 1998
+++ lilo/second.S	Sun Aug 27 02:43:56 2000
@@ -830,9 +830,15 @@
 	call	load1
 	seg	es
 	mov	CL_MAGIC_ADDR,#CL_MAGIC ! set magic number
-	seg	es
-	mov	word ptr CL_OFFSET,#PARMLINE+SECOND_SS
-				! set parameter line offset
+#ifndef LCF_LARGE_EBDA
+        seg     es
+        mov     word ptr CL_OFFSET,#PARMLINE+SECOND_SS
+                                ! set parameter line offset
+#else
+        seg     es
+        mov     word ptr CL_OFFSET,#PARMLINE+SECONDSEG*16-INITSEG*16
+                                ! set parameter line offset
+#endif
 	pop	si		! restore SI
 	lodsw			! get flags bit map
 	mov	bx,ax

--wac7ysb48OaltWcw--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
