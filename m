Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Ayt2-0003gF-00
	for mtd-list@infradead.org; Wed, 19 Jan 2000 17:27:16 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Ayt1-0003g9-00
	for mtd@infradead.org; Wed, 19 Jan 2000 17:27:15 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: Pavel Roskin <pavel_roskin@geocities.com>
Subject: Byteorder stuff.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 19 Jan 2000 17:36:35 +0000
Message-Id: <E12Az23-000315-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


Until the __constant byteorder macros get included in Linus' kernels, we have 
to define them ourselves. This patch should apply to today's release and fix 
the compilation on big-endian machines.

diff -ur mtd-20000119/include/linux/mtd/byteorder.h mtd/include/linux/mtd/byteorder.h
--- mtd-20000119/include/linux/mtd/byteorder.h	Wed Jan 19 17:33:34 2000
+++ mtd/include/linux/mtd/byteorder.h	Wed Jan 19 17:30:44 2000
@@ -0,0 +1,48 @@
+#ifndef __MTD_BYTEORDER_H__
+#define __MTD_BYTEORDER_H__
+
+/* Yes, I'm aware that it's a fairly ugly hack.
+   Until the __constant_* macros appear in Linus' own kernels, this is
+   the way it has to be done.
+ DW 19/1/00
+ */
+
+#include <asm/byteorder.h>
+
+#ifndef __constant_cpu_to_le16
+
+#ifdef __BIG_ENDIAN
+#define __constant_cpu_to_le64(x) ___swab64((x))
+#define __constant_le64_to_cpu(x) ___swab64((x))
+#define __constant_cpu_to_le32(x) ___swab32((x))
+#define __constant_le32_to_cpu(x) ___swab32((x))
+#define __constant_cpu_to_le16(x) ___swab16((x))
+#define __constant_le16_to_cpu(x) ___swab16((x))
+#define __constant_cpu_to_be64(x) ((__u64)(x))
+#define __constant_be64_to_cpu(x) ((__u64)(x))
+#define __constant_cpu_to_be32(x) ((__u32)(x))
+#define __constant_be32_to_cpu(x) ((__u32)(x))
+#define __constant_cpu_to_be16(x) ((__u16)(x))
+#define __constant_be16_to_cpu(x) ((__u16)(x))
+#else
+#ifdef __LITTLE_ENDIAN
+#define __constant_cpu_to_le64(x) ((__u64)(x))
+#define __constant_le64_to_cpu(x) ((__u64)(x))
+#define __constant_cpu_to_le32(x) ((__u32)(x))
+#define __constant_le32_to_cpu(x) ((__u32)(x))
+#define __constant_cpu_to_le16(x) ((__u16)(x))
+#define __constant_le16_to_cpu(x) ((__u16)(x))
+#define __constant_cpu_to_be64(x) ___swab64((x))
+#define __constant_be64_to_cpu(x) ___swab64((x))
+#define __constant_cpu_to_be32(x) ___swab32((x))
+#define __constant_be32_to_cpu(x) ___swab32((x))
+#define __constant_cpu_to_be16(x) ___swab16((x))
+#define __constant_be16_to_cpu(x) ___swab16((x))
+#else
+#error No (recognised) endianness defined (unless it,s PDP)
+#endif /* __LITTLE_ENDIAN */
+#endif /* __BIG_ENDIAN */
+
+#endif /* ifndef __constant_cpu_to_le16 */
+
+#endif /* __MTD_BYTEORDER_H__ */
diff -ur mtd-20000119/kernel/nftl.c mtd/kernel/nftl.c
--- mtd-20000119/kernel/nftl.c	Wed Jan 19 10:26:04 2000
+++ mtd/kernel/nftl.c	Wed Jan 19 17:22:24 2000
@@ -2,7 +2,7 @@
 /* Linux driver for NAND Flash Translation Layer */
 /* (c) 1999 Machine Vision Holdings, Inc.   */
 /* Author: David Woodhouse <dwmw2@mvhi.com> */
-/* $Id: nftl.c,v 1.12 2000/01/19 10:26:04 dwmw2 Exp $ */
+/* $Id: nftl.c,v 1.14 2000/01/19 17:22:24 dwmw2 Exp $ */
 
 #define PRERELEASE
 
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nftl.h>
+#include <linux/mtd/byteorder.h>
 
 /* NFTL block device stuff */
 #define MAJOR_NR NFTL_MAJOR
@@ -417,18 +418,18 @@
 			BlockLastState[block] = (unsigned char) oob.b.Status & 0xff;
 
 			switch(oob.b.Status) {
-			case cpu_to_le16(BLOCK_FREE):
+			case __constant_cpu_to_le16(BLOCK_FREE):
 				BlockFreeFound[block]=1;
 				break;
 
-			case cpu_to_le16(BLOCK_USED):
+			case __constant_cpu_to_le16(BLOCK_USED):
 				if (!BlockFreeFound[block])
 					BlockMap[block] = thisEUN;
 				else
 					printk(KERN_WARNING "BLOCK_USED found after BLOCK_FREE in Virtual Unit Chain %d for block %d\n", thisVUC, block);
 				break;
-			case cpu_to_le16(BLOCK_IGNORE):
-			case cpu_to_le16(BLOCK_DELETED):
+			case __constant_cpu_to_le16(BLOCK_IGNORE):
+			case __constant_cpu_to_le16(BLOCK_DELETED):
 				break;
 			default:
 				printk("Unknown status for block %d in EUN %d: %x\n",block,thisEUN, oob.b.Status);
@@ -710,14 +711,14 @@
 		MTD_READOOB(thisNFTL->mtd, (thisEUN * thisNFTL->EraseSize) + blockofs,8, &retlen, (char *)&bci);
 		
 		switch(bci.Status) {
-		case cpu_to_le16(BLOCK_FREE):
+		case __constant_cpu_to_le16(BLOCK_FREE):
 			thisEUN = 0;
 			break;
-		case cpu_to_le16(BLOCK_USED):
+		case __constant_cpu_to_le16(BLOCK_USED):
 			lastgoodEUN = thisEUN;
 			break;
-		case cpu_to_le16(BLOCK_IGNORE):
-		case cpu_to_le16(BLOCK_DELETED):
+		case __constant_cpu_to_le16(BLOCK_IGNORE):
+		case __constant_cpu_to_le16(BLOCK_DELETED):
 			break;
 		default:
 			printk("Unknown status for block %d in EUN %d: %x\n",block,thisEUN, bci.Status);
@@ -781,12 +782,12 @@
 				printk("Status of block %d in EUN %d is %x\n", block , writeEUN, le16_to_cpu(bci.Status));
 
 			switch(bci.Status) {
-			case cpu_to_le16(BLOCK_FREE):
+			case __constant_cpu_to_le16(BLOCK_FREE):
 				return writeEUN;
 
-			case cpu_to_le16(BLOCK_DELETED):
-			case cpu_to_le16(BLOCK_USED):
-			case cpu_to_le16(BLOCK_IGNORE):
+			case __constant_cpu_to_le16(BLOCK_DELETED):
+			case __constant_cpu_to_le16(BLOCK_USED):
+			case __constant_cpu_to_le16(BLOCK_IGNORE):
 				break;
 			default:
 				// Invalid block. Don't use it any more. Must implement.
@@ -1126,7 +1127,7 @@
 	
 	printk(KERN_NOTICE "M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI\n");
 #ifdef PRERELEASE 
-	printk(KERN_INFO"$Id: nftl.c,v 1.12 2000/01/19 10:26:04 dwmw2 Exp $\n");
+	printk(KERN_INFO"$Id: nftl.c,v 1.14 2000/01/19 17:22:24 dwmw2 Exp $\n");
 #endif
 
 	if (register_blkdev(NFTL_MAJOR, "nftl", &nftl_fops)){


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
