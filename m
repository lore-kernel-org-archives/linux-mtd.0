Received: from secvs01.rockwellcollins.com ([205.175.225.240])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkdYt-0001jj-6F
 for linux-mtd@lists.infradead.org; Thu, 15 Sep 2016 20:47:12 +0000
From: Matt Weber <matthew.weber@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Senthilganapathy Paramasivam
 <senthilganapathy.paramasivam@rockwellcollins.com>
Subject: [PATCH] mtd cfi cmdset: intel panic_write for mtdoops
Date: Thu, 15 Sep 2016 15:46:46 -0500
Message-Id: <1473972406-27412-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added panic write handler for devices using Intel Extended
Vendor Command Set (ID 0x0001).

Signed-off-by: Senthilganapathy Paramasivam <senthilganapathy.paramasivam@rockwellcollins.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 5e1b68c..3f0f9f1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -62,6 +62,7 @@ static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_cha
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_writev(struct mtd_info *, const struct kvec *, unsigned long, loff_t, size_t *);
+static int cfi_intelext_panic_write(struct mtd_info *mtd, loff_t to , size_t len, size_t *retlen, const u_char *buf);
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_intelext_sync (struct mtd_info *);
 static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -491,6 +492,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	mtd->writesize = 1;
 	mtd->writebufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 
+       mtd->_panic_write   = cfi_intelext_panic_write;
 	mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
 
 	if (cfi->cfi_mode == CFI_MODE_CFI) {
@@ -1903,6 +1905,164 @@ static int cfi_intelext_write_buffers (struct mtd_info *mtd, loff_t to,
 	return cfi_intelext_writev(mtd, &vec, 1, to, retlen);
 }
 
+
+/*
+ * Write out one word of data to a single flash chip during a kernel panic
+ *
+ * This is only called during the panic_write() path. When panic_write()
+ * is called, the kernel is in the process of a panic, and will soon be
+ * dead. Therefore we don't take any locks, and attempt to get access
+ * to the chip as soon as possible.
+ *
+ * The implementation of this routine is intentionally similar to
+ * do_write_oneword(), in order to ease code maintenance.
+ */
+static int  do_panic_write_oneword(struct map_info *map, struct flchip *chip,
+				   unsigned long adr, map_word datum)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	map_word status, write_cmd;
+	int ret=0;
+
+	adr += chip->start;
+
+	write_cmd = (cfi->cfiq->P_ID != P_ID_INTEL_PERFORMANCE) ? CMD(0x40) : CMD(0x41);
+
+	pr_debug("MTD %s(): PANIC WRITE 0x%.8lx(0x%.8lx)\n",__func__, adr, datum.x[0]);
+
+	ENABLE_VPP(map);
+
+	map_write(map, write_cmd, adr);
+	map_write(map, datum, adr);
+
+	if (ret) {
+		printk(KERN_ERR "%s: word write error (status timeout)\n", map->name);
+		goto out;
+	}
+
+	/* check for errors */
+	status = map_read(map, adr);
+	if (map_word_bitsset(map, status, CMD(0x1a))) {
+		unsigned long chipstatus = MERGESTATUS(status);
+
+		/* reset status */
+		map_write(map, CMD(0x50), adr);
+		map_write(map, CMD(0x70), adr);
+
+		if (chipstatus & 0x02) {
+			ret = -EROFS;
+		} else if (chipstatus & 0x08) {
+			printk(KERN_ERR "%s: word write error (bad VPP)\n", map->name);
+			ret = -EIO;
+		} else {
+			printk(KERN_ERR "%s: word write error (status 0x%lx)\n", map->name, chipstatus);
+			ret = -EINVAL;
+		}
+		goto out;
+	}
+ out:
+        DISABLE_VPP(map);
+        return ret;
+}
+
+/*
+ * Write out some data during a kernel panic
+ *
+ * This is used by the mtdoops driver to save the dying messages from a
+ * kernel which has panic'd.
+ *
+ * This routine ignores all of the locking used throughout the rest of the
+ * driver, in order to ensure that the data gets written out no matter what
+ * state this driver (and the flash chip itself) was in when the kernel crashed.
+ *
+ * The implementation of this routine is intentionally similar to
+ * cfi_intelext_write_words(), in order to ease code maintenance.
+ */
+static int cfi_intelext_panic_write(struct mtd_info *mtd, loff_t to , size_t len,
+                                     size_t *retlen, const u_char *buf)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret = 0;
+	int chipnum;
+	unsigned long ofs;
+
+	chipnum = to >> cfi->chipshift;
+	ofs = to - (chipnum << cfi->chipshift);
+
+	/* If it's not bus-aligned, do the first byte write */
+	if (ofs & (map_bankwidth(map)-1)) {
+		unsigned long bus_ofs = ofs & ~(map_bankwidth(map)-1);
+		int gap = ofs - bus_ofs;
+		int n;
+		map_word datum;
+
+		n = min_t(int, len, map_bankwidth(map)-gap);
+		datum = map_word_ff(map);
+		datum = map_word_load_partial(map, datum, buf, gap, n);
+
+		ret = do_panic_write_oneword(map, &cfi->chips[chipnum],
+						bus_ofs, datum);
+		if (ret)
+			return ret;
+
+		len -= n;
+		ofs += n;
+		buf += n;
+		(*retlen) += n;
+
+		if (ofs >> cfi->chipshift) {
+			chipnum ++;
+			ofs = 0;
+			if (chipnum == cfi->numchips)
+				return 0;
+		}
+	}
+
+	/* We are now aligned, write as much as possible */
+	while(len >= map_bankwidth(map)) {
+		map_word datum = map_word_load(map, buf);
+
+		/* Significamt delay is required, between two write cycles.
+		   300 micro seconds delay is arrived by trial and error.*/
+		udelay(300);
+
+		ret = do_panic_write_oneword(map, &cfi->chips[chipnum],
+						ofs, datum);
+		if (ret)
+			return ret;
+
+		ofs += map_bankwidth(map);
+		buf += map_bankwidth(map);
+		(*retlen) += map_bankwidth(map);
+		len -= map_bankwidth(map);
+
+		if (ofs >> cfi->chipshift) {
+			chipnum ++;
+			ofs = 0;
+			if (chipnum == cfi->numchips)
+				return 0;
+		}
+	}
+
+	/* Write the trailing bytes if any */
+	if (len & (map_bankwidth(map)-1)) {
+		map_word datum;
+
+		datum = map_word_ff(map);
+		datum = map_word_load_partial(map, datum, buf, 0, len);
+
+		ret = do_panic_write_oneword(map, &cfi->chips[chipnum],
+						ofs, datum);
+		if (ret)
+			return ret;
+
+		(*retlen) += len;
+	}
+
+	return 0;
+}
+
 static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 				      unsigned long adr, int len, void *thunk)
 {
-- 
1.9.1
