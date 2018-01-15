Received: from mail-cys01nam02on0628.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::628]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eb1nS-0004q2-Ns
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 10:15:24 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <boris.brezillon@free-electrons.com>, <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>, <han.xu@nxp.com>, <festevam@gmail.com>,
 <prabhakar.kushwaha@nxp.com>, <suresh.gupta@nxp.com>, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH v2 2/2] mtd: fsl-quadspi: update hwcaps read capabilities as
 READ_1_4_4
Date: Mon, 15 Jan 2018 15:44:48 +0530
Message-ID: <1516011288-6936-3-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1516011288-6936-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1516011288-6936-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Update Read capabilities as SNOR_HWCAPS_READ_1_4_4 i.e. Quad I/O cmd
protocol. Spansion flash, s25fl512s, supports Quad read with read
capabilities as 1-4-4.

Patch added support for SNOR_HWCAPS_READ_1_4_4 protocol.

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>

V1: Swap patch sequences in the series to solve git bissect issue.
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 48d0639..bc72678 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -967,6 +967,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 {
 	const struct spi_nor_hwcaps hwcaps = {
 		.mask = SNOR_HWCAPS_READ_1_1_4 |
+			SNOR_HWCAPS_READ_1_4_4 |
 			SNOR_HWCAPS_PP,
 	};
 	struct device_node *np = pdev->dev.of_node;
-- 
1.9.1
