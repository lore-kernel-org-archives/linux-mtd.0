Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtMW2-0000OQ-Dr
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 17:01:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] mtd: do not duplicate length and offset checks in drivers
Date: Fri,  3 Feb 2012 19:01:30 +0200
Message-Id: <1328288491-8744-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
References: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We already verify that offset and length are within the MTD device size
in the MTD API functions. Let's remove the duplicated checks in drivers.
This patch only affects the following API's:

'mtd_erase()'
'mtd_point()'
'mtd_unpoint()'
'mtd_get_unmapped_area()'
'mtd_read()'
'mtd_write()'
'mtd_panic_write()'
'mtd_lock()'
'mtd_unlock()'
'mtd_is_locked()'
'mtd_block_isbad()'
'mtd_block_markbad()'

This patch adds a bit of noise by removing too sparse empty lines, but this is
not too bad.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    2 +-
 drivers/mtd/chips/cfi_cmdset_0020.c |    9 --------
 drivers/mtd/chips/cfi_util.c        |    6 -----
 drivers/mtd/devices/block2mtd.c     |    9 --------
 drivers/mtd/devices/doc2000.c       |    8 -------
 drivers/mtd/devices/doc2001.c       |    8 -------
 drivers/mtd/devices/doc2001plus.c   |    8 -------
 drivers/mtd/devices/lart.c          |    5 ----
 drivers/mtd/devices/m25p80.c        |   12 -----------
 drivers/mtd/devices/ms02-nv.c       |    8 -------
 drivers/mtd/devices/mtd_dataflash.c |    7 ------
 drivers/mtd/devices/mtdram.c        |   17 ---------------
 drivers/mtd/devices/phram.c         |   23 ---------------------
 drivers/mtd/devices/pmc551.c        |   38 -----------------------------------
 drivers/mtd/devices/slram.c         |   23 ---------------------
 drivers/mtd/devices/spear_smi.c     |   12 -----------
 drivers/mtd/devices/sst25l.c        |    9 --------
 drivers/mtd/lpddr/lpddr_cmds.c      |    5 +---
 drivers/mtd/mtdconcat.c             |   26 -----------------------
 drivers/mtd/mtdpart.c               |   30 +--------------------------
 drivers/mtd/nand/nand_base.c        |   28 -------------------------
 drivers/mtd/onenand/onenand_base.c  |   20 ------------------
 drivers/mtd/ubi/gluebi.c            |   11 ----------
 23 files changed, 3 insertions(+), 321 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 4d04551..27008ae 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1324,7 +1324,7 @@ static int cfi_intelext_point(struct mtd_info *mtd, loff_t from, size_t len,
 	int chipnum;
 	int ret = 0;
 
-	if (!map->virt || (from + len > mtd->size))
+	if (!map->virt)
 		return -EINVAL;
 
 	/* Now lock the chip(s) to POINT state */
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 3861cca..160402f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -904,12 +904,6 @@ static int cfi_staa_erase_varsize(struct mtd_info *mtd,
 	int i, first;
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
 
-	if (instr->addr > mtd->size)
-		return -EINVAL;
-
-	if ((instr->len + instr->addr) > mtd->size)
-		return -EINVAL;
-
 	/* Check that both start and end of the requested erase are
 	 * aligned with the erasesize at the appropriate addresses.
 	 */
@@ -1155,9 +1149,6 @@ static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (len & (mtd->erasesize -1))
 		return -EINVAL;
 
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
-
 	chipnum = ofs >> cfi->chipshift;
 	adr = ofs - (chipnum << cfi->chipshift);
 
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 8e46405..f992418 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -173,12 +173,6 @@ int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
 	int i, first;
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
 
-	if (ofs > mtd->size)
-		return -EINVAL;
-
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
-
 	/* Check that both start and end of the requested erase are
 	 * aligned with the erasesize at the appropriate addresses.
 	 */
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 0fccf14..4c2f84c 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -104,11 +104,6 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int offset = from & (PAGE_SIZE-1);
 	int cpylen;
 
-	if (from > mtd->size)
-		return -EINVAL;
-	if (from + len > mtd->size)
-		len = mtd->size - from;
-
 	if (retlen)
 		*retlen = 0;
 
@@ -190,10 +185,6 @@ static int block2mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	if (!len)
 		return 0;
-	if (to >= mtd->size)
-		return -ENOSPC;
-	if (to + len > mtd->size)
-		len = mtd->size - to;
 
 	mutex_lock(&dev->write_mutex);
 	err = _block2mtd_write(dev, buf, to, len, retlen);
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index 115d890..ee4ee0b 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -602,10 +602,6 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int i, len256 = 0, ret=0;
 	size_t left = len;
 
-	/* Don't allow read past end of device */
-	if (from >= this->totlen)
-		return -EINVAL;
-
 	mutex_lock(&this->lock);
 
 	*retlen = 0;
@@ -748,10 +744,6 @@ static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t left = len;
 	int status;
 
-	/* Don't allow write past end of device */
-	if (to >= this->totlen)
-		return -EINVAL;
-
 	mutex_lock(&this->lock);
 
 	*retlen = 0;
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index b1185f9..1784415 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -383,10 +383,6 @@ static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[from >> (this->chipshift)];
 
-	/* Don't allow read past end of device */
-	if (from >= this->totlen)
-		return -EINVAL;
-
 	/* Don't allow a single read to cross a 512-byte block boundary */
 	if (from + len > ((from | 0x1ff) + 1))
 		len = ((from | 0x1ff) + 1) - from;
@@ -494,10 +490,6 @@ static int doc_write (struct mtd_info *mtd, loff_t to, size_t len,
 	void __iomem *docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[to >> (this->chipshift)];
 
-	/* Don't allow write past end of device */
-	if (to >= this->totlen)
-		return -EINVAL;
-
 #if 0
 	/* Don't allow a single write to cross a 512-byte block boundary */
 	if (to + len > ( (to | 0x1ff) + 1))
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index c9fbadd..a472bab 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -581,10 +581,6 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[from >> (this->chipshift)];
 
-	/* Don't allow read past end of device */
-	if (from >= this->totlen)
-		return -EINVAL;
-
 	/* Don't allow a single read to cross a 512-byte block boundary */
 	if (from + len > ((from | 0x1ff) + 1))
 		len = ((from | 0x1ff) + 1) - from;
@@ -700,10 +696,6 @@ static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 	void __iomem * docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[to >> (this->chipshift)];
 
-	/* Don't allow write past end of device */
-	if (to >= this->totlen)
-		return -EINVAL;
-
 	/* Don't allow writes which aren't exactly one block (512 bytes) */
 	if ((to & 0x1ff) || (len != 0x200))
 		return -EINVAL;
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 6d6502c..c9ae601 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -367,9 +367,6 @@ static int flash_erase (struct mtd_info *mtd,struct erase_info *instr)
    printk (KERN_DEBUG "%s(addr = 0x%.8x, len = %d)\n", __func__, instr->addr, instr->len);
 #endif
 
-   /* sanity checks */
-   if (instr->addr + instr->len > mtd->size) return (-EINVAL);
-
    /*
 	* check that both start and end of the requested erase are
 	* aligned with the erasesize at the appropriate addresses.
@@ -442,7 +439,6 @@ static int flash_read (struct mtd_info *mtd,loff_t from,size_t len,size_t *retle
 
    /* sanity checks */
    if (!len) return (0);
-   if (from + len > mtd->size) return (-EINVAL);
 
    /* we always read len bytes */
    *retlen = len;
@@ -526,7 +522,6 @@ static int flash_write (struct mtd_info *mtd,loff_t to,size_t len,size_t *retlen
 
    /* sanity checks */
    if (!len) return (0);
-   if (to + len > mtd->size) return (-EINVAL);
 
    /* first, we write a 0xFF.... padded byte until we reach a dword boundary */
    if (to & (BUSWIDTH - 1))
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 8808da9..0955a8f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -288,9 +288,6 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 			__func__, (long long)instr->addr,
 			(long long)instr->len);
 
-	/* sanity checks */
-	if (instr->addr + instr->len > flash->mtd.size)
-		return -EINVAL;
 	div_u64_rem(instr->len, mtd->erasesize, &rem);
 	if (rem)
 		return -EINVAL;
@@ -353,9 +350,6 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (!len)
 		return 0;
 
-	if (from + len > flash->mtd.size)
-		return -EINVAL;
-
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
@@ -423,9 +417,6 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (!len)
 		return(0);
 
-	if (to + len > flash->mtd.size)
-		return -EINVAL;
-
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
@@ -515,9 +506,6 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (!len)
 		return 0;
 
-	if (to + len > flash->mtd.size)
-		return -EINVAL;
-
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index 3a05af5..182849d 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -59,12 +59,8 @@ static int ms02nv_read(struct mtd_info *mtd, loff_t from,
 {
 	struct ms02nv_private *mp = mtd->priv;
 
-	if (from + len > mtd->size)
-		return -EINVAL;
-
 	memcpy(buf, mp->uaddr + from, len);
 	*retlen = len;
-
 	return 0;
 }
 
@@ -73,12 +69,8 @@ static int ms02nv_write(struct mtd_info *mtd, loff_t to,
 {
 	struct ms02nv_private *mp = mtd->priv;
 
-	if (to + len > mtd->size)
-		return -EINVAL;
-
 	memcpy(mp->uaddr + to, buf, len);
 	*retlen = len;
-
 	return 0;
 }
 
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index fd4a9fc..fc5c781 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -164,9 +164,6 @@ static int dataflash_erase(struct mtd_info *mtd, struct erase_info *instr)
 	      dev_name(&spi->dev), (long long)instr->addr,
 	      (long long)instr->len);
 
-	/* Sanity checks */
-	if (instr->addr + instr->len > mtd->size)
-		return -EINVAL;
 	div_u64_rem(instr->len, priv->page_size, &rem);
 	if (rem)
 		return -EINVAL;
@@ -257,8 +254,6 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	/* Sanity checks */
 	if (!len)
 		return 0;
-	if (from + len > mtd->size)
-		return -EINVAL;
 
 	/* Calculate flash page/byte address */
 	addr = (((unsigned)from / priv->page_size) << priv->page_offset)
@@ -333,8 +328,6 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Sanity checks */
 	if (!len)
 		return 0;
-	if ((to + len) > mtd->size)
-		return -EINVAL;
 
 	spi_message_init(&msg);
 
diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index e1f017b..0e0e6ed 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -34,27 +34,18 @@ static struct mtd_info *mtd_info;
 
 static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
-	if (instr->addr + instr->len > mtd->size)
-		return -EINVAL;
-
 	memset((char *)mtd->priv + instr->addr, 0xff, instr->len);
-
 	instr->state = MTD_ERASE_DONE;
 	mtd_erase_callback(instr);
-
 	return 0;
 }
 
 static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	if (from + len > mtd->size)
-		return -EINVAL;
-
 	/* can we return a physical address with this driver? */
 	if (phys)
 		return -EINVAL;
-
 	*virt = mtd->priv + from;
 	*retlen = len;
 	return 0;
@@ -81,11 +72,7 @@ static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
 static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
-	if (from + len > mtd->size)
-		return -EINVAL;
-
 	memcpy(buf, mtd->priv + from, len);
-
 	*retlen = len;
 	return 0;
 }
@@ -93,11 +80,7 @@ static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
 static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
-	if (to + len > mtd->size)
-		return -EINVAL;
-
 	memcpy((char *)mtd->priv + to, buf, len);
-
 	*retlen = len;
 	return 0;
 }
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 3803555..36add7c 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -38,29 +38,20 @@ static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	u_char *start = mtd->priv;
 
-	if (instr->addr + instr->len > mtd->size)
-		return -EINVAL;
-
 	memset(start + instr->addr, 0xff, instr->len);
 
 	/* This'll catch a few races. Free the thing before returning :)
 	 * I don't feel at all ashamed. This kind of thing is possible anyway
 	 * with flash, but unlikely.
 	 */
-
 	instr->state = MTD_ERASE_DONE;
-
 	mtd_erase_callback(instr);
-
 	return 0;
 }
 
 static int phram_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
-	if (from + len > mtd->size)
-		return -EINVAL;
-
 	/* can we return a physical address with this driver? */
 	if (phys)
 		return -EINVAL;
@@ -80,14 +71,7 @@ static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	u_char *start = mtd->priv;
 
-	if (from >= mtd->size)
-		return -EINVAL;
-
-	if (len > mtd->size - from)
-		len = mtd->size - from;
-
 	memcpy(buf, start + from, len);
-
 	*retlen = len;
 	return 0;
 }
@@ -97,14 +81,7 @@ static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 {
 	u_char *start = mtd->priv;
 
-	if (to >= mtd->size)
-		return -EINVAL;
-
-	if (len > mtd->size - to)
-		len = mtd->size - to;
-
 	memcpy(start + to, buf, len);
-
 	*retlen = len;
 	return 0;
 }
diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 40a96c7..725198d 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -116,16 +116,6 @@ static int pmc551_erase(struct mtd_info *mtd, struct erase_info *instr)
 #endif
 
 	end = instr->addr + instr->len - 1;
-
-	/* Is it past the end? */
-	if (end > mtd->size) {
-#ifdef CONFIG_MTD_PMC551_DEBUG
-		printk(KERN_DEBUG "pmc551_erase() out of bounds (%ld > %ld)\n",
-			(long)end, (long)mtd->size);
-#endif
-		return -EINVAL;
-	}
-
 	eoff_hi = end & ~(priv->asize - 1);
 	soff_hi = instr->addr & ~(priv->asize - 1);
 	eoff_lo = end & (priv->asize - 1);
@@ -179,14 +169,6 @@ static int pmc551_point(struct mtd_info *mtd, loff_t from, size_t len,
 	printk(KERN_DEBUG "pmc551_point(%ld, %ld)\n", (long)from, (long)len);
 #endif
 
-	if (from + len > mtd->size) {
-#ifdef CONFIG_MTD_PMC551_DEBUG
-		printk(KERN_DEBUG "pmc551_point() out of bounds (%ld > %ld)\n",
-			(long)from + len, (long)mtd->size);
-#endif
-		return -EINVAL;
-	}
-
 	/* can we return a physical address with this driver? */
 	if (phys)
 		return -EINVAL;
@@ -229,16 +211,6 @@ static int pmc551_read(struct mtd_info *mtd, loff_t from, size_t len,
 #endif
 
 	end = from + len - 1;
-
-	/* Is it past the end? */
-	if (end > mtd->size) {
-#ifdef CONFIG_MTD_PMC551_DEBUG
-		printk(KERN_DEBUG "pmc551_read() out of bounds (%ld > %ld)\n",
-			(long)end, (long)mtd->size);
-#endif
-		return -EINVAL;
-	}
-
 	soff_hi = from & ~(priv->asize - 1);
 	eoff_hi = end & ~(priv->asize - 1);
 	soff_lo = from & (priv->asize - 1);
@@ -296,16 +268,6 @@ static int pmc551_write(struct mtd_info *mtd, loff_t to, size_t len,
 #endif
 
 	end = to + len - 1;
-	/* Is it past the end?  or did the u32 wrap? */
-	if (end > mtd->size) {
-#ifdef CONFIG_MTD_PMC551_DEBUG
-		printk(KERN_DEBUG "pmc551_write() out of bounds (end: %ld, "
-			"size: %ld, to: %ld)\n", (long)end, (long)mtd->size,
-			(long)to);
-#endif
-		return -EINVAL;
-	}
-
 	soff_hi = to & ~(priv->asize - 1);
 	eoff_hi = end & ~(priv->asize - 1);
 	soff_lo = to & (priv->asize - 1);
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 9431ffc..842e489 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -84,21 +84,13 @@ static int slram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	slram_priv_t *priv = mtd->priv;
 
-	if (instr->addr + instr->len > mtd->size) {
-		return(-EINVAL);
-	}
-
 	memset(priv->start + instr->addr, 0xff, instr->len);
-
 	/* This'll catch a few races. Free the thing before returning :)
 	 * I don't feel at all ashamed. This kind of thing is possible anyway
 	 * with flash, but unlikely.
 	 */
-
 	instr->state = MTD_ERASE_DONE;
-
 	mtd_erase_callback(instr);
-
 	return(0);
 }
 
@@ -110,10 +102,6 @@ static int slram_point(struct mtd_info *mtd, loff_t from, size_t len,
 	/* can we return a physical address with this driver? */
 	if (phys)
 		return -EINVAL;
-
-	if (from + len > mtd->size)
-		return -EINVAL;
-
 	*virt = priv->start + from;
 	*retlen = len;
 	return(0);
@@ -129,14 +117,7 @@ static int slram_read(struct mtd_info *mtd, loff_t from, size_t len,
 {
 	slram_priv_t *priv = mtd->priv;
 
-	if (from > mtd->size)
-		return -EINVAL;
-
-	if (from + len > mtd->size)
-		len = mtd->size - from;
-
 	memcpy(buf, priv->start + from, len);
-
 	*retlen = len;
 	return(0);
 }
@@ -146,11 +127,7 @@ static int slram_write(struct mtd_info *mtd, loff_t to, size_t len,
 {
 	slram_priv_t *priv = mtd->priv;
 
-	if (to + len > mtd->size)
-		return -EINVAL;
-
 	memcpy(priv->start + to, buf, len);
-
 	*retlen = len;
 	return(0);
 }
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index b4c02d6..f7b9949 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -512,10 +512,6 @@ static int spear_mtd_erase(struct mtd_info *mtd, struct erase_info *e_info)
 	if (!flash || !dev)
 		return -ENODEV;
 
-	/* do not allow erase past end of device */
-	if (e_info->addr + e_info->len > flash->mtd.size)
-		return -EINVAL;
-
 	bank = flash->bank;
 	if (bank > dev->num_flashes - 1) {
 		dev_err(&dev->pdev->dev, "Invalid Bank Num");
@@ -575,10 +571,6 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (!flash || !dev)
 		return -ENODEV;
 
-	/* do not allow reads past end of device */
-	if (from + len > flash->mtd.size)
-		return -EINVAL;
-
 	if (flash->bank > dev->num_flashes - 1) {
 		dev_err(&dev->pdev->dev, "Invalid Bank Num");
 		return -EINVAL;
@@ -680,10 +672,6 @@ static int spear_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (!len)
 		return 0;
 
-	/* do not allow write past end of page */
-	if (to + len > flash->mtd.size)
-		return -EINVAL;
-
 	if (flash->bank > dev->num_flashes - 1) {
 		dev_err(&dev->pdev->dev, "Invalid Bank Num");
 		return -EINVAL;
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 8b9ffaf..99d4a3c 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -175,9 +175,6 @@ static int sst25l_erase(struct mtd_info *mtd, struct erase_info *instr)
 	int err;
 
 	/* Sanity checks */
-	if (instr->addr + instr->len > flash->mtd.size)
-		return -EINVAL;
-
 	if ((uint32_t)instr->len % mtd->erasesize)
 		return -EINVAL;
 
@@ -227,9 +224,6 @@ static int sst25l_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len == 0)
 		return 0;
 
-	if (from + len > flash->mtd.size)
-		return -EINVAL;
-
 	if (retlen)
 		*retlen = 0;
 
@@ -278,9 +272,6 @@ static int sst25l_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (!len)
 		return 0;
 
-	if (to + len > flash->mtd.size)
-		return -EINVAL;
-
 	if ((uint32_t)to % mtd->writesize)
 		return -EINVAL;
 
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index de960b1..0f3731c 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -530,7 +530,7 @@ static int lpddr_point(struct mtd_info *mtd, loff_t adr, size_t len,
 	struct flchip *chip = &lpddr->chips[chipnum];
 	int ret = 0;
 
-	if (!map->virt || (adr + len > mtd->size))
+	if (!map->virt)
 		return -EINVAL;
 
 	/* ofs: offset within the first chip that the first read should start */
@@ -692,9 +692,6 @@ static int lpddr_erase(struct mtd_info *mtd, struct erase_info *instr)
 	ofs = instr->addr;
 	len = instr->len;
 
-	if (ofs > mtd->size || (len + ofs) > mtd->size)
-		return -EINVAL;
-
 	while (len > 0) {
 		ret = do_erase_oneblock(mtd, ofs);
 		if (ret)
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index d826a8a..1f20718 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -185,10 +185,6 @@ concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	for (i = 0; i < count; i++)
 		total_len += vecs[i].iov_len;
 
-	/* Do not allow write past end of device */
-	if ((to + total_len) > mtd->size)
-		return -EINVAL;
-
 	/* Check alignment */
 	if (mtd->writesize > 1) {
 		uint64_t __to = to;
@@ -406,12 +402,6 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
 
-	if (instr->addr > concat->mtd.size)
-		return -EINVAL;
-
-	if (instr->len + instr->addr > concat->mtd.size)
-		return -EINVAL;
-
 	/*
 	 * Check for proper erase block alignment of the to-be-erased area.
 	 * It is easier to do this based on the super device's erase
@@ -538,9 +528,6 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = -EINVAL;
 
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
-
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 		uint64_t size;
@@ -575,9 +562,6 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = 0;
 
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
-
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 		uint64_t size;
@@ -650,9 +634,6 @@ static int concat_block_isbad(struct mtd_info *mtd, loff_t ofs)
 	if (!mtd_can_have_bb(concat->subdev[0]))
 		return res;
 
-	if (ofs > mtd->size)
-		return -EINVAL;
-
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 
@@ -673,9 +654,6 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = -EINVAL;
 
-	if (ofs > mtd->size)
-		return -EINVAL;
-
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 
@@ -713,10 +691,6 @@ static unsigned long concat_get_unmapped_area(struct mtd_info *mtd,
 			continue;
 		}
 
-		/* we've found the subdev over which the mapping will reside */
-		if (offset + len > subdev->size)
-			return (unsigned long) -EINVAL;
-
 		return mtd_get_unmapped_area(subdev, len, offset, flags);
 	}
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index da8a0b2..fbe2c8a 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -65,11 +65,6 @@ static int part_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int res;
 
 	stats = part->master->ecc_stats;
-
-	if (from >= mtd->size)
-		len = 0;
-	else if (from + len > mtd->size)
-		len = mtd->size - from;
 	res = mtd_read(part->master, from + part->offset, len, retlen, buf);
 	if (unlikely(res)) {
 		if (mtd_is_bitflip(res))
@@ -84,10 +79,7 @@ static int part_point(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, void **virt, resource_size_t *phys)
 {
 	struct mtd_part *part = PART(mtd);
-	if (from >= mtd->size)
-		len = 0;
-	else if (from + len > mtd->size)
-		len = mtd->size - from;
+
 	return mtd_point(part->master, from + part->offset, len, retlen,
 			 virt, phys);
 }
@@ -182,10 +174,6 @@ static int part_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_part *part = PART(mtd);
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	if (to >= mtd->size)
-		len = 0;
-	else if (to + len > mtd->size)
-		len = mtd->size - to;
 	return mtd_write(part->master, to + part->offset, len, retlen, buf);
 }
 
@@ -195,10 +183,6 @@ static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_part *part = PART(mtd);
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	if (to >= mtd->size)
-		len = 0;
-	else if (to + len > mtd->size)
-		len = mtd->size - to;
 	return mtd_panic_write(part->master, to + part->offset, len, retlen,
 			       buf);
 }
@@ -248,8 +232,6 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 	int ret;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	if (instr->addr >= mtd->size)
-		return -EINVAL;
 	instr->addr += part->offset;
 	ret = mtd_erase(part->master, instr);
 	if (ret) {
@@ -277,24 +259,18 @@ EXPORT_SYMBOL_GPL(mtd_erase_callback);
 static int part_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
 	return mtd_lock(part->master, ofs + part->offset, len);
 }
 
 static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
 	return mtd_unlock(part->master, ofs + part->offset, len);
 }
 
 static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	if ((len + ofs) > mtd->size)
-		return -EINVAL;
 	return mtd_is_locked(part->master, ofs + part->offset, len);
 }
 
@@ -319,8 +295,6 @@ static void part_resume(struct mtd_info *mtd)
 static int part_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct mtd_part *part = PART(mtd);
-	if (ofs >= mtd->size)
-		return -EINVAL;
 	ofs += part->offset;
 	return mtd_block_isbad(part->master, ofs);
 }
@@ -332,8 +306,6 @@ static int part_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	if (ofs >= mtd->size)
-		return -EINVAL;
 	ofs += part->offset;
 	res = mtd_block_markbad(part->master, ofs);
 	if (!res)
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 05f8243..daaa6a5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -123,12 +123,6 @@ static int check_offs_len(struct mtd_info *mtd,
 		ret = -EINVAL;
 	}
 
-	/* Do not allow past end of device */
-	if (ofs + len > mtd->size) {
-		pr_debug("%s: past end of device\n", __func__);
-		ret = -EINVAL;
-	}
-
 	return ret;
 }
 
@@ -1608,25 +1602,17 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	/* Do not allow reads past end of device */
-	if ((from + len) > mtd->size)
-		return -EINVAL;
 	if (!len)
 		return 0;
 
 	nand_get_device(chip, mtd, FL_READING);
-
 	ops.len = len;
 	ops.datbuf = buf;
 	ops.oobbuf = NULL;
 	ops.mode = 0;
-
 	ret = nand_do_read_ops(mtd, from, &ops);
-
 	*retlen = ops.retlen;
-
 	nand_release_device(mtd);
-
 	return ret;
 }
 
@@ -2316,8 +2302,6 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int ret;
 
 	/* Do not allow reads past end of device */
-	if ((to + len) > mtd->size)
-		return -EINVAL;
 	if (!len)
 		return 0;
 
@@ -2355,25 +2339,17 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	/* Do not allow reads past end of device */
-	if ((to + len) > mtd->size)
-		return -EINVAL;
 	if (!len)
 		return 0;
 
 	nand_get_device(chip, mtd, FL_WRITING);
-
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
 	ops.oobbuf = NULL;
 	ops.mode = 0;
-
 	ret = nand_do_write_ops(mtd, to, &ops);
-
 	*retlen = ops.retlen;
-
 	nand_release_device(mtd);
-
 	return ret;
 }
 
@@ -2737,10 +2713,6 @@ static void nand_sync(struct mtd_info *mtd)
  */
 static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
-	/* Check for invalid offset */
-	if (offs > mtd->size)
-		return -EINVAL;
-
 	return nand_block_checkbad(mtd, offs, 1, 0);
 }
 
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 914c49b..9c6445d 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1756,13 +1756,6 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Initialize retlen, in case of early exit */
 	*retlen = 0;
 
-	/* Do not allow writes past end of device */
-	if (unlikely((to + len) > mtd->size)) {
-		printk(KERN_ERR "%s: Attempt write to past end of device\n",
-			__func__);
-		return -EINVAL;
-	}
-
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
 		printk(KERN_ERR "%s: Attempt to write not page aligned data\n",
@@ -1890,13 +1883,6 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	ops->retlen = 0;
 	ops->oobretlen = 0;
 
-	/* Do not allow writes past end of device */
-	if (unlikely((to + len) > mtd->size)) {
-		printk(KERN_ERR "%s: Attempt write to past end of device\n",
-			__func__);
-		return -EINVAL;
-	}
-
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
 		printk(KERN_ERR "%s: Attempt to write not page aligned data\n",
@@ -2493,12 +2479,6 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 			(unsigned long long)instr->addr,
 			(unsigned long long)instr->len);
 
-	/* Do not allow erase past end of device */
-	if (unlikely((len + addr) > mtd->size)) {
-		printk(KERN_ERR "%s: Erase past end of device\n", __func__);
-		return -EINVAL;
-	}
-
 	if (FLEXONENAND(this)) {
 		/* Find the eraseregion of this address */
 		int i = flexonenand_region(mtd, addr);
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index 0101dce..b875c2c 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -174,11 +174,7 @@ static int gluebi_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int err = 0, lnum, offs, total_read;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || from < 0 || from + len > mtd->size)
-		return -EINVAL;
-
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
-
 	lnum = div_u64_rem(from, mtd->erasesize, &offs);
 	total_read = len;
 	while (total_read) {
@@ -218,9 +214,6 @@ static int gluebi_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int err = 0, lnum, offs, total_written;
 	struct gluebi_device *gluebi;
 
-	if (len < 0 || to < 0 || len + to > mtd->size)
-		return -EINVAL;
-
 	gluebi = container_of(mtd, struct gluebi_device, mtd);
 
 	if (!(mtd->flags & MTD_WRITEABLE))
@@ -265,10 +258,6 @@ static int gluebi_erase(struct mtd_info *mtd, struct erase_info *instr)
 	int err, i, lnum, count;
 	struct gluebi_device *gluebi;
 
-	if (instr->addr < 0 || instr->addr > mtd->size - mtd->erasesize)
-		return -EINVAL;
-	if (instr->len < 0 || instr->addr + instr->len > mtd->size)
-		return -EINVAL;
 	if (mtd_mod_by_ws(instr->addr, mtd) || mtd_mod_by_ws(instr->len, mtd))
 		return -EINVAL;
 
-- 
1.7.9
