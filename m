Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwhjU-0003qx-KE
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 09:13:30 -0500
Received: from portal.sanpeople.com ([192.168.1.40])
	by za-gw.sanpeople.com with esmtp (Exim 4.34) id 1CwhhI-00084Q-My
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 16:11:04 +0200
Received: from fuzzie.sanpeople.com ([192.168.4.5])
	by portal.sanpeople.com with esmtp (Exim 3.33 #1) id 1CwhyO-0002KE-00
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 16:28:44 +0200
From: Andrew Victor <andrew@sanpeople.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1107439704.32168.66.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 03 Feb 2005 16:08:25 +0200
Content-Transfer-Encoding: 7bit
Subject: JFFS2_FS_WRITEBUFFER config option
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

As per discussions on IRC, this patch replaces the current
CONFIG_JFFS2_FS_NAND, CONFIG_JFFS2_FS_NOR_ECC and
CONFIG_JFFS2_FS_DATAFLASH with a single configuration option - 
CONFIG_JFFS2_FS_WRITEBUFFER.

This patch applies on top of the two previously posted DataFlash
patches.

The only functional change of this patch is that the slower div/mod
calculations for SECTOR_ADDR(), PAGE_DIV() and PAGE_MOD() are now always
used.


Regards,
  Andrew Victor


diff -urN -x CVS mtd/fs/Config.in mtd.new/fs/Config.in
--- mtd/fs/Config.in	Thu Jan 27 19:23:32 2005
+++ mtd.new/fs/Config.in	Thu Feb  3 14:56:12 2005
@@ -6,8 +6,7 @@
 dep_tristate 'Journalling Flash File System v2 (JFFS2) support' CONFIG_JFFS2_FS $CONFIG_MTD
 if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m" ] ; then
    int 'JFFS2 debugging verbosity (0 = quiet, 2 = noisy)' CONFIG_JFFS2_FS_DEBUG 0
-   bool 'JFFS2 support for NAND chips' CONFIG_JFFS2_FS_NAND
-   bool 'JFFS2 support for DataFlash' CONFIG_JFFS2_FS_DATAFLASH
+   bool 'JFFS2 write-buffering support' CONFIG_JFFS2_FS_WRITEBUFFER
    bool 'JFFS2 ZLIB compression support (recommended)' CONFIG_JFFS2_ZLIB
    bool 'JFFS2 RTIME compression support (recommended)' CONFIG_JFFS2_RTIME
    bool 'JFFS2 RUBIN compression support' CONFIG_JFFS2_RUBIN
diff -urN -x CVS mtd/fs/Kconfig mtd.new/fs/Kconfig
--- mtd/fs/Kconfig	Tue Feb  1 09:35:12 2005
+++ mtd.new/fs/Kconfig	Thu Feb  3 15:07:51 2005
@@ -51,38 +51,18 @@
 	  If reporting bugs, please try to have available a full dump of the
 	  messages at debug level 1 while the misbehaviour was occurring.
 
-config JFFS2_FS_NAND
-	bool "JFFS2 support for NAND flash (EXPERIMENTAL)"
-	depends on JFFS2_FS && EXPERIMENTAL
-	default n
+config JFFS2_FS_WRITEBUFFER
+	bool "JFFS2 write-buffering support"
+	depends on JFFS2_FS
+	default y
 	help
-	  This enables the experimental support for NAND flash in JFFS2. NAND
-	  is a newer type of flash chip design than the traditional NOR flash,
-	  with higher density but a handful of characteristics which make it
-	  more interesting for the file system to use. Support for NAND flash
-	  is not yet complete and may corrupt data. For further information,
-	  including a link to the mailing list where details of the remaining
-	  work to be completed for NAND flash support can be found, see the 
-	  JFFS2 web site at <http://sources.redhat.com/jffs2>.
+	  This enables the write-buffering support in JFFS2.
 
-	  Say 'N' unless you have NAND flash and you are willing to test and
-	  develop JFFS2 support for it.
-
-config JFFS2_FS_NOR_ECC
-	bool "JFFS2 support for ECC'd NOR flash (EXPERIMENTAL)"
-	   depends on JFFS2_FS && EXPERIMENTAL
-	   default n
-	   help
-	     This enables the experimental support for NOR flash with transparent
-		 ECC for JFFS2.  This type of flash chip is not common, however it is
-		 available from STMicro.
-
-config JFFS2_FS_DATAFLASH
-	bool "JFFS2 support for DataFlash (EXPERIMENTAL)"
-	depends on JFFS2_FS && EXPERIMENTAL
-	default n
-	help
-	  This enables the experimental support for JFFS2 on DataFlash devices.
+	  This functionality is required to support JFFS2 on the following
+	  types of flash devices:
+	    - NAND flash
+	    - NOR flash with transparent ECC
+	    - DataFlash
 
 config JFFS2_COMPRESSION_OPTIONS
 	bool "Advanced compression options for JFFS2"
diff -urN -x CVS mtd/fs/jffs2/Makefile.24 mtd.new/fs/jffs2/Makefile.24
--- mtd/fs/jffs2/Makefile.24	Thu Jan 27 19:24:55 2005
+++ mtd.new/fs/jffs2/Makefile.24	Thu Feb  3 15:02:21 2005
@@ -29,14 +29,13 @@
 
 LINUX_OBJS += super-v24.o crc32.o rbtree.o
 
-NAND_OBJS-$(CONFIG_JFFS2_FS_NAND) += wbuf.o
-NAND_OBJS-$(CONFIG_JFFS2_FS_DATAFLASH) += wbuf.o
+WBUF_OBJS-$(CONFIG_JFFS2_FS_WRITEBUFFER) += wbuf.o
 
 COMPR_OBJS-$(CONFIG_JFFS2_RUBIN)  += compr_rubin.o
 COMPR_OBJS-$(CONFIG_JFFS2_RTIME)  += compr_rtime.o
 COMPR_OBJS-$(CONFIG_JFFS2_ZLIB)   += compr_zlib.o
 
-obj-y := $(COMPR_OBJS-y) $(JFFS2_OBJS) $(LINUX_OBJS) $(NAND_OBJS-y)
+obj-y := $(COMPR_OBJS-y) $(JFFS2_OBJS) $(LINUX_OBJS) $(WBUF_OBJS-y)
 O_TARGET := jffs2.o
 
 include $(TOPDIR)/Rules.make
diff -urN -x CVS mtd/fs/jffs2/Makefile.common mtd.new/fs/jffs2/Makefile.common
--- mtd/fs/jffs2/Makefile.common	Mon Jan 31 14:33:12 2005
+++ mtd.new/fs/jffs2/Makefile.common	Thu Feb  3 15:09:22 2005
@@ -11,9 +11,7 @@
 jffs2-y	+= symlink.o build.o erase.o background.o fs.o writev.o
 jffs2-y	+= super.o
 
-jffs2-$(CONFIG_JFFS2_FS_NAND)	+= wbuf.o
-jffs2-$(CONFIG_JFFS2_FS_NOR_ECC) += wbuf.o
-jffs2-$(CONFIG_JFFS2_FS_DATAFLASH) += wbuf.o
+jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= wbuf.o
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
diff -urN -x CVS mtd/fs/jffs2/defconfig mtd.new/fs/jffs2/defconfig
--- mtd/fs/jffs2/defconfig	Tue May 27 11:35:22 2003
+++ mtd.new/fs/jffs2/defconfig	Thu Feb  3 15:03:21 2005
@@ -2,7 +2,7 @@
 
 CONFIG_JFFS2_FS=m
 ifdef NONAND
-CONFIG_JFFS2_FS_NAND=n
+CONFIG_JFFS2_FS_WRITEBUFFER=n
 else
-CONFIG_JFFS2_FS_NAND=y
+CONFIG_JFFS2_FS_WRITEBUFFER=y
 endif
diff -urN -x CVS mtd/fs/jffs2/ecos/cdl/jffs2.cdl mtd.new/fs/jffs2/ecos/cdl/jffs2.cdl
--- mtd/fs/jffs2/ecos/cdl/jffs2.cdl	Wed Jan 26 16:08:00 2005
+++ mtd.new/fs/jffs2/ecos/cdl/jffs2.cdl	Thu Feb  3 15:08:30 2005
@@ -132,7 +132,7 @@
     cdl_option CYGOPT_FS_JFFS2_NAND {
 	display         "Support for NAND flash"
 	flavor          bool
-	define          CONFIG_JFFS2_FS_NAND
+	define          CONFIG_JFFS2_FS_WRITEBUFFER
 	compile         wbuf.c
         requires        0
         description     "
diff -urN -x CVS mtd/fs/jffs2/ecos/src/os-ecos.h mtd.new/fs/jffs2/ecos/src/os-ecos.h
--- mtd/fs/jffs2/ecos/src/os-ecos.h	Wed Jan 26 16:08:01 2005
+++ mtd.new/fs/jffs2/ecos/src/os-ecos.h	Thu Feb  3 15:08:55 2005
@@ -196,7 +196,7 @@
 static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
 { }
 
-#ifndef CONFIG_JFFS2_FS_NAND
+#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
 #define jffs2_can_mark_obsolete(c) (1)
 #define jffs2_cleanmarker_oob(c) (0)
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
diff -urN -x CVS mtd/fs/jffs2/fs.c mtd.new/fs/jffs2/fs.c
--- mtd/fs/jffs2/fs.c	Fri Jan 28 12:16:15 2005
+++ mtd.new/fs/jffs2/fs.c	Thu Feb  3 15:03:53 2005
@@ -449,13 +449,11 @@
 
 	c = JFFS2_SB_INFO(sb);
 
-#ifndef CONFIG_JFFS2_FS_NAND
+#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (c->mtd->type == MTD_NANDFLASH) {
 		printk(KERN_ERR "jffs2: Cannot operate on NAND flash unless jffs2 NAND support is compiled in.\n");
 		return -EINVAL;
 	}
-#endif
-#ifndef CONFIG_JFFS2_FS_DATAFLASH
 	if (c->mtd->type == MTD_DATAFLASH) {
 		printk(KERN_ERR "jffs2: Cannot operate on DataFlash unless jffs2 DataFlash support is compiled in.\n");
 		return -EINVAL;
diff -urN -x CVS mtd/fs/jffs2/nodelist.h mtd.new/fs/jffs2/nodelist.h
--- mtd/fs/jffs2/nodelist.h	Wed Jan 26 16:07:57 2005
+++ mtd.new/fs/jffs2/nodelist.h	Thu Feb  3 15:07:38 2005
@@ -463,7 +463,7 @@
 void jffs2_erase_block(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb);
 void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count);
 
-#ifdef CONFIG_JFFS2_FS_NAND
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 /* wbuf.c */
 int jffs2_flush_wbuf_gc(struct jffs2_sb_info *c, uint32_t ino);
 int jffs2_flush_wbuf_pad(struct jffs2_sb_info *c);
diff -urN -x CVS mtd/fs/jffs2/os-linux.h mtd.new/fs/jffs2/os-linux.h
--- mtd/fs/jffs2/os-linux.h	Wed Feb  2 18:48:25 2005
+++ mtd.new/fs/jffs2/os-linux.h	Thu Feb  3 15:23:28 2005
@@ -97,16 +97,12 @@
 #endif
 }
 
-#ifdef CONFIG_JFFS2_FS_DATAFLASH
-#define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )
-#else
-#define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
-#endif
 
 #define jffs2_is_readonly(c) (OFNI_BS_2SFFJ(c)->s_flags & MS_RDONLY)
 #define jffs2_is_writebuffered(c) (c->wbuf != NULL)
 
-#if (!defined CONFIG_JFFS2_FS_NAND && !defined CONFIG_JFFS2_FS_NOR_ECC && !defined CONFIG_JFFS2_FS_DATAFLASH)
+#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
+#define SECTOR_ADDR(x) ( ((unsigned long)(x) & ~(c->sector_size-1)) )
 #define jffs2_can_mark_obsolete(c) (1)
 #define jffs2_cleanmarker_oob(c) (0)
 #define jffs2_write_nand_cleanmarker(c,jeb) (-EIO)
@@ -129,6 +125,7 @@
 
 #else /* NAND and/or ECC'd NOR support present */
 
+#define SECTOR_ADDR(x) ( ((unsigned long)(x) / (unsigned long)(c->sector_size)) * c->sector_size )
 #define jffs2_can_mark_obsolete(c) ((c->mtd->type == MTD_NORFLASH && !(c->mtd->flags & MTD_ECC)) || c->mtd->type == MTD_RAM)
 #define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
 
@@ -150,25 +147,16 @@
 int jffs2_flush_wbuf_pad(struct jffs2_sb_info *c);
 int jffs2_nand_flash_setup(struct jffs2_sb_info *c);
 void jffs2_nand_flash_cleanup(struct jffs2_sb_info *c);
-#ifdef CONFIG_JFFS2_FS_NOR_ECC
+
 #define jffs2_nor_ecc(c) (c->mtd->type == MTD_NORFLASH && (c->mtd->flags & MTD_ECC))
 int jffs2_nor_ecc_flash_setup(struct jffs2_sb_info *c);
 void jffs2_nor_ecc_flash_cleanup(struct jffs2_sb_info *c);
-#else
-#define jffs2_nor_ecc(c) (0)
-#define jffs2_nor_ecc_flash_setup(c) (0)
-#define jffs2_nor_ecc_flash_cleanup(c) do {} while (0)
-#endif /* NOR ECC */
-#ifdef CONFIG_JFFS2_FS_DATAFLASH
+
 #define jffs2_dataflash(c) (c->mtd->type == MTD_DATAFLASH)
 int jffs2_dataflash_setup(struct jffs2_sb_info *c);
 void jffs2_dataflash_cleanup(struct jffs2_sb_info *c);
-#else
-#define jffs2_dataflash(c) (0)
-#define jffs2_dataflash_setup(c) (0)
-#define jffs2_dataflash_cleanup(c) do {} while (0)
-#endif /* DATAFLASH */
-#endif /* NAND */
+
+#endif /* WRITEBUFFER */
 
 /* erase.c */
 static inline void jffs2_erase_pending_trigger(struct jffs2_sb_info *c)
diff -urN -x CVS mtd/fs/jffs2/scan.c mtd.new/fs/jffs2/scan.c
--- mtd/fs/jffs2/scan.c	Fri Jan 28 11:36:06 2005
+++ mtd.new/fs/jffs2/scan.c	Thu Feb  3 15:14:48 2005
@@ -68,7 +68,7 @@
 static inline int min_free(struct jffs2_sb_info *c)
 {
 	uint32_t min = 2 * sizeof(struct jffs2_raw_inode);
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (!jffs2_can_mark_obsolete(c) && min < c->wbuf_pagesize)
 		return c->wbuf_pagesize;
 #endif
@@ -228,7 +228,7 @@
 		c->dirty_size -= c->nextblock->dirty_size;
 		c->nextblock->dirty_size = 0;
 	}
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (!jffs2_can_mark_obsolete(c) && c->nextblock && (c->nextblock->free_size & (c->wbuf_pagesize-1))) {
 		/* If we're going to start writing into a block which already 
 		   contains data, and the end of the data isn't page-aligned,
@@ -294,7 +294,7 @@
 	uint32_t hdr_crc, buf_ofs, buf_len;
 	int err;
 	int noise = 0;
-#ifdef CONFIG_JFFS2_FS_NAND
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	int cleanmarkerfound = 0;
 #endif
 
@@ -303,7 +303,7 @@
 
 	D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Scanning block at 0x%x\n", ofs));
 
-#ifdef CONFIG_JFFS2_FS_NAND
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	if (jffs2_cleanmarker_oob(c)) {
 		int ret = jffs2_check_nand_cleanmarker(c, jeb);
 		D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker returned %d\n",ret));
@@ -338,7 +338,7 @@
 		ofs += 4;
 
 	if (ofs == EMPTY_SCAN_SIZE(c->sector_size)) {
-#ifdef CONFIG_JFFS2_FS_NAND
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 		if (jffs2_cleanmarker_oob(c)) {
 			/* scan oob, take care of cleanmarker */
 			int ret = jffs2_check_oob_empty(c, jeb, cleanmarkerfound);
diff -urN -x CVS mtd/fs/jffs2/super-v24.c mtd.new/fs/jffs2/super-v24.c
--- mtd/fs/jffs2/super-v24.c	Wed Jan 26 16:07:58 2005
+++ mtd.new/fs/jffs2/super-v24.c	Thu Feb  3 15:06:27 2005
@@ -110,7 +110,7 @@
 	int ret;
 
 	printk(KERN_INFO "JFFS2 version 2.2."
-#ifdef CONFIG_JFFS2_FS_NAND
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	       " (NAND)"
 #endif
 	       " (C) 2001-2003 Red Hat, Inc.\n");
diff -urN -x CVS mtd/fs/jffs2/super.c mtd.new/fs/jffs2/super.c
--- mtd/fs/jffs2/super.c	Wed Jan 26 16:07:58 2005
+++ mtd.new/fs/jffs2/super.c	Thu Feb  3 15:05:58 2005
@@ -309,7 +309,7 @@
 	int ret;
 
 	printk(KERN_INFO "JFFS2 version 2.2."
-#ifdef CONFIG_JFFS2_FS_NAND
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	       " (NAND)"
 #endif
 	       " (C) 2001-2003 Red Hat, Inc.\n");
diff -urN -x CVS mtd/fs/jffs2/wbuf.c mtd.new/fs/jffs2/wbuf.c
--- mtd/fs/jffs2/wbuf.c	Tue Feb  1 09:38:41 2005
+++ mtd.new/fs/jffs2/wbuf.c	Thu Feb  3 15:22:17 2005
@@ -598,7 +598,7 @@
 	return ret;
 }
 
-#ifdef CONFIG_JFFS2_FS_DATAFLASH
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 #define PAGE_DIV(x) ( ((unsigned long)(x) / (unsigned long)(c->wbuf_pagesize)) * (unsigned long)(c->wbuf_pagesize) )
 #define PAGE_MOD(x) ( (unsigned long)(x) % (unsigned long)(c->wbuf_pagesize) )
 #else
@@ -1189,7 +1189,6 @@
 	kfree(c->wbuf);
 }
 
-#ifdef CONFIG_JFFS2_FS_DATAFLASH
 int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 	c->cleanmarker_size = 0;		/* No cleanmarkers needed */
 	
@@ -1210,9 +1209,7 @@
 void jffs2_dataflash_cleanup(struct jffs2_sb_info *c) {
 	kfree(c->wbuf);
 }
-#endif
 
-#ifdef CONFIG_JFFS2_FS_NOR_ECC
 int jffs2_nor_ecc_flash_setup(struct jffs2_sb_info *c) {
 	/* Cleanmarker is actually larger on the flashes */
 	c->cleanmarker_size = 16;
@@ -1232,4 +1229,3 @@
 void jffs2_nor_ecc_flash_cleanup(struct jffs2_sb_info *c) {
 	kfree(c->wbuf);
 }
-#endif
diff -urN -x CVS mtd/include/linux/config.h mtd.new/include/linux/config.h
--- mtd/include/linux/config.h	Sat Jul 10 23:14:18 2004
+++ mtd.new/include/linux/config.h	Thu Feb  3 15:25:31 2005
@@ -35,7 +35,7 @@
 #endif /* MTD_OUT_OF_TREE */
 
 #ifndef NONAND
-#define CONFIG_JFFS2_FS_NAND 1
+#define CONFIG_JFFS2_FS_WRITEBUFFER 1
 #endif
 
 #endif /* __MTD_CONFIG_H__ */
diff -urN -x CVS mtd/include/linux/jffs2_fs_sb.h mtd.new/include/linux/jffs2_fs_sb.h
--- mtd/include/linux/jffs2_fs_sb.h	Fri Jan 28 11:31:51 2005
+++ mtd.new/include/linux/jffs2_fs_sb.h	Thu Feb  3 15:24:34 2005
@@ -94,7 +94,7 @@
 	   to an obsoleted node. I don't like this. Alternatives welcomed. */
 	struct semaphore erase_free_sem;
 
-#if defined CONFIG_JFFS2_FS_NAND || defined CONFIG_JFFS2_FS_NOR_ECC || defined CONFIG_JFFS2_FS_DATAFLASH
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
 	/* Write-behind buffer for NAND flash */
 	unsigned char *wbuf;
 	uint32_t wbuf_ofs;
diff -urN -x CVS mtd/patches/Configure.help mtd.new/patches/Configure.help
--- mtd/patches/Configure.help	Tue Aug 19 11:24:36 2003
+++ mtd.new/patches/Configure.help	Thu Feb  3 15:27:22 2005
@@ -829,8 +829,13 @@
   If reporting bugs, please try to have available a full dump of the
   messages at debug level 1 while the misbehaviour was occurring.
 
-CONFIG_JFFS2_FS_NAND
-  Enables JFFS2 support for NAND FLASH.
+CONFIG_JFFS2_FS_WRITEBUFFER
+  This enables the write-buffering support in JFFS2.
+  This functionality is required to support JFFS2 on the following
+  types of flash devices:
+    - NAND flash
+    - NOR flash with transparent ECC
+    - DataFlash
 
 Flash chip mapping on the Flaga Digital Module
 CONFIG_MTD_CFI_FLAGADM
