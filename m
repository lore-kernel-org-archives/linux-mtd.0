Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWj6E-000457-CM
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2004 17:25:29 -0500
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id OAA02764
	for <linux-mtd@lists.infradead.org>; Tue, 23 Nov 2004 14:25:22 -0800
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	iANMPMLV017798
	for <linux-mtd@lists.infradead.org>; Tue, 23 Nov 2004 14:25:22 -0800
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id iANMPL4I017796
	for linux-mtd@lists.infradead.org; Tue, 23 Nov 2004 14:25:21 -0800
Date: Tue, 23 Nov 2004 14:25:21 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041123222521.GA17741@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Supporting flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Flash chips that power up with all blocks locked (such as K3
StrataFlash) seem to be showing up on more and more platforms.  At the
risk of being a pest, I'd like to push for some agreement on how to
handle this and possibly get the support into linux-mtd.

Below is a patch to the partition driver to use the partition map as the
source of information for whether a partition is to be writeable and to
unlock blocks upon write if the block is found to be locked when this
was not intended.  It intercepts an EROFS return from the chip driver on
a write/erase, unlocks blocks, and retries the write/erase, if the
partition is marked writeable.  If the partition is not writeable, or if
the partition has been explicitly locked, then the locked blocks are
left alone and the EROFS is returned to the caller.

This avoids the need to detect whether the chip has the property that
blocks intended to be writeable may be locked at boot or system resume
time (and you wouldn't want to do it for all chips due to complications
of some other flash chips), and avoids the overhead of unlocking every
writeable block (if not actually written to).  Also note that some
platforms power cycle the flash device during a system suspend,
reverting blocks to all locked state at system resume time, so a resume
time action is needed as well.  Also note that the code to read the
current state of lock bits might not be functioning properly for all
chips.

In order to allow a writeable partition to be setup but still explicitly
locked via flash_lock, a partition lock flag is added that is
set/cleared by flash_lock/unlock.  Blocks in a partition locked via
flash_lock will not be written to.  flash_lock/unlock thus dynamically
enable/disable software locking, a la a runtime settable MTD_WRITEABLE
flag.

If anyone has any suggestions or comments as to why this wouldn't work
for their device or usage model or why this isn't the right way to go
about things then I'd appreciate it, thanks. -- Todd

Index: drivers/mtd/mtdpart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdpart.c,v
retrieving revision 1.51
diff -u -r1.51 mtdpart.c
--- drivers/mtd/mtdpart.c	16 Nov 2004 18:28:59 -0000	1.51
+++ drivers/mtd/mtdpart.c	23 Nov 2004 01:55:42 -0000
@@ -33,8 +33,11 @@
 	int index;
 	struct list_head list;
 	int registered;
+	int flags;
 };
 
+#define PART_LOCKED 1
+
 /*
  * Given a pointer to the MTD object in the mtd_part structure, we can retrieve
  * the pointer to that structure with this macro.
@@ -124,23 +127,40 @@
 					len, retlen, buf);
 }
 
+static int part_do_write (struct mtd_info *mtd, loff_t to, size_t len,
+			  size_t *retlen, const u_char *buf)
+{
+	struct mtd_part *part = PART(mtd);
+
+	if (part->master->write_ecc == NULL)	
+		return part->master->write (part->master, to + part->offset, 
+					    len, retlen, buf);
+	else
+		return part->master->write_ecc (part->master, to + part->offset,
+						len, retlen, buf, NULL,
+						&mtd->oobinfo);
+}
+
 static int part_write (struct mtd_info *mtd, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
+	int ret;
+	if (! (mtd->flags & MTD_WRITEABLE) || part->flags & PART_LOCKED)
 		return -EROFS;
 	if (to >= mtd->size)
 		len = 0;
 	else if (to + len > mtd->size)
 		len = mtd->size - to;
-	if (part->master->write_ecc == NULL)	
-		return part->master->write (part->master, to + part->offset, 
-					len, retlen, buf);
-	else
-		return part->master->write_ecc (part->master, to + part->offset, 
-					len, retlen, buf, NULL, &mtd->oobinfo);
-							
+
+	if (((ret = part_do_write (mtd, to, len, retlen, buf)) == -EROFS) &&
+	    part->master->unlock) {
+		loff_t baddr = (to + part->offset) & ~(mtd->erasesize - 1);
+		if (! part->master->unlock (part->master, baddr,
+					    mtd->erasesize))
+			ret = part_do_write (mtd, to, len, retlen, buf);
+	}
+	return ret;			
 }
 
 static int part_write_ecc (struct mtd_info *mtd, loff_t to, size_t len,
@@ -148,7 +168,8 @@
 			 u_char *eccbuf, struct nand_oobinfo *oobsel)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
+	int ret;
+	if (! (mtd->flags & MTD_WRITEABLE) || part->flags & PART_LOCKED)
 		return -EROFS;
 	if (oobsel == NULL)
 		oobsel = &mtd->oobinfo;
@@ -156,22 +177,44 @@
 		len = 0;
 	else if (to + len > mtd->size)
 		len = mtd->size - to;
-	return part->master->write_ecc (part->master, to + part->offset, 
-					len, retlen, buf, eccbuf, oobsel);
+	if (((ret = part->master->write_ecc (part->master, to + part->offset,
+					     len, retlen, buf, eccbuf, 
+					     oobsel)) == -EROFS) &&
+	    part->master->unlock) {
+		loff_t baddr = (to + part->offset) & ~(mtd->erasesize - 1);
+		if (! part->master->unlock (part->master, baddr,
+					    mtd->erasesize))
+			ret = part->master->write_ecc (part->master,
+						       to + part->offset,
+						       len, retlen, buf, 
+						       eccbuf, oobsel);
+	}
+	return ret;			
 }
 
 static int part_write_oob (struct mtd_info *mtd, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
+	int ret;
+	if (! (mtd->flags & MTD_WRITEABLE) || part->flags & PART_LOCKED)
 		return -EROFS;
 	if (to >= mtd->size)
 		len = 0;
 	else if (to + len > mtd->size)
 		len = mtd->size - to;
-	return part->master->write_oob (part->master, to + part->offset, 
-					len, retlen, buf);
+	if (((ret = part->master->write_oob (part->master, to + part->offset,
+					     len, retlen, buf)) == -EROFS) &&
+	    part->master->unlock) {
+		loff_t baddr = (to + part->offset) & ~(mtd->erasesize - 1);
+		if (! part->master->unlock (part->master, baddr,
+					    mtd->erasesize))
+			ret = part->master->write_oob (part->master, 
+						       to + part->offset, len,
+						       retlen, buf);
+	}
+
+	return ret;
 }
 
 static int part_write_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, 
@@ -182,12 +225,10 @@
 					len, retlen, buf);
 }
 
-static int part_writev (struct mtd_info *mtd,  const struct kvec *vecs,
-			 unsigned long count, loff_t to, size_t *retlen)
+static int part_do_writev (struct mtd_info *mtd,  const struct kvec *vecs,
+			   unsigned long count, loff_t to, size_t *retlen)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
-		return -EROFS;
 	if (part->master->writev_ecc == NULL)	
 		return part->master->writev (part->master, vecs, count,
 					to + part->offset, retlen);
@@ -197,6 +238,24 @@
 					NULL, &mtd->oobinfo);
 }
 
+static int part_writev (struct mtd_info *mtd,  const struct kvec *vecs,
+			 unsigned long count, loff_t to, size_t *retlen)
+{
+	struct mtd_part *part = PART(mtd);
+	int ret;
+	if (! (mtd->flags & MTD_WRITEABLE) || part->flags & PART_LOCKED)
+		return -EROFS;
+
+	if (((ret = part_do_writev (mtd, vecs, count, to, retlen)) == -EROFS)
+	    && part->master->unlock) {
+		loff_t baddr = (to + part->offset) & ~(mtd->erasesize - 1);
+		if (! part->master->unlock (part->master, baddr,
+					    mtd->erasesize))
+			ret = part_do_writev (mtd, vecs, count, to, retlen);
+	}
+	return ret;			
+}
+
 static int part_readv (struct mtd_info *mtd,  struct kvec *vecs,
 			 unsigned long count, loff_t from, size_t *retlen)
 {
@@ -215,13 +274,25 @@
 			 u_char *eccbuf,  struct nand_oobinfo *oobsel)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
+	int ret;
+	if (! (mtd->flags & MTD_WRITEABLE) || part->flags & PART_LOCKED)
 		return -EROFS;
 	if (oobsel == NULL)
 		oobsel = &mtd->oobinfo;
-	return part->master->writev_ecc (part->master, vecs, count,
-					to + part->offset, retlen,
-					eccbuf, oobsel);
+	if (((ret = part->master->writev_ecc (part->master, vecs, count,
+					      to + part->offset, retlen,
+					      eccbuf, oobsel)) == -EROFS) &&
+	    part->master->unlock) {
+		loff_t baddr = (to + part->offset) & ~(mtd->erasesize - 1);
+		if (! part->master->unlock (part->master, baddr,
+					    mtd->erasesize))
+			ret = part->master->writev_ecc (part->master, vecs, 
+							count,
+							to + part->offset, 
+							retlen, eccbuf, oobsel);
+	}
+	return ret;			
+
 }
 
 static int part_readv_ecc (struct mtd_info *mtd,  struct kvec *vecs,
@@ -240,12 +311,17 @@
 {
 	struct mtd_part *part = PART(mtd);
 	int ret;
-	if (!(mtd->flags & MTD_WRITEABLE))
+	if (! (mtd->flags & MTD_WRITEABLE) || part->flags & PART_LOCKED)
 		return -EROFS;
 	if (instr->addr >= mtd->size)
 		return -EINVAL;
 	instr->addr += part->offset;
-	ret = part->master->erase(part->master, instr);
+	if ((ret = part->master->erase(part->master, instr) == -EROFS) &&
+	    part->master->unlock &&
+	    (! part->master->unlock (part->master, instr->addr,
+				     mtd->erasesize)))
+		ret = part->master->erase(part->master, instr);
+
 	return ret;
 }
 
@@ -268,6 +344,7 @@
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size) 
 		return -EINVAL;
+	part->flags |= PART_LOCKED;
 	return part->master->lock(part->master, ofs + part->offset, len);
 }
 
@@ -276,6 +353,7 @@
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size) 
 		return -EINVAL;
+	part->flags &= ~PART_LOCKED;
 	return part->master->unlock(part->master, ofs + part->offset, len);
 }
 
@@ -309,7 +387,7 @@
 static int part_block_markbad (struct mtd_info *mtd, loff_t ofs)
 {
 	struct mtd_part *part = PART(mtd);
-	if (!(mtd->flags & MTD_WRITEABLE))
+	if (! (mtd->flags & MTD_WRITEABLE) || part->flags & PART_LOCKED)
 		return -EROFS;
 	if (ofs >= mtd->size)
 		return -EINVAL;
