Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgker-0000gg-Ba
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:06:39 -0500
Date: Tue, 21 Dec 2004 15:06:17 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221140617.GX22636@wohnheim.fh-wedel.de>
References: <20041221134901.GN22636@wohnheim.fh-wedel.de>
	<20041221135139.GO22636@wohnheim.fh-wedel.de>
	<20041221135312.GP22636@wohnheim.fh-wedel.de>
	<20041221135405.GQ22636@wohnheim.fh-wedel.de>
	<20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
	<20041221140219.GU22636@wohnheim.fh-wedel.de>
	<20041221140322.GV22636@wohnheim.fh-wedel.de>
	<20041221140446.GW22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221140446.GW22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 18/22] Function renaming
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Renames _erase and _read functions and removes some leftover erase
region stuff.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   65 +++++++++++++++++++------------------------------------------
 1 files changed, 21 insertions(+), 44 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_renames	2004-12-20 22:54:59.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-21 01:05:20.000000000 +0100
@@ -223,59 +223,36 @@
 
 
 /* erase a specified part of the device */
-static int blkmtd_erase(struct mtd_info *mtd, struct erase_info *instr)
+static int blockmtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct blockmtd_dev *dev = mtd->priv;
-	struct mtd_erase_region_info *einfo = mtd->eraseregions;
-	int numregions = mtd->numeraseregions;
-	size_t from;
-	u_long len;
-	int err = -EIO;
+	size_t from = instr->addr;
+	size_t len = instr->len;
 	size_t retlen;
+	int err;
 
 	instr->state = MTD_ERASING;
-	from = instr->addr;
-	len = instr->len;
-
-	/* check erase region has valid start and length */
-	while (numregions) {
-		if (from >= einfo->offset && from < einfo->offset + (einfo->erasesize * einfo->numblocks)) {
-			if (len == einfo->erasesize && ((from - einfo->offset) % einfo->erasesize == 0))
-				break;
-		}
-		numregions--;
-		einfo++;
-	}
-
-	if (!numregions) {
-		/* Not a valid erase block */
-		ERROR("erase: invalid erase request 0x%lX @ 0x%08zX", len,from);
+	err = write_pages(dev, NULL, from, len, &retlen);
+	if (err || retlen != len) {
+		ERROR("erase failed err = %d", err);
 		instr->state = MTD_ERASE_FAILED;
-		err = -EIO;
-	}
-
-	if (instr->state != MTD_ERASE_FAILED) {
-		/* do the erase */
-		err = write_pages(dev, NULL, from, len, &retlen);
-		if (err || retlen != len) {
-			ERROR("erase failed err = %d", err);
-			instr->state = MTD_ERASE_FAILED;
-		} else {
-			instr->state = MTD_ERASE_DONE;
-		}
+	} else {
+		instr->state = MTD_ERASE_DONE;
 	}
 
+	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
 	return err;
 }
 
-static int blkmtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+
+static int blockmtd_read(struct mtd_info *mtd, loff_t from, size_t len,
+		size_t *retlen, u_char *buf)
 {
 	struct blockmtd_dev *dev = mtd->priv;
 	struct page *page;
-	//
 	int index = from >> PAGE_SHIFT;
-	int offset = from - (index << PAGE_SHIFT);
+	int offset = from & (PAGE_SHIFT-1);
 	int cpylen;
 
 	if (from > mtd->size)
@@ -298,7 +275,7 @@
 		if (!page)
 			return -ENOMEM;
 		if (IS_ERR(page))
-			return -EIO;
+			return PTR_ERR(page);
 
 		memcpy(buf, page_address(page) + offset, cpylen);
 		page_cache_release(page);
@@ -308,15 +285,14 @@
 		buf += cpylen;
 		offset = 0;
 		index++;
-
 	}
 	return 0;
 }
 
 
 /* write data to the underlying device */
-static int blkmtd_write(struct mtd_info *mtd, loff_t to, size_t len,
-			size_t *retlen, const u_char *buf)
+static int blockmtd_write(struct mtd_info *mtd, loff_t to, size_t len,
+		size_t *retlen, const u_char *buf)
 {
 	struct blockmtd_dev *dev = mtd->priv;
 	int err;
@@ -361,6 +337,7 @@
 }
 
 
+/* FIXME: ensure that mtd->size % erase_size == 0 */
 static struct blockmtd_dev *add_device(char *devname, int erase_size)
 {
 	struct block_device *bdev;
@@ -403,11 +380,11 @@
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.type = MTD_RAM;
 	dev->mtd.flags = MTD_CAP_RAM;
-	dev->mtd.erase = blkmtd_erase;
-	dev->mtd.write = blkmtd_write;
+	dev->mtd.erase = blockmtd_erase;
+	dev->mtd.write = blockmtd_write;
 	dev->mtd.writev = default_mtd_writev;
 	dev->mtd.sync = blockmtd_sync;
-	dev->mtd.read = blkmtd_read;
+	dev->mtd.read = blockmtd_read;
 	dev->mtd.readv = default_mtd_readv;
 	dev->mtd.priv = dev;
 	dev->mtd.owner = THIS_MODULE;
