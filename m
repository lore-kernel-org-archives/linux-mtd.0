Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmbic-0007eu-Sk
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2018 09:22:28 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Jane Wan <Jane.Wan@nokia.com>, Jagdish Gediya <jagdish.gediya@nxp.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: nand: fsl-ifc: check result of SRAM initialization
Date: Mon,  6 Aug 2018 11:21:36 +0200
Message-Id: <20180806092137.9287-2-kurt@linutronix.de>
In-Reply-To: <20180806092137.9287-1-kurt@linutronix.de>
References: <20180806092137.9287-1-kurt@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The SRAM initialization might fail. If that happens further NAND operations
won't be successful. Therefore, the chip init routine should fail if the SRAM
initialization didn't work.

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index 24f59d0066af..e4f5792dc589 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -761,7 +761,7 @@ static const struct nand_controller_ops fsl_ifc_controller_ops = {
 	.attach_chip = fsl_ifc_attach_chip,
 };
 
-static void fsl_ifc_sram_init(struct fsl_ifc_mtd *priv)
+static int fsl_ifc_sram_init(struct fsl_ifc_mtd *priv)
 {
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 	struct fsl_ifc_runtime __iomem *ifc_runtime = ctrl->rregs;
@@ -805,12 +805,16 @@ static void fsl_ifc_sram_init(struct fsl_ifc_mtd *priv)
 	wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat,
 			   msecs_to_jiffies(IFC_TIMEOUT_MSECS));
 
-	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC)
+	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC) {
 		pr_err("fsl-ifc: Failed to Initialise SRAM\n");
+		return -ETIMEDOUT;
+	}
 
 	/* Restore CSOR and CSOR_ext */
 	ifc_out32(csor, &ifc_global->csor_cs[cs].csor);
 	ifc_out32(csor_ext, &ifc_global->csor_cs[cs].csor_ext);
+
+	return 0;
 }
 
 static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
@@ -914,8 +918,13 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 		chip->ecc.algo = NAND_ECC_HAMMING;
 	}
 
-	if (ctrl->version >= FSL_IFC_VERSION_1_1_0)
-		fsl_ifc_sram_init(priv);
+	if (ctrl->version >= FSL_IFC_VERSION_1_1_0) {
+		int ret;
+
+		ret = fsl_ifc_sram_init(priv);
+		if (ret)
+			return ret;
+	}
 
 	/*
 	 * As IFC version 2.0.0 has 16KB of internal SRAM as compared to older
-- 
2.11.0
