Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TCJIe-000856-Rt
 for linux-mtd@lists.infradead.org; Thu, 13 Sep 2012 23:58:25 +0000
Date: Thu, 13 Sep 2012 18:56:07 -0500
From: Kim Phillips <kim.phillips@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: fsl_ifc_nand: fix cast removes address space of
 expression warnings
Message-ID: <20120913185607.af76965cb973dfb1059c842f@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

found by sparse.

Signed-off-by: Kim Phillips <kim.phillips@freescale.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index e92d223..1be83dc 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -193,7 +193,7 @@ static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
 	struct nand_chip *chip = mtd->priv;
 	struct fsl_ifc_mtd *priv = chip->priv;
 	u8 __iomem *addr = priv->vbase + bufnum * (mtd->writesize * 2);
-	u32 __iomem *mainarea = (u32 *)addr;
+	u32 __iomem *mainarea = (u32 __iomem *)addr;
 	u8 __iomem *oob = addr + mtd->writesize;
 	int i;
 
@@ -591,8 +591,8 @@ static uint8_t fsl_ifc_read_byte16(struct mtd_info *mtd)
 	 * next byte.
 	 */
 	if (ifc_nand_ctrl->index < ifc_nand_ctrl->read_bytes) {
-		data = in_be16((uint16_t *)&ifc_nand_ctrl->
-					addr[ifc_nand_ctrl->index]);
+		data = in_be16((uint16_t __iomem *)&ifc_nand_ctrl->
+			       addr[ifc_nand_ctrl->index]);
 		ifc_nand_ctrl->index += 2;
 		return (uint8_t) data;
 	}
-- 
1.7.12
