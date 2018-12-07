Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPT-0000wm-8k
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
Subject: [RFC PATCH 01/34] mtd: spi-nor: Add a new hook to let part specific
 code tweak the config
Date: Fri,  7 Dec 2018 10:26:04 +0100
Message-Id: <20181207092637.18687-2-boris.brezillon@bootlin.com>
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

SFDP tables are sometimes wrong and we need a way to override the
config chosen by the SFDP parsing logic without discarding all of it.
We also need a way to add chip specific tweaks when the SPI NOR does
not support RDSFDP.

Add a new hook called after the SFDP parsing has taken place to deal
with such problems.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 298bc7a2f899..b2b36b2ea251 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -218,6 +218,11 @@ struct sfdp_bfpt {
 /**
  * struct spi_nor_fixups - SPI NOR fixup hooks
  * @post_bfpt: called after the BFPT table has been parsed
+ * @post_sfdp: called after SFDP has been parsed (is also called for SPI NORs
+ *	       that do not support RDSFDP). Typically used to tweak various
+ *	       parameters that could not be extracted by other means (i.e.
+ *	       when information provided by the SFDP/flash_info tables are
+ *	       incomplete or wrong).
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
@@ -227,6 +232,8 @@ struct spi_nor_fixups {
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt,
 			 struct spi_nor_flash_parameter *params);
+	int (*post_sfdp)(struct spi_nor *nor,
+			 struct spi_nor_flash_parameter *params);
 };
 
 struct flash_info {
@@ -3658,6 +3665,15 @@ void spi_nor_restore(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
+static int spi_nor_post_sfdp_fixups(struct spi_nor *nor,
+				    struct spi_nor_flash_parameter *params)
+{
+	if (nor->info->fixups && nor->info->fixups->post_sfdp)
+		return nor->info->fixups->post_sfdp(nor, params);
+
+	return 0;
+}
+
 static const struct flash_info *spi_nor_match_id(const char *name)
 {
 	const struct flash_info *id = spi_nor_ids;
@@ -3805,6 +3821,18 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & SPI_NOR_NO_FR)
 		params.hwcaps.mask &= ~SNOR_HWCAPS_READ_FAST;
 
+	/*
+	 * Post SFDP fixups. Has to be called before spi_nor_setup() because
+	 * some fixups might modify params that are then used by
+	 * spi_nor_setup() to select the opcodes.
+	 */
+	ret = spi_nor_post_sfdp_fixups(nor, &params);
+	if (ret) {
+		dev_err(dev, "failed in the post-SFDP fixups (err %d)\n",
+			ret);
+		return ret;
+	}
+
 	/*
 	 * Configure the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
-- 
2.17.1
