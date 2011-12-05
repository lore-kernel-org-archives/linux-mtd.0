Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
 helo=DB3EHSOBE002.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXWjF-00026s-LS
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 11:29:02 +0000
From: Shengzhou Liu <Shengzhou.Liu@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] mtd/nand: Add ONFI support for FSL NAND controller
Date: Mon, 5 Dec 2011 18:54:53 +0800
Message-ID: <1323082493-22617-2-git-send-email-Shengzhou.Liu@freescale.com>
In-Reply-To: <1323082493-22617-1-git-send-email-Shengzhou.Liu@freescale.com>
References: <1323082493-22617-1-git-send-email-Shengzhou.Liu@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, dwmw2@infradead.org, kumar.gala@freescale.com,
 linux-mtd@lists.infradead.org, Shengzhou Liu <Shengzhou.Liu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- fix NAND_CMD_READID command for ONFI detect.
- add NAND_CMD_PARAM command to read the ONFI parameter page.

Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 742bf73..08a3aba 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -349,19 +349,24 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		fsl_elbc_run_command(mtd);
 		return;
 
-	/* READID must read all 5 possible bytes while CEB is active */
 	case NAND_CMD_READID:
-		dev_vdbg(priv->dev, "fsl_elbc_cmdfunc: NAND_CMD_READID.\n");
+	case NAND_CMD_PARAM:
+		dev_vdbg(priv->dev, "fsl_elbc_cmdfunc: NAND_CMD %x\n", command);
 
 		out_be32(&lbc->fir, (FIR_OP_CM0 << FIR_OP0_SHIFT) |
 		                    (FIR_OP_UA  << FIR_OP1_SHIFT) |
 		                    (FIR_OP_RBW << FIR_OP2_SHIFT));
-		out_be32(&lbc->fcr, NAND_CMD_READID << FCR_CMD0_SHIFT);
-		/* nand_get_flash_type() reads 8 bytes of entire ID string */
-		out_be32(&lbc->fbcr, 8);
-		elbc_fcm_ctrl->read_bytes = 8;
+		out_be32(&lbc->fcr, command << FCR_CMD0_SHIFT);
+		/* reads 8 bytes of entire ID string */
+		if (NAND_CMD_READID == command) {
+			out_be32(&lbc->fbcr, 8);
+			elbc_fcm_ctrl->read_bytes = 8;
+		} else {
+			out_be32(&lbc->fbcr, 256);
+			elbc_fcm_ctrl->read_bytes = 256;
+		}
 		elbc_fcm_ctrl->use_mdr = 1;
-		elbc_fcm_ctrl->mdr = 0;
+		elbc_fcm_ctrl->mdr = column;
 
 		set_addr(mtd, 0, 0, 0);
 		fsl_elbc_run_command(mtd);
-- 
1.6.4
