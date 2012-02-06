Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RuNHj-00071i-ER
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2012 12:03:08 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] mtd: remove retlen zeroing duplication
Date: Mon,  6 Feb 2012 14:03:07 +0200
Message-Id: <1328529789-2106-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The MTD API function now zero the 'retlen' parameter before calling
the driver's method - do not do this again in dirvers. This removes
duplicated '*retlen = 0' assignent from the following methods:

    'mtd_point()'
    'mtd_read()'
    'mtd_write()'
    'mtd_writev()'
    'mtd_panic_write()'

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    5 -----
 drivers/mtd/chips/cfi_cmdset_0002.c |   12 ------------
 drivers/mtd/chips/cfi_cmdset_0020.c |    3 ---
 drivers/mtd/chips/map_absent.c      |    2 --
 drivers/mtd/devices/block2mtd.c     |    5 -----
 drivers/mtd/devices/doc2000.c       |    4 ----
 drivers/mtd/devices/doc2001.c       |    1 -
 drivers/mtd/devices/doc2001plus.c   |    1 -
 drivers/mtd/devices/lart.c          |    2 --
 drivers/mtd/devices/m25p80.c        |    7 -------
 drivers/mtd/devices/mtd_dataflash.c |    4 ----
 drivers/mtd/devices/phram.c         |    2 --
 drivers/mtd/devices/spear_smi.c     |   10 ----------
 drivers/mtd/devices/sst25l.c        |    3 ---
 drivers/mtd/lpddr/lpddr_cmds.c      |    3 ---
 drivers/mtd/mtdconcat.c             |    6 ------
 drivers/mtd/onenand/onenand_base.c  |    3 ---
 17 files changed, 0 insertions(+), 73 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 27008ae..dc66df6 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1334,7 +1334,6 @@ static int cfi_intelext_point(struct mtd_info *mtd, loff_t from, size_t len,
 	ofs = from - (chipnum << cfi->chipshift);
 
 	*virt = map->virt + cfi->chips[chipnum].start + ofs;
-	*retlen = 0;
 	if (phys)
 		*phys = map->phys + cfi->chips[chipnum].start + ofs;
 
@@ -1460,8 +1459,6 @@ static int cfi_intelext_read (struct mtd_info *mtd, loff_t from, size_t len, siz
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum <<  cfi->chipshift);
 
-	*retlen = 0;
-
 	while (len) {
 		unsigned long thislen;
 
@@ -1569,7 +1566,6 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 	int chipnum;
 	unsigned long ofs;
 
-	*retlen = 0;
 	if (!len)
 		return 0;
 
@@ -1817,7 +1813,6 @@ static int cfi_intelext_writev (struct mtd_info *mtd, const struct kvec *vecs,
 	for (i = 0; i < count; i++)
 		len += vecs[i].iov_len;
 
-	*retlen = 0;
 	if (!len)
 		return 0;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 27ac062..a89d899 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1017,13 +1017,9 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 	int ret = 0;
 
 	/* ofs: offset within the first chip that the first read should start */
-
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum <<  cfi->chipshift);
 
-
-	*retlen = 0;
-
 	while (len) {
 		unsigned long thislen;
 
@@ -1101,16 +1097,11 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
 	int chipnum;
 	int ret = 0;
 
-
 	/* ofs: offset within the first chip that the first read should start */
-
 	/* 8 secsi bytes per chip */
 	chipnum=from>>3;
 	ofs=from & 7;
 
-
-	*retlen = 0;
-
 	while (len) {
 		unsigned long thislen;
 
@@ -1255,7 +1246,6 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	unsigned long ofs, chipstart;
 	DECLARE_WAITQUEUE(wait, current);
 
-	*retlen = 0;
 	if (!len)
 		return 0;
 
@@ -1497,7 +1487,6 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 	int chipnum;
 	unsigned long ofs;
 
-	*retlen = 0;
 	if (!len)
 		return 0;
 
@@ -1708,7 +1697,6 @@ static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int ret = 0;
 	int chipnum;
 
-	*retlen = 0;
 	if (!len)
 		return 0;
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index 160402f..d690b7d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -394,8 +394,6 @@ static int cfi_staa_read (struct mtd_info *mtd, loff_t from, size_t len, size_t
 	chipnum = (from >> cfi->chipshift);
 	ofs = from - (chipnum <<  cfi->chipshift);
 
-	*retlen = 0;
-
 	while (len) {
 		unsigned long thislen;
 
@@ -617,7 +615,6 @@ static int cfi_staa_write_buffers (struct mtd_info *mtd, loff_t to,
 	int chipnum;
 	unsigned long ofs;
 
-	*retlen = 0;
 	if (!len)
 		return 0;
 
diff --git a/drivers/mtd/chips/map_absent.c b/drivers/mtd/chips/map_absent.c
index 6be2edd..f7a5bca 100644
--- a/drivers/mtd/chips/map_absent.c
+++ b/drivers/mtd/chips/map_absent.c
@@ -70,13 +70,11 @@ static struct mtd_info *map_absent_probe(struct map_info *map)
 
 static int map_absent_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
 {
-	*retlen = 0;
 	return -ENODEV;
 }
 
 static int map_absent_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
 {
-	*retlen = 0;
 	return -ENODEV;
 }
 
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 4c2f84c..ba2d74b 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -104,9 +104,6 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int offset = from & (PAGE_SIZE-1);
 	int cpylen;
 
-	if (retlen)
-		*retlen = 0;
-
 	while (len) {
 		if ((offset + len) > PAGE_SIZE)
 			cpylen = PAGE_SIZE - offset;	// multiple pages
@@ -143,8 +140,6 @@ static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 	int offset = to & ~PAGE_MASK;	// page offset
 	int cpylen;
 
-	if (retlen)
-		*retlen = 0;
 	while (len) {
 		if ((offset+len) > PAGE_SIZE)
 			cpylen = PAGE_SIZE - offset;	// multiple pages
diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index ee4ee0b..7ad7b05 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -603,8 +603,6 @@ static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t left = len;
 
 	mutex_lock(&this->lock);
-
-	*retlen = 0;
 	while (left) {
 		len = left;
 
@@ -745,8 +743,6 @@ static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int status;
 
 	mutex_lock(&this->lock);
-
-	*retlen = 0;
 	while (left) {
 		len = left;
 
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index 1784415..7bff54e 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -591,7 +591,6 @@ static int doc_write (struct mtd_info *mtd, loff_t to, size_t len,
 		printk("Error programming flash\n");
 		/* Error in programming
 		   FIXME: implement Bad Block Replacement (in nftl.c ??) */
-		*retlen = 0;
 		ret = -EIO;
 	}
 	dummy = ReadDOC(docptr, LastDataRead);
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index a472bab..4a03d86 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -792,7 +792,6 @@ static int doc_write(struct mtd_info *mtd, loff_t to, size_t len,
 		printk("MTD: Error 0x%x programming at 0x%x\n", dummy, (int)to);
 		/* Error in programming
 		   FIXME: implement Bad Block Replacement (in nftl.c ??) */
-		*retlen = 0;
 		ret = -EIO;
 	}
 	dummy = ReadDOC(docptr, Mplus_LastDataRead);
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index c9ae601..6fb8dba 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -518,8 +518,6 @@ static int flash_write (struct mtd_info *mtd,loff_t to,size_t len,size_t *retlen
    printk (KERN_DEBUG "%s(to = 0x%.8x, len = %d)\n", __func__, (__u32)to, len);
 #endif
 
-   *retlen = 0;
-
    /* sanity checks */
    if (!len) return (0);
 
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 0955a8f..45cc4a1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -365,9 +365,6 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	t[1].len = len;
 	spi_message_add_tail(&t[1], &m);
 
-	/* Byte count starts at zero. */
-	*retlen = 0;
-
 	mutex_lock(&flash->lock);
 
 	/* Wait till previous write/erase is done. */
@@ -411,8 +408,6 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	pr_debug("%s: %s to 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)to, len);
 
-	*retlen = 0;
-
 	/* sanity checks */
 	if (!len)
 		return(0);
@@ -500,8 +495,6 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	pr_debug("%s: %s to 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)to, len);
 
-	*retlen = 0;
-
 	/* sanity checks */
 	if (!len)
 		return 0;
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index fc5c781..c76b446 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -249,8 +249,6 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	pr_debug("%s: read 0x%x..0x%x\n", dev_name(&priv->spi->dev),
 			(unsigned)from, (unsigned)(from + len));
 
-	*retlen = 0;
-
 	/* Sanity checks */
 	if (!len)
 		return 0;
@@ -323,8 +321,6 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	pr_debug("%s: write 0x%x..0x%x\n",
 		dev_name(&spi->dev), (unsigned)to, (unsigned)(to + len));
 
-	*retlen = 0;
-
 	/* Sanity checks */
 	if (!len)
 		return 0;
diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index d0e8dc6..d3474a4 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -85,8 +85,6 @@ static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
-
-
 static void unregister_devices(void)
 {
 	struct phram_mtd_list *this, *safe;
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index f7b9949..520e387 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -576,11 +576,6 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 		return -EINVAL;
 	}
 
-	if (!retlen)
-		return -EINVAL;
-	else
-		*retlen = 0;
-
 	/* select address as per bank number */
 	src = flash->base_addr + from;
 
@@ -677,11 +672,6 @@ static int spear_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 		return -EINVAL;
 	}
 
-	if (!retlen)
-		return -EINVAL;
-	else
-		*retlen = 0;
-
 	/* select address as per bank number */
 	dest = flash->base_addr + to;
 	mutex_lock(&flash->lock);
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 99d4a3c..5c2613c 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -224,9 +224,6 @@ static int sst25l_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (len == 0)
 		return 0;
 
-	if (retlen)
-		*retlen = 0;
-
 	spi_message_init(&message);
 	memset(&transfer, 0, sizeof(transfer));
 
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 0f3731c..a92906b 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -535,9 +535,7 @@ static int lpddr_point(struct mtd_info *mtd, loff_t adr, size_t len,
 
 	/* ofs: offset within the first chip that the first read should start */
 	ofs = adr - (chipnum << lpddr->chipshift);
-
 	*mtdbuf = (void *)map->virt + chip->start + ofs;
-	*retlen = 0;
 
 	while (len) {
 		unsigned long thislen;
@@ -647,7 +645,6 @@ static int lpddr_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	for (i = 0; i < count; i++)
 		len += vecs[i].iov_len;
 
-	*retlen = 0;
 	if (!len)
 		return 0;
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index dd24232..f7a31cc 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -72,8 +72,6 @@ concat_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int ret = 0, err;
 	int i;
 
-	*retlen = 0;
-
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 		size_t size, retsize;
@@ -126,8 +124,6 @@ concat_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int err = -EINVAL;
 	int i;
 
-	*retlen = 0;
-
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
 		size_t size, retsize;
@@ -169,8 +165,6 @@ concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	int i;
 	int err = -EINVAL;
 
-	*retlen = 0;
-
 	/* Calculate total length of data */
 	for (i = 0; i < count; i++)
 		total_len += vecs[i].iov_len;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 9c6445d..a1592cf 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1753,9 +1753,6 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	pr_debug("%s: to = 0x%08x, len = %i\n", __func__, (unsigned int)to,
 			(int)len);
 
-	/* Initialize retlen, in case of early exit */
-	*retlen = 0;
-
 	/* Reject writes, which are not page aligned */
         if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
 		printk(KERN_ERR "%s: Attempt to write not page aligned data\n",
-- 
1.7.9
