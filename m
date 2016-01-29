Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPEgh-0005bm-9Q
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 19:26:33 +0000
Received: by mail-pa0-x242.google.com with SMTP id gi1so4003270pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 29 Jan 2016 11:26:14 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH v2 6/8] mtd: spi-nor: add SPI_NOR_HAS_LOCK flag
Date: Fri, 29 Jan 2016 11:25:35 -0800
Message-Id: <1454095537-130536-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We can't determine this purely by manufacturer type (see commit
67b9bcd36906 ("mtd: spi-nor: fix Spansion regressions (aliased with
Winbond)")), and it's not autodetectable by anything like SFDP. So make
a new flag for it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
v2: no change

 drivers/mtd/spi-nor/spi-nor.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9cd92f135fa2..a47e9dd29456 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -69,6 +69,7 @@ struct flash_info {
 #define SPI_NOR_DUAL_READ	BIT(5)	/* Flash supports Dual Read */
 #define SPI_NOR_QUAD_READ	BIT(6)	/* Flash supports Quad Read */
 #define USE_FSR			BIT(7)	/* use flag status register */
+#define SPI_NOR_HAS_LOCK	BIT(8)	/* Flash supports lock/unlock via SR */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -1280,7 +1281,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
 	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_SST) {
+	    JEDEC_MFR(info) == SNOR_MFR_SST ||
+	    info->flags & SPI_NOR_HAS_LOCK) {
 		write_enable(nor);
 		write_sr(nor, 0);
 		spi_nor_wait_till_ready(nor);
@@ -1297,7 +1299,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mtd->_read = spi_nor_read;
 
 	/* NOR protection support for STmicro/Micron chips and similar */
-	if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
+	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
+			info->flags & SPI_NOR_HAS_LOCK) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
 		nor->flash_is_locked = stm_is_locked;
-- 
2.7.0.rc3.207.g0ac5344
