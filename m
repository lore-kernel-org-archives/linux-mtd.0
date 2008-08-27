Received: from mail153.messagelabs.com ([216.82.253.51])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYHgZ-0007F8-16
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 09:51:33 +0000
Received: from il27exr04.cig.mot.com ([10.17.196.73])
	by motgate5.mot.com (8.12.11/Motorola) with ESMTP id m7R9pTll004950
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2008 02:51:29 -0700 (MST)
Received: from az10vts04.mot.com (il27vts04.cig.mot.com [10.17.196.88])
	by il27exr04.cig.mot.com (8.13.1/Vontu) with SMTP id m7R9pTTM016937
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2008 04:51:29 -0500 (CDT)
Received: from zmy16exm63.ds.mot.com (zmy16exm63.ap.mot.com [10.179.4.34])
	by il27exr04.cig.mot.com (8.13.1/8.13.0) with ESMTP id m7R9pQ4u016927
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Aug 2008 04:51:27 -0500 (CDT)
Subject: [PATCH][MTD][NAND]Bad Block Management
From: Sheng-Zhe Zhao <a18689@motorola.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Message-Id: <1219830684.13957.25.camel@il93elnxlog2>
Mime-Version: 1.0
Date: Wed, 27 Aug 2008 04:51:24 -0500
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here come our patch and a short introduction for this patch. Any comments are welcome.

[MTD] [NAND] Bad Block Management
During the lifetime of a NAN device, additional Bad blocks may develop. The NAN devices have a Status Register that indicates whether an operation is successful or not. Additional Bad Blocks are identified when attempts to program or erase give errors in the Status Register.  As the failure of a page program operation does not affect the data in other pages in the same block, most of the data within a failing block can be moved to a new block prior to marking the block bad. Blocks can be marked as bad and new blocks allocated using two general methods:

1.       Skip Block method:
In the Skip Block method, the algorithm creates the Bad Block Table and when the target address corresponds to a Bad Block address, the data is stored in the next good block, skipping the Bad Block.

2.       Reserve Block method:
The Reserve Block Method uses the same Bad Block Table format as the Skip Block Method. However, in the Reserve Block Method, Bad Blocks are not skipped but instead are replaced by a block from the reserved block area. This replacement is achieved by a layer of software which automatically remaps bad blocks to their corresponding replacement blocks. For this purpose, the Bad Block Management software creates two areas in NAN flash: the User Addressable Block Area and the Reserved Block Area as shown below.

This patch implements "reserve block method" on Motorola's SCUM-A11 platform mobile devices.  With the Reserved Block method, any exist bad block or newly wearing out block will be replaced by reserved block while block pool still available . The maximum number of reserved blocks is set to be 10% of the total size of the NAN device. With the reserved block pool for bad block replacement, applications will see the NAN chip contains only contiguous good blocks; the physical bad blocks will be replaced with good blocks from the reserved pool in very low level and it is transparent to the upper level applications.

Best Regards
Motorola Mobile Device
Zhao Shengzhe



diff -urN a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
--- a/drivers/mtd/mtdpart.c	2008-08-21 02:19:31.000000000 -0500
+++ b/drivers/mtd/mtdpart.c	2008-08-24 22:46:34.000000000 -0500
@@ -1,12 +1,17 @@
 /*
  * Simple MTD partitioning layer
  *
+ * Copyright 2005 Motorola, Inc.
  * (C) 2000 Nicolas Pitre <nico@cam.org>
  *
  * This code is GPL
  *
  * 	02-21-2002	Thomas Gleixner <gleixner@autronix.de>
  *			added support for read_oob, write_oob
+ * 
+ * 05-06-2005   feature CONFIG_MTD_NAND_BBM added by Motorola, Inc.
+ *		create the block reserve pool partition.
+ *		verify the size and start address of the reserve pool partition.
  */
 
 #include <linux/module.h>
@@ -19,6 +24,14 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/compatmac.h>
 
+#if defined(CONFIG_MTD_NAND_BBM)
+/*
+ * reserved block offset 
+ * the last NAND partition will be used as reserved blocks 
+ */
+unsigned long rsvdblock_offset;
+#endif
+
 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
 
@@ -163,6 +176,14 @@
 				    len, retlen, buf);
 }
 
+#ifdef CONFIG_MTD_NAND_BBM
+static int part_block_replace (struct mtd_info *mtd, loff_t ofs, int lock)
+{
+	struct mtd_part *part = PART(mtd);
+	return part->master->block_replace (part->master, ofs + part->offset, lock);
+}
+#endif
+
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
 		struct mtd_oob_ops *ops)
 {
@@ -349,6 +370,11 @@
 	if (master->panic_write)
 		slave->mtd.panic_write = part_panic_write;
 
+#ifdef CONFIG_MTD_NAND_BBM
+        if (master->block_replace)
+                slave->mtd.block_replace = part_block_replace;
+#endif
+
 	if (master->point && master->unpoint) {
 		slave->mtd.point = part_point;
 		slave->mtd.unpoint = part_unpoint;
@@ -465,6 +491,10 @@
 	}
 
 	slave->mtd.ecclayout = master->ecclayout;
+#ifndef CONFIG_MTD_NAND_BBM
+        /* Since we have bbt, there is no need to check here. 
+        * block_isbad may use uninitialized rsvdblock_offset before 'rsv' partition is added.          
+        */
 	if (master->block_isbad) {
 		uint32_t offs = 0;
 
@@ -475,7 +505,7 @@
 			offs += slave->mtd.erasesize;
 		}
 	}
-
+#endif
 out_register:
 	if (part->mtdp) {
 		/* store the object pointer (caller may or may not register it*/
@@ -486,6 +516,40 @@
 		add_mtd_device(&slave->mtd);
 		slave->registered = 1;
 	}
+#if defined(CONFIG_MTD_NAND_BBM)
+	/* preset the reserved block offset */
+	if  (master->type == MTD_NANDFLASH && i == nbparts-1) {
+		int bbmblocks = 0;
+		int rsvdblocks = 0;
+		int erasesize = master->erasesize;
+
+		if (strcmp(slave->mtd.name, "rsv"))
+			panic("%s's \"rsv\" partition does not exist,"
+			   " NAND Bad Block cann't be handled!\n", master->name);
+
+		rsvdblock_offset = slave->offset;
+		printk (KERN_INFO "%s's capacity:%dMB, reserved block offset:0x%08x\n",
+			master->name, (master->size/(1024*1024)), rsvdblock_offset);
+		
+		/*
+		* check the block number for the BBT/BBM reserved block pool...
+		* reserved block number for NAND flash should be 2% of the total blocks,
+		* plus: 
+		*	add extra 1 NFI, 2 BBT and 2 BBMs blocks.
+		* 
+		* how to calculate BBMs:
+		* 	- 2 bytes for each block, 
+		* 	- bbmblocks = ((totalblock*2)+(blocksize-1))/blocksize;
+		*/
+
+		bbmblocks = ((master->size/erasesize)*2 + (erasesize-1)) / erasesize;
+		rsvdblocks = ((master->size/erasesize)/100)*2 + 3 + (bbmblocks*2);
+
+		if (rsvdblock_offset != (master->size - (rsvdblocks*erasesize)))
+			panic("%s:0x%08x's rsv partition must start at offset:0x%08x\n", 
+				master->name, master->size, master->size-(rsvdblocks*erasesize));
+	}
+#endif
 	return slave;
 }
 
diff -urN a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
--- a/drivers/mtd/nand/Kconfig	2008-08-21 02:19:23.000000000 -0500
+++ b/drivers/mtd/nand/Kconfig	2008-08-27 00:26:33.000000000 -0500
@@ -359,6 +359,23 @@
 	  The simulator may simulate various NAND flash chips for the
 	  MTD nand layer.
 
+config MTD_NAND_BBM
+        bool "NAND Bad Block Management support"
+        depends on MTD_NAND
+        default "n"
+        help
+          This enables the driver for the NAND flash to support Motorola Bad Block Management.
+	  With this BBM feature, any exist bad block or newly wearing out block will be 
+	  replaced with good blocks from the reserved pool . applications will see the NAN 
+	  chip contains only contiguous good blocks and it is transparent to the upper level 
+	  applications.
+
+config MTD_NAND_BBM_DBG
+        bool "NAND Bad Block Management Debug support"
+        depends on MTD_NAND_BBM
+        help
+          This is for Bad Block Management development only
+
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
 	depends on MTD_NAND
diff -urN a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
--- a/drivers/mtd/nand/nand_base.c	2008-08-27 01:46:49.000000000 -0500
+++ b/drivers/mtd/nand/nand_base.c	2008-08-21 02:28:18.000000000 -0500
@@ -9,9 +9,15 @@
  *	Additional technical information is available on
  *	http://www.linux-mtd.infradead.org/doc/nand.html
  *
+ *  Copyright (C) 2005 - 2007 Motorola, Inc.
  *  Copyright (C) 2000 Steven J. Hill (sjhill@realitydiluted.com)
  *		  2002-2006 Thomas Gleixner (tglx@linutronix.de)
  *
+ * 05-06-2005	feature CONFIG_MTD_NAND_BBM added by Motorola, Inc.
+ *		added bad block management support. With the reserved block pool 
+ *		available, nand_base driver will do bad block replacement based on
+ *		the BBM map (Bad Block Map) stored in flash.
+ *
  *  Credits:
  *	David Woodhouse for adding multichip support
  *
@@ -52,6 +58,10 @@
 #include <linux/mtd/partitions.h>
 #endif
 
+#if defined(CONFIG_MTD_NAND_BBM)
+/* the rsvdblock_offset is the start address for rsv partition*/
+extern unsigned long rsvdblock_offset;
+#endif
 /* Define default oob placement schemes for large and small page devices */
 static struct nand_ecclayout nand_oob_8 = {
 	.eccbytes = 3,
@@ -335,6 +345,45 @@
 	return res;
 }
 
+#if defined(CONFIG_MTD_NAND_BBM) 
+/**
+ * nand_translate_block - get translated block from reserve pool
+ * @mtd:	MTD device structure
+ * @ofs:	offset from device start
+ *
+ * return translated block from reserved pool - offset from device start
+ */
+loff_t nand_translate_block(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_chip *chip = mtd->priv;
+	int orig_block;
+	loff_t page_ofs, translate_block_ofs;
+retry:
+	/* calculate the block number and page offset */
+	orig_block = (int)(ofs >> chip->phys_erase_shift);
+	page_ofs = ofs - (loff_t)(orig_block <<  chip->phys_erase_shift);
+
+	/* check, if no translate returns back the original offset */
+	if (chip->bbm[orig_block] == 0xffff)
+		return ofs;
+
+	/* get the translate block */
+	translate_block_ofs =
+		(chip->bbm[orig_block] << chip->phys_erase_shift) +
+		rsvdblock_offset + page_ofs;
+	DEBUG (MTD_DEBUG_LEVEL0, "original bad block# %d with "
+	  " offset 0x%08x, translate_block_ofs 0x%08x\n", 
+	  orig_block, (unsigned int)ofs, (unsigned int)translate_block_ofs);
+
+	/* make sure the translate is a good block */
+	if (nand_isbad_bbt(mtd, translate_block_ofs, 0)) {
+		ofs = translate_block_ofs;
+		goto retry;
+	}
+	/* must have the good block for the translate */
+	return translate_block_ofs;
+}
+#endif /* CONFIG_MTD_NAND_BBM */
 /**
  * nand_default_block_markbad - [DEFAULT] mark a block bad
  * @mtd:	MTD device structure
@@ -410,8 +459,27 @@
 	if (!chip->bbt)
 		return chip->block_bad(mtd, ofs, getchip);
 
+#if defined(CONFIG_MTD_NAND_BBM)
+/*
+ * With the Bad Block management feature, this function has been modified to
+ * return good (return 0) if the physical block is bad, but it can be replaced
+ * by a good block from reserved pool.  It returns bad (return 1) only if the
+ * bad block with no replacement
+ */
+	if (nand_isbad_bbt (mtd, ofs, allowbbt)) {  /* bbt said: bad block */
+		if (ofs != nand_translate_block(mtd, ofs))
+		/* has replacement - return as good block */
+			return 0;
+		else
+		/* no replcaement - return block bad */
+			return 1;
+	}
+	else /* bbt said: block is good */
+		return 0;
+#else
 	/* Return info from the table */
 	return nand_isbad_bbt(mtd, ofs, allowbbt);
+#endif
 }
 
 /*
@@ -1045,6 +1113,10 @@
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
 	uint8_t *bufpoi, *oob, *buf;
+#if defined(CONFIG_MTD_NAND_BBM)
+	loff_t  from_rb;
+	int page_cnt = 0, block_replace_flag = 0;
+#endif
 
 	stats = mtd->ecc_stats;
 
@@ -1052,6 +1124,20 @@
 	chip->select_chip(mtd, chipnr);
 
 	realpage = (int)(from >> chip->page_shift);
+#if defined(CONFIG_MTD_NAND_BBM)
+	/* Check for block replacement if the given page is in bad block */
+	if (nand_isbad_bbt (mtd, from, 0)) {
+		from_rb = nand_translate_block(mtd, from);
+		if (from_rb != from) {
+			block_replace_flag = 1;
+			DEBUG (MTD_DEBUG_LEVEL0,
+			"%s: badblock offset:0x%08x, replblock offset:0x%08x\n",
+		    	__FUNCTION__, (unsigned int)from, (unsigned int)from_rb);
+			realpage = (int) (from_rb >> chip->page_shift);
+		}
+	}
+#endif
+
 	page = realpage & chip->pagemask;
 
 	col = (int)(from & (mtd->writesize - 1));
@@ -1147,6 +1233,31 @@
 		 */
 		if (!NAND_CANAUTOINCR(chip) || !(page & blkcheck))
 			sndcmd = 1;
+#if defined(CONFIG_MTD_NAND_BBM)
+		/* Increment page address */
+		page_cnt++;
+		/* do bad block check, if we have hit a block boundary */
+		if (!(page & blkcheck)) {
+			int pg_shift = chip->page_shift;
+
+			/*  check, if it is in a replacement block  */
+			if (block_replace_flag) {
+				/*  set page back to original block */
+				realpage = (int) (from >> pg_shift) + page_cnt;
+				block_replace_flag = 0;
+			}
+			/* check, if the given start page is in bad block */
+			if (nand_isbad_bbt (mtd, (realpage << pg_shift), 0)) {
+				from_rb = nand_translate_block(mtd, (realpage << pg_shift));
+				if (from_rb != (realpage << pg_shift)) {
+					realpage = (int) (from_rb >> pg_shift);
+					block_replace_flag = 1;
+				}
+			}
+			page = realpage & chip->pagemask;
+		}
+#endif
+
 	}
 
 	ops->retlen = ops->len - (size_t) readlen;
@@ -1356,6 +1467,11 @@
 	int len;
 	uint8_t *buf = ops->oobbuf;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	loff_t  from_rb;
+	int page_cnt = 0, block_replace_flag = 0;
+#endif
+
 	DEBUG(MTD_DEBUG_LEVEL3, "nand_read_oob: from = 0x%08Lx, len = %i\n",
 	      (unsigned long long)from, readlen);
 
@@ -1386,6 +1502,22 @@
 	realpage = (int)(from >> chip->page_shift);
 	page = realpage & chip->pagemask;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	/* Check for block replacement if the given page is in bad block */
+	if (nand_isbad_bbt (mtd, from, 0)) {
+		from_rb = nand_translate_block(mtd, from);
+		if (from_rb != from) {
+		   block_replace_flag=1;
+		   DEBUG (MTD_DEBUG_LEVEL0,
+		         "%s: badblock offset:0x%08x, replblock offset:0x%08x\n",
+				  __FUNCTION__, (unsigned int) from,
+				  (unsigned int)from_rb );
+
+           	   realpage = (int) (from_rb >> chip->page_shift);
+		}
+	}
+#endif
+
 	while(1) {
 		sndcmd = chip->ecc.read_oob(mtd, chip, page, sndcmd);
 
@@ -1425,6 +1557,30 @@
 		 */
 		if (!NAND_CANAUTOINCR(chip) || !(page & blkcheck))
 			sndcmd = 1;
+#if defined(CONFIG_MTD_NAND_BBM)
+		/* Increment page address */
+		page_cnt++;
+		/* do bad block check, if we have hit a block boundary */
+		if (!(page & blkcheck)) {
+			/* check, if it is in a replacement block */
+			if (block_replace_flag) {
+				/* set page back to original block */
+				realpage = (int) (from >> chip->page_shift) + page_cnt;
+				block_replace_flag = 0;
+			}
+
+			/* check, if the given start page is in bad block */
+			if (nand_isbad_bbt (mtd, (realpage << chip->page_shift), 0)) {
+				from_rb = nand_translate_block(mtd, (realpage << chip->page_shift));
+				if (from_rb != (realpage << chip->page_shift)) {
+					realpage = (int) (from_rb >> chip->page_shift);
+					block_replace_flag = 1;
+				}
+			}
+			page = realpage & chip->pagemask;
+		}
+#endif  /* CONFIG_MTD_NAND_BBM */
+
 	}
 
 	ops->oobretlen = ops->ooblen;
@@ -1713,6 +1869,11 @@
 	uint8_t *buf = ops->datbuf;
 	int ret, subpage;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	loff_t 	to_rb;
+	int page_cnt = 0, block_replace_flag = 0;
+#endif
+
 	ops->retlen = 0;
 	if (!writelen)
 		return 0;
@@ -1738,13 +1899,36 @@
 		return -EIO;
 
 	realpage = (int)(to >> chip->page_shift);
+
+#if defined(CONFIG_MTD_NAND_BBM)
+	/* Check for block replacement if the given page is in bad block */
+	if (nand_isbad_bbt (mtd, to, 0)) {
+		to_rb = nand_translate_block(mtd, to);
+		if (to_rb != to) {
+			DEBUG (MTD_DEBUG_LEVEL0,
+			"%s: badblock offset:0x%08x, replblock offset:0x%08x\n",
+			__FUNCTION__, (unsigned int)to, (unsigned int)to_rb);
+
+			realpage = (int) (to_rb >> chip->page_shift);
+			block_replace_flag = 1;
+		}
+	}
+#endif
+
 	page = realpage & chip->pagemask;
 	blockmask = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	/* Invalidate the page cache, when we write to the cached page */
+	if (realpage <= chip->pagebuf &&
+		(chip->pagebuf < (realpage + (ops->len >> chip->page_shift))))
+		chip->pagebuf = -1;
+#else
 	/* Invalidate the page cache, when we write to the cached page */
 	if (to <= (chip->pagebuf << chip->page_shift) &&
 	    (chip->pagebuf << chip->page_shift) < (to + ops->len))
 		chip->pagebuf = -1;
+#endif
 
 	/* If we're not given explicit OOB data, let it be 0xFF */
 	if (likely(!oob))
@@ -1781,6 +1965,31 @@
 		buf += bytes;
 		realpage++;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+		page_cnt++;
+		/* Check a block boundary. If we hit the block boundary and
+		 * we were working with the replaced block, we need
+		 * to find the real page from the start address.
+		 */
+		if (!(realpage & blockmask)) {
+			/* check, if it is in a replacement block  */
+			if (block_replace_flag) {
+				/* set page back to original block  */
+				realpage = (int) (to >> chip->page_shift) + page_cnt;
+				block_replace_flag = 0;
+			}
+			/* check, if the given start page is in a bad block */
+			if (nand_isbad_bbt (mtd, (realpage << chip->page_shift), 0)) {
+				to_rb = nand_translate_block(mtd,
+					 		(realpage << chip->page_shift));
+				if (to_rb != (realpage << chip->page_shift)) {
+					block_replace_flag = 1;
+				    realpage = (int) (to_rb >> chip->page_shift);
+				}
+			}
+		}
+#endif
+
 		page = realpage & chip->pagemask;
 		/* Check, if we cross a chip boundary */
 		if (!page) {
@@ -1881,6 +2090,13 @@
 	chipnr = (int)(to >> chip->chip_shift);
 	chip->select_chip(mtd, chipnr);
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	/* Check for block replacement if the given page is in bad block */
+	if (nand_isbad_bbt (mtd, to, 0)) {
+		to = nand_translate_block(mtd, to);
+	}
+#endif
+
 	/* Shift to get page */
 	page = (int)(to >> chip->page_shift);
 
@@ -2019,6 +2235,11 @@
 	int rewrite_bbt[NAND_MAX_CHIPS]={0};
 	unsigned int bbt_masked_page = 0xffffffff;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	loff_t  orig_addr = instr->addr;
+	int block_replace_flag = 0;
+#endif
+
 	DEBUG(MTD_DEBUG_LEVEL3, "nand_erase: start = 0x%08x, len = %i\n",
 	      (unsigned int)instr->addr, (unsigned int)instr->len);
 
@@ -2080,6 +2301,38 @@
 	instr->state = MTD_ERASING;
 
 	while (len) {
+#if defined(CONFIG_MTD_NAND_BBM)
+		/* check, if it is in a replacement block */
+		if (block_replace_flag) {
+			/* set page back to original block */
+			page = (int) (orig_addr >> chip->page_shift);
+			block_replace_flag = 0;
+		}
+		/* check, if the given start page is in a bad block */
+		if (nand_isbad_bbt (mtd, (page << chip->page_shift), allowbbt)) {
+			instr->addr = nand_translate_block(mtd,
+							(page << chip->page_shift));
+			/* Check if we have a bad block with no replacement,
+			   we do not erase bad blocks ! */
+			if (instr->addr == orig_addr) {
+				printk (KERN_WARNING
+				"nand_erase: attempt to erase a bad block at page 0x%08x\n",
+				page);
+				instr->state = MTD_ERASE_FAILED;
+				goto erase_exit;
+			}
+			block_replace_flag = 1;
+			DEBUG (MTD_DEBUG_LEVEL0,
+				"nand_erase: badblck at 0x%08x replced by 0x%08x\n",
+				(unsigned int) (page << chip->page_shift),
+				(unsigned int) instr->addr);
+
+			/* updating page offset with the replacement page offset */
+			page = (int) (instr->addr >> chip->page_shift);
+		}
+		orig_addr += (1 << chip->phys_erase_shift);
+
+#else /* !CONFIG_MTD_NAND_BBM */
 		/*
 		 * heck if we have a bad block, we do not erase bad blocks !
 		 */
@@ -2091,6 +2344,8 @@
 			goto erase_exit;
 		}
 
+#endif /* CONFIG_MTD_NAND_BBM */	
+
 		/*
 		 * Invalidate the page cache, if we erase the block which
 		 * contains the current cached page
@@ -2260,6 +2515,79 @@
 		       "in suspended state\n");
 }
 
+#ifdef CONFIG_MTD_NAND_BBM
+/* This is the Linux 2.6.10 code. Linux 2.6.18 obsoleted this function and
+ * it uses the mtd->read_oob api to read the OOB data from nand_bbt.c.
+ * A bad block is checked in nand_do_read_ops so if nand_bbt.c uses mtd->read_oob
+ * API, we may encounter recursive issue.
+ *
+ * We need to investigate more whether it is safe to call mtd->read_oob from
+ * nand_bbt.c with the BBM support. For now, let's use the nand_read_raw.
+ */
+
+/**
+ * nand_read_raw - [GENERIC] Read raw data including oob into buffer
+ * @mtd:	MTD device structure
+ * @buf:	temporary buffer
+ * @from:	offset to read from
+ * @len:	number of bytes to read
+ * @ooblen:	number of oob data bytes to read
+ *
+ * Read raw data including oob into buffer
+ */
+int nand_read_raw (struct mtd_info *mtd, uint8_t *buf, loff_t from, size_t len, size_t ooblen)
+{
+	struct nand_chip *this = mtd->priv;
+	int page = (int) (from >> this->page_shift);
+	int chip = (int) (from >> this->chip_shift);
+	int sndcmd = 1;
+	int cnt = 0;
+	int pagesize = mtd->writesize + mtd->oobsize;
+	int	blockcheck = (1 << (this->phys_erase_shift - this->page_shift)) - 1;
+
+	/* Do not allow reads past end of device */
+	if ((from + len) > mtd->size) {
+		DEBUG (MTD_DEBUG_LEVEL0, "nand_read_raw: Attempt read beyond end of device\n");
+		return -EINVAL;
+	}
+
+	/* Grab the lock and see if the device is available */
+	nand_get_device (this, mtd , FL_READING);
+
+	this->select_chip (mtd, chip);
+	
+	/* Add requested oob length */
+	len += ooblen;
+	
+	while (len) {
+		if (sndcmd) {
+			this->cmdfunc (mtd, NAND_CMD_READ0, 0, page & this->pagemask);
+		}
+		sndcmd = 0;	
+
+		this->read_buf (mtd, &buf[cnt], pagesize);
+
+		len -= pagesize;
+		cnt += pagesize;
+		page++;
+		
+		if (!this->dev_ready) 
+			udelay (this->chip_delay);
+		else
+			nand_wait_ready(mtd);
+			
+		/* Check, if the chip supports auto page increment */ 
+		if (!NAND_CANAUTOINCR(this) || !(page & blockcheck))
+			sndcmd = 1;
+	}
+
+	/* Deselect and wake up anyone waiting on the device */
+	nand_release_device(mtd);
+	return 0;
+}
+
+#endif /* CONFIG_MTD_NAND_BBM */
+
 /*
  * Set default functions
  */
diff -urN a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
--- a/drivers/mtd/nand/nand_bbt.c	2008-08-27 01:46:40.000000000 -0500
+++ b/drivers/mtd/nand/nand_bbt.c	2008-08-27 01:39:45.000000000 -0500
@@ -4,6 +4,7 @@
  *  Overview:
  *   Bad block table support for the NAND driver
  *
+ *  Copyright (C) 2005-2007 Motorola, Inc.
  *  Copyright (C) 2004 Thomas Gleixner (tglx@linutronix.de)
  *
  * This program is free software; you can redistribute it and/or modify
@@ -48,6 +49,19 @@
  * - bbts start at a page boundary, if autolocated on a block boundary
  * - the space necessary for a bbt in FLASH does not exceed a block boundary
  *
+ * ChangeLog:
+ * (mm-dd-yyyy) Author    Comment
+ * 05-06-2005   Motorola  implemented CONFIG_MTD_NAND_BBM feature.
+ *			  BBMs (bad block maps): both preimary and mirriored bbms 
+ *			  stored in flash next to BBTs (bad block table) blocks.
+ *			  BBMs are used for the nand_base driver for mapping a bad block
+ *			  to a reserved good block from reserve pool.
+ *			  The initial BBMs were created based on the original BBT table.
+ *			  Original (factory marked) bad blocka are mapped to reserved good blocks.
+ *			  BBTs and BBMs will be updated if new bad block detected.
+ *			  new BBTs and BBMs's data will be written back to the flash with
+ *			  version updates.
+ *
  */
 
 #include <linux/slab.h>
@@ -60,6 +74,32 @@
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
 
+#if defined(CONFIG_MTD_NAND_BBM)
+/*
+ * the following definitions are used by BBM feature
+ */
+extern unsigned long rsvdblock_offset;
+static uint8_t bbm_pattern[] = {'B', 'b', 'm', '0'};
+static uint8_t mirror_bbm_pat[] = {'1', 'm', 'b', 'B'};
+static uint8_t bbm_multi_pat[] = {'B', 'b', 'm', '2'};
+static uint8_t mir_bbm_multi_pat[] = {'3', 'm', 'b', 'B'};
+
+static struct nand_bbt_descr bbt_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+#if defined(CONFIG_ARCH_OMAP34XX)
+	.offs = 12,
+	.len = 4,
+	.veroffs = 0,
+	.maxblocks = 8,
+#else
+	.offs = 8,
+	.len = 4,
+	.veroffs = 12,
+	.maxblocks = 4,
+#endif
+};
+#endif /* CONFIG_MTD_NAND_BBM */
+
 /**
  * check_pattern - [GENERIC] check if a pattern is in the buffer
  * @buf:	the buffer to search
@@ -148,6 +188,9 @@
 	size_t retlen, len, totlen;
 	loff_t from;
 	uint8_t msk = (uint8_t) ((1 << bits) - 1);
+#if defined(CONFIG_MTD_NAND_BBM)
+	int update_bbm_flag = 0;
+#endif
 
 	totlen = (num * bits) >> 3;
 	from = ((loff_t) page) << this->page_shift;
@@ -167,6 +210,9 @@
 		for (i = 0; i < len; i++) {
 			uint8_t dat = buf[i];
 			for (j = 0; j < 8; j += bits, act += 2) {
+#if defined(CONFIG_MTD_NAND_BBM)
+				uint16_t badblock;
+#endif
 				uint8_t tmp = (dat >> j) & msk;
 				if (tmp == msk)
 					continue;
@@ -179,8 +225,25 @@
 				}
 				/* Leave it for now, if its matured we can move this
 				 * message to MTD_DEBUG_LEVEL0 */
+#if defined(CONFIG_MTD_NAND_BBM)
+				badblock = (offs << 2) + (act >> 1);
+				printk (KERN_INFO "nand_read_bbt: Bad block at %d\n", badblock);
+				/* check if this is new bad block, update the bbm table */
+				if (this->bbm[badblock] == 0xffff) {
+					this->bbm[badblock] = get_bbm_index(mtd, this->bbm);
+					printk(KERN_INFO
+						"\tbad block %d will be mapped to reserved block %d\n",
+                                                 badblock, this->bbm[badblock]);
+					update_bbm_flag = 1;
+				}
+				else /* bad blokcs already mapped in bbm table */
+					printk(KERN_INFO
+						"\tbad block %d has beed mapped to reserved block %d\n",
+						badblock, this->bbm[badblock]);
+#else
 				printk(KERN_DEBUG "nand_read_bbt: Bad block at 0x%08x\n",
 				       ((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+#endif
 				/* Factory marked bad or worn out ? */
 				if (tmp == 0)
 					this->bbt[offs + (act >> 3)] |= 0x3 << (act & 0x06);
@@ -192,9 +255,105 @@
 		totlen -= len;
 		from += len;
 	}
+#if defined(CONFIG_MTD_NAND_BBM)
+	if (update_bbm_flag)
+		update_bbm(mtd, this->bbm, 0);
+#endif
+
+#if defined(CONFIG_MTD_NAND_BBM_DBG)	/* debugging the bbt data */
+	totlen = (num * bits) >> 3;
+	for (i = 0; i < totlen; i++) {
+		printk("bbt[%04d]=%02x ",i , buf[i]);
+		if (i%8 == 7) printk("\n");
+	}
+#endif
+	return 0;
+}
+
+#if defined(CONFIG_MTD_NAND_BBM)
+/**
+ * read_bbm -  Read the bad block map starting from page
+ * @mtd:       MTD device structure
+ * @buf:       temporary buffer
+ * @page:      the starting page
+ *
+ * Read the bad block map starting from page.
+ *
+ */
+static int read_bbm (struct mtd_info *mtd, uint8_t *buf, struct nand_bbm_descr *bbm_td, int chip)
+{
+	int i, res;
+	struct nand_chip *this = mtd->priv;
+	size_t page, retlen, readlen, bbm_len, tmplen = 0;
+	loff_t from;
+
+	/* calculate the bbm read length */
+	bbm_len = mtd->size >> (this->bbt_erase_shift-1);
+
+	for (i = 0; i < NAND_MAX_BBMS; i++) {
+		page = bbm_td->pages[chip][i];
+		if (page && page < (mtd->size >> this->page_shift) ) {
+		/* For NAND chip with pagesize=512Bytes, blocksize=16KBytes:
+		 * - mtd->size <= 128MB, 'read_ecc' called exactly once.
+		 * - mtd->size > 128MB && <= 256MB (up to 2 Gigabit), 'read_ecc' cal
+		 */
+			from = ((loff_t)page) << this->page_shift;
+			DEBUG (MTD_DEBUG_LEVEL0,
+			"nand_read_bbm: BBM read from page = 0x%08x\n", from);
+
+			/* read bbm data - up to one block size for each read */
+			readlen = min(bbm_len - tmplen, mtd->erasesize);
+			res = mtd->read (mtd, from, readlen, &retlen, &buf[tmplen]);
+			tmplen += retlen;
+			if (res < 0) {
+				if (retlen != readlen ) {
+					printk (KERN_INFO
+					"nand_read_bbm: Error reading bad block map\n");
+					return res;
+				}
+				printk (KERN_WARNING
+				"nand_read_bbm: ECC error while reading bad block map\n");
+			}
+		}
+		else  
+			break;
+	}
+
+#if defined(CONFIG_MTD_NAND_BBM_DBG)	/* debugging the bbm data */
+	for (i = 0; i < bbm_len/2; i++) {
+		printk("bbm[%04d]=%04x ",i , this->bbm[i]);
+		if (i%8 == 7) printk("\n");
+	}
+#endif
 	return 0;
 }
 
+/***
+ * get_bbm_index() - [GENERIC] get the reserved block index through BBM map
+ * @mtd		MTD device structure
+ * @bbm		memory version of BBM map
+ *
+ * Return:	The index to the next available block in reserved pool.
+ */
+int get_bbm_index(struct mtd_info *mtd, uint16_t* bbm)
+{
+	int i, index=0, blocks = mtd->size/mtd->erasesize;
+	int max_rsvblks =
+		(mtd->size - rsvdblock_offset)/mtd->erasesize-bbt_descr.maxblocks;
+	for (i=0; i<blocks; i++)
+		if (bbm[i] != 0xffff)
+			index++;
+	/* check, if index is out of reserved pool */
+	if (index >= max_rsvblks)
+	{
+		printk(KERN_ERR "out of reserved pool\n");
+		return -1;
+	}
+	return index;
+}
+
+#endif  /* CONFIG_MTD_NAND_BBM */
+
 /**
  * read_abs_bbt - [GENERIC] Read the bad block table starting at a given page
  * @mtd:	MTD device structure
@@ -216,16 +375,31 @@
 	if (td->options & NAND_BBT_PERCHIP) {
 		int offs = 0;
 		for (i = 0; i < this->numchips; i++) {
-			if (chip == -1 || chip == i)
+			if (chip == -1 || chip == i) {
+#if defined(CONFIG_MTD_NAND_BBM)
+				/* read BBM into memory for this chip */
+				res = read_bbm (mtd, (uint8_t*)this->bbm, this->bbm_td, chip);
+				if (res)
+					return res;
+#endif
 				res = read_bbt (mtd, buf, td->pages[i], this->chipsize >> this->bbt_erase_shift, bits, offs, td->reserved_block_code);
-			if (res)
-				return res;
+				if (res)
+					return res;
+
+			}
+
 			offs += this->chipsize >> (this->bbt_erase_shift + 2);
 		}
 	} else {
+#if defined(CONFIG_MTD_NAND_BBM)
+		res = read_bbm (mtd, (uint8_t*)this->bbm, this->bbm_td, 0);
+		if (res)
+			return res;
+#endif
 		res = read_bbt (mtd, buf, td->pages[0], mtd->size >> this->bbt_erase_shift, bits, 0, td->reserved_block_code);
 		if (res)
 			return res;
+
 	}
 	return 0;
 }
@@ -282,6 +456,11 @@
 {
 	struct nand_chip *this = mtd->priv;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	int i, page, ret;
+	uint8_t *buf_bbm = (uint8_t *)this->bbm;
+#endif
+
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
 		scan_read_raw(mtd, buf, td->pages[0] << this->page_shift,
@@ -299,7 +478,58 @@
 		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
 		       md->pages[0], md->version[0]);
 	}
+	
+#if defined(CONFIG_MTD_NAND_BBM)
+	/* Read the primary version of bbm, if available */	
+	ret = scan_read_raw (mtd, buf_bbm,
+			this->bbm_td->pages[0][0] << this->page_shift,
+			mtd->writesize);
+	if (!ret) {
+		this->bbm_td->version[0] =
+			buf_bbm[mtd->writesize + this->bbm_td->veroffs];
+		printk (KERN_DEBUG "Bad block map at page %d, version 0x%02X\n", 
+			this->bbm_td->pages[0][0], this->bbm_td->version[0]);
+		/* Step in for multiple BBM block case */
+		for (i = 1; i < NAND_MAX_BBMS; i++) {
+			page = this->bbm_td->pages[0][i];
+			if (page)
+				/* read additional BBM data if available */
+				scan_read_raw (mtd, &buf_bbm[mtd->erasesize*i],
+						page << this->page_shift, 
+						mtd->writesize); 
+			else
+				break;
+		}
+		return 1;
+	}
+
+	/* Read the mirror version, if primary failed */	
+	ret = scan_read_raw (mtd, buf_bbm,
+			this->bbm_md->pages[0][0] << this->page_shift,
+			mtd->writesize);
+	if (!ret) {
+		this->bbm_md->version[0] = buf_bbm[mtd->writesize + this->bbm_md->veroffs];
+		printk (KERN_DEBUG "Bad block map at page %d, version 0x%02X\n", 
+			this->bbm_md->pages[0][0], this->bbm_md->version[0]);
+		/* Step in for multiple BBM block case */
+		for (i = 1; i < NAND_MAX_BBMS; i++) {
+			page = this->bbm_md->pages[0][i];
+			if (page)
+				/* read additional BBM data if available */
+				scan_read_raw (mtd, &buf_bbm[mtd->erasesize*i],
+						page << this->page_shift, 
+						mtd->writesize); 
+			else
+				break;
+		}
+		return 1;
+	}
+
+	return 0;
+#else
 	return 1;
+#endif /* CONFIG_MTD_NAND_BBM */
+
 }
 
 /*
@@ -456,7 +686,12 @@
  * The bbt ident pattern resides in the oob area of the first page
  * in a block.
  */
+#if defined(CONFIG_MTD_NAND_BBM)
+static int search_bbt (struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td,
+		struct nand_bbm_descr *bbm)
+#else
 static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
+#endif
 {
 	struct nand_chip *this = mtd->priv;
 	int i, chips;
@@ -464,6 +699,11 @@
 	int scanlen = mtd->writesize + mtd->oobsize;
 	int bbtblocks;
 	int blocktopage = this->bbt_erase_shift - this->page_shift;
+#if defined(CONFIG_MTD_NAND_BBM)
+	int bbt_found;
+	struct nand_bbt_descr *bbm_td = &bbt_descr;
+	int bbm_found, m_bbm_found, multi_bbm = 0;
+#endif
 
 	/* Search direction top -> down ? */
 	if (td->options & NAND_BBT_LASTBLOCK) {
@@ -487,6 +727,90 @@
 	/* Number of bits for each erase block in the bbt */
 	bits = td->options & NAND_BBT_NRBITS_MSK;
 
+#if defined(CONFIG_MTD_NAND_BBM)
+	/*
+	 * check, if we need multiple bbm blocks. 
+	 * (2 bytes per block for storing bbm data)
+	 */
+	if (bbtblocks > (mtd->erasesize >> 1))
+		multi_bbm = 1;
+		
+	for (i = 0; i < chips; i++) {
+		/* Reset version information */
+		bbt_found = 0; 
+		bbm_found = 0; 
+		m_bbm_found = 0;
+		td->version[i] = 0;	
+		td->pages[i] = -1;
+		bbm->version[i] = 0;
+		bbm->pages[i][0] = -1;
+		bbm->pages[i][1] = -1;
+
+		/* Scan the maximum number of blocks */
+		for (block = 0; block < td->maxblocks; block++) {
+
+			int actblock = startblock + dir * block;
+			loff_t offs = actblock << this->bbt_erase_shift;
+
+			/* Read first page */
+			scan_read_raw (mtd, buf, offs, mtd->writesize); 
+			if (!bbt_found) {
+				if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
+					td->pages[i] = actblock << blocktopage;
+					if (td->options & NAND_BBT_VERSION) {
+						td->version[i] =
+							buf[mtd->writesize + td->veroffs];
+					}
+					bbt_found = 1;
+					continue;
+				}
+			}
+			/* check for bbm */
+			if (!bbm_found) {
+				if (!strcmp(bbm->pattern, bbm_pattern))
+					bbm_td->pattern = bbm_pattern;
+				else
+					bbm_td->pattern = mirror_bbm_pat;
+
+				if (!check_pattern(buf, scanlen, mtd->writesize, bbm_td)) {
+					bbm->pages[i][0] = actblock << blocktopage;
+					if (bbm->options & NAND_BBT_VERSION) {
+						bbm->version[i] =
+							buf[mtd->writesize + bbm->veroffs];
+					}
+					bbm_found = 1;
+					continue;
+				}
+			}
+			/* check if multi bbm iis required */
+			if (!m_bbm_found) {
+				if (multi_bbm) {
+					if (!strcmp(bbm->pattern, bbm_pattern))
+						bbm_td->pattern = bbm_multi_pat;
+					else
+						bbm_td->pattern = mir_bbm_multi_pat;
+
+					if (!check_pattern(buf, scanlen, mtd->writesize, bbm_td)) {
+						bbm->pages[i][1] = actblock << blocktopage;
+						m_bbm_found = 1;
+					}
+				}
+				else {
+					bbm->pages[i][1] = 0;
+					m_bbm_found = 1;
+				}
+			}
+
+			/* found all bbt and bbm for one chip */
+			if (bbt_found && bbm_found && m_bbm_found) {
+				break;
+			}
+		}
+		startblock += this->chipsize >> this->bbt_erase_shift;
+	}
+
+#else  /*  !CONFIG_MTD_NAND_BBM */
+
 	for (i = 0; i < chips; i++) {
 		/* Reset version information */
 		td->version[i] = 0;
@@ -509,6 +833,8 @@
 		}
 		startblock += this->chipsize >> this->bbt_erase_shift;
 	}
+#endif /* CONFIG_MTD_NAND_BBM */
+
 	/* Check, if we found a bbt for each requested chip */
 	for (i = 0; i < chips; i++) {
 		if (td->pages[i] == -1)
@@ -517,6 +843,28 @@
 			printk(KERN_DEBUG "Bad block table found at page %d, version 0x%02X\n", td->pages[i],
 			       td->version[i]);
 	}
+
+#if defined (CONFIG_MTD_NAND_BBM)
+	/* Check, if we found a bbm for each requested chip */
+	for (i = 0; i < chips; i++) {
+		if (bbm->pages[i][0] == -1)
+			printk (KERN_WARNING
+			"Bad block map not found for chip %d\n", i);
+		else {
+			printk (KERN_INFO
+			"Bad block map found at page %d, version 0x%02X\n", 
+				bbm->pages[i][0], bbm->version[i]);
+			if (multi_bbm && bbm->pages[i][1] != -1)
+				printk (KERN_INFO
+				"multiple Bad block found at page %d, version 0x%02X\n",
+				bbm->pages[i][1], bbm->version[i]);
+			else
+				printk (KERN_WARNING
+				"multiple Bad block map not found for chip %d\n", i);
+		}
+	}
+#endif
+
 	return 0;
 }
 
@@ -531,12 +879,23 @@
 */
 static int search_read_bbts(struct mtd_info *mtd, uint8_t * buf, struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
+#if defined (CONFIG_MTD_NAND_BBM)
+	struct nand_chip *this = mtd->priv;
+
+	/* Search the primary table */
+	search_bbt (mtd, buf, td, this->bbm_td);
+		
+	/* Search the mirror table */
+	if (md)
+		search_bbt (mtd, buf, md, this->bbm_md);
+#else
 	/* Search the primary table */
 	search_bbt(mtd, buf, td);
 
 	/* Search the mirror table */
 	if (md)
 		search_bbt(mtd, buf, md);
+#endif
 
 	/* Force result check */
 	return 1;
@@ -743,6 +1102,198 @@
 	return res;
 }
 
+#if defined(CONFIG_MTD_NAND_BBM)
+
+/*
+ * Scan write data with oob to flash
+ */
+static int scan_write_bbm(struct mtd_info *mtd, loff_t offs, size_t len,
+                          uint8_t *buf, uint8_t *oob)
+{
+        struct mtd_oob_ops ops;
+                                                                                                                                                
+        ops.mode = MTD_OOB_PLACE;
+        ops.ooboffs = 0;
+        ops.ooblen = mtd->oobsize;
+        ops.datbuf = buf;
+        ops.oobbuf = oob;
+        ops.len = len;
+                                                                                                                                                
+        return mtd->write_oob(mtd, offs, &ops);
+}
+
+/* this function is not inspected since it is only used for debug. */
+
+/** 
+ * write_bbm - [GENERIC] (Re)write the bad block map
+ *
+ * @mtd:	MTD device structure
+ * @buff:	holds the memory versio nof BBM data
+ * @bbmd:	descriptor for the bad block map (or mirrored)
+ * @chipsel:	selector for a specific chip, -1 for all
+ *
+*/
+static int write_bbm (struct mtd_info *mtd, uint8_t *buff, 
+			struct nand_bbm_descr *bbmd, int chipsel)
+{
+	struct nand_chip *this = mtd->priv;
+	struct erase_info einfo;
+	int i, j, res, multi_bbm = 0, chip = 0;
+	int startblock, dir, page, numblocks;
+	int nrchips;
+	uint8_t *tmpbuf;
+	uint16_t *bbmbuf;
+	size_t len, retlen, ooblen, totlen = mtd->size >> (this->bbt_erase_shift-1);
+	loff_t to;
+
+	/* Write bad block table per chip rather than per device ? */
+	if (bbmd->options & NAND_BBT_PERCHIP) {
+		numblocks = (int) (this->chipsize >> this->bbt_erase_shift);
+		/* Full device write or specific chip ? */	
+		if (chipsel == -1) {
+			nrchips = this->numchips;
+		} else {
+			nrchips = chipsel + 1;
+			chip = chipsel;
+		}
+	} else {
+		numblocks = (int) (mtd->size >> this->bbt_erase_shift);
+		nrchips = 1;
+	}	
+
+	/* calculate oobbuf length */
+	ooblen = mtd->oobsize * (mtd->erasesize/mtd->writesize);
+	tmpbuf = vmalloc(mtd->erasesize+ooblen);
+	if (!tmpbuf) {
+		printk (KERN_ERR "write_bbm: tmpbuf - Out of memory (size %d)\n",mtd->erasesize+ooblen);
+		return -ENOMEM;
+	}
+
+	/* Preset the tmpbuffer for 1st BBM */
+	memset (tmpbuf, 0xff, mtd->erasesize+ooblen);
+
+	/* Placed the BBM data into tmpbuf */
+	memcpy (tmpbuf, buff, mtd->size>>(this->bbt_erase_shift-1));
+
+	/* BBM Pattern is located in oob area of first page */
+	if (!strcmp(bbmd->pattern, bbm_pattern))
+		memcpy (&tmpbuf[mtd->erasesize+bbt_descr.offs], bbm_pattern, bbt_descr.len);
+	else
+		memcpy (&tmpbuf[mtd->erasesize+bbt_descr.offs], mirror_bbm_pat, bbt_descr.len);
+
+	tmpbuf[mtd->erasesize+bbt_descr.veroffs] = bbmd->version[chip];
+
+	/*
+	 * check, if we need multiple bbm blocks. 
+	 * (2 bytes per block for storing bbm data)
+	 */
+	if (numblocks > (mtd->erasesize >> 1))
+		multi_bbm = 1;
+
+	/* Loop through the chips */
+	for (; chip < nrchips; chip++) {
+	    for (i = 0; i < NAND_MAX_BBMS; i++) {
+	    	/* check for multiple bbms */
+		if (i > 0) {
+			if (!multi_bbm)
+				break;
+			else {
+				/* Preset the tmpbuffer for multiple BBM */
+				memset (tmpbuf, 0xff, mtd->erasesize+ooblen);
+				memcpy (&tmpbuf[0], this->bbm+(mtd->erasesize>>1), mtd->erasesize);
+				if (!strcmp(bbmd->pattern, bbm_pattern))
+					memcpy (&tmpbuf[mtd->erasesize+bbt_descr.offs], bbm_multi_pat, bbt_descr.len);
+				else
+					memcpy (&tmpbuf[mtd->erasesize+bbt_descr.offs], mir_bbm_multi_pat, bbt_descr.len);
+
+				len = min((totlen-(mtd->erasesize<<(i-1))), mtd->erasesize);
+			}
+		}
+		else
+			len = min (totlen, (size_t)(1 << this->bbt_erase_shift));
+
+		/* There was already a version of the map, reuse the page 
+		 * This applies for absolute placement too, as we have the 
+		 * page nr. in bbmd->pages.
+		 */
+		if (bbmd->pages[chip][i] != -1) {
+			page = bbmd->pages[chip][i];
+			goto write;
+		}	
+
+		/* Automatic placement of the bad block table */
+		/* Search direction top -> down ? */
+		if (bbmd->options & NAND_BBT_LASTBLOCK) {
+			startblock = numblocks * (chip + 1) - 1;
+			dir = -1;
+		} else {
+			startblock = chip * numblocks;
+			dir = 1;
+		}	
+
+		for (j = 0; j < bbmd->maxblocks; j++) {
+			int block = startblock + dir * j;
+			/* Check, if the block is bad */
+			switch ((this->bbt[block >> 2] >> (2 * (block & 0x03))) & 0x03) {
+			case 0x01:  /* block worn-out */
+			case 0x03:  /* factory bad block */
+				continue;
+			}
+			page = block << (this->bbt_erase_shift - this->page_shift);
+			/* Check, if the block is used by bbms and bbts */
+			if ( (this->bbm_td->pages[chip][0] != page) &&
+			     (this->bbm_td->pages[chip][1] != page) &&
+			     (this->bbm_md->pages[chip][0] != page) &&
+			     (this->bbm_md->pages[chip][1] != page) &&
+			     (this->bbt_td->pages[chip] != page) &&
+			     (!this->bbt_md||this->bbt_md->pages[chip]!=page))
+				goto write;
+		}
+		printk (KERN_ERR "No space left to write bad block map\n");
+		return -ENOSPC;
+write:	
+
+#ifdef CONFIG_MTD_NAND_BBM_DBG	/* debugging the bbm data */
+		bbmbuf = (uint16_t *) tmpbuf;
+		for (j = 0; j < len/2; j++) {
+			if (bbmbuf[j] != 0xffff)
+				printk("bbm%d[%d]=%04x ", i ,j , bbmbuf[j]);
+		}
+		printk("\n");
+#endif
+		to = ((loff_t) page) << this->page_shift;
+
+		/* walk through the memory table */
+		memset (&einfo, 0, sizeof (einfo));
+		einfo.mtd = mtd;
+		einfo.addr = (unsigned long) to;
+		einfo.len = 1 << this->bbt_erase_shift;
+		res = nand_erase_nand (mtd, &einfo, 1);
+		if (res < 0) {
+			printk (KERN_WARNING "nand_bbm: Error during block erase: %d\n", res);
+			this->block_markbad(mtd, to);
+			return res;
+		}
+		res = scan_write_bbm(mtd, to, len, tmpbuf, &tmpbuf[mtd->erasesize]);
+		if (res < 0) {
+			printk (KERN_WARNING "nand_bbm: Error while writing bad block map %d\n", res);
+			return res;
+		}
+
+		printk (KERN_INFO "Bad block map written to 0x%08x, version 0x%02X, length %d\n", 
+			(unsigned int) to, bbmd->version[chip], len);
+	
+		/* Mark it as used */
+		bbmd->pages[chip][i] = page;
+	    }
+	}
+
+	vfree(tmpbuf);
+	return 0;
+}
+
+#endif /* CONFIG_MTD_NAND_BBM */
+
 /**
  * nand_memory_bbt - [GENERIC] create a memory based bad block table
  * @mtd:	MTD device structure
@@ -875,6 +1426,134 @@
 	return 0;
 }
 
+#if defined(CONFIG_MTD_NAND_BBM)
+/**
+ * check_bbm - [GENERIC] create and write bbm(s) if neccecary
+ * @mtd:	MTD device structure
+ *
+ * The function checks the results of the previous call to read_bbt
+ * and creates / updates the bbm(s) if neccecary
+ * Creation is neccecary if no bbt was found for the chip/device
+ * Update is neccecary if one of the tables is missing or the
+ * version nr. of one table is less than the other
+*/
+static int check_bbm (struct mtd_info *mtd)
+{
+	int i, j, chips, writeops, chipsel, res=0, res2=0, rsvdblock_idx = 0;
+	struct nand_chip *this = mtd->priv;
+	struct nand_bbm_descr *td = this->bbm_td;
+	struct nand_bbm_descr *md = this->bbm_md;
+	struct nand_bbm_descr *rd, *rd2;
+
+	/* Do we have a bbt per chip ? */
+	if (td->options & NAND_BBT_PERCHIP) 
+		chips = this->numchips;
+	else 
+		chips = 1;
+
+	for (i = 0; i < chips; i++) {
+		writeops = 0;
+		rd = NULL;
+		rd2 = NULL;
+		/* Per chip or per device ? */
+		chipsel = (td->options & NAND_BBT_PERCHIP) ? i : -1;
+		/* Mirrored table available ? */
+		if (md) {
+#if defined(CONFIG_MTD_NAND_BBM_DBG)
+			/* don't have bbm and mirrored bbm
+			 * need to create both */
+			if (td->pages[i][0] == -1 && md->pages[i][0] == -1) {
+				writeops = 0x03;
+				goto create;
+			}
+#endif
+			/* have mirrored bbm, don't have primary bbm 
+			 * use mirrored bbm to create primary bbm
+			 */
+			if (td->pages[i][0] == -1) {
+				rd = md;				
+				td->version[i] = md->version[i];
+				writeops = 1;
+				goto writecheck;
+			}
+			/* have primary bbm, don't have mirrored bbm 
+			 * use primary bbm to create mirrored bbm
+			 */
+			if (md->pages[i][0] == -1) {
+				rd = td;
+				md->version[i] = td->version[i];
+				writeops = 2;
+				goto writecheck;
+			}
+
+			/* both primary and mirrored bbm exist
+			 * vesrion matched 
+			 */
+			if (td->version[i] == md->version[i]) {
+				rd = td;
+				if (!(td->options & NAND_BBT_VERSION))
+					rd2 = md;
+				goto writecheck; /*check only */
+			}	
+
+			/* primary and mirrored bbm version not match */
+			if (((int8_t) (td->version[i] - md->version[i])) > 0) {
+				/* update mirrored with primary bbm */
+				rd = td;
+				md->version[i] = td->version[i];
+				writeops = 2;
+			} else { /* update primary with mirrored bbm */
+				rd = md;
+				td->version[i] = md->version[i];
+				writeops = 1;
+			}
+
+			goto writecheck;
+
+		} else { /* only care for primary bbm */
+			if (td->pages[i][0] == -1) {
+				writeops = 0x01;
+				goto create;
+			}
+			rd = td;
+			goto writecheck;
+		}
+create:
+		/* Create the bbm map in memory by reading the bbt table */
+		for (j = 0; j<mtd->size>>this->bbt_erase_shift; j++) {
+			if (nand_isbad_bbt (mtd, j<<this->phys_erase_shift, 0)) {
+				printk(KERN_INFO "Bad block mapping: bbm[%d] = %d\n",
+						j, rsvdblock_idx);
+				this->bbm[j]=rsvdblock_idx++;
+			}
+		}
+			
+		td->version[i] = 1;
+		if (md)
+			md->version[i] = 1;	
+writecheck:	
+		/* read back first ? */
+		if (rd)
+			read_bbm (mtd, (uint8_t*)this->bbm, rd, chipsel);
+		/* If they weren't versioned, read both. */
+		if (rd2)
+			read_bbm (mtd, (uint8_t*)this->bbm, rd2, chipsel);
+
+		/* Write the bad block map to the device ? */
+		if (writeops & 0x01) 
+			res = write_bbm (mtd, (uint8_t*)this->bbm, td, chipsel);
+		
+		/* Write the mirror bad block map to the device ? */
+		if (writeops & 0x02) {
+			res2 = write_bbm (mtd, (uint8_t*)this->bbm, md, chipsel);
+			if (res2 < 0)
+				return res2;
+		}
+	}
+	return res;	
+}
+#endif /* CONFIG_MTD_NAND_BBM */
+
 /**
  * mark_bbt_regions - [GENERIC] mark the bad block table regions
  * @mtd:	MTD device structure
@@ -965,6 +1644,19 @@
 		return -ENOMEM;
 	}
 
+#if defined (CONFIG_MTD_NAND_BBM)
+	/* Allocate memory for Bad Block Map (2 bytes per block) */
+	len = mtd->size >> (this->bbt_erase_shift-1);
+	this->bbm = kmalloc (len, GFP_KERNEL);
+	if (!this->bbm) {
+		printk (KERN_ERR "nand_scan_bbt: bbm - Out of memory\n");
+		kfree (this->bbt);
+		this->bbt = NULL;
+		return -ENOMEM;
+	}
+	/* initializing bb map */
+	memset (this->bbm, 0xff, len);
+#endif
 	/* If no primary table decriptor is given, scan the device
 	 * to build a memory based bad block table
 	 */
@@ -973,6 +1665,11 @@
 			printk(KERN_ERR "nand_bbt: Can't scan flash and build the RAM-based BBT\n");
 			kfree(this->bbt);
 			this->bbt = NULL;
+
+#if defined (CONFIG_MTD_NAND_BBM)
+		kfree(this->bbm);
+		this->bbm = NULL;
+#endif
 		}
 		return res;
 	}
@@ -985,6 +1682,10 @@
 		printk(KERN_ERR "nand_bbt: Out of memory\n");
 		kfree(this->bbt);
 		this->bbt = NULL;
+#if defined (CONFIG_MTD_NAND_BBM)
+		kfree (this->bbm);
+		this->bbm = NULL;
+#endif
 		return -ENOMEM;
 	}
 
@@ -999,6 +1700,12 @@
 	if (res)
 		res = check_create(mtd, buf, bd);
 
+#if defined (CONFIG_MTD_NAND_BBM)
+	if (!res)
+		/* check bbm if we have valid bbts */
+		res = check_bbm (mtd);
+#endif
+
 	/* Prevent the bbt regions from erasing / writing */
 	mark_bbt_region(mtd, td);
 	if (md)
@@ -1031,7 +1738,11 @@
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
 	len = (1 << this->bbt_erase_shift);
 	len += (len >> this->page_shift) * mtd->oobsize;
+#ifdef CONFIG_MTD_NAND_BBM
+	buf = vmalloc (len);
+#else
 	buf = kmalloc(len, GFP_KERNEL);
+#endif
 	if (!buf) {
 		printk(KERN_ERR "nand_update_bbt: Out of memory\n");
 		return -ENOMEM;
@@ -1064,7 +1775,12 @@
 	}
 
  out:
+#ifdef CONFIG_MTD_NAND_BBM
+    vfree(buf);
+#else
 	kfree(buf);
+#endif
+
 	return res;
 }
 
@@ -1120,7 +1836,11 @@
 	.offs =	8,
 	.len = 4,
 	.veroffs = 12,
+#if defined(CONFIG_MTD_NAND_BBM)
+	.maxblocks = 8,
+#else
 	.maxblocks = 4,
+#endif
 	.pattern = bbt_pattern
 };
 
@@ -1130,10 +1850,34 @@
 	.offs =	8,
 	.len = 4,
 	.veroffs = 12,
+#if defined(CONFIG_MTD_NAND_BBM)
+	.maxblocks = 8,
+#else
 	.maxblocks = 4,
+#endif
 	.pattern = mirror_pattern
 };
 
+#if defined(CONFIG_MTD_NAND_BBM)
+static struct nand_bbm_descr bbm_main_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs = 8,
+	.len = 4,
+	.veroffs = 12,
+	.maxblocks = 4,
+	.pattern = bbm_pattern
+};
+
+static struct nand_bbm_descr bbm_mirror_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs = 8,
+	.len = 4,
+	.veroffs = 12,
+	.maxblocks = 4,
+	.pattern = mirror_bbm_pat
+};
+#endif /* CONFIG_MTD_NAND_BBM */
+
 /**
  * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
  * @mtd:	MTD device structure
@@ -1159,6 +1903,12 @@
 			this->bbt_td = &bbt_main_descr;
 			this->bbt_md = &bbt_mirror_descr;
 		}
+#if defined(CONFIG_MTD_NAND_BBM)
+		if (!this->bbm_td) {	
+			this->bbm_td = &bbm_main_descr;
+			this->bbm_md = &bbm_mirror_descr;
+		}
+#endif
 		this->options |= NAND_USE_FLASH_BBT;
 		return nand_scan_bbt(mtd, &agand_flashbased);
 	}
@@ -1170,6 +1920,12 @@
 			this->bbt_td = &bbt_main_descr;
 			this->bbt_md = &bbt_mirror_descr;
 		}
+#if defined(CONFIG_MTD_NAND_BBM)
+		if (!this->bbm_td) {	
+			this->bbm_td = &bbm_main_descr;
+			this->bbm_md = &bbm_mirror_descr;
+		}
+#endif
 		if (!this->badblock_pattern) {
 			this->badblock_pattern = (mtd->writesize > 512) ? &largepage_flashbased : &smallpage_flashbased;
 		}
diff -urN a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
--- a/include/linux/mtd/mtd.h	2008-08-21 02:19:27.000000000 -0500
+++ b/include/linux/mtd/mtd.h	2008-08-25 01:26:06.000000000 -0500
@@ -1,7 +1,12 @@
 /*
+ * Copyright 2006 Motorola, Inc.
  * Copyright (C) 1999-2003 David Woodhouse <dwmw2@infradead.org> et al.
  *
  * Released under GPL
+ *
+ * ChangeLog:
+ * (mm-dd-yyyy) Author    Comment
+ * 10-20-2006   Motorola  feature CONFIG_MTD_NAND_BBM added.
  */
 
 #ifndef __MTD_MTD_H__
@@ -200,6 +205,10 @@
 	/* Bad block management functions */
 	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
+#ifdef CONFIG_MTD_NAND_BBM
+	/* get block replacement from reserve pool */
+	int (*block_replace) (struct mtd_info *mtd, loff_t ofs, int lock);
+#endif
 
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
diff -urN a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
--- a/include/linux/mtd/nand.h	2008-08-21 02:19:35.000000000 -0500
+++ b/include/linux/mtd/nand.h	2008-08-21 02:28:19.000000000 -0500
@@ -1,6 +1,7 @@
 /*
  *  linux/include/linux/mtd/nand.h
  *
+ *  Copyright (c) 2005 Motorola, Inc.
  *  Copyright (c) 2000 David Woodhouse <dwmw2@infradead.org>
  *                     Steven J. Hill <sjhill@realitydiluted.com>
  *		       Thomas Gleixner <tglx@linutronix.de>
@@ -14,6 +15,11 @@
  *
  * Changelog:
  *	See git changelog.
+ *
+ *  05-06-2005 Motorola	implemented CONFIG_MTD_NAND_BBM feature.  
+ *			added new attributes to nand_chip structure, and added new 
+ *			nand_bbm_descr structure to support bad block management
+ *
  */
 #ifndef __LINUX_MTD_NAND_H
 #define __LINUX_MTD_NAND_H
@@ -39,6 +45,13 @@
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
 
+#if defined(CONFIG_MTD_NAND_BBM)
+extern int nand_read_raw (struct mtd_info *mtd, uint8_t *buf, loff_t from,
+                          size_t len, size_t ooblen);
+/* The maximum number of BB map blocks per chip in an array */
+#define NAND_MAX_BBMS		2 
+#endif
+
 /* This constant declares the max. oobsize / page, which
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
@@ -359,6 +372,9 @@
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash lookup
  * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
+ * @bbm:                [INTERN] bad block map pointer
+ * @bbm_td:		[REPLACEABLE] bad block map descriptor for flash lookup
+ * @bbm_md:		[REPLACEABLE] bad block map mirror descriptor
  * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for initial bad block scan
  * @controller:		[REPLACEABLE] a pointer to a hardware controller structure
  *			which is shared among multiple independend devices
@@ -421,6 +437,11 @@
 	uint8_t		*bbt;
 	struct nand_bbt_descr	*bbt_td;
 	struct nand_bbt_descr	*bbt_md;
+#ifdef CONFIG_MTD_NAND_BBM
+	uint16_t	*bbm;
+	struct nand_bbm_descr	*bbm_td;
+	struct nand_bbm_descr	*bbm_md;
+#endif
 
 	struct nand_bbt_descr	*badblock_pattern;
 
@@ -509,6 +530,42 @@
 	uint8_t	*pattern;
 };
 
+#ifdef CONFIG_MTD_NAND_BBM
+/** 
+ * struct nand_bbm_descr - bad block map descriptor
+ * @options:	options for this descriptor
+ * @pages:	the page(s) where we find the bbm, used with option BBT_ABSPAGE
+ *		when bbm is searched, then we store the found bbms pages here.
+ *		Its a two dimensions array and supports up 2 bbm blocks for each chip
+ 		and up to 8 chips now
+ * @offs:	offset of the pattern in the oob area of the page
+ * @veroffs:	offset of the bbm version counter in the oob are of the page
+ * @version:	version read from the bbt page during scan
+ * @len:	length of the pattern, if 0 no pattern check is performed
+ * @maxblocks:	maximum number of blocks to search for a bbm. This number of
+ *		blocks is reserved at the end of the device where the tables are 
+ *		written.
+ * @reserved_block_code: if non-0, this pattern denotes a reserved (rather than
+ *              bad) block in the stored bbt
+ * @pattern:	pattern to identify bad block map.
+ *
+ * Descriptor for the bad block map marker and the descriptor for the 
+ * pattern which identifies bad blocks map. The assumption is made
+ * that the pattern and the version count are always located in the oob area
+ * of the first block.
+ */
+struct nand_bbm_descr {
+	int	options;
+	int	pages[NAND_MAX_CHIPS][NAND_MAX_BBMS];
+	int	offs;
+	int	veroffs;
+	uint8_t	version[NAND_MAX_CHIPS];
+	int	len;
+	int 	maxblocks;
+	int	reserved_block_code;
+	uint8_t	*pattern;
+};
+#endif
 /* Options for the bad block table descriptors */
 
 /* The number of bits used per block in the bbt on the device */
