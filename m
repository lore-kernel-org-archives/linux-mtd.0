Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19g3vU-0002sU-C3
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2003 15:52:09 +0100
Received: from portal.sanpeople.com ([192.168.1.40])
	by za-gw.sanpeople.com with esmtp (Exim 3.33 #2)
	id 19g3sX-00070J-00
	for linux-mtd@lists.infradead.org; Fri, 25 Jul 2003 16:49:05 +0200
Received: from fuzzie.sanpeople.com ([192.168.4.5])
	by portal.sanpeople.com with esmtp (Exim 3.33 #1)
	id 19g3w4-0005Pu-00
	for linux-mtd@lists.infradead.org; Fri, 25 Jul 2003 16:52:44 +0200
From: Andrew Victor <andrew@sanpeople.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1059144299.3544.129.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 25 Jul 2003 16:44:59 +0200
Content-Type: multipart/mixed; boundary="=-yBOaXymdR4Ag/Ri9RQvp"
Subject: DataFlash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yBOaXymdR4Ag/Ri9RQvp
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

The attached patch adds support for Atmel DataFlash devices.
(http://www.atmel.com/products/DataFlash/)
DataFlash differs from standard NOR flash in that the page sizes are 528
or 1056 bytes (depending on capacity).  [And no, it's not NAND flash]

Since the page-size is no longer always a power-of-two, the patch just
replaces all occurrences in that code where the erasesize and
sector_size are used as bitmasks.

Also, in fs/jffs2/scan.c, the EMPTY_SCAN_SIZE was a constant of 1024. 
Since this could be larger than the sector size of the DataFlash, this
is now basically set to MIN(sector_size, 1024).

There are also some places in fs/jffs2/wbuf.c where the the sector size
is also used as a bitmask, but I assume that code is only used for JFFS2
on NAND?


So far it seems to work without any problems.  Are there any JFFS2
stress-testing utilities?

(Patch is against the latest version in CVS)


Regards,
  Andrew Victor


--=-yBOaXymdR4Ag/Ri9RQvp
Content-Disposition: attachment; filename=dataflash.patch
Content-Type: text/x-patch; name=dataflash.patch; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

diff -urN -x CVS mtd/drivers/mtd/mtdpart.c mtd.new/drivers/mtd/mtdpart.c
--- mtd/drivers/mtd/mtdpart.c	Tue Jul 22 12:43:45 2003
+++ mtd.new/drivers/mtd/mtdpart.c	Fri Jul 25 15:05:45 2003
@@ -399,8 +399,9 @@
 		if (slave->offset == MTDPART_OFS_APPEND)
 			slave->offset = cur_offset;
 		if (slave->offset == MTDPART_OFS_NXTBLK) {
-			u_int32_t emask = master->erasesize-1;
-			slave->offset = (cur_offset + emask) & ~emask;
+			slave->offset = cur_offset;
+			if ((cur_offset % master->erasesize) != 0)
+				slave->offset = ((cur_offset / master->erasesize) + 1) * master->erasesize;
 			if (slave->offset != cur_offset) {
 				printk(KERN_NOTICE "Moving partition %d: "
 				       "0x%08x -> 0x%08x\n", i,
diff -urN -x CVS mtd/fs/jffs2/erase.c mtd.new/fs/jffs2/erase.c
--- mtd/fs/jffs2/erase.c	Mon May 12 00:47:36 2003
+++ mtd.new/fs/jffs2/erase.c	Fri Jul 25 14:56:53 2003
@@ -207,7 +207,8 @@
 			continue;
 		} 
 
-		if (((*prev)->flash_offset & ~(c->sector_size -1)) == jeb->offset) {
+		if (((*prev)->flash_offset >= jeb->offset) &&
+		    ((*prev)->flash_offset < (jeb->offset + c->sector_size))) {
 			/* It's in the block we're erasing */
 			struct jffs2_raw_node_ref *this;
 
diff -urN -x CVS mtd/fs/jffs2/gc.c mtd.new/fs/jffs2/gc.c
--- mtd/fs/jffs2/gc.c	Tue Jun 17 15:08:09 2003
+++ mtd.new/fs/jffs2/gc.c	Fri Jul 25 14:57:54 2003
@@ -770,8 +770,7 @@
 
 			/* Doesn't matter if there's one in the same erase block. We're going to 
 			   delete it too at the same time. */
-			if ((raw->flash_offset & ~(c->sector_size-1)) ==
-			    (fd->raw->flash_offset & ~(c->sector_size-1)))
+			if ((raw->flash_offset / c->sector_size) == (fd->raw->flash_offset / c->sector_size))
 				continue;
 
 			/* This is an obsolete node belonging to the same directory */
diff -urN -x CVS mtd/fs/jffs2/scan.c mtd.new/fs/jffs2/scan.c
--- mtd/fs/jffs2/scan.c	Tue Jul 22 12:44:10 2003
+++ mtd.new/fs/jffs2/scan.c	Fri Jul 25 15:41:52 2003
@@ -19,7 +19,7 @@
 #include <linux/compiler.h>
 #include "nodelist.h"
 
-#define EMPTY_SCAN_SIZE 1024
+#define DEFAULT_EMPTY_SCAN_SIZE 1024
 
 #define DIRTY_SPACE(x) do { typeof(x) _x = (x); \
 		c->free_size -= _x; c->dirty_size += _x; \
@@ -274,6 +274,13 @@
 	return 0;
 }
 
+static inline uint32_t EMPTY_SCAN_SIZE(uint32_t sector_size) {
+	if (sector_size < DEFAULT_EMPTY_SCAN_SIZE)
+		return sector_size;
+	else
+		return DEFAULT_EMPTY_SCAN_SIZE;
+}
+
 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				  unsigned char *buf, uint32_t buf_size) {
 	struct jffs2_unknown_node *node;
@@ -314,7 +321,7 @@
 	if (!buf_size) {
 		buf_len = c->sector_size;
 	} else {
-		buf_len = EMPTY_SCAN_SIZE;
+		buf_len = EMPTY_SCAN_SIZE(c->sector_size);
 		err = jffs2_fill_scan_buf(c, buf, buf_ofs, buf_len);
 		if (err)
 			return err;
@@ -324,10 +331,10 @@
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
@@ -404,8 +411,8 @@
 			/* If scanning empty space after only a cleanmarker, don't
 			   bother scanning the whole block */
 			if (unlikely(empty_start == jeb->offset + c->cleanmarker_size &&
-				     jeb->offset + EMPTY_SCAN_SIZE < buf_ofs + buf_len))
-				scanend = jeb->offset + EMPTY_SCAN_SIZE - buf_ofs;
+				     jeb->offset + EMPTY_SCAN_SIZE(c->sector_size) < buf_ofs + buf_len))
+				scanend = jeb->offset + EMPTY_SCAN_SIZE(c->sector_size) - buf_ofs;
 			else
 				scanend = buf_len;
 

--=-yBOaXymdR4Ag/Ri9RQvp--
