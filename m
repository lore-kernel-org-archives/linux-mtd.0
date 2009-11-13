Date: Fri, 13 Nov 2009 14:12:16 -0600
From: Scott Wood <scottwood@freescale.com>
To: dwmw2@infradead.org
Subject: [PATCH 1/3] eLBC NAND: increase bus timeout to maximum
Message-ID: <20091113201216.GA8313@loki.buserror.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a NAND operation is in progress, all other localbus operations
(including NOR flash) will have to wait for access to the bus.  However, the
NAND operation may take longer to complete than the default timeout.  Thus,
if NOR is accessed while a NAND operation is in progress, the NAND operation
will fail.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index ddd37d2..58db278 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -946,6 +946,13 @@ static int __devinit fsl_elbc_ctrl_init(struct fsl_elbc_ctrl *ctrl)
 {
 	struct fsl_lbc_regs __iomem *lbc = ctrl->regs;
 
+	/*
+	 * NAND transactions can tie up the bus for a long time, so set the
+	 * bus timeout to max by clearing LBCR[BMT] (highest base counter
+	 * value) and setting LBCR[BMTPS] to the highest prescaler value.
+	 */
+	clrsetbits_be32(&lbc->lbcr, LBCR_BMT, 15);
+
 	/* clear event registers */
 	setbits32(&lbc->ltesr, LTESR_NAND_MASK);
 	out_be32(&lbc->lteatr, 0);
-- 
1.6.4.4
