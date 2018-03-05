Received: from mail-eopbgr30061.outbound.protection.outlook.com ([40.107.3.61]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esnyt-0000N7-0N
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2018 11:08:40 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 marek.vasut@gmail.com, frieder.schrempf@exceet.de,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH v6 2/2] mtd: fsl-quadspi: fix init AHB read in
 fsl_qspi_nor_setup()
Date: Mon,  5 Mar 2018 16:36:59 +0530
Message-Id: <1520248019-2828-3-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1520248019-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1520248019-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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
Changes for v6:
- None
Changes for v5:
- None
Changes for v4:
- None
Changes for v3:
- None
Changes for v2:
- None

 drivers/mtd/spi-nor/fsl-quadspi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index d2e8421..8f05be2 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -819,6 +819,9 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	/* enable the interrupt */
 	qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);
 
+	/* Init for AHB read */
+	fsl_qspi_init_ahb_read(q);
+
 	return 0;
 }
 
@@ -841,9 +844,6 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	if (ret)
 		return ret;
 
-	/* Init for AHB read */
-	fsl_qspi_init_ahb_read(q);
-
 	/* Prepare LUT for AHB read - required for read from devmem interface */
 	fsl_qspi_prep_ahb_read(q);
 
-- 
1.9.1
