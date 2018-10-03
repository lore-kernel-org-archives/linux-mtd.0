Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iKr-0002TW-A9
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 14:41:10 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Mason Yang <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 6/8] mtd: spi-nor: Create a ->set_4byte() method
Date: Wed,  3 Oct 2018 16:40:41 +0200
Message-Id: <20181003144043.21529-7-boris.brezillon@bootlin.com>
In-Reply-To: <20181003144043.21529-1-boris.brezillon@bootlin.com>
References: <20181003144043.21529-1-boris.brezillon@bootlin.com>
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

This is also an opportunity to create a per-manufacturer fixup function
where will put all the odd things.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 125 +++++++++++++++++++++++++++++-------------
 include/linux/mtd/spi-nor.h   |   1 +
 2 files changed, 88 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1f174adb4da0..00437132803e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -276,44 +276,15 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 /* Enable/disable 4-byte addressing mode. */
 static int set_4byte(struct spi_nor *nor, bool enable)
 {
-	int status;
-	bool need_wren = false;
-	u8 cmd;
-
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_MICRON:
-		/* Some Micron need WREN command; all will accept it */
-		need_wren = true;
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
+	if (nor->set_4byte)
+		return nor->set_4byte(nor, enable);
 
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
@@ -3583,6 +3554,80 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
+static int macronix_set_4byte(struct spi_nor *nor, bool enable)
+{
+	return nor->write_reg(nor, enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B,
+			      NULL, 0);
+}
+
+static int micron_set_4byte(struct spi_nor *nor, bool enable)
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
+static void micron_fixups(struct spi_nor *nor)
+{
+	nor->set_4byte = micron_set_4byte;
+}
+
+static void macronix_fixups(struct spi_nor *nor)
+{
+	nor->set_4byte = macronix_set_4byte;
+}
+
+static void winbond_fixups(struct spi_nor *nor)
+{
+	nor->set_4byte = winbond_set_4byte;
+}
+
+static void spi_nor_manufacturer_fixups(struct spi_nor *nor)
+{
+	switch (JEDEC_MFR(nor->info)) {
+	case SNOR_MFR_MICRON:
+		micron_fixups(nor);
+		break;
+
+	case SNOR_MFR_MACRONIX:
+		macronix_fixups(nor);
+		break;
+
+	case SNOR_MFR_WINBOND:
+		winbond_fixups(nor);
+		break;
+
+	default:
+		break;
+	}
+}
+
 static const struct flash_info *spi_nor_match_id(const char *name)
 {
 	const struct flash_info *id = spi_nor_ids;
@@ -3763,8 +3808,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 			return ret;
 	}
 
-	/* Send all the required SPI flash commands to initialize device */
 	nor->info = info;
+
+	/* Apply manufacturer fixups before we start using the NOR. */
+	spi_nor_manufacturer_fixups(nor);
+
+	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
 	if (ret)
 		return ret;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 7f0c7303575e..09cb85e02de1 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -403,6 +403,7 @@ struct spi_nor {
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*quad_enable)(struct spi_nor *nor);
+	int (*set_4byte)(struct spi_nor *nor, bool enable);
 
 	void *priv;
 };
-- 
2.14.1
