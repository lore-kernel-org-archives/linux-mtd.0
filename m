Received: from ns.omicron.at ([212.183.10.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLXGf-0005YT-FD
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 12:19:21 +0000
Received: from counter.omicron.at ([212.183.10.29])
 by ns.omicron.at (8.13.1/8.13.1) with ESMTP id s26CIl8Q002174
 for <linux-mtd@lists.infradead.org>; Thu, 6 Mar 2014 13:18:53 +0100
Received: from mary.at.omicron.at (mary.at.omicron.at [172.22.100.48])
 by counter.omicron.at (8.14.4/8.14.4) with ESMTP id s26CIlu6031175
 for <linux-mtd@lists.infradead.org>; Thu, 6 Mar 2014 13:18:47 +0100
From: Christian Riesch <christian.riesch@omicron.at>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 4/4] mtd: cfi_cmdset_0002: Add support for locking OTP
 memory
Date: Thu, 6 Mar 2014 13:18:30 +0100
In-Reply-To: <1394108310-9241-1-git-send-email-christian.riesch@omicron.at>
References: <1394108310-9241-1-git-send-email-christian.riesch@omicron.at>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <c2efa045-baf0-41ab-97e7-863390dbe55b@mary.at.omicron.at>
Cc: Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for the locking of the one time
programmable (OTP) memory of Micron M29EW devices.

Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   89 +++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 5d446f8..ac79010 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -70,6 +70,7 @@ static int cfi_amdstd_read_user_prot_reg(struct mtd_info *, loff_t, size_t,
 					 size_t *, u_char *);
 static int cfi_amdstd_write_user_prot_reg(struct mtd_info *, loff_t, size_t,
 					  size_t *, u_char *);
+static int cfi_amdstd_lock_user_prot_reg(struct mtd_info *, loff_t, size_t);
 
 static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 				  size_t *retlen, const u_char *buf);
@@ -536,6 +537,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 	mtd->_get_fact_prot_info = cfi_amdstd_get_fact_prot_info;
 	mtd->_get_user_prot_info = cfi_amdstd_get_user_prot_info;
 	mtd->_write_user_prot_reg = cfi_amdstd_write_user_prot_reg;
+	mtd->_lock_user_prot_reg = cfi_amdstd_lock_user_prot_reg;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
 	mtd->writesize = 1;
@@ -1158,7 +1160,7 @@ static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_
 }
 
 typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip,
-			loff_t adr, size_t len, u_char *buf);
+			loff_t adr, size_t len, u_char *buf, size_t grouplen);
 
 static inline void otp_enter(struct map_info *map, struct flchip *chip,
 			     loff_t adr, size_t len)
@@ -1192,7 +1194,10 @@ static inline void otp_exit(struct map_info *map, struct flchip *chip,
 	INVALIDATE_CACHED_RANGE(map, chip->start + adr, len);
 }
 
-static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
+static inline int do_read_secsi_onechip(struct map_info *map,
+					struct flchip *chip, loff_t adr,
+					size_t len, u_char *buf,
+					size_t grouplen)
 {
 	DECLARE_WAITQUEUE(wait, current);
 	unsigned long timeo = jiffies + HZ;
@@ -1251,7 +1256,8 @@ static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, size_t len,
 		else
 			thislen = len;
 
-		ret = do_read_secsi_onechip(map, &cfi->chips[chipnum], ofs, thislen, buf);
+		ret = do_read_secsi_onechip(map, &cfi->chips[chipnum], ofs,
+					    thislen, buf, 0);
 		if (ret)
 			break;
 
@@ -1270,7 +1276,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 				     int mode);
 
 static int do_otp_write(struct map_info *map, struct flchip *chip, loff_t adr,
-			size_t len, u_char *buf)
+			size_t len, u_char *buf, size_t grouplen)
 {
 	int ret;
 	while (len) {
@@ -1299,6 +1305,70 @@ static int do_otp_write(struct map_info *map, struct flchip *chip, loff_t adr,
 	return 0;
 }
 
+static int do_otp_lock(struct map_info *map, struct flchip *chip, loff_t adr,
+		       size_t len, u_char *buf, size_t grouplen)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	uint8_t lockreg;
+	unsigned long timeo;
+	int ret;
+
+	/* make sure area matches group boundaries */
+	if ((adr != 0) || (len != grouplen))
+		return -EINVAL;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, chip->start, FL_LOCKING);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+	chip->state = FL_LOCKING;
+
+	/* Enter lock register command */
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x40, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+
+	/* read lock register */
+	lockreg = cfi_read_query(map, 0);
+
+	/* set bit 0 to protect extended memory block */
+	lockreg &= ~0x01;
+
+	/* set bit 0 to protect extended memory block */
+	/* write lock register */
+	map_write(map, CMD(0xA0), chip->start);
+	map_write(map, CMD(lockreg), chip->start);
+
+	/* wait for chip to become ready */
+	timeo = jiffies + msecs_to_jiffies(2);
+	for (;;) {
+		if (chip_ready(map, adr))
+			break;
+
+		if (time_after(jiffies, timeo)) {
+			pr_err("Waiting for chip to be ready timed out.\n");
+			ret = -EIO;
+			break;
+		}
+		UDELAY(map, chip, 0, 1);
+	}
+
+	/* exit protection commands */
+	map_write(map, CMD(0x90), chip->start);
+	map_write(map, CMD(0x00), chip->start);
+
+	chip->state = FL_READY;
+	put_chip(map, chip, chip->start);
+	mutex_unlock(&chip->mutex);
+
+	return ret;
+}
+
 static int cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 			       size_t *retlen, u_char *buf,
 			       otp_op_t action, int user_regs)
@@ -1397,7 +1467,8 @@ static int cfi_amdstd_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
 		} else if ((from < otpsize) && (len > 0)) {
 			size_t size;
 			size = (len < otpsize - from) ? len : otpsize - from;
-			ret = action(map, chip, otpoffset + from, size, buf);
+			ret = action(map, chip, otpoffset + from, size, buf,
+				     otpsize);
 			if (ret < 0)
 				return ret;
 
@@ -1450,6 +1521,14 @@ static int cfi_amdstd_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
 				   do_otp_write, 1);
 }
 
+static int cfi_amdstd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
+					 size_t len)
+{
+	size_t retlen;
+	return cfi_amdstd_otp_walk(mtd, from, len, &retlen, NULL,
+				   do_otp_lock, 1);
+}
+
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 				     unsigned long adr, map_word datum,
 				     int mode)
-- 
1.7.9.5
