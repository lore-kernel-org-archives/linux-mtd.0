Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UB1ax-0006Ue-PX
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 11:24:18 +0000
Received: from counter.omicron.at ([212.183.10.29])
 by ns.omicron.at (8.13.1/8.13.1) with ESMTP id r1SBNmg1013824
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2013 12:23:53 +0100
Received: from mary.at.omicron.at (mary.at.omicron.at [172.22.100.48])
 by counter.omicron.at (8.14.4/8.14.4) with ESMTP id r1SBNmXs009904
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2013 12:23:48 +0100
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 4/4] mtd: cfi_cmdset_0002: Add support for writing OTP
 memory
Date: Thu, 28 Feb 2013 12:23:26 +0100
In-Reply-To: <1362050606-29475-1-git-send-email-christian.riesch@omicron.at>
References: <1362050606-29475-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <2f7af1b1-b503-46ca-87c8-0c88cf36f5bd@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for writing the one time programmable (OTP)
memory of Micron M29EW devices.

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   53 ++++++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 36d62ce..2a25dc2 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -62,6 +62,7 @@ static int cfi_amdstd_get_user_prot_info(struct mtd_info *, struct otp_info *, s
 static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_amdstd_write_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 
 static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 				  size_t *retlen, const u_char *buf);
@@ -522,6 +523,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->_read_fact_prot_reg = cfi_amdstd_read_fact_prot_reg;
 	mtd->_get_fact_prot_info = cfi_amdstd_get_fact_prot_info;
 	mtd->_get_user_prot_info = cfi_amdstd_get_user_prot_info;
+	mtd->_write_user_prot_reg = cfi_amdstd_write_user_prot_reg;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
@@ -1231,6 +1233,30 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
 	return ret;
 }
 
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum, int mode);
+
+static int do_otp_write(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
+{
+	int ret;
+	while (len) {
+		unsigned long bus_ofs = adr & ~(map_bankwidth(map)-1);
+		int gap = adr - bus_ofs;
+		int n = min_t(int, len, map_bankwidth(map) - gap);
+		map_word datum = map_word_ff(map);
+
+		datum = map_word_load_partial(map, datum, buf, gap, n);
+		ret = do_write_oneword(map, chip, bus_ofs, datum, FL_OTP_WRITE);
+		if (ret)
+			return ret;
+
+		adr += n;
+		buf += n;
+		len -= n;
+	}
+
+	return 0;
+}
+
 static int __xipram cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from,
 					size_t len,
 					size_t *retlen, u_char *buf,
@@ -1358,7 +1384,14 @@ static int cfi_amdstd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
 				   buf, do_read_secsi_onechip, 1);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum)
+static int cfi_amdstd_write_user_prot_reg (struct mtd_info *mtd, loff_t from,
+					   size_t len, size_t *retlen,
+					   u_char *buf)
+{
+	return cfi_amdstd_otp_walk(mtd, from, len, retlen, buf, do_otp_write, 1);
+}
+
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum, int mode)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
@@ -1379,7 +1412,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	adr += chip->start;
 
 	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr, FL_WRITING);
+	ret = get_chip(map, chip, adr, mode);
 	if (ret) {
 		mutex_unlock(&chip->mutex);
 		return ret;
@@ -1388,6 +1421,9 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
 	       __func__, adr, datum.x[0] );
 
+	if (mode == FL_OTP_WRITE)
+		otp_enter(map, chip, adr, map_bankwidth(map));
+
 	/*
 	 * Check for a NOP for the case when the datum to write is already
 	 * present - it saves time and works around buggy chips that corrupt
@@ -1404,12 +1440,13 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
+
  retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	map_write(map, datum, adr);
-	chip->state = FL_WRITING;
+	chip->state = mode;
 
 	INVALIDATE_CACHE_UDELAY(map, chip,
 				adr, map_bankwidth(map),
@@ -1418,7 +1455,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	/* See comment above for timeout value. */
 	timeo = jiffies + uWriteTimeout;
 	for (;;) {
-		if (chip->state != FL_WRITING) {
+		if (chip->state != mode) {
 			/* Someone's suspended the write. Sleep */
 			DECLARE_WAITQUEUE(wait, current);
 
@@ -1458,6 +1495,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	}
 	xip_enable(map, chip, adr);
  op_done:
+	if (mode == FL_OTP_WRITE)
+		otp_exit(map, chip, adr, map_bankwidth(map));
 	chip->state = FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
@@ -1513,7 +1552,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 		tmp_buf = map_word_load_partial(map, tmp_buf, buf, i, n);
 
 		ret = do_write_oneword(map, &cfi->chips[chipnum],
-				       bus_ofs, tmp_buf);
+				       bus_ofs, tmp_buf, FL_WRITING);
 		if (ret)
 			return ret;
 
@@ -1537,7 +1576,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 		datum = map_word_load(map, buf);
 
 		ret = do_write_oneword(map, &cfi->chips[chipnum],
-				       ofs, datum);
+				       ofs, datum, FL_WRITING);
 		if (ret)
 			return ret;
 
@@ -1580,7 +1619,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 		tmp_buf = map_word_load_partial(map, tmp_buf, buf, 0, len);
 
 		ret = do_write_oneword(map, &cfi->chips[chipnum],
-				ofs, tmp_buf);
+				       ofs, tmp_buf, FL_WRITING);
 		if (ret)
 			return ret;
 
-- 
1.7.9.5
