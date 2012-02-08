Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv9L3-0003pF-3W
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 15:21:43 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/9] mtd: move zero length verification to MTD API functions
Date: Wed,  8 Feb 2012 17:21:24 +0200
Message-Id: <1328714485-19536-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
References: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

In many places in drivers we verify for the zero length, but this is very
inconsistent across drivers. This is obviously the right thing to do, though.
This patch moves the check to the MTD API functions instead and removes a lot
of duplication.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    3 ---
 drivers/mtd/chips/cfi_cmdset_0002.c |    9 ---------
 drivers/mtd/chips/cfi_cmdset_0020.c |    3 ---
 drivers/mtd/devices/block2mtd.c     |    3 ---
 drivers/mtd/devices/lart.c          |    3 ---
 drivers/mtd/devices/m25p80.c        |   12 ------------
 drivers/mtd/devices/mtd_dataflash.c |   10 ----------
 drivers/mtd/devices/spear_smi.c     |    6 ------
 drivers/mtd/devices/sst25l.c        |    8 --------
 drivers/mtd/lpddr/lpddr_cmds.c      |    1 -
 drivers/mtd/maps/vmu-flash.c        |    8 --------
 drivers/mtd/mtdcore.c               |   21 +++++++++++++++++++++
 drivers/mtd/nand/nand_base.c        |   10 ----------
 13 files changed, 21 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index dc66df6..2d96690 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1566,9 +1566,6 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 	int chipnum;
 	unsigned long ofs;
 
-	if (!len)
-		return 0;
-
 	chipnum = to >> cfi->chipshift;
 	ofs = to  - (chipnum << cfi->chipshift);
 
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a89d899..c1d4624 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1246,9 +1246,6 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	unsigned long ofs, chipstart;
 	DECLARE_WAITQUEUE(wait, current);
 
-	if (!len)
-		return 0;
-
 	chipnum = to >> cfi->chipshift;
 	ofs = to  - (chipnum << cfi->chipshift);
 	chipstart = cfi->chips[chipnum].start;
@@ -1487,9 +1484,6 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 	int chipnum;
 	unsigned long ofs;
 
-	if (!len)
-		return 0;
-
 	chipnum = to >> cfi->chipshift;
 	ofs = to  - (chipnum << cfi->chipshift);
 
@@ -1697,9 +1691,6 @@ static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int ret = 0;
 	int chipnum;
 
-	if (!len)
-		return 0;
-
 	chipnum = to >> cfi->chipshift;
 	ofs = to - (chipnum << cfi->chipshift);
 	chipstart = cfi->chips[chipnum].start;
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index d690b7d..096993f 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -615,9 +615,6 @@ static int cfi_staa_write_buffers (struct mtd_info *mtd, loff_t to,
 	int chipnum;
 	unsigned long ofs;
 
-	if (!len)
-		return 0;
-
 	chipnum = to >> cfi->chipshift;
 	ofs = to  - (chipnum << cfi->chipshift);
 
diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index ba2d74b..a4a80b7 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -178,9 +178,6 @@ static int block2mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct block2mtd_dev *dev = mtd->priv;
 	int err;
 
-	if (!len)
-		return 0;
-
 	mutex_lock(&dev->write_mutex);
 	err = _block2mtd_write(dev, buf, to, len, retlen);
 	mutex_unlock(&dev->write_mutex);
diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
index 6fb8dba..82bd00a 100644
--- a/drivers/mtd/devices/lart.c
+++ b/drivers/mtd/devices/lart.c
@@ -437,9 +437,6 @@ static int flash_read (struct mtd_info *mtd,loff_t from,size_t len,size_t *retle
    printk (KERN_DEBUG "%s(from = 0x%.8x, len = %d)\n", __func__, (__u32)from, len);
 #endif
 
-   /* sanity checks */
-   if (!len) return (0);
-
    /* we always read len bytes */
    *retlen = len;
 
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 45cc4a1..1924d24 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -346,10 +346,6 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)from, len);
 
-	/* sanity checks */
-	if (!len)
-		return 0;
-
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
@@ -408,10 +404,6 @@ static int m25p80_write(struct mtd_info *mtd, loff_t to, size_t len,
 	pr_debug("%s: %s to 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)to, len);
 
-	/* sanity checks */
-	if (!len)
-		return(0);
-
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
@@ -495,10 +487,6 @@ static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 	pr_debug("%s: %s to 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)to, len);
 
-	/* sanity checks */
-	if (!len)
-		return 0;
-
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index c76b446..928fb0e 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -249,10 +249,6 @@ static int dataflash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	pr_debug("%s: read 0x%x..0x%x\n", dev_name(&priv->spi->dev),
 			(unsigned)from, (unsigned)(from + len));
 
-	/* Sanity checks */
-	if (!len)
-		return 0;
-
 	/* Calculate flash page/byte address */
 	addr = (((unsigned)from / priv->page_size) << priv->page_offset)
 		+ ((unsigned)from % priv->page_size);
@@ -321,10 +317,6 @@ static int dataflash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	pr_debug("%s: write 0x%x..0x%x\n",
 		dev_name(&spi->dev), (unsigned)to, (unsigned)(to + len));
 
-	/* Sanity checks */
-	if (!len)
-		return 0;
-
 	spi_message_init(&msg);
 
 	x[0].tx_buf = command = priv->command;
@@ -479,8 +471,6 @@ static ssize_t otp_read(struct spi_device *spi, unsigned base,
 
 	if ((off + len) > 64)
 		len = 64 - off;
-	if (len == 0)
-		return len;
 
 	spi_message_init(&m);
 
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 520e387..4f7b682 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -565,9 +565,6 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 	u32 ctrlreg1, val;
 	int ret;
 
-	if (!len)
-		return 0;
-
 	if (!flash || !dev)
 		return -ENODEV;
 
@@ -664,9 +661,6 @@ static int spear_mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (!flash || !dev)
 		return -ENODEV;
 
-	if (!len)
-		return 0;
-
 	if (flash->bank > dev->num_flashes - 1) {
 		dev_err(&dev->pdev->dev, "Invalid Bank Num");
 		return -EINVAL;
diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 5c2613c..51b2df3 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -220,10 +220,6 @@ static int sst25l_read(struct mtd_info *mtd, loff_t from, size_t len,
 	unsigned char command[4];
 	int ret;
 
-	/* Sanity checking */
-	if (len == 0)
-		return 0;
-
 	spi_message_init(&message);
 	memset(&transfer, 0, sizeof(transfer));
 
@@ -265,10 +261,6 @@ static int sst25l_write(struct mtd_info *mtd, loff_t to, size_t len,
 	int i, j, ret, bytes, copied = 0;
 	unsigned char command[5];
 
-	/* Sanity checks */
-	if (!len)
-		return 0;
-
 	if ((uint32_t)to % mtd->writesize)
 		return -EINVAL;
 
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index a92906b..d3cfe26b 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -639,7 +639,6 @@ static int lpddr_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	int chipnum;
 	unsigned long ofs, vec_seek, i;
 	int wbufsize = 1 << lpddr->qinfo->BufSizeShift;
-
 	size_t len = 0;
 
 	for (i = 0; i < count; i++)
diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 48a803e..2e2b094 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -360,9 +360,6 @@ static int vmu_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
 	int index = 0, retval, partition, leftover, numblocks;
 	unsigned char cx;
 
-	if (len < 1)
-		return -EIO;
-
 	mpart = mtd->priv;
 	mdev = mpart->mdev;
 	partition = mpart->partition;
@@ -434,11 +431,6 @@ static int vmu_flash_write(struct mtd_info *mtd, loff_t to, size_t len,
 	partition = mpart->partition;
 	card = maple_get_drvdata(mdev);
 
-	/* simple sanity checks */
-	if (len < 1) {
-		error = -EIO;
-		goto failed;
-	}
 	numblocks = card->parts[partition].numblocks;
 	if (to + len > numblocks * card->blocklen)
 		len = numblocks * card->blocklen - to;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b20346e..6acc4fb 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -695,6 +695,11 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	if (!instr->len) {
+		instr->state = MTD_ERASE_DONE;
+		mtd_erase_callback(instr);
+		return 0;
+	}
 	return mtd->_erase(mtd, instr);
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
@@ -713,6 +718,8 @@ int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 		return -EOPNOTSUPP;
 	if (from < 0 || from > mtd->size || len > mtd->size - from)
 		return -EINVAL;
+	if (!len)
+		return 0;
 	return mtd->_point(mtd, from, len, retlen, virt, phys);
 }
 EXPORT_SYMBOL_GPL(mtd_point);
@@ -724,6 +731,8 @@ int mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 		return -EOPNOTSUPP;
 	if (from < 0 || from > mtd->size || len > mtd->size - from)
 		return -EINVAL;
+	if (!len)
+		return 0;
 	return mtd->_unpoint(mtd, from, len);
 }
 EXPORT_SYMBOL_GPL(mtd_unpoint);
@@ -750,6 +759,8 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	*retlen = 0;
 	if (from < 0 || from > mtd->size || len > mtd->size - from)
 		return -EINVAL;
+	if (!len)
+		return 0;
 	return mtd->_read(mtd, from, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_read);
@@ -762,6 +773,8 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EINVAL;
 	if (!mtd->_write || !(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	if (!len)
+		return 0;
 	return mtd->_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_write);
@@ -783,6 +796,8 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	if (!len)
+		return 0;
 	return mtd->_panic_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_panic_write);
@@ -794,6 +809,8 @@ int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
+	if (!len)
+		return 0;
 	return mtd->_lock(mtd, ofs, len);
 }
 EXPORT_SYMBOL_GPL(mtd_lock);
@@ -804,6 +821,8 @@ int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
+	if (!len)
+		return 0;
 	return mtd->_unlock(mtd, ofs, len);
 }
 EXPORT_SYMBOL_GPL(mtd_unlock);
@@ -814,6 +833,8 @@ int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs > mtd->size || len > mtd->size - ofs)
 		return -EINVAL;
+	if (!len)
+		return 0;
 	return mtd->_is_locked(mtd, ofs, len);
 }
 EXPORT_SYMBOL_GPL(mtd_is_locked);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dd182c8..5822e3a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1614,9 +1614,6 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	if (!len)
-		return 0;
-
 	nand_get_device(chip, mtd, FL_READING);
 	ops.len = len;
 	ops.datbuf = buf;
@@ -2313,10 +2310,6 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	/* Do not allow reads past end of device */
-	if (!len)
-		return 0;
-
 	/* Wait for the device to get ready */
 	panic_nand_wait(mtd, chip, 400);
 
@@ -2351,9 +2344,6 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
-	if (!len)
-		return 0;
-
 	nand_get_device(chip, mtd, FL_WRITING);
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
-- 
1.7.9
