Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13cV3X-0007eK-00
	for mtd-list@infradead.org; Fri, 22 Sep 2000 16:48:07 +0100
Received: from fep01.swip.net ([130.244.199.129] helo=fep01-svc.swip.net)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13cV3W-0007eD-00
	for mtd@infradead.org; Fri, 22 Sep 2000 16:48:06 +0100
Received: from win95 ([130.244.212.127]) by fep01-svc.swip.net
          (InterMail vM.5.01.01.01 201-252-104) with SMTP
          id <20000922154735.DWRE16761.fep01-svc.swip.net@win95>
          for <mtd@infradead.org>; Fri, 22 Sep 2000 17:47:35 +0200
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: <mtd@infradead.org>
Subject: Changes to Config.in, mtdchar.c & mtdcore.c
Date: Fri, 22 Sep 2000 17:47:45 +0200
Message-ID: <003201c024ac$73198100$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


 I'm compiling on 2.2.14-16ish, as compatmac.h (and sysdep-2.2.h) defines
mod_init_t as 'static int __init' for kernel version < 2.3.0 I don't see how
them init-funcs() can be called from mtdcore.c (when compiled as
non-module). What am I missing?

* Anyways, some changes. Config.in need to extra "":

Index: mtd/kernel/Config.in
===================================================================
RCS file: /home/cvs/mtd/kernel/Config.in,v
retrieving revision 1.27
diff -u -r1.27 Config.in
--- mtd/kernel/Config.in	2000/09/14 11:09:37	1.27
+++ mtd/kernel/Config.in	2000/09/22 14:05:52
@@ -6,7 +6,7 @@

 tristate 'Memory Technology Device (MTD) support' CONFIG_MTD

-if [ $CONFIG_MTD = "y" ]; then
+if [ "$CONFIG_MTD" = "y" ]; then
 comment 'Debugging'
    int 'Debugging verbosity (0 = quiet, 3 = noisy)'
CONFIG_MTD_DEBUG_VERBOSE 0
 fi

* mtdchar.c tries to initialise 'file_operations.owner', I didn't find this
in 2.3.99-pre6.

Index: mtd/kernel/mtdchar.c
===================================================================
RCS file: /home/cvs/mtd/kernel/mtdchar.c,v
retrieving revision 1.12
diff -u -r1.12 mtdchar.c
--- mtd/kernel/mtdchar.c	2000/09/14 14:26:08	1.12
+++ mtd/kernel/mtdchar.c	2000/09/22 14:05:52
@@ -376,7 +376,7 @@
 } /* memory_ioctl */

 static struct file_operations mtd_fops = {
-	owner:		THIS_MODULE,
+	/*Whats this? owner:		THIS_MODULE,*/
 	llseek:		mtd_lseek,     	/* lseek */
 	read:		mtd_read,	/* read */
 	write: 		mtd_write, 	/* write */

* And mtdcore.c could use a extern-declaration.

Index: mtd/kernel/mtdcore.c
===================================================================
RCS file: /home/cvs/mtd/kernel/mtdcore.c,v
retrieving revision 1.18
diff -u -r1.18 mtdcore.c
--- mtd/kernel/mtdcore.c	2000/09/18 15:54:06	1.18
+++ mtd/kernel/mtdcore.c	2000/09/22 14:05:53
@@ -67,6 +67,9 @@
 #ifdef CONFIG_MTD_SPIA_NAND
 extern int init_spia_nand(void);
 #endif
+#ifdef CONFIG_MTD_MTDRAM
+extern /*mod_init_t contains 'static'*/int init_mtdram(void);
+#endif
 #ifdef CONFIG_FTL
 extern int init_ftl(void);
 #endif


//Björnen.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
