Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
 helo=DB3EHSOBE001.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rg85s-0004JU-Oo
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 04:59:57 +0000
From: Prabhakar Kushwaha <prabhakar@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd/nand:Fix wrong address read in is_blank()
Date: Thu, 29 Dec 2011 10:29:38 +0530
Message-ID: <1325134779-3571-2-git-send-email-prabhakar@freescale.com>
In-Reply-To: <1325134779-3571-1-git-send-email-prabhakar@freescale.com>
References: <1325134779-3571-1-git-send-email-prabhakar@freescale.com>
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

 Tested on P1010RDB

 drivers/mtd/nand/fsl_ifc_nand.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 8475b88..2df7206 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -191,7 +191,9 @@ static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
 {
 	struct nand_chip *chip = mtd->priv;
 	struct fsl_ifc_mtd *priv = chip->priv;
-	u8 __iomem *addr = priv->vbase + bufnum * (mtd->writesize * 2);
+	int bufperpage = mtd->writesize / chip->ecc.size;
+	u8 __iomem *addr = priv->vbase + bufnum / bufperpage
+					* (mtd->writesize * 2);
 	u32 __iomem *mainarea = (u32 *)addr;
 	u8 __iomem *oob = addr + mtd->writesize;
 	int i;
@@ -273,7 +275,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
 		dev_err(priv->dev, "NAND Flash Write Protect Error\n");
 
 	if (nctrl->eccread) {
-		int bufperpage = mtd->writesize / 512;
+		int bufperpage = mtd->writesize / chip->ecc.size;
 		int bufnum = (nctrl->page & priv->bufnum_mask) * bufperpage;
 		int bufnum_end = bufnum + bufperpage - 1;
 
-- 
1.7.5.4
