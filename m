Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S9l8D-0008Jo-7t
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 22:32:51 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] drivers/mtd: docg3 add protection against concurrency
Date: Mon, 19 Mar 2012 23:32:22 +0100
Message-Id: <1332196342-21545-5-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
References: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As docg3 is intolerant against reentrancy, especially
because of its weird register access (ie. a register read is
performed by a first register write), each access to the
docg3 IO space must be locked.

Lock the IO space with a mutex, shared by all chips on the
same cascade, as they all share the same IO space.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   60 +++++++++++++++++++++++++++++++++++--------
 drivers/mtd/devices/docg3.h |    2 +
 2 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 03c9c99..6703b6c 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -80,6 +80,16 @@ static struct nand_ecclayout docg3_oobinfo = {
 	.oobavail = 8,
 };
 
+static void cascade_lock(struct docg3 *docg3)
+{
+	mutex_lock(&docg3->cascade->lock);
+}
+
+static void cascade_unlock(struct docg3 *docg3)
+{
+	mutex_unlock(&docg3->cascade->lock);
+}
+
 static inline u8 doc_readb(struct docg3 *docg3, u16 reg)
 {
 	u8 val = readb(docg3->cascade->base + reg);
@@ -875,6 +885,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 	ops->retlen = 0;
 	ret = 0;
 	skip = from % DOC_LAYOUT_PAGE_SIZE;
+	cascade_lock(docg3);
 	while (!ret && (len > 0 || ooblen > 0)) {
 		calc_block_sector(from - skip, &block0, &block1, &page, &ofs,
 			docg3->reliable);
@@ -882,7 +893,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 		nboob = min_t(size_t, ooblen, (size_t)DOC_LAYOUT_OOB_SIZE);
 		ret = doc_read_page_prepare(docg3, block0, block1, page, ofs);
 		if (ret < 0)
-			goto err;
+			goto out;
 		ret = doc_read_page_ecc_init(docg3, DOC_ECC_BCH_TOTAL_BYTES);
 		if (ret < 0)
 			goto err_in_read;
@@ -949,11 +960,12 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t from,
 		skip = 0;
 	}
 
+out:
+	cascade_unlock(docg3);
 	return ret;
 err_in_read:
 	doc_read_page_finish(docg3);
-err:
-	return ret;
+	goto out;
 }
 
 /**
@@ -1193,7 +1205,6 @@ static int doc_erase(struct mtd_info *mtd, struct erase_info *info)
 	int block0, block1, page, ret, ofs = 0;
 
 	doc_dbg("doc_erase(from=%lld, len=%lld\n", info->addr, info->len);
-	doc_set_device_id(docg3, docg3->device_id);
 
 	info->state = MTD_ERASE_PENDING;
 	calc_block_sector(info->addr + info->len, &block0, &block1, &page,
@@ -1205,6 +1216,8 @@ static int doc_erase(struct mtd_info *mtd, struct erase_info *info)
 	ret = 0;
 	calc_block_sector(info->addr, &block0, &block1, &page, &ofs,
 			  docg3->reliable);
+	cascade_lock(docg3);
+	doc_set_device_id(docg3, docg3->device_id);
 	doc_set_reliable_mode(docg3);
 	for (len = info->len; !ret && len > 0; len -= mtd->erasesize) {
 		info->state = MTD_ERASING;
@@ -1212,6 +1225,7 @@ static int doc_erase(struct mtd_info *mtd, struct erase_info *info)
 		block0 += 2;
 		block1 += 2;
 	}
+	cascade_unlock(docg3);
 
 	if (ret)
 		goto reset_err;
@@ -1398,7 +1412,7 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 			 struct mtd_oob_ops *ops)
 {
 	struct docg3 *docg3 = mtd->priv;
-	int block0, block1, page, ret, pofs = 0, autoecc, oobdelta;
+	int ret, autoecc, oobdelta;
 	u8 *oobbuf = ops->oobbuf;
 	u8 *buf = ops->datbuf;
 	size_t len, ooblen;
@@ -1450,6 +1464,7 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 	if (autoecc < 0)
 		return autoecc;
 
+	cascade_lock(docg3);
 	while (!ret && len > 0) {
 		memset(oob, 0, sizeof(oob));
 		if (ofs == docg3->oob_write_ofs)
@@ -1470,8 +1485,9 @@ static int doc_write_oob(struct mtd_info *mtd, loff_t ofs,
 		}
 		ops->retlen += DOC_LAYOUT_PAGE_SIZE;
 	}
-err:
+
 	doc_set_device_id(docg3, 0);
+	cascade_unlock(docg3);
 	return ret;
 }
 
@@ -1528,9 +1544,11 @@ static ssize_t dps0_is_key_locked(struct device *dev,
 	struct docg3 *docg3 = sysfs_dev2docg3(dev, attr);
 	int dps0;
 
+	cascade_lock(docg3);
 	doc_set_device_id(docg3, docg3->device_id);
 	dps0 = doc_register_readb(docg3, DOC_DPS0_STATUS);
 	doc_set_device_id(docg3, 0);
+	cascade_unlock(docg3);
 
 	return sprintf(buf, "%d\n", !(dps0 & DOC_DPS_KEY_OK));
 }
@@ -1541,9 +1559,11 @@ static ssize_t dps1_is_key_locked(struct device *dev,
 	struct docg3 *docg3 = sysfs_dev2docg3(dev, attr);
 	int dps1;
 
+	cascade_lock(docg3);
 	doc_set_device_id(docg3, docg3->device_id);
 	dps1 = doc_register_readb(docg3, DOC_DPS1_STATUS);
 	doc_set_device_id(docg3, 0);
+	cascade_unlock(docg3);
 
 	return sprintf(buf, "%d\n", !(dps1 & DOC_DPS_KEY_OK));
 }
@@ -1558,10 +1578,12 @@ static ssize_t dps0_insert_key(struct device *dev,
 	if (count != DOC_LAYOUT_DPS_KEY_LENGTH)
 		return -EINVAL;
 
+	cascade_lock(docg3);
 	doc_set_device_id(docg3, docg3->device_id);
 	for (i = 0; i < DOC_LAYOUT_DPS_KEY_LENGTH; i++)
 		doc_writeb(docg3, buf[i], DOC_DPS0_KEY);
 	doc_set_device_id(docg3, 0);
+	cascade_unlock(docg3);
 	return count;
 }
 
@@ -1575,10 +1597,12 @@ static ssize_t dps1_insert_key(struct device *dev,
 	if (count != DOC_LAYOUT_DPS_KEY_LENGTH)
 		return -EINVAL;
 
+	cascade_lock(docg3);
 	doc_set_device_id(docg3, docg3->device_id);
 	for (i = 0; i < DOC_LAYOUT_DPS_KEY_LENGTH; i++)
 		doc_writeb(docg3, buf[i], DOC_DPS1_KEY);
 	doc_set_device_id(docg3, 0);
+	cascade_unlock(docg3);
 	return count;
 }
 
@@ -1633,7 +1657,11 @@ static int dbg_flashctrl_show(struct seq_file *s, void *p)
 	struct docg3 *docg3 = (struct docg3 *)s->private;
 
 	int pos = 0;
-	u8 fctrl = doc_register_readb(docg3, DOC_FLASHCONTROL);
+	u8 fctrl;
+
+	cascade_lock(docg3);
+	fctrl = doc_register_readb(docg3, DOC_FLASHCONTROL);
+	cascade_unlock(docg3);
 
 	pos += seq_printf(s,
 		 "FlashControl : 0x%02x (%s,CE# %s,%s,%s,flash %s)\n",
@@ -1651,9 +1679,12 @@ static int dbg_asicmode_show(struct seq_file *s, void *p)
 {
 	struct docg3 *docg3 = (struct docg3 *)s->private;
 
-	int pos = 0;
-	int pctrl = doc_register_readb(docg3, DOC_ASICMODE);
-	int mode = pctrl & 0x03;
+	int pos = 0, pctrl, mode;
+
+	cascade_lock(docg3);
+	pctrl = doc_register_readb(docg3, DOC_ASICMODE);
+	mode = pctrl & 0x03;
+	cascade_unlock(docg3);
 
 	pos += seq_printf(s,
 			 "%04x : RAM_WE=%d,RSTIN_RESET=%d,BDETCT_RESET=%d,WRITE_ENABLE=%d,POWERDOWN=%d,MODE=%d%d (",
@@ -1685,7 +1716,11 @@ static int dbg_device_id_show(struct seq_file *s, void *p)
 {
 	struct docg3 *docg3 = (struct docg3 *)s->private;
 	int pos = 0;
-	int id = doc_register_readb(docg3, DOC_DEVICESELECT);
+	int id;
+
+	cascade_lock(docg3);
+	id = doc_register_readb(docg3, DOC_DEVICESELECT);
+	cascade_unlock(docg3);
 
 	pos += seq_printf(s, "DeviceId = %d\n", id);
 	return pos;
@@ -1698,6 +1733,7 @@ static int dbg_protection_show(struct seq_file *s, void *p)
 	int pos = 0;
 	int protect, dps0, dps0_low, dps0_high, dps1, dps1_low, dps1_high;
 
+	cascade_lock(docg3);
 	protect = doc_register_readb(docg3, DOC_PROTECTION);
 	dps0 = doc_register_readb(docg3, DOC_DPS0_STATUS);
 	dps0_low = doc_register_readw(docg3, DOC_DPS0_ADDRLOW);
@@ -1705,6 +1741,7 @@ static int dbg_protection_show(struct seq_file *s, void *p)
 	dps1 = doc_register_readb(docg3, DOC_DPS1_STATUS);
 	dps1_low = doc_register_readw(docg3, DOC_DPS1_ADDRLOW);
 	dps1_high = doc_register_readw(docg3, DOC_DPS1_ADDRHIGH);
+	cascade_unlock(docg3);
 
 	pos += seq_printf(s, "Protection = 0x%02x (",
 			 protect);
@@ -2021,6 +2058,7 @@ static int __init docg3_probe(struct platform_device *pdev)
 	if (!cascade)
 		goto nomem1;
 	cascade->base = base;
+	mutex_init(&cascade->lock);
 	cascade->bch = init_bch(DOC_ECC_BCH_M, DOC_ECC_BCH_T,
 			     DOC_ECC_BCH_PRIMPOLY);
 	if (!cascade->bch)
diff --git a/drivers/mtd/devices/docg3.h b/drivers/mtd/devices/docg3.h
index 642e606..19fb93f 100644
--- a/drivers/mtd/devices/docg3.h
+++ b/drivers/mtd/devices/docg3.h
@@ -273,11 +273,13 @@
  * @floors: floors (ie. one physical docg3 chip is one floor)
  * @base: IO space to access all chips in the cascade
  * @bch: the BCH correcting control structure
+ * @lock: lock to protect docg3 IO space from concurrent accesses
  */
 struct docg3_cascade {
 	struct mtd_info *floors[DOC_MAX_NBFLOORS];
 	void __iomem *base;
 	struct bch_control *bch;
+	struct mutex lock;
 };
 
 /**
-- 
1.7.5.4
