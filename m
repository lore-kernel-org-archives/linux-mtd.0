Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5Hz0-0005dv-A0
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2018 22:08:36 +0000
From: Lukasz Majewski <lukma@denx.de>
To: Frieder Schrempf <frieder.schrempf@exceet.de>, boris.brezillon@bootlin.com,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, yogeshnarayan.gaur@nxp.com, richard@nod.at,
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, prabhakar.kushwaha@nxp.com,
 han.xu@nxp.com, broonie@kernel.org, david.wolfe@nxp.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, albert.aribaud@3adev.fr,
 Lukasz Majewski <lukma@denx.de>
Subject: [RFC/RFT PATCH v1 3/9] mtd: spi: Do not setup the default seqid as we
 got it set for DUAL and QUAD
Date: Thu, 27 Sep 2018 00:07:33 +0200
Message-Id: <20180926220739.620-4-lukma@denx.de>
In-Reply-To: <20180926220739.620-1-lukma@denx.de>
References: <20180926220739.620-1-lukma@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2ef5bfc41d32..ad951a46a628 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -686,7 +686,6 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
 static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
-	int seqid;
 	u32 buf3cr;
 
 	/* AHB configuration for access buffer 0/1/2 .*/
@@ -708,11 +707,6 @@ static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
 	qspi_writel(q, 0, base + QUADSPI_BUF0IND);
 	qspi_writel(q, 0, base + QUADSPI_BUF1IND);
 	qspi_writel(q, 0, base + QUADSPI_BUF2IND);
-
-	/* Set the default lut sequence for AHB Read. */
-	seqid = fsl_qspi_get_seqid(q, q->nor[0].read_opcode);
-	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
-		q->iobase + QUADSPI_BFGENCR);
 }
 
 /* This function was used to prepare and enable QSPI clock */
-- 
2.11.0
