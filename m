Received: from mail-by2on0109.outbound.protection.outlook.com
 ([207.46.100.109] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMeDo-0008IC-Jo
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 15:33:53 +0000
From: Han Xu <b45815@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <frank.li@freescale.com>,
 <han.xu@freescale.com>
Subject: [PATCH v4 01/10] mtd: spi-nor: fsl-quadspi: dynamically map memory
 space for AHB read
Date: Tue, 4 Aug 2015 10:25:22 -0500
Message-ID: <1438701922-26916-1-git-send-email-b45815@freescale.com>
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

From: Han Xu <han.xu@freescale.com>

QSPI may failed to map enough memory (256MB) for AHB read in
previous implementation, especially in 3G/1G memory layout kernel.
Dynamically map memory to avoid such issue.

This implementation generally map QUADSPI_MAX_IOMAP (default 4MB) memory
for AHB read, it should be enough for common scenarios, and the side
effect (0.6% performance drop) is minor.

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

Signed-off-by: Han Xu <han.xu@freescale.com>
Signed-off-by: Frank Li <Frank.Li@freescale.com>
---

Change from v3 to v4:
According to Brian's comments,
- introduce a new macro QUADSPI_MIN_IOMAP instead of SZ_4M
- reduce the duplicated computation for offset
- reintroduce the devm_request_mem_region()

Change from v2 to v3:
Resend whole serial patch

Change from v1 to v2:
   rebase to last l2-mtd

 drivers/mtd/spi-nor/fsl-quadspi.c | 55 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 1946c6d..6858236 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -192,6 +192,8 @@
 #define SEQID_EN4B		10
 #define SEQID_BRWR		11
 
+#define QUADSPI_MIN_IOMAP SZ_4M
+
 enum fsl_qspi_devtype {
 	FSL_QUADSPI_VYBRID,
 	FSL_QUADSPI_IMX6SX,
@@ -223,8 +225,10 @@ struct fsl_qspi {
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
@@ -732,11 +736,42 @@ static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
 	struct fsl_qspi *q = nor->priv;
 	u8 cmd = nor->read_opcode;
 
-	dev_dbg(q->dev, "cmd [%x],read from (0x%p, 0x%.8x, 0x%.8x),len:%d\n",
-		cmd, q->ahb_base, q->chip_base_addr, (unsigned int)from, len);
+	/* if necessary,ioremap buffer before AHB read, */
+	if (!q->ahb_addr) {
+		q->memmap_offs = q->chip_base_addr + from;
+		q->memmap_len = len > QUADSPI_MIN_IOMAP ? len : QUADSPI_MIN_IOMAP;
+
+		q->ahb_addr = ioremap_nocache(
+				q->memmap_phy + q->memmap_offs,
+				q->memmap_len);
+		if (!q->ahb_addr) {
+			dev_err(q->dev, "ioremap failed\n");
+			return -ENOMEM;
+		}
+	/* ioremap if the data requested is out of range */
+	} else if (q->chip_base_addr + from < q->memmap_offs
+			|| q->chip_base_addr + from + len >
+			q->memmap_offs + q->memmap_len) {
+		iounmap(q->ahb_addr);
+
+		q->memmap_offs = q->chip_base_addr + from;
+		q->memmap_len = len > QUADSPI_MIN_IOMAP ? len : QUADSPI_MIN_IOMAP;
+		q->ahb_addr = ioremap_nocache(
+				q->memmap_phy + q->memmap_offs,
+				q->memmap_len);
+		if (!q->ahb_addr) {
+			dev_err(q->dev, "ioremap failed\n");
+			return -ENOMEM;
+		}
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
@@ -821,9 +856,11 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 					"QuadSPI-memory");
-	q->ahb_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(q->ahb_base))
-		return PTR_ERR(q->ahb_base);
+	if (!devm_request_mem_region(dev, res->start, resource_size(res),
+				     res->name)) {
+		dev_err(dev, "can't request region for resource %pR\n", res);
+	return -EBUSY;
+	}
 
 	q->memmap_phy = res->start;
 
@@ -989,6 +1026,10 @@ static int fsl_qspi_remove(struct platform_device *pdev)
 	mutex_destroy(&q->lock);
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
