From: Yunhui Cui <B56489@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <han.xu@freescale.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <yao.yuan@nxp.com>
Subject: [PATCH v2 3/4] mtd:spi-nor:fsl-quadspi:Add fast-read mode support
Date: Mon, 1 Feb 2016 19:30:07 +0800
Message-ID: <1454326208-4533-3-git-send-email-B56489@freescale.com>
In-Reply-To: <1454326208-4533-1-git-send-email-B56489@freescale.com>
References: <1454326208-4533-1-git-send-email-B56489@freescale.com>
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

The qspi driver add generic fast-read mode for different
flash venders. There are some different board flash work on
different mode, such fast-read, quad-mode.
So we have to modify the third entrace parameter of spi_nor_scan().

Signed-off-by: Yunhui Cui <B56489@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 9861290..0a31cb1 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -389,11 +389,21 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 	/* Read */
 	lut_base = SEQID_READ * 4;
 
-	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
-			base + QUADSPI_LUT(lut_base));
-	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
-		    LUT1(FSL_READ, PAD4, rxfifo),
-			base + QUADSPI_LUT(lut_base + 1));
+	if (nor->flash_read == SPI_NOR_FAST) {
+		qspi_writel(q, LUT0(CMD, PAD1, read_op) |
+			    LUT1(ADDR, PAD1, addrlen),
+				base + QUADSPI_LUT(lut_base));
+		qspi_writel(q,  LUT0(DUMMY, PAD1, read_dm) |
+			    LUT1(FSL_READ, PAD1, rxfifo),
+				base + QUADSPI_LUT(lut_base + 1));
+	} else if (nor->flash_read == SPI_NOR_QUAD) {
+		qspi_writel(q, LUT0(CMD, PAD1, read_op) |
+			    LUT1(ADDR, PAD1, addrlen),
+				base + QUADSPI_LUT(lut_base));
+		qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
+			    LUT1(FSL_READ, PAD4, rxfifo),
+				base + QUADSPI_LUT(lut_base + 1));
+	}
 
 	/* Write enable */
 	lut_base = SEQID_WREN * 4;
@@ -468,6 +478,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 {
 	switch (cmd) {
 	case SPINOR_OP_READ_1_1_4:
+	case SPINOR_OP_READ_FAST:
 		return SEQID_READ;
 	case SPINOR_OP_WREN:
 		return SEQID_WREN;
@@ -963,6 +974,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
 	int ret, i = 0;
+	enum read_mode mode = SPI_NOR_QUAD;
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -1064,7 +1076,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		/* set the chip address for READID */
 		fsl_qspi_set_base_addr(q, nor);
 
-		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
+		ret = of_property_read_bool(np, "m25p,fast-read");
+		mode = (ret) ? SPI_NOR_FAST : SPI_NOR_QUAD;
+
+		ret = spi_nor_scan(nor, NULL, mode);
 		if (ret)
 			goto mutex_failed;
 
-- 
2.1.0.27.g96db324
