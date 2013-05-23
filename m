Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UfSIO-00075i-1J
 for linux-mtd@lists.infradead.org; Thu, 23 May 2013 09:58:56 +0000
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/4 RESEND] mtd: cfi_cmdset_0002: Add support for reading
 OTP
Date: Thu, 23 May 2013 11:58:13 +0200
In-Reply-To: <1369303096-9948-1-git-send-email-christian.riesch@omicron.at>
References: <1369303096-9948-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <f2aa9f13-bd7d-4039-a1c4-dc54a873e545@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
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
 drivers/mtd/chips/cfi_cmdset_0002.c |  163 +++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index fff665d..353ddfb 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -59,7 +59,15 @@ static void cfi_amdstd_sync (struct mtd_info *);
 static int cfi_amdstd_suspend (struct mtd_info *);
 static void cfi_amdstd_resume (struct mtd_info *);
 static int cfi_amdstd_reboot(struct notifier_block *, unsigned long, void *);
+static int cfi_amdstd_get_fact_prot_info(struct mtd_info *, struct otp_info *,
+					 size_t len);
+static int cfi_amdstd_get_user_prot_info(struct mtd_info *, struct otp_info *,
+					 size_t len);
 static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_amdstd_read_fact_prot_reg(struct mtd_info *, loff_t, size_t,
+					 size_t *, u_char *);
+static int cfi_amdstd_read_user_prot_reg(struct mtd_info *, loff_t, size_t,
+					 size_t *, u_char *);
 
 static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 				  size_t *retlen, const u_char *buf);
@@ -521,6 +529,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
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
@@ -1142,6 +1154,8 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 	return ret;
 }
 
+typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip,
+			loff_t adr, size_t len, u_char *buf);
 
 static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
@@ -1224,6 +1238,155 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
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
+	unsigned long base;
+	int chipnum;
+	struct flchip *chip;
+	uint8_t otp, lockreg;
+	int ret;
+
+	size_t user_size, factory_size, otpsize;
+	loff_t user_offset, factory_offset, otpoffset;
+	int user_locked = 0, otplocked;
+
+	*retlen = 0;
+
+	for (chipnum = 0; chipnum < cfi->numchips; chipnum++) {
+		chip = &cfi->chips[chipnum];
+		factory_size = 0;
+		user_size = 0;
+
+		/* Micron M29EW family */
+		if (is_m29ew(cfi)) {
+			base = chip->start;
+
+			/* check whether secsi area is factory locked
+			   or user lockable */
+			mutex_lock(&chip->mutex);
+			ret = get_chip(map, chip, base, FL_CFI_QUERY);
+			if (ret) {
+				mutex_unlock(&chip->mutex);
+				return ret;
+			}
+			cfi_qry_mode_on(base, map, cfi);
+			otp = cfi_read_query(map, base + 0x3 * ofs_factor);
+			cfi_qry_mode_off(base, map, cfi);
+			put_chip(map, chip, base);
+			mutex_unlock(&chip->mutex);
+
+			if (otp & 0x80) {
+				/* factory locked */
+				factory_offset = 0;
+				factory_size = 0x100;
+			} else {
+				/* customer lockable */
+				user_offset = 0;
+				user_size = 0x100;
+
+				mutex_lock(&chip->mutex);
+				ret = get_chip(map, chip, base, FL_LOCKING);
+
+				/* Enter lock register command */
+				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1,
+						 chip->start, map, cfi,
+						 cfi->device_type, NULL);
+				cfi_send_gen_cmd(0x55, cfi->addr_unlock2,
+						 chip->start, map, cfi,
+						 cfi->device_type, NULL);
+				cfi_send_gen_cmd(0x40, cfi->addr_unlock1,
+						 chip->start, map, cfi,
+						 cfi->device_type, NULL);
+				/* read lock register */
+				lockreg = cfi_read_query(map, 0);
+				/* exit protection commands */
+				map_write(map, CMD(0x90), chip->start);
+				map_write(map, CMD(0x00), chip->start);
+				put_chip(map, chip, chip->start);
+				mutex_unlock(&chip->mutex);
+
+				user_locked = ((lockreg & 0x01) == 0x00);
+			}
+		}
+
+		otpsize = user_regs ? user_size : factory_size;
+		if (!otpsize)
+			continue;
+		otpoffset = user_regs ? user_offset : factory_offset;
+		otplocked = user_regs ? user_locked : 1;
+
+		if (!action) {
+			/* return otpinfo */
+			struct otp_info *otpinfo;
+			len -= sizeof(*otpinfo);
+			if (len <= 0)
+				return -ENOSPC;
+			otpinfo = (struct otp_info *)buf;
+			otpinfo->start = from;
+			otpinfo->length = otpsize;
+			otpinfo->locked = otplocked;
+			buf += sizeof(*otpinfo);
+			*retlen += sizeof(*otpinfo);
+			from += otpsize;
+		} else if ((from < otpsize) && (len > 0)) {
+			size_t size;
+			size = (len < otpsize - from) ? len : otpsize - from;
+			ret = action(map, chip, otpoffset + from, size, buf);
+			if (ret < 0)
+				return ret;
+
+			buf += size;
+			len -= size;
+			*retlen += size;
+			from = 0;
+		} else {
+			from -= otpsize;
+		}
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
