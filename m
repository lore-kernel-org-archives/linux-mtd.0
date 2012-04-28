Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwX2-00038V-QH
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:33:05 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so1739571pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:33:04 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 07/10] mtd: IFC NAND: utilize oob_required parameter
Date: Fri, 27 Apr 2012 18:29:51 -0700
Message-Id: <1335576594-25267-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Li Yang <leoli@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't read/write OOB if the caller doesn't requre it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index a8d1e87..2bbb9d5 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -699,7 +699,8 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 
 	fsl_ifc_read_buf(mtd, buf, mtd->writesize);
-	fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER)
 		dev_err(priv->dev, "NAND Flash ECC Uncorrectable Error\n");
@@ -717,7 +718,8 @@ static void fsl_ifc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			       const uint8_t *buf, int oob_required)
 {
 	fsl_ifc_write_buf(mtd, buf, mtd->writesize);
-	fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
 
 static int fsl_ifc_chip_init_tail(struct mtd_info *mtd)
-- 
1.7.5.4.2.g519b1
