Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UB1ax-0006Uf-Pc
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2013 11:24:17 +0000
Received: from counter.omicron.at ([212.183.10.29])
 by ns.omicron.at (8.13.1/8.13.1) with ESMTP id r1SBNmtZ013821
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2013 12:23:53 +0100
Received: from mary.at.omicron.at (mary.at.omicron.at [172.22.100.48])
 by counter.omicron.at (8.14.4/8.14.4) with ESMTP id r1SBNmXq009904
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2013 12:23:48 +0100
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 2/4] mtd: cfi_cmdset_0002: Add support for reading OTP
 memory of Micron M29EW
Date: Thu, 28 Feb 2013 12:23:24 +0100
In-Reply-To: <1362050606-29475-1-git-send-email-christian.riesch@omicron.at>
References: <1362050606-29475-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <26955741-ff11-4ecb-aba8-06dbf27c022f@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Micron M29EW has a 256 byte one time programmable (OTP) memory.
This patch adds support for reading this memory. This support will be
extended for locking and writing in subsequent patches.

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
---
 drivers/mtd/chips/Kconfig           |    1 +
 drivers/mtd/chips/cfi_cmdset_0002.c |  137 +++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index e469b01..798359e 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -183,6 +183,7 @@ config MTD_CFI_AMDSTD
 	tristate "Support for AMD/Fujitsu/Spansion flash chips"
 	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
+	select HAVE_MTD_OTP
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 8391890..43d08d9 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -57,7 +57,11 @@ static void cfi_amdstd_sync (struct mtd_info *);
 static int cfi_amdstd_suspend (struct mtd_info *);
 static void cfi_amdstd_resume (struct mtd_info *);
 static int cfi_amdstd_reboot(struct notifier_block *, unsigned long, void *);
+static int cfi_amdstd_get_fact_prot_info(struct mtd_info *, struct otp_info *, size_t len);
+static int cfi_amdstd_get_user_prot_info(struct mtd_info *, struct otp_info *, size_t len);
 static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_amdstd_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_amdstd_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 
 static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 				  size_t *retlen, const u_char *buf);
@@ -514,6 +518,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->_sync    = cfi_amdstd_sync;
 	mtd->_suspend = cfi_amdstd_suspend;
 	mtd->_resume  = cfi_amdstd_resume;
+	mtd->_read_user_prot_reg = cfi_amdstd_read_user_prot_reg;
+	mtd->_read_fact_prot_reg = cfi_amdstd_read_fact_prot_reg;
+	mtd->_get_fact_prot_info = cfi_amdstd_get_fact_prot_info;
+	mtd->_get_user_prot_info = cfi_amdstd_get_user_prot_info;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
@@ -1124,6 +1132,9 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 	return ret;
 }
 
+typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip,
+			loff_t adr, size_t len, u_char *buf);
+
 
 static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
@@ -1206,6 +1217,132 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
 	return ret;
 }
 
+static int __xipram cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from,
+					size_t len,
+					size_t *retlen, u_char *buf,
+					otp_op_t action, int user_regs)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ofs_factor = cfi->interleave * cfi->device_type;
+	__u32 base, walk;
+	int chipnum;
+	struct flchip *chip;
+	uint8_t otp;
+	int ret;
+
+	uint user_size, factory_size, size;
+	ulong user_offset, factory_offset, offset;
+
+	*retlen = 0;
+	walk = 0;
+
+	for (chipnum = 0; chipnum < cfi->numchips; chipnum++) {
+		chip = &cfi->chips[chipnum];
+		factory_size = 0;
+		user_size = 0;
+
+		/* Micron M29EW family */
+		if ((cfi->mfr == CFI_MFR_INTEL) && (cfi->id == 0x3901)) {
+			base = chip->start;
+
+			/* check whether secsi area is factory locked
+			   or user lockable */
+			mutex_lock(&chip->mutex);
+			ret = get_chip(map, chip, chip->start, FL_CFI_QUERY);
+			if (ret) {
+				mutex_unlock(&chip->mutex);
+				return ret;
+			}
+			cfi_qry_mode_on(base, map, cfi);
+			otp = cfi_read_query(map, base + 0x3 * ofs_factor);
+			cfi_qry_mode_off(base, map, cfi);
+			put_chip(map, chip, chip->start);
+			mutex_unlock(&chip->mutex);
+
+			if ((otp & 0xef) == 0x89) {
+				/* factory locked */
+				factory_offset = 0;
+				factory_size = 0x100;
+			} else if ((otp & 0xef) == 0x09) {
+				/* customer lockable */
+				user_offset = 0;
+				user_size = 0x100;
+			} else {
+				return -EIO;
+			}
+		}
+
+		size = user_regs ? user_size : factory_size;
+		if (!size)
+			continue;
+		offset = user_regs ? user_offset : factory_offset;
+
+		if (!action) {
+			/* return otpinfo */
+			struct otp_info *otpinfo;
+			len -= sizeof(*otpinfo);
+			if (len <= 0)
+				return -ENOSPC;
+			otpinfo = (struct otp_info *)buf;
+			otpinfo->start = walk;
+			otpinfo->length = size;
+/* TODO: determine if locked */
+			otpinfo->locked = 0;
+			buf += sizeof(*otpinfo);
+			*retlen += sizeof(*otpinfo);
+		} else if (from < walk + size) {
+			int ret;
+			size -= from - walk;
+			if (size > len)
+				size = len;
+			ret = action(map, chip, offset + from - walk, size, buf);
+			if (ret < 0)
+				return ret;
+			buf += size;
+			len -= size;
+			*retlen += size;
+		}
+		walk += size;
+	}
+	return 0;
+}
+
+static int cfi_amdstd_get_fact_prot_info(struct mtd_info *mtd,
+					   struct otp_info *buf, size_t len)
+{
+	size_t retlen;
+	int ret;
+
+	ret = cfi_amdstd_otp_walk(mtd, 0, len, &retlen, (u_char *)buf, NULL, 0);
+	return ret ? : retlen;
+}
+
+static int cfi_amdstd_get_user_prot_info(struct mtd_info *mtd,
+					 struct otp_info *buf, size_t len)
+{
+	size_t retlen;
+	int ret;
+
+	ret = cfi_amdstd_otp_walk(mtd, 0, len, &retlen, (u_char *)buf, NULL, 1);
+	return ret ? : retlen;
+}
+
+static int cfi_amdstd_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
+					 size_t len, size_t *retlen,
+					 u_char *buf)
+{
+	return cfi_amdstd_otp_walk(mtd, from, len, retlen,
+				   buf, do_read_secsi_onechip, 0);
+}
+
+static int cfi_amdstd_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+					 size_t len, size_t *retlen,
+					 u_char *buf)
+{
+	return cfi_amdstd_otp_walk(mtd, from, len, retlen,
+				   buf, do_read_secsi_onechip, 1);
+}
 
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum)
 {
-- 
1.7.9.5
