Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSN1l-0003sj-W5
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 14:10:53 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/6] mtd: spi-nor: Avoid forward declaration of internal
 functions
Date: Thu, 29 Nov 2018 15:10:22 +0100
Message-Id: <20181129141026.24892-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181129141026.24892-1-boris.brezillon@bootlin.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
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
Changes in v2:
- None
---
 drivers/mtd/spi-nor/spi-nor.c | 202 +++++++++++++++++-----------------
 1 file changed, 98 insertions(+), 104 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0aa1b1035b4b..e1eaabf98d08 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -96,8 +96,6 @@ struct flash_info {
 
 #define JEDEC_MFR(info)	((info)->id[0])
 
-static const struct flash_info *spi_nor_match_id(const char *name);
-
 /*
  * Read the status register, returning its value in the location
  * Return the status register value.
@@ -1202,7 +1200,42 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static int macronix_quad_enable(struct spi_nor *nor);
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
 
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -1778,43 +1811,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
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
 /*
  * Write status Register and configuration register with 2 bytes
  * The first byte will be written to the status register, while the
@@ -2479,7 +2475,56 @@ static const struct sfdp_bfpt_erase sfdp_bfpt_erases[] = {
 	{BFPT_DWORD(9), 16},
 };
 
-static int spi_nor_hwcaps_read2cmd(u32 hwcaps);
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
 
 /**
  * spi_nor_set_erase_type() - set a SPI NOR erase type
@@ -3279,57 +3324,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
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
@@ -3610,6 +3604,18 @@ void spi_nor_restore(struct spi_nor *nor)
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
@@ -3809,18 +3815,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
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
