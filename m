Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvtxb-0003Fx-59
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 04:04:40 -0500
Received: from portal.sanpeople.com ([192.168.1.40])
	by za-gw.sanpeople.com with esmtp (Exim 4.34) id 1CvtvZ-0001qh-4Y
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 11:02:29 +0200
Received: from fuzzie.sanpeople.com ([192.168.4.5])
	by portal.sanpeople.com with esmtp (Exim 3.33 #1) id 1CvuCs-0007yC-00
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 11:20:22 +0200
From: Andrew Victor <andrew@sanpeople.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 01 Feb 2005 11:00:03 +0200
Content-Transfer-Encoding: 7bit
Subject: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

The changes included in this patch are:

For Dataflash, can_mark_obsolete = false and the NAND write buffering
code (wbuf.c) is used.

Since the DataFlash chip will automatically erase pages when writing,
the cleanmarkers are not needed - so cleanmarker_oob = false and
cleanmarker_size = 0

Configuration (Config.in and Kconfig) and Makefiles updated.

DataFlash page-sizes are not a power of two (they're multiples of 528
bytes).  The SECTOR_ADDR macro (added in the previous core patch) is
replaced with a (slower) div/mod version if CONFIG_JFFS2_FS_DATAFLASH is
selected.

Padding nodes are only skipped for DataFlash devices - no longer breaks
the NOR ECC flash support.


Regards,
  Andrew Victor



diff -urN -x CVS mtd.core/fs/Config.in mtd.new/fs/Config.in
--- mtd.core/fs/Config.in	Tue May 25 13:31:47 2004
+++ mtd.new/fs/Config.in	Tue Feb  1 10:17:22 2005
@@ -7,6 +7,7 @@
 if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m" ] ; then
    int 'JFFS2 debugging verbosity (0 = quiet, 2 = noisy)' CONFIG_JFFS2_FS_DEBUG 0
    bool 'JFFS2 support for NAND chips' CONFIG_JFFS2_FS_NAND
+   bool 'JFFS2 support for DataFlash' CONFIG_JFFS2_FS_DATAFLASH
    bool 'JFFS2 ZLIB compression support (recommended)' CONFIG_JFFS2_ZLIB
    bool 'JFFS2 RTIME compression support (recommended)' CONFIG_JFFS2_RTIME
    bool 'JFFS2 RUBIN compression support' CONFIG_JFFS2_RUBIN
diff -urN -x CVS mtd.core/fs/Kconfig mtd.new/fs/Kconfig
--- mtd.core/fs/Kconfig	Wed Jan 26 16:07:56 2005
+++ mtd.new/fs/Kconfig	Tue Feb  1 10:17:22 2005
@@ -77,6 +77,13 @@
 		 ECC for JFFS2.  This type of flash chip is not common, however it is
 		 available from STMicro.
 
+config JFFS2_FS_DATAFLASH
+	bool "JFFS2 support for DataFlash (EXPERIMENTAL)"
+	depends on JFFS2_FS && EXPERIMENTAL
+	default n
+	help
+	  This enables the experimental support for JFFS2 on DataFlash devices.
+
 config JFFS2_COMPRESSION_OPTIONS
 	bool "Advanced compression options for JFFS2"
 	default n
diff -urN -x CVS mtd.core/fs/jffs2/Makefile.24 mtd.new/fs/jffs2/Makefile.24
--- mtd.core/fs/jffs2/Makefile.24	Mon Aug  9 20:46:05 2004
+++ mtd.new/fs/jffs2/Makefile.24	Tue Feb  1 10:17:22 2005
@@ -30,6 +30,7 @@
 LINUX_OBJS += super-v24.o crc32.o rbtree.o
 
 NAND_OBJS-$(CONFIG_JFFS2_FS_NAND) += wbuf.o
+NAND_OBJS-$(CONFIG_JFFS2_FS_DATAFLASH) += wbuf.o
 
 COMPR_OBJS-$(CONFIG_JFFS2_RUBIN)  += compr_rubin.o
 COMPR_OBJS-$(CONFIG_JFFS2_RTIME)  += compr_rtime.o
diff -urN -x CVS mtd.core/fs/jffs2/Makefile.common mtd.new/fs/jffs2/Makefile.common
--- mtd.core/fs/jffs2/Makefile.common	Wed Nov  3 14:57:38 2004
+++ mtd.new/fs/jffs2/Makefile.common	Tue Feb  1 10:17:22 2005
@@ -13,6 +13,7 @@
 
 jffs2-$(CONFIG_JFFS2_FS_NAND)	+= wbuf.o
 jffs2-$(CONFIG_JFFS2_FS_NOR_ECC) += wbuf.o
+jffs2-$(CONFIG_JFFS2_FS_DATAFLASH) += wbuf.o
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
diff -urN -x CVS mtd.core/fs/jffs2/erase.c mtd.new/fs/jffs2/erase.c
--- mtd.core/fs/jffs2/erase.c	Tue Feb  1 10:06:13 2005
+++ mtd.new/fs/jffs2/erase.c	Tue Feb  1 10:17:22 2005
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
diff -urN -x CVS mtd.core/fs/jffs2/fs.c mtd.new/fs/jffs2/fs.c
--- mtd.core/fs/jffs2/fs.c	Wed Jan 26 16:07:57 2005
+++ mtd.new/fs/jffs2/fs.c	Tue Feb  1 10:17:22 2005
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
diff -urN -x CVS mtd.core/fs/jffs2/os-linux.h mtd.new/fs/jffs2/os-linux.h
--- mtd.core/fs/jffs2/os-linux.h	Tue Feb  1 10:06:13 2005
+++ mtd.new/fs/jffs2/os-linux.h	Tue Feb  1 10:18:19 2005
@@ -97,12 +97,16 @@
 #endif
 }
 
+#ifdef CONFIG_JFFS2_FS_DATAFLASH
+#define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )
+#else
 #define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
+#endif
 
 #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
 #define jffs2_is_writebuffered(c) (c->wbuf != NULL)
 
-#if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC)
+#if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC && !defined CONFIG_JFFS2_FS_DATAFLASH)
 #define jffs2_can_mark_obsolete(c) (1)
 #define jffs2_cleanmarker_oob(c) (0)
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
@@ -119,6 +123,7 @@
 #define jffs2_wbuf_timeout NULL
 #define jffs2_wbuf_process NULL
 #define jffs2_nor_ecc(c) (0)
+#define jffs2_dataflash(c) (0)
 #define jffs2_nor_ecc_flash_setup(c) (0)
 #define jffs2_nor_ecc_flash_cleanup(c) do {} while (0)
 
@@ -154,6 +159,15 @@
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
diff -urN -x CVS mtd.core/fs/jffs2/scan.c mtd.new/fs/jffs2/scan.c
--- mtd.core/fs/jffs2/scan.c	Tue Feb  1 10:07:55 2005
+++ mtd.new/fs/jffs2/scan.c	Tue Feb  1 10:18:53 2005
@@ -68,7 +68,7 @@
 static inline int min_free(struct jffs2_sb_info *c)
 {
 	uint32_t min = 2 * sizeof(struct jffs2_raw_inode);
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
+#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
 	if (!jffs2_can_mark_obsolete(c) && min < c->wbuf_pagesize)
 		return c->wbuf_pagesize;
 #endif
@@ -228,7 +228,7 @@
 		c->dirty_size -= c->nextblock->dirty_size;
 		c->nextblock->dirty_size = 0;
 	}
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
+#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
 	if (!jffs2_can_mark_obsolete(c) && c->nextblock && (c->nextblock->free_size & (c->wbuf_pagesize-1))) {
 		/* If we're going to start writing into a block which already 
 		   contains data, and the end of the data isn't page-aligned,
@@ -351,7 +351,10 @@
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
diff -urN -x CVS mtd.core/fs/jffs2/wbuf.c mtd.new/fs/jffs2/wbuf.c
--- mtd.core/fs/jffs2/wbuf.c	Tue Feb  1 10:06:13 2005
+++ mtd.new/fs/jffs2/wbuf.c	Tue Feb  1 10:17:22 2005
@@ -435,7 +435,7 @@
 	   if we have a switch to next page, we will not have
 	   enough remaining space for this. 
 	*/
-	if (pad) {
+	if (pad && !jffs2_dataflash(c)) {
 		c->wbuf_len = PAD(c->wbuf_len);
 
 		/* Pad with JFFS2_DIRTY_BITMASK initially.  this helps out ECC'd NOR
@@ -486,7 +486,7 @@
 	spin_lock(&c->erase_completion_lock);
 
 	/* Adjust free size of the block if we padded. */
-	if (pad) {
+	if (pad && !jffs2_dataflash(c)) {
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
diff -urN -x CVS mtd.core/include/linux/jffs2_fs_sb.h mtd.new/include/linux/jffs2_fs_sb.h
--- mtd.core/include/linux/jffs2_fs_sb.h	Wed Jan 26 16:09:40 2005
+++ mtd.new/include/linux/jffs2_fs_sb.h	Tue Feb  1 10:17:22 2005
@@ -94,7 +94,7 @@
 	   to an obsoleted node. I don't like this. Alternatives welcomed. */
 	struct semaphore erase_free_sem;
 
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC
+#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
 	/* Write-behind buffer for NAND flash */
 	unsigned char *wbuf;
 	uint32_t wbuf_ofs;
diff -urN -x CVS mtd.core/include/mtd/mtd-abi.h mtd.new/include/mtd/mtd-abi.h
--- mtd.core/include/mtd/mtd-abi.h	Wed Jan 26 16:09:41 2005
+++ mtd.new/include/mtd/mtd-abi.h	Tue Feb  1 10:17:22 2005
@@ -29,6 +29,7 @@
 #define MTD_NORFLASH		3
 #define MTD_NANDFLASH		4
 #define MTD_PEROM		5
+#define MTD_DATAFLASH		6
 #define MTD_OTHER		14
 #define MTD_UNKNOWN		15
 
