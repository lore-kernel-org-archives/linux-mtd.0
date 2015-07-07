Received: from mail-bl2on0122.outbound.protection.outlook.com ([65.55.169.122]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCOTX-0000S8-Ui
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 08:43:36 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@freescale.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH 3/8 v2] mtd: spi-nor: fsl-quadspi: Add a variable in struct
 fsl_qspi_devtype_data to specify platform specail feature
Date: Tue, 7 Jul 2015 16:38:15 +0800
Message-ID: <1436258300-21261-3-git-send-email-haikun.wang@freescale.com>
In-Reply-To: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
References: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a variable "driver_data" in struct fsl_qspi_devtype_data.
Add a flag to indicate that driver need swap endian when access registers
using the new variable.
Enable this flag for LS1021A.

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
Changes in v2:
- Update commit messgae

 drivers/mtd/spi-nor/fsl-quadspi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 685ac97..ac2a607 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -192,6 +192,9 @@
 #define SEQID_EN4B		10
 #define SEQID_BRWR		11
 
+/* Controller needs swap endian when access registers */
+#define QUADSPI_QUIRK_REGMAP_BE    (1 << 5)
+
 enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
@@ -203,6 +206,7 @@ struct fsl_qspi_devtype_data {
 	int rxfifo;
 	int txfifo;
 	int ahb_buf_size;
+	int driver_data;
 };
 
 static struct fsl_qspi_devtype_data vybrid_data = {
@@ -223,7 +227,8 @@ static struct fsl_qspi_devtype_data ls1_data = {
 	.devtype = FSL_QUADSPI_LS1,
 	.rxfifo = 128,
 	.txfifo = 64,
-	.ahb_buf_size = 1024
+	.ahb_buf_size = 1024,
+	.driver_data = QUADSPI_QUIRK_REGMAP_BE
 };
 
 #define FSL_QSPI_MAX_CHIP	4
-- 
2.1.0.27.g96db324
