Received: from mail-bn1on0116.outbound.protection.outlook.com
 ([157.56.110.116] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMeEb-0000la-6W
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 15:34:42 +0000
From: Han Xu <b45815@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <frank.li@freescale.com>,
 <han.xu@freescale.com>
Subject: [PATCH v4 10/10] mtd: spi-nor: fsl-quadspi: fix unsupported cmd when
 run flash_erase
Date: Tue, 4 Aug 2015 10:26:16 -0500
Message-ID: <1438701976-27286-1-git-send-email-b45815@freescale.com>
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

From: Frank Li <Frank.Li@freescale.com>

Erase function will use cmd 0x20 (SPINOR_OP_BE_4K) if kenrel enable option
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS.

This command is not in fsl-quadspi driver LUT. So driver continue report
fsl-quadspi 21e0000.qspi: Unsupported cmd 0x20.

This patch fix this issue.

Signed-off-by: Frank Li <Frank.Li@freescale.com>
Acked-by: Han Xu <Han.xu@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index d09fb28..66d1eb8 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -397,14 +397,8 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 	/* Erase a sector */
 	lut_base = SEQID_SE * 4;
 
-	if (q->nor_size <= SZ_16M) {
-		cmd = SPINOR_OP_SE;
-		addrlen = ADDR24BIT;
-	} else {
-		/* use the 4-byte address */
-		cmd = SPINOR_OP_SE;
-		addrlen = ADDR32BIT;
-	}
+	cmd = q->nor[0].erase_opcode;
+	addrlen = q->nor_size <= SZ_16M ? ADDR24BIT : ADDR32BIT;
 
 	writel(LUT0(CMD, PAD1, cmd) | LUT1(ADDR, PAD1, addrlen),
 			base + QUADSPI_LUT(lut_base));
@@ -473,6 +467,8 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 	case SPINOR_OP_BRWR:
 		return SEQID_BRWR;
 	default:
+		if (cmd == q->nor[0].erase_opcode)
+			return SEQID_SE;
 		dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
 		break;
 	}
-- 
1.9.1
