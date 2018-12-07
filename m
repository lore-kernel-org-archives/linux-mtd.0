Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPf-00010C-Br
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:21 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 14/34] mtd: spi-nor: Stop prefixing generic functions with
 a manufacturer name
Date: Fri,  7 Dec 2018 10:26:17 +0100
Message-Id: <20181207092637.18687-15-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Most quad_enable, set_4byte() and locking functions are manufacturer
agnostic.
Replace the manufacturer prefix by something describing more precisely
what those functions do.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 104 ++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8efd0490d2a0..f3c8e4ac1158 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -220,7 +220,7 @@ static int set_4byte(struct spi_nor *nor, bool enable)
 	return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
 }
 
-static int s3an_sr_ready(struct spi_nor *nor)
+static int spi_nor_xsr_ready(struct spi_nor *nor)
 {
 	int ret;
 	u8 val;
@@ -281,7 +281,7 @@ static int spi_nor_ready(struct spi_nor *nor)
 	int sr, fsr;
 
 	if (nor->flags & SNOR_F_READY_XSR_RDY)
-		sr = s3an_sr_ready(nor);
+		sr = spi_nor_xsr_ready(nor);
 	else
 		sr = spi_nor_sr_ready(nor);
 	if (sr < 0)
@@ -797,8 +797,8 @@ static int write_sr_and_check(struct spi_nor *nor, u8 status_new, u8 mask)
 	return ((ret & mask) != (status_new & mask)) ? -EIO : 0;
 }
 
-static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
-				 uint64_t *len)
+static void get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
+				uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
@@ -823,8 +823,8 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
  * Return 1 if the entire region is locked (if @locked is true) or unlocked (if
  * @locked is false); 0 otherwise
  */
-static int stm_check_lock_status_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-				    u8 sr, bool locked)
+static int check_lock_status_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				u8 sr, bool locked)
 {
 	loff_t lock_offs;
 	uint64_t lock_len;
@@ -832,7 +832,7 @@ static int stm_check_lock_status_sr(struct spi_nor *nor, loff_t ofs, uint64_t le
 	if (!len)
 		return 1;
 
-	stm_get_locked_range(nor, sr, &lock_offs, &lock_len);
+	get_locked_range_sr(nor, sr, &lock_offs, &lock_len);
 
 	if (locked)
 		/* Requested range is a sub-range of locked range */
@@ -842,16 +842,14 @@ static int stm_check_lock_status_sr(struct spi_nor *nor, loff_t ofs, uint64_t le
 		return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
 }
 
-static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-			    u8 sr)
+static int is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len, u8 sr)
 {
-	return stm_check_lock_status_sr(nor, ofs, len, sr, true);
+	return check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
-static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-			      u8 sr)
+static int is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len, u8 sr)
 {
-	return stm_check_lock_status_sr(nor, ofs, len, sr, false);
+	return check_lock_status_sr(nor, ofs, len, sr, false);
 }
 
 /*
@@ -886,7 +884,7 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
  *
  * Returns negative on errors, 0 on success.
  */
-static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
@@ -901,16 +899,16 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		return status_old;
 
 	/* If nothing in our range is unlocked, we don't need to do anything */
-	if (stm_is_locked_sr(nor, ofs, len, status_old))
+	if (is_locked_sr(nor, ofs, len, status_old))
 		return 0;
 
 	/* If anything below us is unlocked, we can't use 'bottom' protection */
-	if (!stm_is_locked_sr(nor, 0, ofs, status_old))
+	if (!is_locked_sr(nor, 0, ofs, status_old))
 		can_be_bottom = false;
 
 	/* If anything above us is unlocked, we can't use 'top' protection */
-	if (!stm_is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
-				status_old))
+	if (!is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
+			  status_old))
 		can_be_top = false;
 
 	if (!can_be_bottom && !can_be_top)
@@ -962,11 +960,11 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 }
 
 /*
- * Unlock a region of the flash. See stm_lock() for more info
+ * Unlock a region of the flash. See sr_lock() for more info
  *
  * Returns negative on errors, 0 on success.
  */
-static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
@@ -981,16 +979,16 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		return status_old;
 
 	/* If nothing in our range is locked, we don't need to do anything */
-	if (stm_is_unlocked_sr(nor, ofs, len, status_old))
+	if (is_unlocked_sr(nor, ofs, len, status_old))
 		return 0;
 
 	/* If anything below us is locked, we can't use 'top' protection */
-	if (!stm_is_unlocked_sr(nor, 0, ofs, status_old))
+	if (!is_unlocked_sr(nor, 0, ofs, status_old))
 		can_be_top = false;
 
 	/* If anything above us is locked, we can't use 'bottom' protection */
-	if (!stm_is_unlocked_sr(nor, ofs + len, mtd->size - (ofs + len),
-				status_old))
+	if (!is_unlocked_sr(nor, ofs + len, mtd->size - (ofs + len),
+			    status_old))
 		can_be_bottom = false;
 
 	if (!can_be_bottom && !can_be_top)
@@ -1045,13 +1043,13 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 }
 
 /*
- * Check if a region of the flash is (completely) locked. See stm_lock() for
+ * Check if a region of the flash is (completely) locked. See sr_lock() for
  * more info.
  *
  * Returns 1 if entire region is locked, 0 if any portion is unlocked, and
  * negative on errors.
  */
-static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sr_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	int status;
 
@@ -1059,13 +1057,13 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (status < 0)
 		return status;
 
-	return stm_is_locked_sr(nor, ofs, len, status);
+	return is_locked_sr(nor, ofs, len, status);
 }
 
-static const struct spi_nor_locking_ops stm_locking_ops = {
-	.lock = stm_lock,
-	.unlock = stm_unlock,
-	.is_locked = stm_is_locked,
+static const struct spi_nor_locking_ops sr_locking_ops = {
+	.lock = sr_lock,
+	.unlock = sr_unlock,
+	.is_locked = sr_is_locked,
 };
 
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
@@ -1148,7 +1146,7 @@ static int no_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * macronix_quad_enable() - set QE bit in Status Register.
+ * sr1_bit6_quad_enable() - set QE bit in Status Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Status Register.
@@ -1157,7 +1155,7 @@ static int no_quad_enable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int macronix_quad_enable(struct spi_nor *nor)
+static int sr1_bit6_quad_enable(struct spi_nor *nor)
 {
 	int ret, val;
 
@@ -1177,7 +1175,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 
 	ret = read_sr(nor);
 	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
-		dev_err(nor->dev, "Macronix Quad bit not set\n");
+		dev_err(nor->dev, "QE bit not set\n");
 		return -EINVAL;
 	}
 
@@ -1185,7 +1183,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spansion_quad_enable() - set QE bit in Configuraiton Register.
+ * legacy_quad_enable() - set QE bit in Configuraiton Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Configuration Register.
@@ -1207,7 +1205,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spansion_quad_enable(struct spi_nor *nor)
+static int legacy_quad_enable(struct spi_nor *nor)
 {
 	u8 sr_cr[2] = {0, CR_QUAD_EN_SPAN};
 	int ret;
@@ -1227,7 +1225,7 @@ static int spansion_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Register.
+ * sr2_bit1_no_read_quad_enable() - set QE bit in Configuration Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Configuration Register.
@@ -1239,7 +1237,7 @@ static int spansion_quad_enable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
+static int sr2_bit1_no_read_quad_enable(struct spi_nor *nor)
 {
 	u8 sr_cr[2];
 	int ret;
@@ -1257,7 +1255,7 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spansion_read_cr_quad_enable() - set QE bit in Configuration Register.
+ * sr2_bit1_read_quad_enable() - set QE bit in Configuration Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Configuration Register.
@@ -1269,7 +1267,7 @@ static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spansion_read_cr_quad_enable(struct spi_nor *nor)
+static int sr2_bit1_read_quad_enable(struct spi_nor *nor)
 {
 	struct device *dev = nor->dev;
 	u8 sr_cr[2];
@@ -1363,7 +1361,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 static int gd25q256_post_sfdp_fixups(struct spi_nor *nor,
 				     struct spi_nor_flash_parameter *params)
 {
-	params->quad_enable = macronix_quad_enable;
+	params->quad_enable = sr1_bit6_quad_enable;
 
 	return 0;
 }
@@ -2548,11 +2546,11 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
 	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
-		params->quad_enable = spansion_no_read_cr_quad_enable;
+		params->quad_enable = sr2_bit1_no_read_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR1_BIT6:
-		params->quad_enable = macronix_quad_enable;
+		params->quad_enable = sr1_bit6_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT7:
@@ -2560,7 +2558,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1:
-		params->quad_enable = spansion_read_cr_quad_enable;
+		params->quad_enable = sr2_bit1_read_quad_enable;
 		break;
 
 	default:
@@ -3326,18 +3324,18 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-static int macronix_set_4byte(struct spi_nor *nor, bool enable)
+static int en4_ex4_set_4byte(struct spi_nor *nor, bool enable)
 {
 	return nor->write_reg(nor, enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B,
 			      NULL, 0);
 }
 
-static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
+static int en4_ex4_wen_set_4byte(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
 	write_enable(nor);
-	ret = macronix_set_4byte(nor, enable);
+	ret = en4_ex4_set_4byte(nor, enable);
 	write_disable(nor);
 
 	return ret;
@@ -3347,7 +3345,7 @@ static int winbond_set_4byte(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	ret = macronix_set_4byte(nor, enable);
+	ret = en4_ex4_set_4byte(nor, enable);
 	if (ret || enable)
 		return ret;
 
@@ -3369,14 +3367,14 @@ static void st_micron_post_sfdp_fixups(struct spi_nor *nor)
 {
 	/* All ST/Micron NORs support the unlock/lock operations. */
 	nor->flags |= SNOR_F_HAS_LOCK;
-	nor->set_4byte = st_micron_set_4byte;
+	nor->set_4byte = en4_ex4_wen_set_4byte;
 	nor->quad_enable = no_quad_enable;
 }
 
 static void macronix_post_sfdp_fixups(struct spi_nor *nor)
 {
-	nor->set_4byte = macronix_set_4byte;
-	nor->quad_enable = macronix_quad_enable;
+	nor->set_4byte = en4_ex4_set_4byte;
+	nor->quad_enable = sr1_bit6_quad_enable;
 }
 
 static void winbond_post_sfdp_fixups(struct spi_nor *nor)
@@ -3669,7 +3667,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |= SNOR_F_HAS_LOCK;
 
 	/* Kept only for backward compatibility purpose. */
-	nor->quad_enable = spansion_quad_enable;
+	nor->quad_enable = legacy_quad_enable;
 
 	/*
 	 * Post SFDP fixups. Has to be called before spi_nor_setup() because
@@ -3688,7 +3686,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * pick the default ones.
 	 */
 	if (nor->flags & SNOR_F_HAS_LOCK && !nor->locking_ops)
-		nor->locking_ops = &stm_locking_ops;
+		nor->locking_ops = &sr_locking_ops;
 
 	if (nor->locking_ops) {
 		mtd->_lock = spi_nor_lock;
-- 
2.17.1
