Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLLlw-0003V9-4G
	for linux-mtd@lists.infradead.org; Wed, 05 May 2004 13:45:12 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i45CoVc20147
	for <linux-mtd@lists.infradead.org>;
	Wed, 5 May 2004 15:50:31 +0300 (EEST)
Message-ID: <4098DF0D.1040703@intracom.gr>
Date: Wed, 05 May 2004 15:33:17 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
   David Woodhouse <dwmw2@infradead.org>, David Daney <ddaney@avtrex.com>
Content-Type: multipart/mixed;
 boundary="------------040900020802020007060405"
Subject: [patch] Allow any filesystem on MTD Nand when Read Only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------040900020802020007060405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello there.

The following patch allows you to have any filesystem over NAND when mounted
read only.

The main drive for this was that I wanted to use CRAMFS over NAND flash 
since
it has a much higher compression ratio than JFFS2.

How it works is pretty simple.

It's pretty reasonable assumption that bad blocks are created only when
writting to NAND. So in the read-only case it is possible to skip over 
the bad
blocks and offer a bad-block free block device to the upper layers.
This allows us to utilize any filesystem when  read-only.

In order to speed the mount operation the bad block detection is 
performed lazilly.

Using the patch I was able to mount as read-only CRAMFS/JFFS2 partitions
which contained simulated bad-blocks.

Awaiting your comments...

Regards

Pantelis


--------------040900020802020007060405
Content-Type: text/x-patch;
 name="ro-mtdblock.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ro-mtdblock.diff"

diff -ruN mtd-original/drivers/mtd/chips/amd_flash.c mtd-work/drivers/mtd/chips/amd_flash.c
--- mtd-original/drivers/mtd/chips/amd_flash.c	2003-06-13 01:00:05.000000000 +0300
+++ mtd-work/drivers/mtd/chips/amd_flash.c	2004-05-05 15:07:29.784400712 +0300
@@ -760,6 +760,9 @@
 	mtd->lock = amd_flash_lock;
 	mtd->unlock = amd_flash_unlock;
 
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	private = kmalloc(sizeof(*private) + (sizeof(struct flchip) *
 					      temp.numchips), GFP_KERNEL);
 	if (!private) {
diff -ruN mtd-original/drivers/mtd/chips/cfi_cmdset_0001.c mtd-work/drivers/mtd/chips/cfi_cmdset_0001.c
--- mtd-original/drivers/mtd/chips/cfi_cmdset_0001.c	2004-03-26 01:00:04.000000000 +0200
+++ mtd-work/drivers/mtd/chips/cfi_cmdset_0001.c	2004-05-05 15:07:29.786400408 +0300
@@ -307,6 +307,10 @@
 	mtd->unlock = cfi_intelext_unlock;
 	mtd->suspend = cfi_intelext_suspend;
 	mtd->resume = cfi_intelext_resume;
+
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	mtd->flags = MTD_CAP_NORFLASH;
 	map->fldrv = &cfi_intelext_chipdrv;
 	mtd->name = map->name;
diff -ruN mtd-original/drivers/mtd/chips/cfi_cmdset_0002.c mtd-work/drivers/mtd/chips/cfi_cmdset_0002.c
--- mtd-original/drivers/mtd/chips/cfi_cmdset_0002.c	2004-04-15 01:00:09.000000000 +0300
+++ mtd-work/drivers/mtd/chips/cfi_cmdset_0002.c	2004-05-05 15:07:29.788400104 +0300
@@ -367,6 +367,10 @@
 	mtd->sync = cfi_amdstd_sync;
 	mtd->suspend = cfi_amdstd_suspend;
 	mtd->resume = cfi_amdstd_resume;
+
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	mtd->flags = MTD_CAP_NORFLASH;
 	map->fldrv = &cfi_amdstd_chipdrv;
 	mtd->name = map->name;
diff -ruN mtd-original/drivers/mtd/chips/cfi_cmdset_0020.c mtd-work/drivers/mtd/chips/cfi_cmdset_0020.c
--- mtd-original/drivers/mtd/chips/cfi_cmdset_0020.c	2003-10-17 01:00:07.000000000 +0300
+++ mtd-work/drivers/mtd/chips/cfi_cmdset_0020.c	2004-05-05 15:07:29.789399952 +0300
@@ -226,6 +226,10 @@
 	mtd->unlock = cfi_staa_unlock;
 	mtd->suspend = cfi_staa_suspend;
 	mtd->resume = cfi_staa_resume;
+
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	mtd->flags = MTD_CAP_NORFLASH;
 	mtd->flags |= MTD_ECC; /* FIXME: Not all STMicro flashes have this */
 	mtd->eccsize = 8; /* FIXME: Should be 0 for STMicro flashes w/out ECC */
diff -ruN mtd-original/drivers/mtd/chips/map_ram.c mtd-work/drivers/mtd/chips/map_ram.c
--- mtd-original/drivers/mtd/chips/map_ram.c	2003-05-29 01:00:10.000000000 +0300
+++ mtd-work/drivers/mtd/chips/map_ram.c	2004-05-05 15:07:29.790399800 +0300
@@ -76,6 +76,9 @@
  	while(mtd->size & (mtd->erasesize - 1))
 		mtd->erasesize >>= 1;
 
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	__module_get(THIS_MODULE);
 	return mtd;
 }
diff -ruN mtd-original/drivers/mtd/chips/map_rom.c mtd-work/drivers/mtd/chips/map_rom.c
--- mtd-original/drivers/mtd/chips/map_rom.c	2003-05-29 01:00:10.000000000 +0300
+++ mtd-work/drivers/mtd/chips/map_rom.c	2004-05-05 15:07:29.790399800 +0300
@@ -46,6 +46,10 @@
 	mtd->read = maprom_read;
 	mtd->write = maprom_write;
 	mtd->sync = maprom_nop;
+
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	mtd->flags = MTD_CAP_ROM;
 	mtd->erasesize = 131072;
  	while(mtd->size & (mtd->erasesize - 1))
diff -ruN mtd-original/drivers/mtd/chips/sharp.c mtd-work/drivers/mtd/chips/sharp.c
--- mtd-original/drivers/mtd/chips/sharp.c	2003-05-29 01:00:10.000000000 +0300
+++ mtd-work/drivers/mtd/chips/sharp.c	2004-05-05 15:07:29.791399648 +0300
@@ -139,6 +139,10 @@
 	mtd->sync = sharp_sync;
 	mtd->suspend = sharp_suspend;
 	mtd->resume = sharp_resume;
+
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	mtd->flags = MTD_CAP_NORFLASH;
 	mtd->name = map->name;
 
diff -ruN mtd-original/drivers/mtd/devices/doc2000.c mtd-work/drivers/mtd/devices/doc2000.c
--- mtd-original/drivers/mtd/devices/doc2000.c	2004-04-08 01:00:04.000000000 +0300
+++ mtd-work/drivers/mtd/devices/doc2000.c	2004-05-05 15:07:29.792399496 +0300
@@ -605,6 +605,9 @@
 	mtd->write_oob = doc_write_oob;
 	mtd->sync = NULL;
 
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	this->totlen = 0;
 	this->numchips = 0;
 
diff -ruN mtd-original/drivers/mtd/devices/doc2001.c mtd-work/drivers/mtd/devices/doc2001.c
--- mtd-original/drivers/mtd/devices/doc2001.c	2004-04-05 01:00:05.000000000 +0300
+++ mtd-work/drivers/mtd/devices/doc2001.c	2004-05-05 15:07:29.793399344 +0300
@@ -380,6 +380,9 @@
 	mtd->write_oob = doc_write_oob;
 	mtd->sync = NULL;
 
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	this->totlen = 0;
 	this->numchips = 0;
 	this->curfloor = -1;
diff -ruN mtd-original/drivers/mtd/devices/doc2001plus.c mtd-work/drivers/mtd/devices/doc2001plus.c
--- mtd-original/drivers/mtd/devices/doc2001plus.c	2004-04-05 01:00:05.000000000 +0300
+++ mtd-work/drivers/mtd/devices/doc2001plus.c	2004-05-05 15:07:29.795399040 +0300
@@ -504,6 +504,9 @@
 	mtd->write_oob = doc_write_oob;
 	mtd->sync = NULL;
 
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	this->totlen = 0;
 	this->numchips = 0;
 	this->curfloor = -1;
diff -ruN mtd-original/drivers/mtd/devices/ms02-nv.c mtd-work/drivers/mtd/devices/ms02-nv.c
--- mtd-original/drivers/mtd/devices/ms02-nv.c	2003-08-20 01:00:35.000000000 +0300
+++ mtd-work/drivers/mtd/devices/ms02-nv.c	2004-05-05 15:07:29.795399040 +0300
@@ -226,6 +226,9 @@
 	mtd->read = ms02nv_read;
 	mtd->write = ms02nv_write;
 
+	mtd->block_read = mtd->read;
+	mtd->block_write = mtd->write;
+
 	ret = -EIO;
 	if (add_mtd_device(mtd)) {
 		printk(KERN_ERR
diff -ruN mtd-original/drivers/mtd/devices/mtdram.c mtd-work/drivers/mtd/devices/mtdram.c
--- mtd-original/drivers/mtd/devices/mtdram.c	2003-05-24 01:00:19.000000000 +0300
+++ mtd-work/drivers/mtd/devices/mtdram.c	2004-05-05 15:07:29.796398888 +0300
@@ -145,6 +145,9 @@
    mtd->read = ram_read;
    mtd->write = ram_write;
 
+   mtd->block_read = mtd->read;
+   mtd->block_write = mtd->write;
+
    if (add_mtd_device(mtd)) {
      return -EIO;
    }
diff -ruN mtd-original/drivers/mtd/mtdblock.c mtd-work/drivers/mtd/mtdblock.c
--- mtd-original/drivers/mtd/mtdblock.c	2003-10-05 01:00:04.000000000 +0300
+++ mtd-work/drivers/mtd/mtdblock.c	2004-05-05 15:07:29.796398888 +0300
@@ -84,7 +84,7 @@
 	 * Next, writhe data to flash.
 	 */
 
-	ret = MTD_WRITE (mtd, pos, len, &retlen, buf);
+	ret = MTD_BLOCK_WRITE (mtd, pos, len, &retlen, buf);
 	if (ret)
 		return ret;
 	if (retlen != len)
@@ -134,7 +134,7 @@
 		mtd->name, pos, len);
 	
 	if (!sect_size)
-		return MTD_WRITE (mtd, pos, len, &retlen, buf);
+		return MTD_BLOCK_WRITE (mtd, pos, len, &retlen, buf);
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
@@ -166,7 +166,7 @@
 			    mtdblk->cache_offset != sect_start) {
 				/* fill the cache with the current sector */
 				mtdblk->cache_state = STATE_EMPTY;
-				ret = MTD_READ(mtd, sect_start, sect_size, &retlen, mtdblk->cache_data);
+				ret = MTD_BLOCK_READ(mtd, sect_start, sect_size, &retlen, mtdblk->cache_data);
 				if (ret)
 					return ret;
 				if (retlen != sect_size)
@@ -203,7 +203,7 @@
 			mtd->name, pos, len);
 	
 	if (!sect_size)
-		return MTD_READ (mtd, pos, len, &retlen, buf);
+		return MTD_BLOCK_READ (mtd, pos, len, &retlen, buf);
 
 	while (len > 0) {
 		unsigned long sect_start = (pos/sect_size)*sect_size;
@@ -222,7 +222,7 @@
 		    mtdblk->cache_offset == sect_start) {
 			memcpy (buf, mtdblk->cache_data + offset, size);
 		} else {
-			ret = MTD_READ (mtd, pos, size, &retlen, buf);
+			ret = MTD_BLOCK_READ (mtd, pos, size, &retlen, buf);
 			if (ret)
 				return ret;
 			if (retlen != size)
diff -ruN mtd-original/drivers/mtd/mtdcore.c mtd-work/drivers/mtd/mtdcore.c
--- mtd-original/drivers/mtd/mtdcore.c	2003-05-24 01:00:14.000000000 +0300
+++ mtd-work/drivers/mtd/mtdcore.c	2004-05-05 15:07:29.797398736 +0300
@@ -286,6 +286,64 @@
 	return ret;
 }
 
+loff_t map_over_bad_blocks(struct mtd_info *mtd, loff_t from)
+{
+	int i, block;
+
+	/* if no bad block checking is possible bail out */
+	if (mtd->block_isbad == NULL)
+		return from;
+
+	/* first time in */
+	if (mtd->block_map == NULL) {
+		mtd->block_top = mtd->size / mtd->erasesize;
+		mtd->block_map = kmalloc(sizeof(*mtd->block_map) * mtd->block_top, GFP_KERNEL);
+		if (mtd->block_map == NULL) {
+			printk (KERN_WARNING "nand_scan(): unable to allocate block map\n");
+			return -ENOMEM;
+		}
+		for (i = 0; i < mtd->block_top; i++)
+			mtd->block_map[i] = -1;
+
+		for (i = 0; i < mtd->block_top; i++)
+			if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
+				break;
+
+		if (i >= mtd->block_top) {
+			printk (KERN_WARNING "nand_scan(): all blocks bad!\n");
+			return -EIO;
+		}
+		mtd->block_scantop = 0;
+		mtd->block_map[0] = i;
+
+		DEBUG(0, "mtd: map %d -> %d\n", mtd->block_scantop, mtd->block_map[mtd->block_scantop]);
+	}
+
+	block = ((int)from / mtd->erasesize);
+	if (block >= mtd->block_top)
+		return (loff_t)-1;
+
+	/* scan for bad block up to where we want */
+	while (block >= mtd->block_scantop) {
+		/* find a non bad block */
+		for (i = mtd->block_map[mtd->block_scantop] + 1; i < mtd->block_top; i++)
+			if ((*mtd->block_isbad)(mtd, i * mtd->erasesize) == 0)
+				break;
+
+		/* exchausted ? */
+		if (i >= mtd->block_top) {
+			printk (KERN_WARNING "nand_scan(): no more good blocks!\n");
+			return (loff_t)-1;
+		}
+
+		mtd->block_map[++mtd->block_scantop] = i;
+		DEBUG(0, "mtd: map %d -> %d\n", mtd->block_scantop, mtd->block_map[mtd->block_scantop]);
+	}
+
+	block = mtd->block_map[(int)from / mtd->erasesize];
+	from = (block * mtd->erasesize) | ((int)from & (mtd->erasesize - 1));
+	return from;
+}
 
 EXPORT_SYMBOL(add_mtd_device);
 EXPORT_SYMBOL(del_mtd_device);
@@ -296,6 +354,8 @@
 EXPORT_SYMBOL(default_mtd_writev);
 EXPORT_SYMBOL(default_mtd_readv);
 
+EXPORT_SYMBOL(map_over_bad_blocks);
+
 /*====================================================================*/
 /* Power management code */
 
diff -ruN mtd-original/drivers/mtd/mtdpart.c mtd-work/drivers/mtd/mtdpart.c
--- mtd-original/drivers/mtd/mtdpart.c	2004-03-30 01:00:17.000000000 +0300
+++ mtd-work/drivers/mtd/mtdpart.c	2004-05-05 15:07:29.798398584 +0300
@@ -301,6 +301,56 @@
 	return part->master->block_markbad(part->master, ofs);
 }
 
+/* note that the partition block reads do not call the master block_read function because 
+   they do their own bad block management */
+static int part_block_read (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * buf)
+{
+	struct mtd_part *part = PART(mtd);
+	struct mtd_info *master = part->master;
+
+	if (from >= mtd->size)
+		len = 0;
+	else if (from + len > mtd->size)
+		len = mtd->size - from;
+
+	if (master->block_read == NULL)	
+		return master->read (master, from + part->offset, len, retlen, buf);
+
+	/* for writeable partitions just read */
+	if ((mtd->flags & MTD_WRITEABLE) == MTD_WRITEABLE)
+		return master->read (master, from + part->offset, len, retlen, buf);
+
+	from = map_over_bad_blocks(mtd, from);
+
+	/* exchausted memory; simulated read of 0xff */
+	if (from == (loff_t)-1) {
+		memset(buf, 0xff, len);
+		*retlen = len;
+		return 0;
+	}
+
+	/* the length must always be less than the erase size */
+	BUG_ON(len > mtd->erasesize);
+
+	return master->read (master, from + part->offset, len, retlen, buf);
+}
+
+static int part_block_write (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * buf)
+{
+	struct mtd_part *part = PART(mtd);
+	struct mtd_info *master = part->master;
+
+	if (to >= mtd->size)
+		len = 0;
+	else if (to + len > mtd->size)
+		len = mtd->size - to;
+
+	if (master->block_write == NULL)
+		return master->write (master, to + part->offset, len, retlen, buf);
+	else
+		return master->block_write (master, to + part->offset, len, retlen, buf);
+}
+
 /* 
  * This function unregisters and destroy all slave MTD objects which are 
  * attached to the given master MTD object.
@@ -415,6 +465,12 @@
 			slave->mtd.block_isbad = part_block_isbad;
 		if (master->block_markbad)
 			slave->mtd.block_markbad = part_block_markbad;
+
+		if (master->block_read)
+			slave->mtd.block_read = part_block_read;
+		if (master->block_write)
+			slave->mtd.block_write = part_block_write;
+
 		slave->mtd.erase = part_erase;
 		slave->master = master;
 		slave->offset = parts[i].offset;
diff -ruN mtd-original/drivers/mtd/nand/nand.c mtd-work/drivers/mtd/nand/nand.c
--- mtd-original/drivers/mtd/nand/nand.c	2004-05-05 01:00:35.000000000 +0300
+++ mtd-work/drivers/mtd/nand/nand.c	2004-05-05 15:11:21.522171216 +0300
@@ -50,6 +50,8 @@
 #include <linux/mtd/compatmac.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
+#include <linux/slab.h>
+#include <linux/mtd/mtd.h>
 #include <asm/io.h>
 
 /* Define default oob placement schemes for large and small page devices */
@@ -111,6 +113,9 @@
 static int nand_erase (struct mtd_info *mtd, struct erase_info *instr);
 static void nand_sync (struct mtd_info *mtd);
 
+static int nand_block_read (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * buf);
+static int nand_block_write (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * buf);
+
 /* Some internal functions */
 static int nand_write_page (struct mtd_info *mtd, struct nand_chip *this, int page, u_char *oob_buf,
 		struct nand_oobinfo *oobsel, int mode);
@@ -1163,7 +1168,7 @@
 	/* Check, if the buffer must be filled with ff again */
 	if (this->oobdirty) {	
 		memset (this->oob_buf, 0xff, 
-			mtd->oobsize * (mtd->erasesize / mtd->oobblock));
+			mtd->oobsize << (this->erase_shift - this->page_shift));
 		this->oobdirty = 0;
 	}	
 	
@@ -1671,7 +1676,7 @@
 	chipnr = (int)((unsigned long)instr->addr / this->chipsize);
 
 	/* Calculate pages in each block */
-	pages_per_block = mtd->erasesize / mtd->oobblock;
+	pages_per_block = 1 << (this->erase_shift - this->page_shift);
 
 	/* Select the NAND device */
 	this->select_chip(mtd, chipnr);
@@ -1941,6 +1946,7 @@
 		
 		/* Calculate the address shift from the page size */	
 		this->page_shift = ffs(mtd->oobblock) - 1;
+		this->erase_shift = ffs(mtd->erasesize) - 1;
 
 		/* Set the bad block position */
 		this->badblockpos = mtd->oobblock > 512 ? 
@@ -1994,7 +2000,7 @@
 	/* Convert chipsize to number of pages per chip -1. */
 	this->pagemask = (this->chipsize >> this->page_shift) - 1;
 	/* Preset the internal oob buffer */
-	memset(this->oob_buf, 0xff, mtd->oobsize * (mtd->erasesize / mtd->oobblock));	
+	memset(this->oob_buf, 0xff, mtd->oobsize << (this->erase_shift - this->page_shift));
 
 	/* If no default placement scheme is given, select an
 	 * appropriate one */
@@ -2068,8 +2074,6 @@
 		BUG();	
 	}	
 	
-	mtd->eccsize = this->eccsize;
-	
 	/* Set the number of read / write steps for one page to ensure ECC generation */
 	switch (this->eccmode) {
 	case NAND_ECC_HW3_512:
@@ -2120,12 +2124,65 @@
 	mtd->resume = NULL;
 	mtd->block_isbad = nand_block_isbad;
 	mtd->block_markbad = nand_block_markbad;
+
+	mtd->block_read = nand_block_read;
+	mtd->block_write = nand_block_write;
+
 	mtd->owner = THIS_MODULE;
 
 	/* Return happy */
 	return 0;
 }
 
+/*************************************************************************************************/
+
+/*
+ * This function simply calls nand_read_ecc with oob buffer and oobsel = NULL
+ * after mapping over any bad blocks when read only.
+ *
+ * @mtd:	MTD device structure
+ * @from:	offset to read from
+ * @len:	number of bytes to read
+ * @retlen:	pointer to variable to store the number of read bytes
+ * @buf:	the databuffer to put data
+*/
+static int nand_block_read (struct mtd_info *mtd, loff_t from, size_t len, size_t * retlen, u_char * buf)
+{
+	/* if partition writable just read with ECC */
+	if ((mtd->flags & MTD_WRITEABLE) == MTD_WRITEABLE)
+		return nand_read_ecc (mtd, from, len, retlen, buf, NULL, NULL);
+
+	from = map_over_bad_blocks(mtd, from);
+
+	/* exchausted memory; simulated read of 0xff */
+	if (from == (loff_t)-1) {
+		memset(buf, 0xff, len);
+		*retlen = len;
+		return 0;
+	}
+
+	/* the length must always be less than the erase size */
+	BUG_ON(len > mtd->erasesize);
+
+	/* do the read by just skipping over any bad blocks as they weren't there */
+	return nand_read_ecc (mtd, from, len, retlen, buf, NULL, NULL);
+}			   
+
+/*
+ * This function simply calls nand_write_ecc with oob buffer and oobsel = NULL
+ *
+ * @mtd:	MTD device structure
+ * @to:		offset to write to
+ * @len:	number of bytes to write
+ * @retlen:	pointer to variable to store the number of written bytes
+ * @buf:	the data to write
+*/
+static int nand_block_write (struct mtd_info *mtd, loff_t to, size_t len, size_t * retlen, const u_char * buf)
+{
+	BUG_ON((mtd->flags & MTD_WRITEABLE) == MTD_WRITEABLE);	/* must be writable to work */
+	return (nand_write_ecc (mtd, to, len, retlen, buf, NULL, NULL));
+}			   
+
 EXPORT_SYMBOL (nand_scan);
 
 MODULE_LICENSE ("GPL");
diff -ruN mtd-original/include/linux/mtd/mtd.h mtd-work/include/linux/mtd/mtd.h
--- mtd-original/include/linux/mtd/mtd.h	2004-04-15 01:00:10.000000000 +0300
+++ mtd-work/include/linux/mtd/mtd.h	2004-05-05 15:06:37.650326296 +0300
@@ -166,6 +166,10 @@
 	u_int32_t ecctype;
 	u_int32_t eccsize;
 	
+	/* block map for RO */
+	int		*block_map;
+	int		 block_top;
+	int		 block_scantop;
 
 	// Kernel-only stuff starts here.
 	char *name;
@@ -240,6 +244,10 @@
 	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
 
+	/* block read */
+	int (*block_read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
+	int (*block_write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
+
 	void *priv;
 
 	struct module *owner;
@@ -273,6 +281,8 @@
 int default_mtd_readv(struct mtd_info *mtd, struct iovec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
+loff_t map_over_bad_blocks(struct mtd_info *mtd, loff_t from);
+
 #define MTD_ERASE(mtd, args...) (*(mtd->erase))(mtd, args)
 #define MTD_POINT(mtd, a,b,c,d) (*(mtd->point))(mtd, a,b,c, (u_char **)(d))
 #define MTD_UNPOINT(mtd, arg) (*(mtd->unpoint))(mtd, (u_char *)arg)
@@ -286,6 +296,9 @@
 #define MTD_WRITEOOB(mtd, args...) (*(mtd->write_oob))(mtd, args)
 #define MTD_SYNC(mtd) do { if (mtd->sync) (*(mtd->sync))(mtd);  } while (0) 
 
+#define MTD_BLOCK_READ(mtd, args...) (*(mtd->block_read))(mtd, args)
+#define MTD_BLOCK_WRITE(mtd, args...) (*(mtd->block_write))(mtd, args)
+
 /*
  * Debugging macro and defines
  */
diff -ruN mtd-original/include/linux/mtd/nand.h mtd-work/include/linux/mtd/nand.h
--- mtd-original/include/linux/mtd/nand.h	2004-04-17 01:00:05.000000000 +0300
+++ mtd-work/include/linux/mtd/nand.h	2004-05-05 15:06:37.664324168 +0300
@@ -235,6 +235,7 @@
 	wait_queue_head_t wq;
 	nand_state_t 	state;
 	int 		page_shift;
+	int		erase_shift;
 	u_char 		*data_buf;
 	u_char		*oob_buf;
 	int		oobdirty;

--------------040900020802020007060405
Content-Type: text/plain;
 name="ro-mtdblock.diffstat"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ro-mtdblock.diffstat"

 drivers/mtd/chips/amd_flash.c       |    3 +
 drivers/mtd/chips/cfi_cmdset_0001.c |    4 ++
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++
 drivers/mtd/chips/cfi_cmdset_0020.c |    4 ++
 drivers/mtd/chips/map_ram.c         |    3 +
 drivers/mtd/chips/map_rom.c         |    4 ++
 drivers/mtd/chips/sharp.c           |    4 ++
 drivers/mtd/devices/doc2000.c       |    3 +
 drivers/mtd/devices/doc2001.c       |    3 +
 drivers/mtd/devices/doc2001plus.c   |    3 +
 drivers/mtd/devices/ms02-nv.c       |    3 +
 drivers/mtd/devices/mtdram.c        |    3 +
 drivers/mtd/mtdblock.c              |   10 ++---
 drivers/mtd/mtdcore.c               |   60 ++++++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c               |   56 ++++++++++++++++++++++++++++++
 drivers/mtd/nand/nand.c             |   67 +++++++++++++++++++++++++++++++++---
 include/linux/mtd/mtd.h             |   13 ++++++
 include/linux/mtd/nand.h            |    1 
 18 files changed, 238 insertions(+), 10 deletions(-)

--------------040900020802020007060405--
