Received: from mail-bn1on0110.outbound.protection.outlook.com
 ([157.56.110.110] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCOTh-0000Sj-7V
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 08:43:45 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@freescale.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH 5/8 v5] mtd: spi-nor: fsl-quadspi: Enable support big endian
 registers
Date: Tue, 7 Jul 2015 16:38:17 +0800
Message-ID: <1436258300-21261-5-git-send-email-haikun.wang@freescale.com>
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

QSPI registers are big endian on LS1021A.
This patch check endianness before accessing register and
swap the data if QSPI register is big endian.

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
Changes in v5:
- Rebase with l2-mtd.git

Changes in v4:
- Split into three patches:
 1. mtd: spi-nor: fsl-quadspi: Add a variable in struct fsl_qspi_devtype_data to specify platform specail feature
 2. mtd: spi-nor: fsl-quadspi: Wrap writel/readl with qspi_writel/qspi_readl
 3. mtd: spi-nor: fsl-quadspi: Enable support big endian registers

Changes in v3:
- Rebase with l2-mtd.git

Changes in v2:
- Fix compile issue

 drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index ec23a74..283e157 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -262,12 +262,14 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q)
 
 static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem *addr)
 {
-	writel(val, addr);
+	q->devtype_data->driver_data & QUADSPI_QUIRK_REGMAP_BE ?
+		writel(cpu_to_be32(val), addr) : writel(val, addr);
 }
 
 static u32 qspi_readl(struct fsl_qspi *q, void __iomem *addr)
 {
-	return	readl(addr);
+	return q->devtype_data->driver_data & QUADSPI_QUIRK_REGMAP_BE ?
+		cpu_to_be32(readl(addr)) : readl(addr);
 }
 
 /*
-- 
2.1.0.27.g96db324
