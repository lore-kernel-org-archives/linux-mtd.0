Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12AMFj-0002J9-00
	for mtd-list@infradead.org; Tue, 18 Jan 2000 00:12:07 +0000
Received: from rokslava.transcept.com ([208.151.20.130])
	by infradead.org with smtp (Exim 3.03 #1)
	id 12AMFh-0002J3-00
	for mtd@infradead.org; Tue, 18 Jan 2000 00:12:05 +0000
Received: from localhost (proskin@localhost)
	by sunapee.transcept.com (8.9.3/8.9.3) with ESMTP id TAA29250
	for <mtd@infradead.org>; Mon, 17 Jan 2000 19:22:48 -0500
Date: Mon, 17 Jan 2000 19:22:48 -0500 (EST)
From: Pavel Roskin <pavel_roskin@geocities.com>
To: mtd@infradead.org
Subject: Patch for PowerPC
Message-ID: <Pine.LNX.4.21.0001171855040.29220-100000@sunapee.transcept.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hello!

I'm not sure if mtd-19991025.diff is the last version.
If it isn't please tell me a better place to look (CVS is Ok).

I have fixed many glitches in that version, and I'm sending you my patch.

Some comments:

- MTD is now enabled on PPC.

- The configuration is now in a separate menu. This fixes "menu xconfig"

- Typo in drivers/mtd/Config.in prevented "Direct blockdevice access" from
  being enabled.

- PPC kernel doesn't have a function for dividing 64-bit integers.
  Remember that (unsigned-unsigned) is long long. Workaround provided

- Removed function calls outside functions. I believe it's meant to
  prevent warnings, but egcs-1.1.2 reports errors, which is worse.

- dummy_init() made static to prevent namespace conflicts

- Some workarounds for Linux 2.x were not in all drivers. Fixed.

- Some macros are not constants on PPC and cannot be used after "case".
  Converted to if-else chains.

- printf format violation fixed in drivers/mtd/slram.c

That all for today. Don't hesitate to put a new diff on the website. This
will save time and labor of people interested in getting your stuff
working on PowerPC.

Regards,
Pavel Roskin

=== cut here ===
diff -ur linux-2.2.14pre9.mtd1/arch/ppc/config.in linux-2.2.14pre9.mtd2/arch/ppc/config.in
--- linux-2.2.14pre9.mtd1/arch/ppc/config.in	Thu Nov 25 19:53:09 1999
+++ linux-2.2.14pre9.mtd2/arch/ppc/config.in	Mon Jan 17 19:05:14 2000
@@ -177,6 +177,7 @@
 
 source drivers/char/Config.in
 source drivers/usb/Config.in
+source drivers/mtd/Config.in
 source fs/Config.in
 
 mainmenu_option next_comment
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/Config.in linux-2.2.14pre9.mtd2/drivers/mtd/Config.in
--- linux-2.2.14pre9.mtd1/drivers/mtd/Config.in	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/Config.in	Mon Jan 17 19:04:51 2000
@@ -1,3 +1,6 @@
+mainmenu_option next_comment
+comment 'Memory Technology Device (MTD)'
+
 tristate 'Memory Technology Device (MTD) support' CONFIG_MTD
 
 if [ "$CONFIG_MTD" != "n" ]; then
@@ -10,5 +13,7 @@
 
 	dep_tristate 'FTL (Flash Translation Layer) support' CONFIG_FTL $CONFIG_MTD
 	dep_tristate 'NFTL (NAND Flash Translation Layer) support' CONFIG_NFTL $CONFIG_MTD
-	dep_tristate 'Direct blockdevice access to MTD devices' CONFIG_MTDBLOCK $CONFIG_MTD
+	dep_tristate 'Direct blockdevice access to MTD devices' CONFIG_MTD_BLOCK $CONFIG_MTD
 fi
+
+endmenu
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/doc1000.c linux-2.2.14pre9.mtd2/drivers/mtd/doc1000.c
--- linux-2.2.14pre9.mtd1/drivers/mtd/doc1000.c	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/doc1000.c	Mon Jan 17 19:04:51 2000
@@ -153,7 +153,7 @@
  	u_char *pageaddr=pagein(mtd,from);
 	struct mypriv *priv=mtd->priv;
 	u_char device = from >> priv->devshift;
-	u_char cell = (from  - (device << priv->devshift)) / mtd->erasesize;
+	u_char cell = (int) (from - (device << priv->devshift)) / mtd->erasesize;
 	int ret = 0, timeron = 0;
 
 	if ((from & WINDOW_MASK) + len <= WINDOW_SIZE)
@@ -593,10 +593,4 @@
 	del_mtd_device(mymtd);
 	kfree(mymtd);
 }
-
-module_init (init_doc1000);
-module_exit(cleanup_doc1000);
-
-
-
 
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/doc2000.c linux-2.2.14pre9.mtd2/drivers/mtd/doc2000.c
--- linux-2.2.14pre9.mtd1/drivers/mtd/doc2000.c	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/doc2000.c	Mon Jan 17 19:04:51 2000
@@ -929,23 +929,4 @@
 		}
 	}
 }
-#if LINUX_VERSION_CODE < 0x20300
-#ifndef MODULE
-__initfunc(init_doc2000);
-#endif
-#else /* V2.3.x */
-module_init(init_doc2000);
-module_exit(cleanup_doc2000);
-#endif
-
-
-
-
-
-
-
-
-
-
-
 
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/ftl.c linux-2.2.14pre9.mtd2/drivers/mtd/ftl.c
--- linux-2.2.14pre9.mtd1/drivers/mtd/ftl.c	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/ftl.c	Mon Jan 17 19:04:51 2000
@@ -134,7 +134,7 @@
 
 
 
-void dummy_init(struct gendisk *crap)
+static void dummy_init(struct gendisk *crap)
 {
 }
 
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/mixmem.c linux-2.2.14pre9.mtd2/drivers/mtd/mixmem.c
--- linux-2.2.14pre9.mtd1/drivers/mtd/mixmem.c	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/mixmem.c	Mon Jan 17 19:04:51 2000
@@ -24,6 +24,10 @@
 #define MIXMEM_PAGESIZE 4096
 #define FIRST_BLOCK_OFFSET 0x1000
 
+#if LINUX_VERSION_CODE < 0x20300
+#define __exit
+#endif
+
 static unsigned int mixmem_addrs[] = { 0xc8000, 0xd8000, 0 };
 static unsigned int mixcom_ports[] = { 0x180, 0x280, 0x380, 0 };
 
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/mtd.c linux-2.2.14pre9.mtd2/drivers/mtd/mtd.c
--- linux-2.2.14pre9.mtd1/drivers/mtd/mtd.c	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/mtd.c	Mon Jan 17 19:04:51 2000
@@ -553,14 +553,3 @@
 #endif
 }
 
-
-
-
-#if LINUX_VERSION_CODE < 0x20300
-#ifndef MODULE
-__initfunc(init_mtd);
-#endif
-#else
-module_init(init_mtd);
-module_exit(cleanup_mtd);
-#endif
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/nftl.c linux-2.2.14pre9.mtd2/drivers/mtd/nftl.c
--- linux-2.2.14pre9.mtd1/drivers/mtd/nftl.c	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/nftl.c	Mon Jan 17 19:04:51 2000
@@ -45,7 +45,7 @@
 struct hd_struct part_table[256] = {{0,0},};
 
 
-void dummy_init (struct gendisk *crap)
+static void dummy_init (struct gendisk *crap)
 {}
 
 
@@ -417,23 +417,17 @@
 
 			BlockLastState[block] = (unsigned char) oob.b.Status & 0xff;
 
-			switch(oob.b.Status) {
-			case cpu_to_le16(BLOCK_FREE):
+			if (oob.b.Status == cpu_to_le16(BLOCK_FREE))
 				BlockFreeFound[block]=1;
-				break;
-
-			case cpu_to_le16(BLOCK_USED):
+			else if (oob.b.Status == cpu_to_le16(BLOCK_USED)) {
 				if (!BlockFreeFound[block])
 					BlockMap[block] = thisEUN;
 				else
 					printk(KERN_WARNING "BLOCK_USED found after BLOCK_FREE in Virtual Unit Chain %d for block %d\n", thisVUC, block);
-				break;
-			case cpu_to_le16(BLOCK_IGNORE):
-			case cpu_to_le16(BLOCK_DELETED):
-				break;
-			default:
-				printk("Unknown status for block %d in EUN %d: %x\n",block,thisEUN, oob.b.Status);
 			}
+			else if (oob.b.Status != cpu_to_le16(BLOCK_IGNORE) &&
+				 oob.b.Status != cpu_to_le16(BLOCK_DELETED))
+				printk("Unknown status for block %d in EUN %d: %x\n",block,thisEUN, oob.b.Status);
 		}
 
 		if (!silly--) {
@@ -710,19 +704,13 @@
 		
 		MTD_READOOB(thisNFTL->mtd, (thisEUN * thisNFTL->EraseSize) + blockofs,8, &retlen, (char *)&bci);
 		
-		switch(bci.Status) {
-		case cpu_to_le16(BLOCK_FREE):
+		if (bci.Status == cpu_to_le16(BLOCK_FREE))
 			thisEUN = 0;
-			break;
-		case cpu_to_le16(BLOCK_USED):
+		else if (bci.Status == cpu_to_le16(BLOCK_USED))
 			lastgoodEUN = thisEUN;
-			break;
-		case cpu_to_le16(BLOCK_IGNORE):
-		case cpu_to_le16(BLOCK_DELETED):
-			break;
-		default:
+		else if (bci.Status != cpu_to_le16(BLOCK_IGNORE) &&
+			 bci.Status != cpu_to_le16(BLOCK_DELETED))
 			printk("Unknown status for block %d in EUN %d: %x\n",block,thisEUN, bci.Status);
-		}
 
 		if (!silly--) {
 			printk(KERN_WARNING "Infinite loop in Virtual Unit Chain 0x%x\n",block / (thisNFTL->EraseSize / 512));
@@ -781,17 +769,13 @@
 			if (debug) 
 				printk("Status of block %d in EUN %d is %x\n", block , writeEUN, le16_to_cpu(bci.Status));
 
-			switch(bci.Status) {
-			case cpu_to_le16(BLOCK_FREE):
+			if (bci.Status == cpu_to_le16(BLOCK_FREE))
 				return writeEUN;
-
-			case cpu_to_le16(BLOCK_DELETED):
-			case cpu_to_le16(BLOCK_USED):
-			case cpu_to_le16(BLOCK_IGNORE):
-				break;
-			default:
+			else if (bci.Status != cpu_to_le16(BLOCK_DELETED) &&
+				 bci.Status != cpu_to_le16(BLOCK_USED) &&
+				 bci.Status != cpu_to_le16(BLOCK_IGNORE))
+			{
 				// Invalid block. Don't use it any more. Must implement.
-				break;			
 			}
 			
 			if (!silly--) { 
diff -ur linux-2.2.14pre9.mtd1/drivers/mtd/slram.c linux-2.2.14pre9.mtd2/drivers/mtd/slram.c
--- linux-2.2.14pre9.mtd1/drivers/mtd/slram.c	Mon Jan 17 19:04:06 2000
+++ linux-2.2.14pre9.mtd2/drivers/mtd/slram.c	Mon Jan 17 19:04:51 2000
@@ -33,6 +33,14 @@
 
 #include <linux/mtd/mtd.h>
 
+#ifndef THIS_MODULE
+#ifdef MODULE
+#define THIS_MODULE (&__this_module)
+#else
+#define THIS_MODULE NULL
+#endif
+#endif
+
 struct mypriv {
 	u_char *start;
 	u_char *end;
@@ -142,7 +150,8 @@
 
 	if (start + length != end)
 	  {
-	    printk(KERN_NOTICE "physmem: start(%p) + length(%p) != end(%p) !\n");
+	    printk(KERN_NOTICE "physmem: start(%lx) + length(%lx) != end(%lx) !\n",
+		   start, length, end);
 	    return -EINVAL;
 	  }
 
@@ -182,7 +191,7 @@
 	mymtd->unpoint = physmem_unpoint;
 	mymtd->read = physmem_read;
 	mymtd->write = physmem_write;
-	mymtd->module = &__this_module;
+	mymtd->module = THIS_MODULE;
 	mymtd->type = MTD_RAM;
 	mymtd->erasesize = 0x10000;
 
=== cut here ===



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
