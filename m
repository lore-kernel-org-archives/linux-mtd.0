Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qKmx-0004fV-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 21:12:27 +0100
Date: Thu, 19 Apr 2001 22:11:19 +0200
From: Fabrice Gautier <gautier@email.enst.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] Makefiles + vmax301 (was Re: MTD CVS and Official Kernel Tree )
Cc: mtd@infradead.org
In-Reply-To: <5889.987697556@redhat.com>
References: <20010419181031.18A9.GAUTIER@email.enst.fr> <5889.987697556@redhat.com>
Message-Id: <20010419220359.0A46.GAUTIER@email.enst.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Thu, 19 Apr 2001 17:25:56 +0100
David Woodhouse <dwmw2@infradead.org> wrote:
> 
> gautier@email.enst.fr said:
> > Am I right when I assume that the mtd cvs tree can be applied to a 2.4
> > kernel tree by coppying directories like this?
> 
> > mtd/drivers/mtd -------> linux/drivers/mtd
> > mtd/fs ----------------> linux/fs
> > mtd/include -----------> linux/include
> 
> Yep. Assuming I got the Makefiles right. Which is unlikely. 

The following patch make them good (for me), plus there is another patch
for an include problem in vmax301.c. (it's a "works for me" patch)


The problems were:
1/ target for nftl.o before global Rules
2/ $TOPDIR instead of $(TOPDIR) in some Makefiles
3/ mixmem.c has disapeared from CVS.


Index: drivers/mtd/Makefile
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/Makefile,v
retrieving revision 1.55
diff -u -r1.55 Makefile
--- drivers/mtd/Makefile	2001/04/18 21:09:29	1.55
+++ drivers/mtd/Makefile	2001/04/19 20:01:24
@@ -62,7 +62,8 @@
 
 nftl-objs	:= nftlcore.o nftlmount.o
 
+include $(TOPDIR)/Rules.make
+
 nftl.o: $(nftl-objs)
 	$(LD) -r -o $@ $(nftl-objs)
 
-include $(TOPDIR)/Rules.make
Index: drivers/mtd/chips/Makefile
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/Makefile,v
retrieving revision 1.1
diff -u -r1.1 Makefile
--- drivers/mtd/chips/Makefile	2001/04/18 21:09:28	1.1
+++ drivers/mtd/chips/Makefile	2001/04/19 20:01:24
@@ -21,4 +21,4 @@
 obj-$(CONFIG_MTD_ROM)		+= map_rom.o
 obj-$(CONFIG_MTD_SHARP)		+= sharp.o
 
-include $TOPDIR/Rules.make
+include $(TOPDIR)/Rules.make
Index: drivers/mtd/devices/Makefile
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/Makefile,v
retrieving revision 1.1
diff -u -r1.1 Makefile
--- drivers/mtd/devices/Makefile	2001/04/18 21:09:29	1.1
+++ drivers/mtd/devices/Makefile	2001/04/19 20:01:24
@@ -20,4 +20,4 @@
 obj-$(CONFIG_MTD_PMC551)	+= pmc551.o
 obj-$(CONFIG_MTD_MTDRAM)	+= mtdram.o
 
-include $TOPDIR/Rules.make
+include $(TOPDIR)/Rules.make
Index: drivers/mtd/maps/Makefile
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/Makefile,v
retrieving revision 1.1
diff -u -r1.1 Makefile
--- drivers/mtd/maps/Makefile	2001/04/18 21:09:29	1.1
+++ drivers/mtd/maps/Makefile	2001/04/19 20:01:24
@@ -12,7 +12,6 @@
 obj-$(CONFIG_MTD_DC21285)       += dc21285.o
 obj-$(CONFIG_MTD_ELAN_104NC)    += elan-104nc.o
 obj-$(CONFIG_MTD_IQ80310)	+= iq80310.o
-obj-$(CONFIG_MTD_MIXMEM)	+= mixmem.o
 obj-$(CONFIG_MTD_NORA)		+= nora.o
 obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o 
@@ -24,4 +23,4 @@
 obj-$(CONFIG_MTD_SUN_UFLASH)    += sun_uflash.o
 obj-$(CONFIG_MTD_VMAX)		+= vmax301.o
 
-include $TOPDIR/Rules.make
+include $(TOPDIR)/Rules.make
Index: drivers/mtd/nand/Makefile
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nand/Makefile,v
retrieving revision 1.1
diff -u -r1.1 Makefile
--- drivers/mtd/nand/Makefile	2001/04/18 21:09:29	1.1
+++ drivers/mtd/nand/Makefile	2001/04/19 20:01:25
@@ -9,4 +9,4 @@
 obj-$(CONFIG_MTD_NAND_ECC)	+= nand_ecc.o
 obj-$(CONFIG_MTD_NAND_SPIA)	+= spia.o
 
-include $TOPDIR/Rules.make
+include $(TOPDIR)/Rules.make


This one is for an include problem in vmax301.c

Index: drivers/mtd/maps/vmax301.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/vmax301.c,v
retrieving revision 1.19
diff -u -r1.19 vmax301.c
--- drivers/mtd/maps/vmax301.c	2001/03/17 16:18:29	1.19
+++ drivers/mtd/maps/vmax301.c	2001/04/19 20:01:25
@@ -20,7 +20,7 @@
 #include <linux/malloc.h>
 #include <linux/ioport.h>
 #include <linux/init.h>
-#include <asm/spinlock.h>
+#include <linux/spinlock.h>
 #include <asm/io.h>
 
 #include <linux/mtd/map.h>



-- 
Fabrice Gautier <gautier@email.enstfr>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
