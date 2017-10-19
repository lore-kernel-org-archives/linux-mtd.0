Received: from mx1.emlix.com ([46.4.235.150])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e55wx-0007KK-MT
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 08:13:13 +0000
Received: from mailer.emlix.com (unknown [80.150.94.234])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id C9C6125F46A
 for <linux-mtd@lists.infradead.org>; Thu, 19 Oct 2017 10:12:47 +0200 (CEST)
From: Philipp Puschmann <pp@emlix.com>
To: linux-mtd@lists.infradead.org
Cc: pp@emlix.com
Subject: [PATCH] mtd: spi-nor: Add support for mr25h128
Date: Thu, 19 Oct 2017 10:12:47 +0200
Message-Id: <20171019081247.5486-1-pp@emlix.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Everspin mr25h128 16KB MRAM to the list of supported chips.

Signed-off-by: Philipp Puschmann <pp@emlix.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
 drivers/mtd/devices/m25p80.c                            | 1 +
 drivers/mtd/spi-nor/spi-nor.c                           | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index 9ce35af8507c..956bb046e599 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -13,6 +13,7 @@ Required properties:
                  at25df321a
                  at25df641
                  at26df081a
+                 mr25h128
                  mr25h256
                  mr25h10
                  mr25h40
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 00eea6fd379c..dbe6a1de2bb8 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -359,6 +359,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
 
 	/* Everspin MRAMs (non-JEDEC) */
+	{ "mr25h128" }, /* 128 Kib, 40 MHz */
 	{ "mr25h256" }, /* 256 Kib, 40 MHz */
 	{ "mr25h10" },  /*   1 Mib, 40 MHz */
 	{ "mr25h40" },  /*   4 Mib, 40 MHz */
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 386de64e5a86..a835bb890166 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -964,6 +964,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_HAS_LOCK) },
 
 	/* Everspin */
+	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-- 
2.15.0.rc1
