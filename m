Received: from mail-bn1on0707.outbound.protection.outlook.com
 ([2a01:111:f400:fc10::707] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9rvH-0001IQ-OZ
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 09:33:49 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <linux-mtd@lists.infradead.org>, <han.xu@freescale.com>
Subject: [PATCH 3/5 v4] mtd: spi-nor: fsl-quadspi: Enable support big endian
 registers
Date: Tue, 30 Jun 2015 17:28:36 +0800
Message-ID: <1435656518-14022-3-git-send-email-haikun.wang@freescale.com>
In-Reply-To: <1435656518-14022-1-git-send-email-haikun.wang@freescale.com>
References: <1435656518-14022-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 Haikun Wang <haikun.wang@freescale.com>
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
Changes in v4:
- Split into three patches

Changes in v3:
- Rebase with l2-mtd.git

Changes in v2:
- Fix compile issue

 drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index d65e073..e416b08 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -260,12 +260,14 @@ static inline int is_imx6sx_qspi(struct fsl_qspi *q)
 
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
 
 
-- 
2.1.0.27.g96db324
