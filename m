Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13cASX-0002ny-00
	for mtd-list@infradead.org; Thu, 21 Sep 2000 18:48:33 +0100
Received: from fep01.swip.net ([130.244.199.129] helo=fep01-svc.swip.net)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13cAS1-0002ns-00
	for mtd@infradead.org; Thu, 21 Sep 2000 18:48:01 +0100
Received: from win95 ([130.244.212.45]) by fep01-svc.swip.net
          (InterMail vM.5.01.01.01 201-252-104) with SMTP
          id <20000921174728.VVL16761.fep01-svc.swip.net@win95>
          for <mtd@infradead.org>; Thu, 21 Sep 2000 19:47:28 +0200
From: "Bjorn Eriksson" <mdeans@algonet.se>
To: <mtd@infradead.org>
Subject: MTDRAM update for SRAM.
Date: Thu, 21 Sep 2000 19:47:34 +0200
Message-ID: <002901c023f4$060a3ae0$0800a8c0@win95.inteloop.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

[First attempt bounced with: administrative prohibition (host is
blacklisted)]
Couple of small changes:

 I made mtdram.c support my battery backuped, memory mapped SRAM device.
 Added -O1 CFLAGS_pmc551.o
 Changed `dirname $0` into 'cd dirname $0 && pwd' since $0 doesn't resolve
to a fully qualified path (I tried it with several shells).

Index: mtd/kernel/Config.in
===================================================================
RCS file: /home/cvs/mtd/kernel/Config.in,v
retrieving revision 1.27
diff -u -r1.27 Config.in
--- mtd/kernel/Config.in	2000/09/14 11:09:37	1.27
+++ mtd/kernel/Config.in	2000/09/21 16:40:04
@@ -38,6 +38,9 @@
    if [ "$CONFIG_MTD_MTDRAM" != "n" ]; then
       int 'Device size in kB' CONFIG_MTDRAM_TOTAL_SIZE 4096
       int 'Size of the erase sectors in kB' CONFIG_MTDRAM_ERASE_SIZE 128
+      if [ "$CONFIG_MTD_MTDRAM" = "y" ]; then #If not a module (I don't
want to test it as a module)
+         int 'SRAM: Absolute position (or 0 if N/A)' CONFIG_MTDRAM_ABS_POS
0
+      fi
    fi

 comment 'Linearly Mapped Flash Device Drivers'
Index: mtd/kernel/Makefile
===================================================================
RCS file: /home/cvs/mtd/kernel/Makefile,v
retrieving revision 1.24
diff -u -r1.24 Makefile
--- mtd/kernel/Makefile	2000/09/08 10:21:01	1.24
+++ mtd/kernel/Makefile	2000/09/21 16:40:04
@@ -21,6 +21,7 @@
 	nora.o octagon-5066.o pnc2000.o rpxlite.o vmax301.o mtdchar.o \
 	mtdblock.o ftl.o nftl.o sbc_mediagx.o elan-104nc.o

+CFLAGS_pmc551.o := -O1 # or -O0 or -g, or my egcs-2.91.66 goes to sleep.
 CFLAGS_nftl.o := -DCONFIG_NFTL_RW
 CFLAGS_mtdram.o
:= -DCONFIG_MTDRAM_TOTAL_SIZE=4096 -DCONFIG_MTDRAM_ERASE_SIZE=128
 CFLAGS_physmap.o
:= -DCONFIG_MTD_PHYSMAP_START=0x8000000 -DCONFIG_MTD_PHYSMAP_LEN=0x4000000
Index: mtd/kernel/mtdram.c
===================================================================
RCS file: /home/cvs/mtd/kernel/mtdram.c,v
retrieving revision 1.16
diff -u -r1.16 mtdram.c
--- mtd/kernel/mtdram.c	2000/08/24 09:31:23	1.16
+++ mtd/kernel/mtdram.c	2000/09/21 16:40:04
@@ -15,8 +15,9 @@
 #include <linux/ioport.h>
 #include <linux/mtd/compatmac.h>
 #include <linux/mtd/mtd.h>
-
-
+#if CONFIG_MTDRAM_ABS_POS > 0
+  #include <asm/io.h>
+#endif

 #ifdef MODULE
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
@@ -101,7 +107,11 @@
   if (mtd_info) {
     del_mtd_device(mtd_info);
     if (mtd_info->priv)
+#if CONFIG_MTDRAM_ABS_POS > 0
+      iounmap(mtd_info->priv);
+#else
       vfree(mtd_info->priv);
+#endif
     kfree(mtd_info);
   }
 }
@@ -123,8 +133,19 @@
    mtd_info->flags = MTD_CAP_RAM;
    mtd_info->size = MTDRAM_TOTAL_SIZE;
    mtd_info->erasesize = MTDRAM_ERASE_SIZE;
+#if CONFIG_MTDRAM_ABS_POS > 0
+   mtd_info->priv = ioremap(CONFIG_MTDRAM_ABS_POS, MTDRAM_TOTAL_SIZE);
+   if ( !mtd_info->priv ) {
+      printk("Failed to ioremap memory region (pos:%d, size: %d)\n",
(int)CONFIG_MTDRAM_ABS_POS, (int)MTDRAM_TOTAL_SIZE);
+      return -EIO;
+   } else {
+      printk("Sucess: ioremap memory region (pos:%d, size: %d)\n",
(int)CONFIG_MTDRAM_ABS_POS, (int)MTDRAM_TOTAL_SIZE);
+   }
+
+#else
    mtd_info->priv = vmalloc(MTDRAM_TOTAL_SIZE);
    memset(mtd_info->priv, 0xff, MTDRAM_TOTAL_SIZE);
+#endif

 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
    mtd_info->module = THIS_MODULE;
@@ -142,7 +163,11 @@
    mtd_info->write = ram_write;

    if (add_mtd_device(mtd_info)) {
+#if CONFIG_MTDRAM_ABS_POS > 0
+     iounmap(mtd_info->priv);
+#else
      vfree(mtd_info->priv);
+#endif
      kfree(mtd_info);
      mtd_info = NULL;
      return -EIO;
Index: mtd/patches/patchin.sh
===================================================================
RCS file: /home/cvs/mtd/patches/patchin.sh,v
retrieving revision 1.1
diff -u -r1.1 patchin.sh
--- mtd/patches/patchin.sh	2000/06/26 08:22:56	1.1
+++ mtd/patches/patchin.sh	2000/09/21 16:40:04
@@ -5,7 +5,8 @@
 # This only adds symlinks to the new files - you'll also need to apply
 # the appropriate patch from this directory.

-THISDIR=`dirname $0`
+cd `dirname $0`
+THISDIR=`pwd`
 TOPDIR=`dirname $THISDIR`

 LINUXDIR=/usr/src/linux


--
//Björnen




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
