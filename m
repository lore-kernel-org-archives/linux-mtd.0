Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TRn8-0005wB-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 17:02:02 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E29@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: Support for AMD-compatible non-CFI flashes 
Date: Thu, 15 Feb 2001 17:59:53 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> jonas.holmberg@axis.com said:
> > Here's my MTD-driver for AMD-compatible non-CFI flashes. It only
> > supports one 16-bit flash yet. Is it something you want to 
> include in
> > mtd/kernel?
> 
> ooooh - yes please. 
> 
> --
> dwmw2

Besides kernel/amd_flash.c, is this OK to commit?

/Jonas

--- kernel/Config.in	2001/01/05 23:28:41	1.49
+++ kernel/Config.in	2001/02/15 16:54:28
@@ -65,6 +65,7 @@
    fi
    dep_tristate '    CFI support for Intel/Sharp Extended Commands' CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_CFI
    dep_tristate '    CFI support for AMD/Fujitsu Standard Commands' CONFIG_MTD_CFI_AMDSTD $CONFIG_MTD_CFI
+   dep_tristate '  AMD compatible flash chip support (non-CFI)' CONFIG_MTD_AMDSTD $CONFIG_MTD
    dep_tristate '  pre-CFI Sharp chip support' CONFIG_MTD_SHARP $CONFIG_MTD
    dep_tristate '  CFI Flash device in physical memory map' CONFIG_MTD_PHYSMAP $CONFIG_MTD_CFI
    if [ "$CONFIG_MTD_PHYSMAP" = "y" -o "$CONFIG_MTD_PHYSMAP" = "m" ]; then
Index: kernel/Makefile
===================================================================
RCS file: /home/cvs/mtd/kernel/Makefile,v
retrieving revision 1.43
diff -u -r1.43 Makefile
--- kernel/Makefile	2001/01/05 23:26:26	1.43
+++ kernel/Makefile	2001/02/15 16:54:28
@@ -94,6 +94,7 @@
 obj-$(CONFIG_MTD_CFI)		+= cfi_probe.o
 obj-$(CONFIG_MTD_NAND_SPIA)	+= spia.o mtdpart.o
 obj-$(CONFIG_MTD_SHARP)		+= sharp.o
+obj-$(CONFIG_MTD_AMDSTD)	+= amd_flash.o
 
 # Chip mappings
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o 
cvs server: Diffing kernel/ffs2
cvs server: Diffing obsolete
cvs server: Diffing patches
Index: patches/Configure.help
===================================================================
RCS file: /home/cvs/mtd/patches/Configure.help,v
retrieving revision 1.4
diff -u -r1.4 Configure.help
--- patches/Configure.help	2000/11/02 17:46:36	1.4
+++ patches/Configure.help	2001/02/15 16:54:33
@@ -104,6 +104,11 @@
   provides support for one of those command sets, used on Intel
   StrataFlash and other parts.
 
+AMD compatible flash chip support (non-CFI)
+CONFIG_MTD_AMDSTD
+  This provides support for AMD compatible non-CFI flash chips.
+  It also works on AMD compatible chips that do conform to CFI.
+
 Flash chip mapping in physical memory
 CONFIG_MTD_PHYSMAP
   This provides a 'mapping' driver which allows the CFI probe and


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
