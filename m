Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFjeb-0005zE-Ax
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2004 21:34:43 -0400
Date: Thu, 7 Oct 2004 18:34:19 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20041008013419.GA23146@slurryseal.ddns.mvista.com>
References: <20040925021907.D14A2A00043@mail.murgatroid.com>
	<1096108415.31730.4411.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1096108415.31730.4411.camel@imladris.demon.co.uk>
Cc: Christopher Hoover <ch@murgatroid.com>, linux-mtd@lists.infradead.org
Subject: Re: Supporting flash that is locked by default
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Another stab at handling flashes that bootup/resume with blocks locked:
The partition driver intercepts an EROFS return from the chip driver,
unlocks blocks, and retries the write/erase.  If the flash is not
writeable per the partition map, or if the partition has been locked,
then leave locked blocks alone.  This avoids the need to detect whether
the flash has the property that blocks for a partition intended to be
writeable may be locked anyway, and avoids a loop to unlock all
appropriate blocks at init time, as well as the need to save/restore
block lock status via a bitmap at suspend/resume time.

In order to allow a writeable partition to be setup but still explicitly
locked via flash_lock, a partition lock flag is added that is
set/cleared by flash_lock/unlock.  Blocks in a partition locked via
flash_lock will not be automatically cleared.  flash_lock will thus
trigger software locking a la the MTD_WRITEABLE flag in maps.  This
might be a good thing, regardless of the merits of the previous
paragraph.

Comments?  Thanks -- Todd

Index: drivers/mtd/mtdpart.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdpart.c,v
retrieving revision 1.50
diff -u -r1.50 mtdpart.c
--- drivers/mtd/mtdpart.c	10 Aug 2004 16:18:34 -0000	1.50
+++ drivers/mtd/mtdpart.c	8 Oct 2004 01:06:52 -0000
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
