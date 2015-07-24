Received: from mail-bn1on0144.outbound.protection.outlook.com
 ([157.56.110.144] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIiSX-0003LV-Bz
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2015 19:16:42 +0000
From: <Frank.Li@freescale.com>
To: <linux-mtd@lists.infradead.org>, <b45815@freescale.com>,
 <computersforpeace@gmail.com>, <lznuaa@gmail.com>
CC: Frank Li <Frank.Li@freescale.com>
Subject: [PATCH v3 8/8] mtd: spi-nor: fsl-quadspi: fix unsupported cmd when
 run flash_erase
Date: Sat, 25 Jul 2015 02:06:28 +0800
Message-ID: <1437761188-8179-9-git-send-email-Frank.Li@freescale.com>
In-Reply-To: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
References: <1437761188-8179-1-git-send-email-Frank.Li@freescale.com>
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

fsl-quadspi 21e0000.qspi: Unsupported cmd 0x20

when config CONFIG_MTD_SPI_NOR_USE_4K_SECTORS enable,
erase will use SPINOR_OP_BE_4K, which was not supported by fsl-quadspi
driver

Signed-off-by: Frank Li <Frank.Li@freescale.com>
Acked-by: Allen Xu <b45815@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 0f3f22d..e50da5c 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -396,11 +396,11 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 	lut_base = SEQID_SE * 4;
 
 	if (q->nor_size <= SZ_16M) {
-		cmd = SPINOR_OP_SE;
+		cmd = q->nor[0].erase_opcode;
 		addrlen = ADDR24BIT;
 	} else {
 		/* use the 4-byte address */
-		cmd = SPINOR_OP_SE;
+		cmd = q->nor[0].erase_opcode;
 		addrlen = ADDR32BIT;
 	}
 
@@ -471,6 +471,8 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
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
