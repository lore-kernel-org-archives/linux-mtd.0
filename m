Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeBmv-0001wz-Dw
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2011 20:00:06 +0000
Received: by yxj20 with SMTP id 20so1272470yxj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jul 2011 13:00:02 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: eLBC NAND: remove bogus ECC read-back
Date: Tue,  5 Jul 2011 15:59:57 -0400
Message-Id: <1309895997-29969-1-git-send-email-mlcreech@gmail.com>
In-Reply-To: <CAPBSBxqRywJjCfk_iuDLxn1HbuqPjJRJS=SkRQ3-Ge7SinbSBg@mail.gmail.com>
References: <CAPBSBxqRywJjCfk_iuDLxn1HbuqPjJRJS=SkRQ3-Ge7SinbSBg@mail.gmail.com>
Cc: scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org, rick22@wi.rr.com,
	mhench@elutions.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Hench <mhench@elutions.com>

The eLBC NAND driver currently follows up each program/write operation with a
read-back of the page, in order to [ostensibly] fill in ECC data for the
caller. However, the page address used for this read is always -1, so the read
will never work correctly.  Remove this useless (and potentially problematic)
block of code.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |   17 -----------------
 1 files changed, 0 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 0bb254c..050a2fc 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -455,23 +455,6 @@ static void fsl_elbc_cmdfunc(struct mtd_info *mtd, unsigned int command,
 
 		fsl_elbc_run_command(mtd);
 
-		/* Read back the page in order to fill in the ECC for the
-		 * caller.  Is this really needed?
-		 */
-		if (full_page && elbc_fcm_ctrl->oob_poi) {
-			out_be32(&lbc->fbcr, 3);
-			set_addr(mtd, 6, page_addr, 1);
-
-			elbc_fcm_ctrl->read_bytes = mtd->writesize + 9;
-
-			fsl_elbc_do_read(chip, 1);
-			fsl_elbc_run_command(mtd);
-
-			memcpy_fromio(elbc_fcm_ctrl->oob_poi + 6,
-				&elbc_fcm_ctrl->addr[elbc_fcm_ctrl->index], 3);
-			elbc_fcm_ctrl->index += 3;
-		}
-
 		elbc_fcm_ctrl->oob_poi = NULL;
 		return;
 	}
-- 
1.6.3.3
