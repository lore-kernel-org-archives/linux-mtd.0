Received: from mail-dm3nam03on0041.outbound.protection.outlook.com
 ([104.47.41.41] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWK0O-0001FY-8T
 for linux-mtd@lists.infradead.org; Tue, 02 Jan 2018 10:41:21 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <boris.brezillon@free-electrons.com>, <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>, <prabhakar.kushwaha@nxp.com>,
 <suresh.gupta@nxp.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH] mtd: fsl-quadspi: fix init AHB read in fsl_qspi_nor_setup()
Date: Tue, 2 Jan 2018 16:10:53 +0530
Message-ID: <1514889653-23647-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Move AHB read initialize in fsl_qspi_nor_setup().

In file spi-nor.c, func spi_nor_scan() calls nor->read() thru
spi_nor_read_sfdp() API.

Presently, fsl_qspi_init_ahb_read() called from fsl_qspi_nor_setup_last().
Func fsl_qspi_probe() calls spi_nor_scan() first and then calls
fsl_qspi_nor_setup_last().

When nor->read() being called from inside spi_nor_read_sfdp(), QSPI cntlr
AHB mode initialization is not yet done results in data read error.

Initialize AHB read inside fsl_qspi_nor_setup().

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 943e9c4..c22e3eb 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -769,6 +769,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	/* enable the interrupt */
 	qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
 
+	/* Init for AHB read */
+	fsl_qspi_init_ahb_read(q);
+
 	return 0;
 }
 
@@ -794,9 +797,6 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	/* Init the LUT table again. */
 	fsl_qspi_init_lut(q);
 
-	/* Init for AHB read */
-	fsl_qspi_init_ahb_read(q);
-
 	return 0;
 }
 
-- 
1.9.1
