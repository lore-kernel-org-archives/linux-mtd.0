Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayhq0-00025C-50
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 15:38:45 +0000
Received: by mail-pf0-x230.google.com with SMTP id 206so51293989pfu.0
 for <linux-mtd@lists.infradead.org>; Fri, 06 May 2016 08:38:23 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v2] mtd: spi-nor: support GigaDevice gd25lq64c
Date: Fri,  6 May 2016 08:37:41 -0700
Message-Id: <1462549061-88356-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also note the GigaDevice JEDEC ID.

No write-protect support yet, since this flash uses a different status
register layout.

Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: fixed duplicate flag

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 include/linux/mtd/spi-nor.h   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 157841dc3e99..c52e45594bfd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -832,6 +832,7 @@ static const struct flash_info spi_nor_ids[] = {
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
 
 	/* Intel/Numonyx -- xxxs33b */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3c36113a88e1..7f041bd88b82 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -21,6 +21,7 @@
  * Sometimes these are the same as CFI IDs, but sometimes they aren't.
  */
 #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
+#define SNOR_MFR_GIGADEVICE	0xc8
 #define SNOR_MFR_INTEL		CFI_MFR_INTEL
 #define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
 #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
-- 
2.8.0.rc3.226.g39d4020
