Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14bR0P-0001It-00
	for mtd-list@infradead.org; Fri, 09 Mar 2001 17:48:45 +0000
Received: from [216.174.202.135] (helo=celeborn.rivendell.insynq.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14bR0O-0001In-00
	for mtd@infradead.org; Fri, 09 Mar 2001 17:48:44 +0000
Received: from pyramid.insynq.com (pyramid.office.insynq.com [10.2.2.10])
	by celeborn.rivendell.insynq.com (8.9.3/8.8.7) with ESMTP id LAA19153
	for <mtd@infradead.org>; Fri, 9 Mar 2001 11:05:08 -0800
Received: by insynq.com
	via sendmail from stdin
	id <m14bR0P-00169FC@pyramid.insynq.com> (Debian Smail3.2.0.102)
	for mtd@infradead.org; Fri, 9 Mar 2001 09:48:45 -0800 (PST)
From: "Ian Eure <Ian Eure" <ieure@insynq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15017.6013.604261.151332@pyramid.insynq.com>
Date: Fri, 9 Mar 2001 09:48:45 -0800 (PST)
To: mtd@infradead.org
Subject: [PATCH] lilo 21.6.1 patch
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

ok, i decided to put my code where my mouth was. here's an updated
lilo patch, against 21.6.1. it works for me, and i've booted 32mb &
48mb doc2000s with it.

diff -u lilo-21.6.1.orig/Makefile lilo-21.6.1/Makefile
--- lilo-21.6.1.orig/Makefile	Sat Dec 16 14:41:35 2000
+++ lilo-21.6.1/Makefile	Wed Feb 21 14:59:08 2001
@@ -50,6 +50,9 @@
   sed 's/-D/-DLCF_/g'` `[ -r /usr/include/asm/boot.h ] && echo -DHAS_BOOT_H`
 GO=-DGO=0x`sed '/go/s/^.*go *0 \(....\) A.*$$/\1/p;d' first.lis`
 
+#CONFIG+=-DLCF_LARGE_EBDA
+#PCONFIG+=-DLCF_LARGE_EBDA
+
 SHELL=/bin/sh
 CC=cc
 CPP=$(CC) -E
Only in lilo-21.6.1: activate
Only in lilo-21.6.1: boot-menu.b
Only in lilo-21.6.1: boot-text.b
Only in lilo-21.6.1: chain.b
Only in lilo-21.6.1: disk.com
Common subdirectories: lilo-21.6.1.orig/doc and lilo-21.6.1/doc
Only in lilo-21.6.1: dparam.com
diff -u lilo-21.6.1.orig/geometry.c lilo-21.6.1/geometry.c
--- lilo-21.6.1.orig/geometry.c	Sat Dec 16 14:09:21 2000
+++ lilo-21.6.1/geometry.c	Wed Feb 21 15:01:36 2001
@@ -125,7 +125,8 @@
       MAJOR(dev) == MAJOR_IDE3 || MAJOR(dev) == MAJOR_IDE4 ||
       MAJOR(dev) == MAJOR_IDE5 || MAJOR(dev) == MAJOR_IDE6 ||
       MAJOR(dev) == MAJOR_XT || MAJOR(dev) == MAJOR_SD ||
-      MAJOR(dev) == MAJOR_ESDI || MAJOR(dev) == MAJOR_DAC960;
+      MAJOR(dev) == MAJOR_ESDI || MAJOR(dev) == MAJOR_DAC960 ||
+      MAJOR(dev) == MAJOR_FL || MAJOR(dev) == MAJOR_NFTL;
 }
 
 
@@ -310,8 +311,15 @@
 	    /* fall through */
 	case MAJOR_ESDI:
 	    /* fall through */
+	case MAJOR_FL:
+	    /* fall through */
+	case MAJOR_NFTL:
+	    /* fall through */
 	case MAJOR_XT:
-	    geo->device = 0x80+(MINOR(device) >> 6)+(MAJOR(device) == MAJOR_HD ?
+	    geo->device = 0x80+(MINOR(device) >> 6)+(
+	      (MAJOR(device) == MAJOR_HD || 
+	       MAJOR(device) == MAJOR_FL ||
+	       MAJOR(device) == MAJOR_NFTL) ?
 	      0 : last_dev(MAJOR_HD,64));
 	    if (ioctl(fd,HDIO_GETGEO,&hdprm) < 0)
 		die("geo_query_dev HDIO_GETGEO (dev 0x%04x): %s",device,
@@ -403,6 +411,10 @@
 	case MAJOR_IDE6:
 	    /* fall through */
 	case MAJOR_ESDI:
+	    /* fall through */
+	case MAJOR_FL:
+	    /* fall through */
+	case MAJOR_NFTL:
 	    /* fall through */
 	case MAJOR_XT:
 	    return MINOR(device) >> 6 ? 0 : !last_dev(MAJOR_HD,64);
Only in lilo-21.6.1: lilo
diff -u lilo-21.6.1.orig/lilo.h lilo-21.6.1/lilo.h
--- lilo-21.6.1.orig/lilo.h	Thu Sep 21 16:18:50 2000
+++ lilo-21.6.1/lilo.h	Wed Feb 21 15:02:17 2001
@@ -41,6 +41,8 @@
 #define MAJOR_DAC960	48 /* First Mylex DAC960 PCI RAID controller */
 #define MAJOR_IDE5	55 /* IDE on fifth interface */
 #define MAJOR_IDE6	57 /* IDE on sixth interface */
+#define MAJOR_FL  62 /* M-Systems Disk On Chip 2000 */
+#define MAJOR_NFTL  93 /* M-Systems DOC2000 NFTL driver */
 #define COMPAQ_SMART2_MAJOR	72 /* First Smart/2 Major */
 
 #define MAX_IMAGES      ((SECTOR_SIZE*2-2)/sizeof(IMAGE_DESCR))
@@ -271,4 +273,4 @@
 
 #endif
 
-#endif
\ No newline at end of file
+#endif
Common subdirectories: lilo-21.6.1.orig/manPages and lilo-21.6.1/manPages

-- 
 ___________________________________
| Ian Eure - <ieure@insynq.com>     | "You're living in a facist world...
|         -  Developer -            | Freedom is a luxury." -Front Line
|        -  InsynQ, Inc. -          | Assembly, "Digital Tension Dementia"
| Your Internet Utility Company.tm  |________________________________________


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
