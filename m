Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZLVP-0005FI-Cz
	for linux-mtd@lists.infradead.org; Tue, 30 Nov 2004 22:50:17 -0500
Date: Tue, 30 Nov 2004 19:50:03 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20041201035003.GA4258@slurryseal.ddns.mvista.com>
References: <20041123222521.GA17741@slurryseal.ddns.mvista.com>
	<1101304647.8191.9015.camel@hades.cambridge.redhat.com>
	<41A53246.7040704@mvista.com>
	<1101375381.13352.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1101375381.13352.22.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Supporting flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 25, 2004 at 09:36:21AM +0000, David Woodhouse wrote:
> On the new chips of which you speak, all the locking can do is give us a
> little more protection against random read/write cycles causing damage
> to the contents of the flash. So let's use it for that. Leave the flash
> locked at most times, and unlock a sector as we need to use it. 

To that end here's a new version of the patch that unlocks blocks as
written to, if a write to a writeable partition incurs EROFS.  If we
really wanted to go with that spirit, could relock afterwards.  This
patch drops the previous explicit partition lock flag.

Another possibility would be to add a quirk for these flashes that
rectifies the unlock status with the partition map (unlock all blocks
intended to be writeable) at init time and mtd resume time.  Or to add a
quirk that unlocks and relocks around writes, possibly in the chip
driver if we don't want to rely on the partition map for whether it's OK
to do so.

Suggestions?  Thanks -- Todd

Index: drivers/mtd/mtdpart.c
===================================================================
RCS file: /cvsdev/mvl-kernel/linux/drivers/mtd/mtdpart.c,v
retrieving revision 1.2.14.2.10.2
diff -u -r1.2.14.2.10.2 mtdpart.c
--- drivers/mtd/mtdpart.c	26 Aug 2004 22:07:09 -0000	1.2.14.2.10.2
+++ drivers/mtd/mtdpart.c	1 Dec 2004 02:45:39 -0000
@@ -124,23 +124,40 @@
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
+	int ret;
 	if (!(mtd->flags & MTD_WRITEABLE))
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
@@ -148,6 +165,7 @@
 			 u_char *eccbuf, struct nand_oobinfo *oobsel)
 {
 	struct mtd_part *part = PART(mtd);
+	int ret;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 	if (oobsel == NULL)
@@ -156,22 +174,44 @@
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
+	int ret;
 	if (!(mtd->flags & MTD_WRITEABLE))
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
@@ -182,12 +222,10 @@
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
@@ -197,6 +235,24 @@
 					NULL, &mtd->oobinfo);
 }
 
+static int part_writev (struct mtd_info *mtd,  const struct kvec *vecs,
+			 unsigned long count, loff_t to, size_t *retlen)
+{
+	struct mtd_part *part = PART(mtd);
+	int ret;
+	if (!(mtd->flags & MTD_WRITEABLE))
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
@@ -215,13 +271,25 @@
 			 u_char *eccbuf,  struct nand_oobinfo *oobsel)
 {
 	struct mtd_part *part = PART(mtd);
+	int ret;
 	if (!(mtd->flags & MTD_WRITEABLE))
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
@@ -245,7 +313,12 @@
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
 
