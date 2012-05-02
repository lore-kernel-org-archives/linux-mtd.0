Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPdA4-0002kp-KR
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:16:21 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so1447778pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:16:20 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 07/10] mtd: IFC NAND: utilize oob_required parameter
Date: Wed,  2 May 2012 10:15:01 -0700
Message-Id: <1335978904-8005-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
Cc: Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Li Yang <leoli@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't read OOB if the caller doesn't require it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index c085df3..9602c1b 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -706,7 +706,8 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	struct fsl_ifc_nand_ctrl *nctrl = ifc_nand_ctrl;
 
 	fsl_ifc_read_buf(mtd, buf, mtd->writesize);
-	fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER)
 		dev_err(priv->dev, "NAND Flash ECC Uncorrectable Error\n");
-- 
1.7.5.4.2.g519b1
