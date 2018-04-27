Received: from mail-he1eur01on0122.outbound.protection.outlook.com
 ([104.47.0.122] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBr9O-0003W1-6L
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2018 00:22:32 +0000
From: Jane Wan <Jane.Wan@nokia.com>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 ties.bos@nokia.com, Jane Wan <Jane.Wan@nokia.com>
Subject: [PATCH 1/2] Fix FSL NAND driver to read all ONFI parameter pages
Date: Thu, 26 Apr 2018 17:19:55 -0700
Message-Id: <1524788396-32380-2-git-send-email-Jane.Wan@nokia.com>
In-Reply-To: <1524788396-32380-1-git-send-email-Jane.Wan@nokia.com>
References: <1524788396-32380-1-git-send-email-Jane.Wan@nokia.com>
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

Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
---
 drivers/mtd/nand/fsl_ifc_nand.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index ca36b35..a3cf6ca 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -413,6 +413,7 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 	struct fsl_ifc_mtd *priv = chip->priv;
 	struct fsl_ifc_ctrl *ctrl = priv->ctrl;
 	struct fsl_ifc_runtime __iomem *ifc = ctrl->rregs;
+	int len;
 
 	/* clear the read buffer */
 	ifc_nand_ctrl->read_bytes = 0;
@@ -462,11 +463,12 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		ifc_out32(column, &ifc->ifc_nand.row3);
 
 		/*
-		 * although currently it's 8 bytes for READID, we always read
-		 * the maximum 256 bytes(for PARAM)
+		 * For READID, read 8 bytes that are currently used.
+		 * For PARAM, read all 3 copies of 256-bytes pages.
 		 */
-		ifc_out32(256, &ifc->ifc_nand.nand_fbcr);
-		ifc_nand_ctrl->read_bytes = 256;
+		len = (command == NAND_CMD_PARAM) ? (3 * 256) : 8;
+		ifc_out32(len, &ifc->ifc_nand.nand_fbcr);
+		ifc_nand_ctrl->read_bytes = len;
 
 		set_addr(mtd, 0, 0, 0);
 		fsl_ifc_run_command(mtd);
-- 
1.7.9.5
