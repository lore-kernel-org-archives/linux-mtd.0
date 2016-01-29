From: Yunhui Cui <B56489@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <han.xu@freescale.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <yao.yuan@nxp.com>
Subject: [PATCH 2/3] mtd: fsl-quadspi: Rename SEQID_QUAD_READ to SEQID_READ
Date: Fri, 29 Jan 2016 19:41:08 +0800
Message-ID: <1454067669-35274-3-git-send-email-B56489@freescale.com>
In-Reply-To: <1454067669-35274-1-git-send-email-B56489@freescale.com>
References: <1454067669-35274-1-git-send-email-B56489@freescale.com>
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

There are some read modes for flash, such as NORMAL, FAST,
QUAD, DDR QUAD. These modes will use the identical lut table base
So rename SEQID_QUAD_READ to SEQID_READ.

Signed-off-by: Yunhui Cui <B56489@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 517ffe2..9861290 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -193,7 +193,7 @@
 #define QUADSPI_LUT_NUM		64
 
 /* SEQID -- we can have 16 seqids at most. */
-#define SEQID_QUAD_READ		0
+#define SEQID_READ		0
 #define SEQID_WREN		1
 #define SEQID_WRDI		2
 #define SEQID_RDSR		3
@@ -386,8 +386,8 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 	for (i = 0; i < QUADSPI_LUT_NUM; i++)
 		qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i * 4);
 
-	/* Quad Read */
-	lut_base = SEQID_QUAD_READ * 4;
+	/* Read */
+	lut_base = SEQID_READ * 4;
 
 	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
 			base + QUADSPI_LUT(lut_base));
@@ -468,7 +468,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 {
 	switch (cmd) {
 	case SPINOR_OP_READ_1_1_4:
-		return SEQID_QUAD_READ;
+		return SEQID_READ;
 	case SPINOR_OP_WREN:
 		return SEQID_WREN;
 	case SPINOR_OP_WRDI:
-- 
2.1.0.27.g96db324
