Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwWy-00038V-4D
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:33:00 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so1739571pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:32:59 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 06/10] mtd: eLBD NAND: utilize oob_required parameter
Date: Fri, 27 Apr 2012 18:29:50 -0700
Message-Id: <1335576594-25267-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
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

Don't read/write OOB if the caller doesn't require it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 5cddd65..ab22985 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -742,7 +742,8 @@ static int fsl_elbc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			      uint8_t *buf, int oob_required, int page)
 {
 	fsl_elbc_read_buf(mtd, buf, mtd->writesize);
-	fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		fsl_elbc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
 
 	if (fsl_elbc_wait(mtd, chip) & NAND_STATUS_FAIL)
 		mtd->ecc_stats.failed++;
@@ -757,7 +758,8 @@ static void fsl_elbc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf, int oob_required)
 {
 	fsl_elbc_write_buf(mtd, buf, mtd->writesize);
-	fsl_elbc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	if (oob_required)
+		fsl_elbc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
 }
 
 static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
-- 
1.7.5.4.2.g519b1
