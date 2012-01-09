Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkEH0-0003fC-5t
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 12:24:26 +0000
From: Prabhakar Kushwaha <prabhakar@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2][v2] mtd/nand:Fix wrong address read in is_blank()
Date: Mon, 9 Jan 2012 17:54:07 +0530
Message-ID: <1326111847-13085-1-git-send-email-prabhakar@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, Poonam Aggrwal <poonam.aggrwal@freescale.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

IFC NAND Machine calculates ECC on 512byte sector. Same is taken care in
fsl_ifc_run_command() while ECC status verification. Here buffer number is
calculated assuming 512byte sector and same is passed to is_blank.
However in is_blank() buffer address is calculated using mdt->writesize which is
wrong. It should be calculated on basis of ecc sector size.

Also, in fsl_ifc_run_command() bufferpage is calculated on the basis of ecc sector
size instead of hard coded value.

Signed-off-by: Poonam Aggrwal <poonam.aggrwal@freescale.com>
Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
---
  git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git (branch next)

 This patch is created on top of IFC driver patch (already floated in mailing
 list). Please find their link:
 http://patchwork.ozlabs.org/patch/133315/
 http://patchwork.ozlabs.org/patch/133316/

 Tested on P1010RDB

 Changes for v2: Incorporated Scott's comments
 	- Updated copyright
	- is_blank - works on ecc buffer block 
	- check_read_ecc() - Calculate actual ecc buffer number

 drivers/mtd/nand/fsl_ifc_nand.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 8475b88..c0529ea 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -1,7 +1,7 @@
 /*
  * Freescale Integrated Flash Controller NAND driver
  *
- * Copyright 2011 Freescale Semiconductor, Inc
+ * Copyright 2011,2012 Freescale Semiconductor, Inc
  *
  * Author: Dipen Dudhat <Dipen.Dudhat@freescale.com>
  *
@@ -191,12 +191,12 @@ static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
 {
 	struct nand_chip *chip = mtd->priv;
 	struct fsl_ifc_mtd *priv = chip->priv;
-	u8 __iomem *addr = priv->vbase + bufnum * (mtd->writesize * 2);
+	u8 __iomem *addr = priv->vbase + bufnum * chip->ecc.size;
 	u32 __iomem *mainarea = (u32 *)addr;
 	u8 __iomem *oob = addr + mtd->writesize;
 	int i;
 
-	for (i = 0; i < mtd->writesize / 4; i++) {
+	for (i = 0; i < chip->ecc.size / 4; i++) {
 		if (__raw_readl(&mainarea[i]) != 0xffffffff)
 			return 0;
 	}
@@ -215,12 +215,15 @@ static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
 static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
 			  u32 *eccstat, unsigned int bufnum)
 {
+	struct nand_chip *chip = mtd->priv;
+	int bufperpage = mtd->writesize / chip->ecc.size;
+	int eccbuf_num = bufnum + (bufnum / bufperpage) * bufperpage;
 	u32 reg = eccstat[bufnum / 4];
 	int errors = (reg >> ((3 - bufnum % 4) * 8)) & 15;
 
 	if (errors == 15) { /* uncorrectable */
 		/* Blank pages fail hw ECC checks */
-		if (is_blank(mtd, bufnum))
+		if (is_blank(mtd, eccbuf_num))
 			return 1;
 
 		/*
@@ -273,7 +276,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
 		dev_err(priv->dev, "NAND Flash Write Protect Error\n");
 
 	if (nctrl->eccread) {
-		int bufperpage = mtd->writesize / 512;
+		int bufperpage = mtd->writesize / chip->ecc.size;
 		int bufnum = (nctrl->page & priv->bufnum_mask) * bufperpage;
 		int bufnum_end = bufnum + bufperpage - 1;
 
-- 
1.7.5.4
