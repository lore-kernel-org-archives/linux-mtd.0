Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
 helo=DB3EHSOBE006.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ra2vm-0005rR-Cn
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 10:16:23 +0000
From: Shengzhou Liu <Shengzhou.Liu@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] mtd/nand: Add ONFI support for FSL NAND controller
Date: Mon, 12 Dec 2011 17:40:53 +0800
Message-ID: <1323682853-10750-2-git-send-email-Shengzhou.Liu@freescale.com>
In-Reply-To: <1323682853-10750-1-git-send-email-Shengzhou.Liu@freescale.com>
References: <1323682853-10750-1-git-send-email-Shengzhou.Liu@freescale.com>
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
v3: unify the bytes of fbcr to 256.
v2: no changes

 drivers/mtd/nand/fsl_elbc_nand.c |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 4f405a0..320584a 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -349,20 +349,22 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
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
+		/*
+		 * although currently it's 8 bytes for READID, we always read
+		 * the maximum 256 bytes(for PARAM)
+		 */
+		out_be32(&lbc->fbcr, 256);
+		elbc_fcm_ctrl->read_bytes = 256;
 		elbc_fcm_ctrl->use_mdr = 1;
-		elbc_fcm_ctrl->mdr = 0;
-
+		elbc_fcm_ctrl->mdr = column;
 		set_addr(mtd, 0, 0, 0);
 		fsl_elbc_run_command(mtd);
 		return;
-- 
1.6.4
