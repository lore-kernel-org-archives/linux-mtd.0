Received: from mail-bn1bon0134.outbound.protection.outlook.com
 ([157.56.111.134] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHJ4a-00046V-DY
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 21:58:09 +0000
From: <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>, <b45815@freescale.com>,
 <computersforpeace@gmail.com>, <lznuaa@gmail.com>
CC: Frank Li <Frank.Li@freescale.com>
Subject: [PATCH 1/1] mtd: spi-nor: fsl-qspi: dynamically map memory space for
 AHB read
Date: Tue, 21 Jul 2015 04:48:14 +0800
Message-ID: <1437425294-32090-1-git-send-email-Frank.Li@freescale.com>
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

From: Allen Xu <b45815@freescale.com>

QSPI may failed to map enough memory (256MB) for AHB read in
previous implementation, especially in 3G/1G memory layout kernel.
Dynamically map memory to avoid such issue.

This implementation generally map 4MB memory for AHB read, it should
be enough for common scenarios, and the side effect (0.6% performance
drop) is minor.

Previous implementation

root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=1K count=32K
32768+0 records in
32768+0 records out
33554432 bytes (34 MB) copied, 2.16006 s, 15.5 MB/s

root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=32M count=1
1+0 records in
1+0 records out
33554432 bytes (34 MB) copied, 1.43149 s, 23.4 MB/s

After applied the patch

root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=1K count=32K
32768+0 records in
32768+0 records out
33554432 bytes (34 MB) copied, 2.1743 s, 15.4 MB/s

root@imx6qdlsolo:~# dd if=/dev/mtd0 of=/dev/null bs=32M count=1
1+0 records in
1+0 records out
33554432 bytes (34 MB) copied, 1.43158 s, 23.4 MB/s

Signed-off-by: Allen Xu <b45815@freescale.com>
Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 48 ++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 52a872f..69b95e8 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -222,8 +222,10 @@ struct fsl_qspi {
 	struct mtd_info mtd[FSL_QSPI_MAX_CHIP];
 	struct spi_nor nor[FSL_QSPI_MAX_CHIP];
 	void __iomem *iobase;
-	void __iomem *ahb_base; /* Used when read from AHB bus */
+	void __iomem *ahb_addr;
 	u32 memmap_phy;
+	u32 memmap_offs;
+	u32 memmap_len;
 	struct clk *clk, *clk_en;
 	struct device *dev;
 	struct completion c;
@@ -730,11 +732,41 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
 	struct fsl_qspi *q = nor->priv;
 	u8 cmd = nor->read_opcode;
 
-	dev_dbg(q->dev, "cmd [%x],read from (0x%p, 0x%.8x, 0x%.8x),len:%d\n",
-		cmd, q->ahb_base, q->chip_base_addr, (unsigned int)from, len);
+	/* if necessary,ioremap buffer before AHB read, */
+	/* generally 4MB should be large enough */
+	if (!q->ahb_addr) {
+		q->ahb_addr = ioremap_nocache(
+				q->memmap_phy + q->chip_base_addr + from,
+				len > SZ_4M ? len : SZ_4M);
+		if (!q->ahb_addr) {
+			dev_err(q->dev, "ioremap failed\n");
+			return -ENOMEM;
+		}
+		q->memmap_offs = q->chip_base_addr + from;
+		q->memmap_len = len > SZ_4M ? len : SZ_4M;
+	/* ioremap if the data requested is out of range */
+	} else if (q->chip_base_addr + from < q->memmap_offs
+			|| q->chip_base_addr + from + len >
+			q->memmap_offs + q->memmap_len) {
+		iounmap(q->ahb_addr);
+		q->ahb_addr = ioremap_nocache(
+				q->memmap_phy + q->chip_base_addr + from,
+				len > SZ_4M ? len : SZ_4M);
+		if (!q->ahb_addr) {
+			dev_err(q->dev, "ioremap failed\n");
+			return -ENOMEM;
+		}
+		q->memmap_offs = q->chip_base_addr + from;
+		q->memmap_len = len > SZ_4M ? len : SZ_4M;
+	}
+
+	dev_dbg(q->dev, "cmd [%x],read from 0x%p, len:%d\n",
+		cmd, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
+		len);
 
 	/* Read out the data directly from the AHB buffer.*/
-	memcpy(buf, q->ahb_base + q->chip_base_addr + from, len);
+	memcpy(buf, q->ahb_addr + q->chip_base_addr + from - q->memmap_offs,
+		len);
 
 	*retlen += len;
 	return 0;
@@ -812,10 +844,6 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					"QuadSPI-memory");
-	q->ahb_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(q->ahb_base))
-		return PTR_ERR(q->ahb_base);
-
 	q->memmap_phy = res->start;
 
 	/* find the clocks */
@@ -975,6 +1003,10 @@ static int fsl_qspi_remove(struct platform_device *pdev)
 
 	clk_unprepare(q->clk);
 	clk_unprepare(q->clk_en);
+
+	if (q->ahb_addr)
+		iounmap(q->ahb_addr);
+
 	return 0;
 }
 
-- 
1.9.1
