Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Ys8X-0002H4-00
	for mtd-list@infradead.org; Tue, 12 Sep 2000 16:38:17 +0100
Received: from runyon.cygnus.com ([205.180.230.5] helo=cygnus.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Ys8T-0002Gy-00
	for mtd@infradead.org; Tue, 12 Sep 2000 16:38:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: kundrat@pkx.sk
Subject: little EBDA lilo patch (fwd)
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-15864826880"
Date: Tue, 12 Sep 2000 16:34:12 +0100
Message-ID: <10428.968772852@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multipart MIME message.

--==_Exmh_-15864826880
Content-Type: text/plain; charset=us-ascii

Could someone who's using LILO on DiskOnChip please confirm that this is 
OK, and apply it?

--
dwmw2


--==_Exmh_-15864826880
Content-Type: message/rfc822 ; name="1"
Content-Description: 1
Content-Disposition: attachment; filename="1"


>From kundrat@pkx.sk  Sun Aug 27 02:15:35 2000
>From alias  Sun Aug 27 02:15:35 2000
Return-Path: <kundrat@pkx.sk>
Received: (from alias@localhost)
	by cygnus.co.uk id CAA12210
	for dwmw2@cygnus.co.uk; Sun, 27 Aug 2000 02:15:28 +0100 (BST)
Received: (qmail 12207 invoked from network); 27 Aug 2000 01:15:27 -0000
Received: from imladris.infradead.org (HELO infradead.org) (root@194.205.184.45)
  by dns.cygnus.co.uk with SMTP; 27 Aug 2000 01:15:27 -0000
Received: from localhost.localdomain
	([127.0.0.1] helo=localhost ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13Sr2k-0006rG-00
	for Dave@imladris.demon.co.uk; Sun, 27 Aug 2000 02:15:26 +0100
Received: from pop3.mail.demon.net
	by localhost with POP3 (fetchmail-5.0.0)
	for Dave@imladris.demon.co.uk (multi-drop); Sun, 27 Aug 2000 02:15:26 +0100 (BST)
Received: from punt-1.mail.demon.net by mailstore for Dave@imladris.demon.co.uk
          id 967338884:11:11734:4; Sun, 27 Aug 2000 01:14:44 GMT
Received: from cherry.napri.sk ([194.1.128.4]) by punt-1.mail.demon.net
           id aa1023855; 27 Aug 2000 1:14 GMT
Received: from ham.kundrat.sk (root@gw.pkx.sk [194.1.139.234])
	by cherry.napri.sk (8.9.3/8.9.3/Debian/GNU) with ESMTP id DAA23823
	for <Dave@imladris.demon.co.uk>; Sun, 27 Aug 2000 03:14:21 +0200
Received: (from kundrat@localhost)
	by ham.kundrat.sk (8.9.3/8.9.3/Debian/GNU) id DAA04718
	for Dave@imladris.demon.co.uk; Sun, 27 Aug 2000 03:13:04 +0200
Date: Sun, 27 Aug 2000 03:13:04 +0200
From: Peter Kundrat <kundrat@pkx.sk>
To: Dave@imladris.demon.co.uk
Subject: little EBDA lilo patch
Message-ID: <20000827031304.A4700@napri.sk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
User-Agent: Mutt/1.0i


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii

Hi,

I came across a machine with flashdisk, that didnt boot with standard lilo boot.b (EBDA off).
Trying your boot.b-mtd it started working but unfortunately command line was garbled (later
i found that the turning LARGE_EBDA on was the culprit).

Trying to fix it i found, that even if boot loaders themselves were under 0x9a000,
the cmdline position didnt depend on LARGE_EBDA.

This little patch moves cmdline area to 0x98000 (Dave Miller's recent email
to l-k about boot protocol mentions 32k as upper limit for kernel setup code,
thus 0x98000 seemed safe).

I hope it helps (in case you or someone else see the same problem).

        Thanks for good work! Regards,

                Peter

PS: I'd suggest mentioning patchin.sh in main README - or at least a pair of words about
    how it is intended to plug in kernel sources (at least i did it the slower
    way of directly patching kernel and copying missing files/dirs from mtd to kernel
    on compilation errors). 
--
Peter Kundrat
peter@kundrat.sk
~

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lilo-ebda.patch"

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

--jRHKVT23PllUwdXP--


--==_Exmh_-15864826880--




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
