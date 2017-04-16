Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czrwt-0006Th-Rf
 for linux-mtd@lists.infradead.org; Sun, 16 Apr 2017 21:43:14 +0000
Received: from player714.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id B166251788
 for <linux-mtd@lists.infradead.org>; Sun, 16 Apr 2017 23:42:49 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, kdasu.kdev@gmail.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, jartur@cadence.com, mar.krzeminski@gmail.com,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [RFC PATCH v6 3/4] mtd: spi-nor: transitional patch
Date: Sun, 16 Apr 2017 23:41:57 +0200
Message-Id: <df4bdab3eb9507ea708544962aaff8a09eb81a3b.1492374675.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1492374675.git.cyrille.pitchen@atmel.com>
References: <cover.1492374675.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1492374675.git.cyrille.pitchen@atmel.com>
References: <cover.1492374675.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 19 ++++++++++++-------
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3bb2adff306b..2377fe54f8b9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1828,13 +1828,10 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
 	/* Enable Quad I/O if needed. */
 	enable_quad_io = (spi_nor_get_protocol_width(nor->read_proto) == 4 ||
 			  spi_nor_get_protocol_width(nor->write_proto) == 4);
-	if (enable_quad_io && params->quad_enable) {
-		err = params->quad_enable(nor);
-		if (err) {
-			dev_err(nor->dev, "quad mode not supported\n");
-			return err;
-		}
-	}
+	if (enable_quad_io && params->quad_enable)
+		nor->flash_quad_enable = params->quad_enable;
+	else
+		nor->flash_quad_enable = NULL;
 
 	return 0;
 }
@@ -1990,6 +1987,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
+	if (nor->flash_quad_enable) {
+		ret = nor->flash_quad_enable(nor);
+		if (ret) {
+			dev_err(dev, "quad mode not supported\n");
+			return ret;
+		}
+	}
+
 	if (info->addr_width)
 		nor->addr_width = info->addr_width;
 	else if (mtd->size > 0x1000000) {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 73b50efc4fc9..e0c58d9d9286 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -248,6 +248,7 @@ enum spi_nor_option_flags {
  * @flash_unlock:	[FLASH-SPECIFIC] unlock a region of the SPI NOR
  * @flash_is_locked:	[FLASH-SPECIFIC] check if a region of the SPI NOR is
  *			completely locked
+ * @flash_quad_enable:	[FLASH-SPECIFIC] set the Quad Enable bit of the SPI NOR
  * @priv:		the private data
  */
 struct spi_nor {
@@ -281,6 +282,7 @@ struct spi_nor {
 	int (*flash_lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
 	int (*flash_is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*flash_quad_enable)(struct spi_nor *nor);
 
 	void *priv;
 };
-- 
2.9.3
