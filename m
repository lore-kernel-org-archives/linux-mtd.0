Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPT-0000wt-8o
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:02 +0000
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
Subject: [RFC PATCH 03/34] mtd: spi-nor: Create a ->set_4byte() method
Date: Fri,  7 Dec 2018 10:26:06 +0100
Message-Id: <20181207092637.18687-4-boris.brezillon@bootlin.com>
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

The procedure used to enable 4 byte addressing mode depends on the NOR
device, so let's provide a hook so that manufacturer specific handling
can be implemented in a sane way.

This is also an opportunity to create a per-manufacturer post SFDP
fixups function where we'll put all the manufacturer specific tweaks.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 138 +++++++++++++++++++++++-----------
 include/linux/mtd/spi-nor.h   |   3 +
 2 files changed, 99 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6b458ff4effa..bea267c446b5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -470,46 +470,15 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 /* Enable/disable 4-byte addressing mode. */
 static int set_4byte(struct spi_nor *nor, bool enable)
 {
-	int status;
-	bool need_wren = false;
-	u8 cmd;
+	if (nor->set_4byte)
+		return nor->set_4byte(nor, enable);
 
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_ST:
-	case SNOR_MFR_MICRON:
-		/* Some Micron need WREN command; all will accept it */
-		need_wren = true;
-		/* fall through */
-	case SNOR_MFR_MACRONIX:
-	case SNOR_MFR_WINBOND:
-		if (need_wren)
-			write_enable(nor);
-
-		cmd = enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B;
-		status = nor->write_reg(nor, cmd, NULL, 0);
-		if (need_wren)
-			write_disable(nor);
-
-		if (!status && !enable &&
-		    JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND) {
-			/*
-			 * On Winbond W25Q256FV, leaving 4byte mode causes
-			 * the Extended Address Register to be set to 1, so all
-			 * 3-byte-address reads come from the second 16M.
-			 * We must clear the register to enable normal behavior.
-			 */
-			write_enable(nor);
-			nor->cmd_buf[0] = 0;
-			nor->write_reg(nor, SPINOR_OP_WREAR, nor->cmd_buf, 1);
-			write_disable(nor);
-		}
-
-		return status;
-	default:
-		/* Spansion style */
-		nor->cmd_buf[0] = enable << 7;
-		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
-	}
+	/*
+	 * Spansion style. Should work for all NORs that do not have their own
+	 * ->set_4byte() implementation.
+	 */
+	nor->cmd_buf[0] = enable << 7;
+	return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
 }
 
 static int s3an_sr_ready(struct spi_nor *nor)
@@ -3666,13 +3635,98 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
+static int macronix_set_4byte(struct spi_nor *nor, bool enable)
+{
+	return nor->write_reg(nor, enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B,
+			      NULL, 0);
+}
+
+static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	write_enable(nor);
+	ret = macronix_set_4byte(nor, enable);
+	write_disable(nor);
+
+	return ret;
+}
+
+static int winbond_set_4byte(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	ret = macronix_set_4byte(nor, enable);
+	if (ret || enable)
+		return ret;
+
+	/*
+	 * On Winbond W25Q256FV, leaving 4byte mode causes the Extended Address
+	 * Register to be set to 1, so all 3-byte-address reads come from the
+	 * second 16M.
+	 * We must clear the register to enable normal behavior.
+	 */
+	write_enable(nor);
+	nor->cmd_buf[0] = 0;
+	nor->write_reg(nor, SPINOR_OP_WREAR, nor->cmd_buf, 1);
+	write_disable(nor);
+
+	return ret;
+}
+
+static void st_micron_post_sfdp_fixups(struct spi_nor *nor)
+{
+	nor->set_4byte = st_micron_set_4byte;
+}
+
+static void macronix_post_sfdp_fixups(struct spi_nor *nor)
+{
+	nor->set_4byte = macronix_set_4byte;
+}
+
+static void winbond_post_sfdp_fixups(struct spi_nor *nor)
+{
+	nor->set_4byte = winbond_set_4byte;
+}
+
+static int
+spi_nor_manufacturer_post_sfdp_fixups(struct spi_nor *nor,
+				      struct spi_nor_flash_parameter *params)
+{
+	switch (JEDEC_MFR(nor->info)) {
+	case SNOR_MFR_ST:
+	case SNOR_MFR_MICRON:
+		st_micron_post_sfdp_fixups(nor);
+		break;
+
+	case SNOR_MFR_MACRONIX:
+		macronix_post_sfdp_fixups(nor);
+		break;
+
+	case SNOR_MFR_WINBOND:
+		winbond_post_sfdp_fixups(nor);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int spi_nor_post_sfdp_fixups(struct spi_nor *nor,
 				    struct spi_nor_flash_parameter *params)
 {
-	if (nor->info->fixups && nor->info->fixups->post_sfdp)
-		return nor->info->fixups->post_sfdp(nor, params);
+	int ret;
 
-	return 0;
+	ret = spi_nor_manufacturer_post_sfdp_fixups(nor, params);
+	if (ret)
+		return ret;
+
+	if (nor->info->fixups && nor->info->fixups->post_sfdp)
+		ret = nor->info->fixups->post_sfdp(nor, params);
+
+	return ret;
 }
 
 static const struct flash_info *spi_nor_match_id(const char *name)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5f177aa39f68..d28a9913b165 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -365,6 +365,8 @@ struct flash_info;
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
  * @quad_enable:	[FLASH-SPECIFIC] enables SPI NOR quad mode
  *			completely locked
+ * @set_4byte:		[FLASH-SPECIFIC] put the SPI NOR in 4 byte addressing
+ *			mode
  * @priv:		the private data
  */
 struct spi_nor {
@@ -401,6 +403,7 @@ struct spi_nor {
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*quad_enable)(struct spi_nor *nor);
+	int (*set_4byte)(struct spi_nor *nor, bool enable);
 
 	void *priv;
 };
-- 
2.17.1
