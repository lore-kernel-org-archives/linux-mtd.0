Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayP7D-0005Ox-NK
 for linux-mtd@lists.infradead.org; Thu, 05 May 2016 19:39:16 +0000
Received: by mail-pf0-x22f.google.com with SMTP id c189so42271564pfb.3
 for <linux-mtd@lists.infradead.org>; Thu, 05 May 2016 12:38:55 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, Archit Taneja <architt@codeaurora.org>
Subject: [PATCH] mtd: nand: qcom: fixup whitespace
Date: Thu,  5 May 2016 12:38:48 -0700
Message-Id: <1462477128-105528-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Should be using tabs instead of spaces.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Sorry for the resend, I missed linux-mtd the first time...

 drivers/mtd/nand/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index acd47c1b9c6b..de7d28e62d4e 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -1711,7 +1711,7 @@ static void qcom_nandc_select_chip(struct mtd_info *mtd, int chipnr)
  * the sum of the three).
  */
 static int qcom_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
-                                   struct mtd_oob_region *oobregion)
+				   struct mtd_oob_region *oobregion)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
-- 
2.8.0.rc3.226.g39d4020
