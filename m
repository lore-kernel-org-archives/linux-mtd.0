Received: from mail-bl2nam02on0066.outbound.protection.outlook.com
 ([104.47.38.66] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMUsz-0001Km-R2
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:16:59 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [RFC 06/10] mtd: spi-nor: Update hwcap based on mode of fsl-quadspi
Date: Wed, 6 Dec 2017 13:45:37 +0530
Message-ID: <1512548141-3319-7-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

FSL QuadSPI controller supports Single, dual, quad modes of operation.
Mode information is available via "spi-tx-bus-width" and
"spi-rx-bus-width" nodes of device tree.

Update read hwcap capability by reading "spi-rx-bus-width".
1_1_1 (SNOR_HWCAPS_PP) is selected as default write hwcap capability (PP).

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index f17d224..5477d78 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -957,9 +957,8 @@ static void fsl_qspi_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 
 static int fsl_qspi_probe(struct platform_device *pdev)
 {
-	const struct spi_nor_hwcaps hwcaps = {
-		.mask = SNOR_HWCAPS_READ_1_1_4 |
-			SNOR_HWCAPS_PP,
+	struct spi_nor_hwcaps hwcaps = {
+		.mask = SNOR_HWCAPS_PP,
 	};
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
@@ -967,7 +966,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
-	int ret, i = 0;
+	int ret, i = 0, value;
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -1015,6 +1014,28 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		goto clk_failed;
 	}
 
+	if (!of_property_read_u32(np, "spi-rx-bus-width", &value)) {
+		switch (value) {
+		case 1:
+			hwcaps.mask |= SNOR_HWCAPS_READ | SNOR_HWCAPS_READ_FAST;
+			break;
+		case 2:
+			hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2 |
+				SNOR_HWCAPS_READ_1_2_2 | SNOR_HWCAPS_READ_2_2_2;
+			break;
+		case 4:
+			hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4 |
+				SNOR_HWCAPS_READ_1_4_4 | SNOR_HWCAPS_READ_4_4_4;
+			break;
+		default:
+			dev_err(dev,
+				"spi-rx-bus-width %d not supported\n",
+				value);
+			break;
+		}
+	} else
+		hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0) {
-- 
2.7.4
