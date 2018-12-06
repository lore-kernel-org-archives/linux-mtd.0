Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUr6F-0000We-C4
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 10:41:47 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/5] mtd: spi-nor: Avoid forward declaration of internal
 functions
Date: Thu,  6 Dec 2018 11:41:17 +0100
Message-Id: <20181206104120.6280-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181206104120.6280-1-boris.brezillon@bootlin.com>
References: <20181206104120.6280-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Reorganize the code to kill forward declarations of spi_nor_match_id()
macronix_quad_enable() and spi_nor_hwcaps_read2cmd().

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v3:
- Group all _quad_enable() implems
- Move spi_nor_hwcaps_xx2cmd() just after spi_nor_set_pp_settings()

Changes in v2:
- None
---
 drivers/mtd/spi-nor/spi-nor.c | 614 +++++++++++++++++-----------------
 1 file changed, 304 insertions(+), 310 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d099aee075e9..b440f29637ab 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -289,8 +289,6 @@ struct flash_info {
 
 #define JEDEC_MFR(info)	((info)->id[0])
 
-static const struct flash_info *spi_nor_match_id(const char *name);
-
 /*
  * Read the status register, returning its value in the location
  * Return the status register value.
@@ -1395,7 +1393,247 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static int macronix_quad_enable(struct spi_nor *nor);
+/*
+ * Write status Register and configuration register with 2 bytes
+ * The first byte will be written to the status register, while the
+ * second byte will be written to the configuration register.
+ * Return negative if error occurred.
+ */
+static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
+{
+	int ret;
+
+	write_enable(nor);
+
+	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
+	if (ret < 0) {
+		dev_err(nor->dev,
+			"error while writing configuration register\n");
+		return -EINVAL;
+	}
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret) {
+		dev_err(nor->dev,
+			"timeout while writing configuration register\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * macronix_quad_enable() - set QE bit in Status Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Set the Quad Enable (QE) bit in the Status Register.
+ *
+ * bit 6 of the Status Register is the QE bit for Macronix like QSPI memories.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int macronix_quad_enable(struct spi_nor *nor)
+{
+	int ret, val;
+
+	val = read_sr(nor);
+	if (val < 0)
+		return val;
+	if (val & SR_QUAD_EN_MX)
+		return 0;
+
+	write_enable(nor);
+
+	write_sr(nor, val | SR_QUAD_EN_MX);
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	ret = read_sr(nor);
+	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
+		dev_err(nor->dev, "Macronix Quad bit not set\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * spansion_quad_enable() - set QE bit in Configuraiton Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Set the Quad Enable (QE) bit in the Configuration Register.
+ * This function is kept for legacy purpose because it has been used for a
+ * long time without anybody complaining but it should be considered as
+ * deprecated and maybe buggy.
+ * First, this function doesn't care about the previous values of the Status
+ * and Configuration Registers when it sets the QE bit (bit 1) in the
+ * Configuration Register: all other bits are cleared, which may have unwanted
+ * side effects like removing some block protections.
+ * Secondly, it uses the Read Configuration Register (35h) instruction though
+ * some very old and few memories don't support this instruction. If a pull-up
+ * resistor is present on the MISO/IO1 line, we might still be able to pass the
+ * "read back" test because the QSPI memory doesn't recognize the command,
+ * so leaves the MISO/IO1 line state unchanged, hence read_cr() returns 0xFF.
+ *
+ * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
+ * memories.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_quad_enable(struct spi_nor *nor)
+{
+	u8 sr_cr[2] = {0, CR_QUAD_EN_SPAN};
+	int ret;
+
+	ret = write_sr_cr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	/* read back and check it */
+	ret = read_cr(nor);
+	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
+		dev_err(nor->dev, "Spansion Quad bit not set\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Set the Quad Enable (QE) bit in the Configuration Register.
+ * This function should be used with QSPI memories not supporting the Read
+ * Configuration Register (35h) instruction.
+ *
+ * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
+ * memories.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
+{
+	u8 sr_cr[2];
+	int ret;
+
+	/* Keep the current value of the Status Register. */
+	ret = read_sr(nor);
+	if (ret < 0) {
+		dev_err(nor->dev, "error while reading status register\n");
+		return -EINVAL;
+	}
+	sr_cr[0] = ret;
+	sr_cr[1] = CR_QUAD_EN_SPAN;
+
+	return write_sr_cr(nor, sr_cr);
+}
+
+/**
+ * spansion_read_cr_quad_enable() - set QE bit in Configuration Register.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Set the Quad Enable (QE) bit in the Configuration Register.
+ * This function should be used with QSPI memories supporting the Read
+ * Configuration Register (35h) instruction.
+ *
+ * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
+ * memories.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spansion_read_cr_quad_enable(struct spi_nor *nor)
+{
+	struct device *dev = nor->dev;
+	u8 sr_cr[2];
+	int ret;
+
+	/* Check current Quad Enable bit value. */
+	ret = read_cr(nor);
+	if (ret < 0) {
+		dev_err(dev, "error while reading configuration register\n");
+		return -EINVAL;
+	}
+
+	if (ret & CR_QUAD_EN_SPAN)
+		return 0;
+
+	sr_cr[1] = ret | CR_QUAD_EN_SPAN;
+
+	/* Keep the current value of the Status Register. */
+	ret = read_sr(nor);
+	if (ret < 0) {
+		dev_err(dev, "error while reading status register\n");
+		return -EINVAL;
+	}
+	sr_cr[0] = ret;
+
+	ret = write_sr_cr(nor, sr_cr);
+	if (ret)
+		return ret;
+
+	/* Read back and check it. */
+	ret = read_cr(nor);
+	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
+		dev_err(nor->dev, "Spansion Quad bit not set\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/**
+ * sr2_bit7_quad_enable() - set QE bit in Status Register 2.
+ * @nor:	pointer to a 'struct spi_nor'
+ *
+ * Set the Quad Enable (QE) bit in the Status Register 2.
+ *
+ * This is one of the procedures to set the QE bit described in the SFDP
+ * (JESD216 rev B) specification but no manufacturer using this procedure has
+ * been identified yet, hence the name of the function.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int sr2_bit7_quad_enable(struct spi_nor *nor)
+{
+	u8 sr2;
+	int ret;
+
+	/* Check current Quad Enable bit value. */
+	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
+	if (ret)
+		return ret;
+	if (sr2 & SR2_QUAD_EN_BIT7)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	sr2 |= SR2_QUAD_EN_BIT7;
+
+	write_enable(nor);
+
+	ret = nor->write_reg(nor, SPINOR_OP_WRSR2, &sr2, 1);
+	if (ret < 0) {
+		dev_err(nor->dev, "error while writing status register 2\n");
+		return -EINVAL;
+	}
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret < 0) {
+		dev_err(nor->dev, "timeout while writing status register 2\n");
+		return ret;
+	}
+
+	/* Read back and check it. */
+	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
+	if (!(ret > 0 && (sr2 & SR2_QUAD_EN_BIT7))) {
+		dev_err(nor->dev, "SR2 Quad bit not set\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
 
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -2002,248 +2240,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return ret;
 }
 
-/**
- * macronix_quad_enable() - set QE bit in Status Register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Status Register.
- *
- * bit 6 of the Status Register is the QE bit for Macronix like QSPI memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int macronix_quad_enable(struct spi_nor *nor)
-{
-	int ret, val;
-
-	val = read_sr(nor);
-	if (val < 0)
-		return val;
-	if (val & SR_QUAD_EN_MX)
-		return 0;
-
-	write_enable(nor);
-
-	write_sr(nor, val | SR_QUAD_EN_MX);
-
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret)
-		return ret;
-
-	ret = read_sr(nor);
-	if (!(ret > 0 && (ret & SR_QUAD_EN_MX))) {
-		dev_err(nor->dev, "Macronix Quad bit not set\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-/*
- * Write status Register and configuration register with 2 bytes
- * The first byte will be written to the status register, while the
- * second byte will be written to the configuration register.
- * Return negative if error occurred.
- */
-static int write_sr_cr(struct spi_nor *nor, u8 *sr_cr)
-{
-	int ret;
-
-	write_enable(nor);
-
-	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
-	if (ret < 0) {
-		dev_err(nor->dev,
-			"error while writing configuration register\n");
-		return -EINVAL;
-	}
-
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret) {
-		dev_err(nor->dev,
-			"timeout while writing configuration register\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-/**
- * spansion_quad_enable() - set QE bit in Configuraiton Register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Configuration Register.
- * This function is kept for legacy purpose because it has been used for a
- * long time without anybody complaining but it should be considered as
- * deprecated and maybe buggy.
- * First, this function doesn't care about the previous values of the Status
- * and Configuration Registers when it sets the QE bit (bit 1) in the
- * Configuration Register: all other bits are cleared, which may have unwanted
- * side effects like removing some block protections.
- * Secondly, it uses the Read Configuration Register (35h) instruction though
- * some very old and few memories don't support this instruction. If a pull-up
- * resistor is present on the MISO/IO1 line, we might still be able to pass the
- * "read back" test because the QSPI memory doesn't recognize the command,
- * so leaves the MISO/IO1 line state unchanged, hence read_cr() returns 0xFF.
- *
- * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
- * memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spansion_quad_enable(struct spi_nor *nor)
-{
-	u8 sr_cr[2] = {0, CR_QUAD_EN_SPAN};
-	int ret;
-
-	ret = write_sr_cr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	/* read back and check it */
-	ret = read_cr(nor);
-	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
-		dev_err(nor->dev, "Spansion Quad bit not set\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-/**
- * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Configuration Register.
- * This function should be used with QSPI memories not supporting the Read
- * Configuration Register (35h) instruction.
- *
- * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
- * memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spansion_no_read_cr_quad_enable(struct spi_nor *nor)
-{
-	u8 sr_cr[2];
-	int ret;
-
-	/* Keep the current value of the Status Register. */
-	ret = read_sr(nor);
-	if (ret < 0) {
-		dev_err(nor->dev, "error while reading status register\n");
-		return -EINVAL;
-	}
-	sr_cr[0] = ret;
-	sr_cr[1] = CR_QUAD_EN_SPAN;
-
-	return write_sr_cr(nor, sr_cr);
-}
-
-/**
- * spansion_read_cr_quad_enable() - set QE bit in Configuration Register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Configuration Register.
- * This function should be used with QSPI memories supporting the Read
- * Configuration Register (35h) instruction.
- *
- * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
- * memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spansion_read_cr_quad_enable(struct spi_nor *nor)
-{
-	struct device *dev = nor->dev;
-	u8 sr_cr[2];
-	int ret;
-
-	/* Check current Quad Enable bit value. */
-	ret = read_cr(nor);
-	if (ret < 0) {
-		dev_err(dev, "error while reading configuration register\n");
-		return -EINVAL;
-	}
-
-	if (ret & CR_QUAD_EN_SPAN)
-		return 0;
-
-	sr_cr[1] = ret | CR_QUAD_EN_SPAN;
-
-	/* Keep the current value of the Status Register. */
-	ret = read_sr(nor);
-	if (ret < 0) {
-		dev_err(dev, "error while reading status register\n");
-		return -EINVAL;
-	}
-	sr_cr[0] = ret;
-
-	ret = write_sr_cr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	/* Read back and check it. */
-	ret = read_cr(nor);
-	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
-		dev_err(nor->dev, "Spansion Quad bit not set\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-/**
- * sr2_bit7_quad_enable() - set QE bit in Status Register 2.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Status Register 2.
- *
- * This is one of the procedures to set the QE bit described in the SFDP
- * (JESD216 rev B) specification but no manufacturer using this procedure has
- * been identified yet, hence the name of the function.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int sr2_bit7_quad_enable(struct spi_nor *nor)
-{
-	u8 sr2;
-	int ret;
-
-	/* Check current Quad Enable bit value. */
-	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
-	if (ret)
-		return ret;
-	if (sr2 & SR2_QUAD_EN_BIT7)
-		return 0;
-
-	/* Update the Quad Enable bit. */
-	sr2 |= SR2_QUAD_EN_BIT7;
-
-	write_enable(nor);
-
-	ret = nor->write_reg(nor, SPINOR_OP_WRSR2, &sr2, 1);
-	if (ret < 0) {
-		dev_err(nor->dev, "error while writing status register 2\n");
-		return -EINVAL;
-	}
-
-	ret = spi_nor_wait_till_ready(nor);
-	if (ret < 0) {
-		dev_err(nor->dev, "timeout while writing status register 2\n");
-		return ret;
-	}
-
-	/* Read back and check it. */
-	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
-	if (!(ret > 0 && (sr2 & SR2_QUAD_EN_BIT7))) {
-		dev_err(nor->dev, "SR2 Quad bit not set\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
@@ -2318,6 +2314,57 @@ spi_nor_set_pp_settings(struct spi_nor_pp_command *pp,
 	pp->proto = proto;
 }
 
+static int spi_nor_hwcaps2cmd(u32 hwcaps, const int table[][2], size_t size)
+{
+	size_t i;
+
+	for (i = 0; i < size; i++)
+		if (table[i][0] == (int)hwcaps)
+			return table[i][1];
+
+	return -EINVAL;
+}
+
+static int spi_nor_hwcaps_read2cmd(u32 hwcaps)
+{
+	static const int hwcaps_read2cmd[][2] = {
+		{ SNOR_HWCAPS_READ,		SNOR_CMD_READ },
+		{ SNOR_HWCAPS_READ_FAST,	SNOR_CMD_READ_FAST },
+		{ SNOR_HWCAPS_READ_1_1_1_DTR,	SNOR_CMD_READ_1_1_1_DTR },
+		{ SNOR_HWCAPS_READ_1_1_2,	SNOR_CMD_READ_1_1_2 },
+		{ SNOR_HWCAPS_READ_1_2_2,	SNOR_CMD_READ_1_2_2 },
+		{ SNOR_HWCAPS_READ_2_2_2,	SNOR_CMD_READ_2_2_2 },
+		{ SNOR_HWCAPS_READ_1_2_2_DTR,	SNOR_CMD_READ_1_2_2_DTR },
+		{ SNOR_HWCAPS_READ_1_1_4,	SNOR_CMD_READ_1_1_4 },
+		{ SNOR_HWCAPS_READ_1_4_4,	SNOR_CMD_READ_1_4_4 },
+		{ SNOR_HWCAPS_READ_4_4_4,	SNOR_CMD_READ_4_4_4 },
+		{ SNOR_HWCAPS_READ_1_4_4_DTR,	SNOR_CMD_READ_1_4_4_DTR },
+		{ SNOR_HWCAPS_READ_1_1_8,	SNOR_CMD_READ_1_1_8 },
+		{ SNOR_HWCAPS_READ_1_8_8,	SNOR_CMD_READ_1_8_8 },
+		{ SNOR_HWCAPS_READ_8_8_8,	SNOR_CMD_READ_8_8_8 },
+		{ SNOR_HWCAPS_READ_1_8_8_DTR,	SNOR_CMD_READ_1_8_8_DTR },
+	};
+
+	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_read2cmd,
+				  ARRAY_SIZE(hwcaps_read2cmd));
+}
+
+static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
+{
+	static const int hwcaps_pp2cmd[][2] = {
+		{ SNOR_HWCAPS_PP,		SNOR_CMD_PP },
+		{ SNOR_HWCAPS_PP_1_1_4,		SNOR_CMD_PP_1_1_4 },
+		{ SNOR_HWCAPS_PP_1_4_4,		SNOR_CMD_PP_1_4_4 },
+		{ SNOR_HWCAPS_PP_4_4_4,		SNOR_CMD_PP_4_4_4 },
+		{ SNOR_HWCAPS_PP_1_1_8,		SNOR_CMD_PP_1_1_8 },
+		{ SNOR_HWCAPS_PP_1_8_8,		SNOR_CMD_PP_1_8_8 },
+		{ SNOR_HWCAPS_PP_8_8_8,		SNOR_CMD_PP_8_8_8 },
+	};
+
+	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_pp2cmd,
+				  ARRAY_SIZE(hwcaps_pp2cmd));
+}
+
 /*
  * Serial Flash Discoverable Parameters (SFDP) parsing.
  */
@@ -2527,8 +2574,6 @@ static const struct sfdp_bfpt_erase sfdp_bfpt_erases[] = {
 	{BFPT_DWORD(9), 16},
 };
 
-static int spi_nor_hwcaps_read2cmd(u32 hwcaps);
-
 /**
  * spi_nor_set_erase_type() - set a SPI NOR erase type
  * @erase:	pointer to a structure that describes a SPI NOR erase type
@@ -3342,57 +3387,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	return 0;
 }
 
-static int spi_nor_hwcaps2cmd(u32 hwcaps, const int table[][2], size_t size)
-{
-	size_t i;
-
-	for (i = 0; i < size; i++)
-		if (table[i][0] == (int)hwcaps)
-			return table[i][1];
-
-	return -EINVAL;
-}
-
-static int spi_nor_hwcaps_read2cmd(u32 hwcaps)
-{
-	static const int hwcaps_read2cmd[][2] = {
-		{ SNOR_HWCAPS_READ,		SNOR_CMD_READ },
-		{ SNOR_HWCAPS_READ_FAST,	SNOR_CMD_READ_FAST },
-		{ SNOR_HWCAPS_READ_1_1_1_DTR,	SNOR_CMD_READ_1_1_1_DTR },
-		{ SNOR_HWCAPS_READ_1_1_2,	SNOR_CMD_READ_1_1_2 },
-		{ SNOR_HWCAPS_READ_1_2_2,	SNOR_CMD_READ_1_2_2 },
-		{ SNOR_HWCAPS_READ_2_2_2,	SNOR_CMD_READ_2_2_2 },
-		{ SNOR_HWCAPS_READ_1_2_2_DTR,	SNOR_CMD_READ_1_2_2_DTR },
-		{ SNOR_HWCAPS_READ_1_1_4,	SNOR_CMD_READ_1_1_4 },
-		{ SNOR_HWCAPS_READ_1_4_4,	SNOR_CMD_READ_1_4_4 },
-		{ SNOR_HWCAPS_READ_4_4_4,	SNOR_CMD_READ_4_4_4 },
-		{ SNOR_HWCAPS_READ_1_4_4_DTR,	SNOR_CMD_READ_1_4_4_DTR },
-		{ SNOR_HWCAPS_READ_1_1_8,	SNOR_CMD_READ_1_1_8 },
-		{ SNOR_HWCAPS_READ_1_8_8,	SNOR_CMD_READ_1_8_8 },
-		{ SNOR_HWCAPS_READ_8_8_8,	SNOR_CMD_READ_8_8_8 },
-		{ SNOR_HWCAPS_READ_1_8_8_DTR,	SNOR_CMD_READ_1_8_8_DTR },
-	};
-
-	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_read2cmd,
-				  ARRAY_SIZE(hwcaps_read2cmd));
-}
-
-static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
-{
-	static const int hwcaps_pp2cmd[][2] = {
-		{ SNOR_HWCAPS_PP,		SNOR_CMD_PP },
-		{ SNOR_HWCAPS_PP_1_1_4,		SNOR_CMD_PP_1_1_4 },
-		{ SNOR_HWCAPS_PP_1_4_4,		SNOR_CMD_PP_1_4_4 },
-		{ SNOR_HWCAPS_PP_4_4_4,		SNOR_CMD_PP_4_4_4 },
-		{ SNOR_HWCAPS_PP_1_1_8,		SNOR_CMD_PP_1_1_8 },
-		{ SNOR_HWCAPS_PP_1_8_8,		SNOR_CMD_PP_1_8_8 },
-		{ SNOR_HWCAPS_PP_8_8_8,		SNOR_CMD_PP_8_8_8 },
-	};
-
-	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_pp2cmd,
-				  ARRAY_SIZE(hwcaps_pp2cmd));
-}
-
 static int spi_nor_select_read(struct spi_nor *nor,
 			       const struct spi_nor_flash_parameter *params,
 			       u32 shared_hwcaps)
@@ -3669,6 +3663,18 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
+static const struct flash_info *spi_nor_match_id(const char *name)
+{
+	const struct flash_info *id = spi_nor_ids;
+
+	while (id->name) {
+		if (!strcmp(name, id->name))
+			return id;
+		id++;
+	}
+	return NULL;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -3872,18 +3878,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 }
 EXPORT_SYMBOL_GPL(spi_nor_scan);
 
-static const struct flash_info *spi_nor_match_id(const char *name)
-{
-	const struct flash_info *id = spi_nor_ids;
-
-	while (id->name) {
-		if (!strcmp(name, id->name))
-			return id;
-		id++;
-	}
-	return NULL;
-}
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
 MODULE_AUTHOR("Mike Lavender");
-- 
2.17.1
