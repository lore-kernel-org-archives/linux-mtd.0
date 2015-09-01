Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWriB-00030J-RX
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:20 +0000
Received: by pary6 with SMTP id y6so973535par.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:58:59 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 04/10] mtd: spi-nor: use SNOR_MFR_* instead of CFI_MFR_*
Date: Tue,  1 Sep 2015 12:57:09 -0700
Message-Id: <1441137435-52862-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No functional change, just cosmetic.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index dd46d5e65846..09183eb51297 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -17,7 +17,6 @@
 #include <linux/mutex.h>
 #include <linux/math64.h>
 
-#include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
 #include <linux/spi/flash.h>
@@ -179,11 +178,11 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 	u8 cmd;
 
 	switch (JEDEC_MFR(info)) {
-	case CFI_MFR_ST: /* Micron, actually */
+	case SNOR_MFR_MICRON:
 		/* Some Micron need WREN command; all will accept it */
 		need_wren = true;
-	case CFI_MFR_MACRONIX:
-	case 0xEF /* winbond */:
+	case SNOR_MFR_MACRONIX:
+	case SNOR_MFR_WINBOND:
 		if (need_wren)
 			write_enable(nor);
 
@@ -963,14 +962,14 @@ static int set_quad_mode(struct spi_nor *nor, const struct flash_info *info)
 	int status;
 
 	switch (JEDEC_MFR(info)) {
-	case CFI_MFR_MACRONIX:
+	case SNOR_MFR_MACRONIX:
 		status = macronix_quad_enable(nor);
 		if (status) {
 			dev_err(nor->dev, "Macronix quad-read not enabled\n");
 			return -EINVAL;
 		}
 		return status;
-	case CFI_MFR_ST:
+	case SNOR_MFR_MICRON:
 		status = micron_quad_enable(nor);
 		if (status) {
 			dev_err(nor->dev, "Micron quad-read not enabled\n");
@@ -1050,9 +1049,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	 * up with the software protection bits set
 	 */
 
-	if (JEDEC_MFR(info) == CFI_MFR_ATMEL ||
-	    JEDEC_MFR(info) == CFI_MFR_INTEL ||
-	    JEDEC_MFR(info) == CFI_MFR_SST) {
+	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
+	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
+	    JEDEC_MFR(info) == SNOR_MFR_SST) {
 		write_enable(nor);
 		write_sr(nor, 0);
 	}
@@ -1067,8 +1066,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
 
-	/* nor protection support for STmicro chips */
-	if (JEDEC_MFR(info) == CFI_MFR_ST) {
+	/* NOR protection support for STmicro/Micron chips */
+	if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
 	}
@@ -1162,7 +1161,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info) == CFI_MFR_AMD) {
+		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION) {
 			/* Dedicated 4-byte command set */
 			switch (nor->flash_read) {
 			case SPI_NOR_QUAD:
-- 
2.5.0.457.gab17608
