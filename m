Date: Fri, 13 Nov 2009 14:14:15 -0600
From: Scott Wood <scottwood@freescale.com>
To: dwmw2@infradead.org
Subject: [PATCH 3/3] eLBC NAND: give more verbose output on error
Message-ID: <20091113201415.GA8345@loki.buserror.net>
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

We want error information even if the kernel hasn't been built for verbose
debugging.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 5b51ed3..ae30fb6 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -237,12 +237,15 @@ static int fsl_elbc_run_command(struct mtd_info *mtd)
 
 	ctrl->use_mdr = 0;
 
-	dev_vdbg(ctrl->dev,
-	         "fsl_elbc_run_command: stat=%08x mdr=%08x fmr=%08x\n",
-	         ctrl->status, ctrl->mdr, in_be32(&lbc->fmr));
+	if (ctrl->status != LTESR_CC) {
+		dev_info(ctrl->dev,
+		         "command failed: fir %x fcr %x status %x mdr %x\n",
+		         in_be32(&lbc->fir), in_be32(&lbc->fcr),
+		         ctrl->status, ctrl->mdr);
+		return -EIO;
+	}
 
-	/* returns 0 on success otherwise non-zero) */
-	return ctrl->status == LTESR_CC ? 0 : -EIO;
+	return 0;
 }
 
 static void fsl_elbc_do_read(struct nand_chip *chip, int oob)
-- 
1.6.4.4
