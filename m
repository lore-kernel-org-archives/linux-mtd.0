Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvemt-0000fF-3t
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 11:52:37 -0500
Received: from portal.sanpeople.com ([192.168.1.40])
	by za-gw.sanpeople.com with esmtp (Exim 4.34) id 1Cvekf-0006ZN-N6
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 18:50:13 +0200
Received: from fuzzie.sanpeople.com ([192.168.4.5])
	by portal.sanpeople.com with esmtp (Exim 3.33 #1) id 1Cvf23-0007Uy-00
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 19:08:11 +0200
From: Andrew Victor <andrew@sanpeople.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-FNUxkdheM737f1StHD4A"
Message-Id: <1107190071.2480.150.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 31 Jan 2005 18:47:51 +0200
Subject: JFFS2-on-DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FNUxkdheM737f1StHD4A
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

This patch adds support for JFFS2-on-DataFlash devices.
DataFlash is NOR flash, with a NAND-like layout, but doesn't include
NAND features like OOB areas.

So for Dataflash, can_mark_obsolete = false and the NAND write buffering
code (wbuf.c) is used.

Since the DataFlash chip will automatically erase pages when writing,
the cleanmarkers are not needed - so cleanmarker_oob = false and
cleanmarker_size = 0

DataFlash page-sizes are not a power of two (they're multiples of 528
bytes).  There are a few places in JFFS2 code where sector_size is used
as a bitmask.  A new macro (SECTOR_ADDR) was defined to calculate these
sector addresses. If CONFIG_JFFS2_FS_DATAFLASH is not selected, the
original (faster) bitmask operation will still be used.

Also in scan.c, the EMPTY_SCAN_SIZE was a constant of 1024. 
Since this could be larger than the sector size of the DataFlash, this
is now basically set to MIN(sector_size, 1024).

(Patch is against the latest version in CVS)


Regards,
  Andrew Victor


--=-FNUxkdheM737f1StHD4A
Content-Disposition: attachment; filename=dataflash.patch
Content-Type: text/x-patch; name=dataflash.patch; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

diff -urN -x CVS mtd.orig/fs/Config.in mtd/fs/Config.in
--- mtd.orig/fs/Config.in	Tue May 25 13:31:47 2004
+++ mtd/fs/Config.in	Thu Jan 27 19:23:32 2005
@@ -7,6 +7,7 @@
 if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m" ] ; then
    int 'JFFS2 debugging verbosity (0 = quiet, 2 = noisy)' CONFIG_JFFS2_FS_DEBUG 0
    bool 'JFFS2 support for NAND chips' CONFIG_JFFS2_FS_NAND
+   bool 'JFFS2 support for DataFlash' CONFIG_JFFS2_FS_DATAFLASH
    bool 'JFFS2 ZLIB compression support (recommended)' CONFIG_JFFS2_ZLIB
    bool 'JFFS2 RTIME compression support (recommended)' CONFIG_JFFS2_RTIME
    bool 'JFFS2 RUBIN compression support' CONFIG_JFFS2_RUBIN
diff -urN -x CVS mtd.orig/fs/jffs2/Makefile.24 mtd/fs/jffs2/Makefile.24
--- mtd.orig/fs/jffs2/Makefile.24	Mon Aug  9 20:46:05 2004
+++ mtd/fs/jffs2/Makefile.24	Thu Jan 27 19:24:55 2005
@@ -30,6 +30,7 @@
 LINUX_OBJS += super-v24.o crc32.o rbtree.o
 
 NAND_OBJS-$(CONFIG_JFFS2_FS_NAND) += wbuf.o
+NAND_OBJS-$(CONFIG_JFFS2_FS_DATAFLASH) += wbuf.o
 
 COMPR_OBJS-$(CONFIG_JFFS2_RUBIN)  += compr_rubin.o
 COMPR_OBJS-$(CONFIG_JFFS2_RTIME)  += compr_rtime.o
diff -urN -x CVS mtd.orig/fs/jffs2/Makefile.common mtd/fs/jffs2/Makefile.common
--- mtd.orig/fs/jffs2/Makefile.common	Wed Nov  3 14:57:38 2004
+++ mtd/fs/jffs2/Makefile.common	Mon Jan 31 14:33:12 2005
@@ -13,6 +13,7 @@
 
 jffs2-$(CONFIG_JFFS2_FS_NAND)	+= wbuf.o
 jffs2-$(CONFIG_JFFS2_FS_NOR_ECC) += wbuf.o
+jffs2-$(CONFIG_JFFS2_FS_DATAFLASH) += wbuf.o
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
diff -urN -x CVS mtd.orig/fs/jffs2/erase.c mtd/fs/jffs2/erase.c
--- mtd.orig/fs/jffs2/erase.c	Wed Jan 26 16:07:57 2005
+++ mtd/fs/jffs2/erase.c	Fri Jan 28 14:52:52 2005
@@ -233,7 +233,7 @@
 			continue;
 		} 
 
-		if (((*prev)->flash_offset & ~(c->sector_size -1)) == jeb->offset) {
+		if (SECTOR_ADDR((*prev)->flash_offset) == jeb->offset) {
 			/* It's in the block we're erasing */
 			struct jffs2_raw_node_ref *this;
 
@@ -310,7 +310,7 @@
 	int ret;
 	uint32_t bad_offset;
 
-	if (!jffs2_cleanmarker_oob(c)) {
+	if ((!jffs2_cleanmarker_oob(c)) && (c->cleanmarker_size > 0)) {
 		marker_ref = jffs2_alloc_raw_node_ref();
 		if (!marker_ref) {
 			printk(KERN_WARNING "Failed to allocate raw node ref for clean marker\n");
@@ -351,7 +351,7 @@
 					bad_offset += i;
 					printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08x\n", datum, bad_offset);
 				bad: 
-					if (!jffs2_cleanmarker_oob(c))
+					if ((!jffs2_cleanmarker_oob(c)) && (c->cleanmarker_size > 0))
 						jffs2_free_raw_node_ref(marker_ref);
 					kfree(ebuf);
 				bad2:
@@ -384,6 +384,13 @@
 		jeb->first_node = jeb->last_node = NULL;
 
 		jeb->free_size = c->sector_size;
+		jeb->used_size = 0;
+		jeb->dirty_size = 0;
+		jeb->wasted_size = 0;
+	} else if (c->cleanmarker_size == 0) {
+		jeb->first_node = jeb->last_node = NULL;
+
+		jeb->free_size = c->sector_size;
 		jeb->used_size = 0;
 		jeb->dirty_size = 0;
 		jeb->wasted_size = 0;
diff -urN -x CVS mtd.orig/fs/jffs2/fs.c mtd/fs/jffs2/fs.c
--- mtd.orig/fs/jffs2/fs.c	Wed Jan 26 16:07:57 2005
+++ mtd/fs/jffs2/fs.c	Fri Jan 28 12:16:15 2005
@@ -455,6 +455,12 @@
 		return -EINVAL;
 	}
 #endif
+#ifndef CONFIG_JFFS2_FS_DATAFLASH
+	if (c->mtd->type == MTD_DATAFLASH) {
+		printk(KERN_ERR "jffs2: Cannot operate on DataFlash unless jffs2 DataFlash support is compiled in.\n");
+		return -EINVAL;
+	}
+#endif
 
 	c->flash_size = c->mtd->size;
 
@@ -660,6 +666,14 @@
 		if (ret)
 			return ret;
 	}
+	
+	/* and Dataflash */
+	if (jffs2_dataflash(c)) {
+		ret = jffs2_dataflash_setup(c);
+		if (ret)
+			return ret;
+	}
+	
 	return ret;
 }
 
@@ -673,4 +687,9 @@
 	if (jffs2_nor_ecc(c)) {
 		jffs2_nor_ecc_flash_cleanup(c);
 	}
+	
+	/* and DataFlash */
+	if (jffs2_dataflash(c)) {
+		jffs2_dataflash_cleanup(c);
+	}
 }
diff -urN -x CVS mtd.orig/fs/jffs2/gc.c mtd/fs/jffs2/gc.c
--- mtd.orig/fs/jffs2/gc.c	Wed Jan 26 16:07:57 2005
+++ mtd/fs/jffs2/gc.c	Fri Jan 28 14:53:06 2005
@@ -816,8 +816,7 @@
 
 			/* Doesn't matter if there's one in the same erase block. We're going to 
 			   delete it too at the same time. */
-			if ((raw->flash_offset & ~(c->sector_size-1)) ==
-			    (fd->raw->flash_offset & ~(c->sector_size-1)))
+			if (SECTOR_ADDR(raw->flash_offset) == SECTOR_ADDR(fd->raw->flash_offset))
 				continue;
 
 			D1(printk(KERN_DEBUG "Check potential deletion dirent at %08x\n", ref_offset(raw)));
diff -urN -x CVS mtd.orig/fs/jffs2/os-linux.h mtd/fs/jffs2/os-linux.h
--- mtd.orig/fs/jffs2/os-linux.h	Wed Jan 26 16:07:58 2005
+++ mtd/fs/jffs2/os-linux.h	Fri Jan 28 14:54:15 2005
@@ -97,9 +97,16 @@
 #endif
 }
 
+#ifdef CONFIG_JFFS2_FS_DATAFLASH
+#define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )
+#else
+#define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
+#endif
+
 #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
+#define jffs2_is_writebuffered(c) (c->wbuf != NULL)
 
-#if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC)
+#if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC && !defined CONFIG_JFFS2_FS_DATAFLASH)
 #define jffs2_can_mark_obsolete(c) (1)
 #define jffs2_cleanmarker_oob(c) (0)
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
@@ -116,6 +123,7 @@
 #define jffs2_wbuf_timeout NULL
 #define jffs2_wbuf_process NULL
 #define jffs2_nor_ecc(c) (0)
+#define jffs2_dataflash(c) (0)
 #define jffs2_nor_ecc_flash_setup(c) (0)
 #define jffs2_nor_ecc_flash_cleanup(c) do {} while (0)
 
@@ -151,6 +159,15 @@
 #define jffs2_nor_ecc_flash_setup(c) (0)
 #define jffs2_nor_ecc_flash_cleanup(c) do {} while (0)
 #endif /* NOR ECC */
+#ifdef CONFIG_JFFS2_FS_DATAFLASH
+#define jffs2_dataflash(c) (c->mtd->type == MTD_DATAFLASH)
+int jffs2_dataflash_setup(struct jffs2_sb_info *c);
+void jffs2_dataflash_cleanup(struct jffs2_sb_info *c);
+#else
+#define jffs2_dataflash(c) (0)
+#define jffs2_dataflash_setup(c) (0)
+#define jffs2_dataflash_cleanup(c) do {} while (0)
+#endf /* DATAFLASH */
 #endif /* NAND */
 
 /* erase.c */
diff -urN -x CVS mtd.orig/fs/jffs2/scan.c mtd/fs/jffs2/scan.c
--- mtd.orig/fs/jffs2/scan.c	Wed Jan 26 16:07:58 2005
+++ mtd/fs/jffs2/scan.c	Fri Jan 28 11:36:06 2005
@@ -19,7 +19,7 @@
 #include <linux/compiler.h>
 #include "nodelist.h"
 
-#define EMPTY_SCAN_SIZE 1024
+#define DEFAULT_EMPTY_SCAN_SIZE 1024
 
 #define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
 		c->free_size -= _x; c->dirty_size += _x; \
@@ -68,13 +68,21 @@
 static inline int min_free(struct jffs2_sb_info *c)
 {
 	uint32_t min = 2 * sizeof(struct jffs2_raw_inode);
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
+#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
 	if (!jffs2_can_mark_obsolete(c) && min < c->wbuf_pagesize)
 		return c->wbuf_pagesize;
 #endif
 	return min;
 
 }
+
+static inline uint32_t EMPTY_SCAN_SIZE(uint32_t sector_size) {
+	if (sector_size < DEFAULT_EMPTY_SCAN_SIZE)
+		return sector_size;
+	else
+		return DEFAULT_EMPTY_SCAN_SIZE;
+}
+
 int jffs2_scan_medium(struct jffs2_sb_info *c)
 {
 	int i, ret;
@@ -220,7 +228,7 @@
 		c->dirty_size -= c->nextblock->dirty_size;
 		c->nextblock->dirty_size = 0;
 	}
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
+#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
 	if (!jffs2_can_mark_obsolete(c) && c->nextblock && (c->nextblock->free_size & (c->wbuf_pagesize-1))) {
 		/* If we're going to start writing into a block which already 
 		   contains data, and the end of the data isn't page-aligned,
@@ -316,7 +324,7 @@
 	if (!buf_size) {
 		buf_len = c->sector_size;
 	} else {
-		buf_len = EMPTY_SCAN_SIZE;
+		buf_len = EMPTY_SCAN_SIZE(c->sector_size);
 		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
 		if (err)
 			return err;
@@ -326,10 +334,10 @@
 	ofs = 0;
 
 	/* Scan only 4KiB of 0xFF before declaring it's empty */
-	while(ofs < EMPTY_SCAN_SIZE && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
+	while(ofs < EMPTY_SCAN_SIZE(c->sector_size) && *(uint32_t *)(&buf[ofs]) == 0xFFFFFFFF)
 		ofs += 4;
 
-	if (ofs == EMPTY_SCAN_SIZE) {
+	if (ofs == EMPTY_SCAN_SIZE(c->sector_size)) {
 #ifdef CONFIG_JFFS2_FS_NAND
 		if (jffs2_cleanmarker_oob(c)) {
 			/* scan oob, take care of cleanmarker */
@@ -343,7 +351,10 @@
 		}
 #endif
 		D1(printk(KERN_DEBUG "Block at 0x%08x is empty (erased)\n", jeb->offset));
-		return BLK_STATE_ALLFF;	/* OK to erase if all blocks are like this */
+		if (c->cleanmarker_size == 0)
+			return BLK_STATE_CLEANMARKER;	/* don't bother with re-erase */
+		else
+			return BLK_STATE_ALLFF;	/* OK to erase if all blocks are like this */
 	}
 	if (ofs) {
 		D1(printk(KERN_DEBUG "Free space at %08x ends at %08x\n", jeb->offset,
@@ -423,7 +434,7 @@
 			   bail now */
 			if (buf_ofs == jeb->offset && jeb->used_size == PAD(c->cleanmarker_size) && 
 			    c->cleanmarker_size && !jeb->dirty_size && !jeb->first_node->next_in_ino) {
-				D1(printk(KERN_DEBUG "%d bytes at start of block seems clean... assuming all clean\n", EMPTY_SCAN_SIZE));
+				D1(printk(KERN_DEBUG "%d bytes at start of block seems clean... assuming all clean\n", EMPTY_SCAN_SIZE(c->sector_size)));
 				return BLK_STATE_CLEANMARKER;
 			}
 
diff -urN -x CVS mtd.orig/fs/jffs2/wbuf.c mtd/fs/jffs2/wbuf.c
--- mtd.orig/fs/jffs2/wbuf.c	Wed Jan 26 16:07:58 2005
+++ mtd/fs/jffs2/wbuf.c	Fri Jan 28 14:52:40 2005
@@ -415,9 +415,9 @@
 	int ret;
 	size_t retlen;
 
-	/* Nothing to do if not NAND flash. In particular, we shouldn't
+	/* Nothing to do if not write-buffering the flash. In particular, we shouldn't
 	   del_timer() the timer we never initialised. */
-	if (jffs2_can_mark_obsolete(c))
+	if (!jffs2_is_writebuffered(c))
 		return 0;
 
 	if (!down_trylock(&c->alloc_sem)) {
@@ -426,7 +426,7 @@
 		BUG();
 	}
 
-	if(!c->wbuf || !c->wbuf_len)
+	if (!c->wbuf_len)	/* already checked c->wbuf above */
 		return 0;
 
 	/* claim remaining space on the page
@@ -435,7 +435,7 @@
 	   if we have a switch to next page, we will not have
 	   enough remaining space for this. 
 	*/
-	if (pad) {
+	if (pad && jffs2_cleanmarker_oob(c)) {
 		c->wbuf_len = PAD(c->wbuf_len);
 
 		/* Pad with JFFS2_DIRTY_BITMASK initially.  this helps out ECC'd NOR
@@ -486,7 +486,7 @@
 	spin_lock(&c->erase_completion_lock);
 
 	/* Adjust free size of the block if we padded. */
-	if (pad) {
+	if (pad && jffs2_cleanmarker_oob(c)) {
 		struct jffs2_eraseblock *jeb;
 
 		jeb = &c->blocks[c->wbuf_ofs / c->sector_size];
@@ -598,8 +598,14 @@
 	return ret;
 }
 
+#ifdef CONFIG_JFFS2_FS_DATAFLASH
+#define PAGE_DIV(x) ( ((unsigned long)(x) / (unsigned long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize) )
+#define PAGE_MOD(x) ( (unsigned long)(x) % (unsigned long)(c->wbuf_pagesize) )
+#else
 #define PAGE_DIV(x) ( (x) & (~(c->wbuf_pagesize - 1)) )
 #define PAGE_MOD(x) ( (x) & (c->wbuf_pagesize - 1) )
+#endif
+
 int jffs2_flash_writev(struct jffs2_sb_info *c, const struct kvec *invecs, unsigned long count, loff_t to, size_t *retlen, uint32_t ino)
 {
 	struct kvec outvecs[3];
@@ -614,7 +620,7 @@
 	uint32_t outvec_to = to;
 
 	/* If not NAND flash, don't bother */
-	if (!c->wbuf)
+	if (!jffs2_is_writebuffered(c))
 		return jffs2_flash_direct_writev(c, invecs, count, to, retlen);
 	
 	down_write(&c->wbuf_sem);
@@ -643,7 +649,7 @@
 	   erase block. Anything else, and you die.
 	   New block starts at xxx000c (0-b = block header)
 	*/
-	if ( (to & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) {
+	if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) {
 		/* It's a write to a new block */
 		if (c->wbuf_len) {
 			D1(printk(KERN_DEBUG "jffs2_flash_writev() to 0x%lx causes flush of wbuf at 0x%08x\n", (unsigned long)to, c->wbuf_ofs));
@@ -841,7 +847,7 @@
 {
 	struct kvec vecs[1];
 
-	if (jffs2_can_mark_obsolete(c))
+	if (!jffs2_is_writebuffered(c))
 		return c->mtd->write(c->mtd, ofs, len, retlen, buf);
 
 	vecs[0].iov_base = (unsigned char *) buf;
@@ -857,39 +863,39 @@
 	loff_t	orbf = 0, owbf = 0, lwbf = 0;
 	int	ret;
 
+	if (!jffs2_is_writebuffered(c))
+		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
+
 	/* Read flash */
-	if (!jffs2_can_mark_obsolete(c)) {
-		down_read(&c->wbuf_sem);
+	down_read(&c->wbuf_sem);
 
-		if (jffs2_cleanmarker_oob(c))
-			ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
-		else
-			ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
+	if (jffs2_cleanmarker_oob(c))
+		ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf, NULL, c->oobinfo);
+	else
+		ret = c->mtd->read(c->mtd, ofs, len, retlen, buf);
 
-		if ( (ret == -EBADMSG) && (*retlen == len) ) {
-			printk(KERN_WARNING "mtd->read(0x%zx bytes from 0x%llx) returned ECC error\n",
-			       len, ofs);
-			/* 
-			 * We have the raw data without ECC correction in the buffer, maybe 
-			 * we are lucky and all data or parts are correct. We check the node.
-			 * If data are corrupted node check will sort it out.
-			 * We keep this block, it will fail on write or erase and the we
-			 * mark it bad. Or should we do that now? But we should give him a chance.
-			 * Maybe we had a system crash or power loss before the ecc write or  
-			 * a erase was completed.
-			 * So we return success. :)
-			 */
-		 	ret = 0;
-		 }	
-	} else
-		return c->mtd->read(c->mtd, ofs, len, retlen, buf);
+	if ( (ret == -EBADMSG) && (*retlen == len) ) {
+		printk(KERN_WARNING "mtd->read(0x%zx bytes from 0x%llx) returned ECC error\n",
+		       len, ofs);
+		/* 
+		 * We have the raw data without ECC correction in the buffer, maybe 
+		 * we are lucky and all data or parts are correct. We check the node.
+		 * If data are corrupted node check will sort it out.
+		 * We keep this block, it will fail on write or erase and the we
+		 * mark it bad. Or should we do that now? But we should give him a chance.
+		 * Maybe we had a system crash or power loss before the ecc write or  
+		 * a erase was completed.
+		 * So we return success. :)
+		 */
+	 	ret = 0;
+	}	
 
 	/* if no writebuffer available or write buffer empty, return */
 	if (!c->wbuf_pagesize || !c->wbuf_len)
 		goto exit;
 
 	/* if we read in a different block, return */
-	if ( (ofs & ~(c->sector_size-1)) != (c->wbuf_ofs & ~(c->sector_size-1)) ) 
+	if (SECTOR_ADDR(ofs) != SECTOR_ADDR(c->wbuf_ofs))
 		goto exit;
 
 	if (ofs >= c->wbuf_ofs) {
@@ -1183,6 +1189,29 @@
 	kfree(c->wbuf);
 }
 
+#ifdef CONFIG_JFFS2_FS_DATAFLASH
+int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
+	c->cleanmarker_size = 0;		/* No cleanmarkers needed */
+	
+	/* Initialize write buffer */
+	init_rwsem(&c->wbuf_sem);
+	c->wbuf_pagesize = c->sector_size;
+	c->wbuf_ofs = 0xFFFFFFFF;
+
+	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
+	if (!c->wbuf)
+		return -ENOMEM;
+
+	printk(KERN_INFO "JFFS2 write-buffering enabled (%i)\n", c->wbuf_pagesize);
+
+	return 0;
+}
+
+void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
+	kfree(c->wbuf);
+}
+#endif
+
 #ifdef CONFIG_JFFS2_FS_NOR_ECC
 int jffs2_nor_ecc_flash_setup(struct jffs2_sb_info *c) {
 	/* Cleanmarker is actually larger on the flashes */
diff -urN -x CVS mtd.orig/include/linux/jffs2_fs_sb.h mtd/include/linux/jffs2_fs_sb.h
--- mtd.orig/include/linux/jffs2_fs_sb.h	Wed Jan 26 16:09:40 2005
+++ mtd/include/linux/jffs2_fs_sb.h	Fri Jan 28 11:31:51 2005
@@ -94,7 +94,7 @@
 	   to an obsoleted node. I don't like this. Alternatives welcomed. */
 	struct semaphore erase_free_sem;
 
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
+#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
 	/* Write-behind buffer for NAND flash */
 	unsigned char *wbuf;
 	uint32_t wbuf_ofs;
diff -urN -x CVS mtd.orig/include/mtd/mtd-abi.h mtd/include/mtd/mtd-abi.h
--- mtd.orig/include/mtd/mtd-abi.h	Wed Jan 26 16:09:41 2005
+++ mtd/include/mtd/mtd-abi.h	Thu Jan 27 14:53:09 2005
@@ -29,6 +29,7 @@
 #define MTD_NORFLASH		3
 #define MTD_NANDFLASH		4
 #define MTD_PEROM		5
+#define MTD_DATAFLASH		6
 #define MTD_OTHER		14
 #define MTD_UNKNOWN		15
 

--=-FNUxkdheM737f1StHD4A--
