Received: from mail-pz0-f44.google.com ([209.85.210.44])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPdA4-0002mH-FN
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:16:21 +0000
Received: by dacx6 with SMTP id x6so85712dac.31
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:16:19 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 06/10] mtd: eLBC NAND: utilize oob_required parameter
Date: Wed,  2 May 2012 10:15:00 -0700
Message-Id: <1335978904-8005-7-git-send-email-computersforpeace@gmail.com>
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
 drivers/mtd/nand/fsl_elbc_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 11e3401..7842938 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -754,7 +754,8 @@ static int fsl_elbc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	struct fsl_elbc_fcm_ctrl *elbc_fcm_ctrl = ctrl->nand;
 
 	fsl_elbc_read_buf(mtd, buf, mtd->writesize);
-	fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	if (fsl_elbc_wait(mtd, chip) & NAND_STATUS_FAIL)
 		mtd->ecc_stats.failed++;
-- 
1.7.5.4.2.g519b1
