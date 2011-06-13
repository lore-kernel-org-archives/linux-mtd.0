Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=CH1EHSOBE018.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVxcm-0001Ie-Bf
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 03:15:38 +0000
From: Shaohui Xie <Shaohui.Xie@freescale.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/85xx: fix NAND_CMD_READID read bytes number
Date: Mon, 13 Jun 2011 10:23:12 +0800
Message-ID: <1307931792-30386-1-git-send-email-Shaohui.Xie@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org,
	Shaohui Xie <Shaohui.Xie@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

when nand_get_flash_type() is called, it will read 8 bytes of ID instead of 5,
but the driver only read 5 bytes, so kernel will dump error messages like:

fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
fsl-lbc ffe124000.localbus: read_byte beyond end of buffer
fsl-lbc ffe124000.localbus: read_byte beyond end of buffer

Signed-off-by: Shaohui Xie <Shaohui.Xie@freescale.com>
Acked-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 0bb254c..33d8aad 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -339,9 +339,9 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 		                    (FIR_OP_UA  << FIR_OP1_SHIFT) |
 		                    (FIR_OP_RBW << FIR_OP2_SHIFT));
 		out_be32(&lbc->fcr, NAND_CMD_READID << FCR_CMD0_SHIFT);
-		/* 5 bytes for manuf, device and exts */
-		out_be32(&lbc->fbcr, 5);
-		elbc_fcm_ctrl->read_bytes = 5;
+		/* nand_get_flash_type() reads 8 bytes of entire ID string */
+		out_be32(&lbc->fbcr, 8);
+		elbc_fcm_ctrl->read_bytes = 8;
 		elbc_fcm_ctrl->use_mdr = 1;
 		elbc_fcm_ctrl->mdr = 0;
 
-- 
1.6.4
