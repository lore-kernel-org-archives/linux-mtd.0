Received: from mail-bl2nam02on0041.outbound.protection.outlook.com
 ([104.47.38.41] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWJyo-0008WK-2F
 for linux-mtd@lists.infradead.org; Tue, 02 Jan 2018 10:39:35 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <boris.brezillon@free-electrons.com>, <cyrille.pitchen@wedev4u.fr>,
 <computersforpeace@gmail.com>, <prabhakar.kushwaha@nxp.com>,
 <suresh.gupta@nxp.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH] mtd: fsl-quadspi: fix api naming typo _init_ahb_read
Date: Tue, 2 Jan 2018 16:09:12 +0530
Message-ID: <1514889552-23603-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Fix api naming typo _init_ahb_read
fsl_qspi_init_abh_read --> fsl_qspi_init_ahb_read

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index f17d224..943e9c4 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -661,7 +661,7 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
  * causes the controller to clear the buffer, and use the sequence pointed
  * by the QUADSPI_BFGENCR[SEQID] to initiate a read from the flash.
  */
-static void fsl_qspi_init_abh_read(struct fsl_qspi *q)
+static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	int seqid;
@@ -795,7 +795,7 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	fsl_qspi_init_lut(q);
 
 	/* Init for AHB read */
-	fsl_qspi_init_abh_read(q);
+	fsl_qspi_init_ahb_read(q);
 
 	return 0;
 }
-- 
1.9.1
