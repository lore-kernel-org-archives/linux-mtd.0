Received: from mail-by2on0145.outbound.protection.outlook.com
 ([207.46.100.145] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZK99Q-0004mA-MI
 for linux-mtd@lists.infradead.org; Tue, 28 Jul 2015 17:58:53 +0000
From: Han Xu <b45815@freescale.com>
To: <shijie8@gmail.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <b45815@freescale.com>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <hofrat@osadl.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 6/6] mtd: nand: gpmi: support NAND on i.MX6UL
Date: Tue, 28 Jul 2015 12:50:47 -0500
Message-ID: <1438105847-22355-1-git-send-email-b45815@freescale.com>
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

support GPMI NAND on i.MX6UL

Signed-off-by: Han Xu <b45815@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++++
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h | 6 ++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 362cf4c..adadac2 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -89,6 +89,12 @@ static const struct gpmi_devdata gpmi_devdata_imx7d = {
 	.max_chain_delay = 12,
 };
 
+static const struct gpmi_devdata gpmi_devdata_imx6ul = {
+	.type = IS_MX6UL,
+	.bch_max_ecc_strength = 40,
+	.max_chain_delay = 12,
+};
+
 static irqreturn_t bch_irq(int irq, void *cookie)
 {
 	struct gpmi_nand_data *this = cookie;
@@ -2016,6 +2022,9 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 		.compatible = "fsl,imx6sx-gpmi-nand",
 		.data = &gpmi_devdata_imx6sx,
 	}, {
+		.compatible = "fsl,imx6ul-gpmi-nand",
+		.data = (void *)&gpmi_devdata_imx6ul,
+	}, {
 		.compatible = "fsl,imx7d-gpmi-nand",
 		.data = (void *)&gpmi_devdata_imx7d,
 	}
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index 36ffeda..8428637 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -125,7 +125,8 @@ enum gpmi_type {
 	IS_MX6Q,
 	IS_MX6QP,
 	IS_MX6SX,
-	IS_MX7D
+	IS_MX7D,
+	IS_MX6UL
 };
 
 struct gpmi_devdata {
@@ -310,8 +311,9 @@ void gpmi_copy_bits(u8 *dst, size_t dst_bit_off,
 #define GPMI_IS_MX6QP(x)	((x)->devdata->type == IS_MX6QP)
 #define GPMI_IS_MX6SX(x)	((x)->devdata->type == IS_MX6SX)
 #define GPMI_IS_MX7D(x)		((x)->devdata->type == IS_MX7D)
+#define GPMI_IS_MX6UL(x)	((x)->devdata->type == IS_MX6UL)
 
 #define GPMI_IS_MX6(x)		(GPMI_IS_MX6Q(x) || GPMI_IS_MX6QP(x)\
-	   || GPMI_IS_MX6SX(x))
+	   || GPMI_IS_MX6SX(x) || GPMI_IS_MX6UL(x))
 #define GPMI_IS_MX7(x)		(GPMI_IS_MX7D(x))
 #endif
-- 
1.9.1
