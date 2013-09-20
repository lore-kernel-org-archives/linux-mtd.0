Received: from mail-ye0-x232.google.com ([2607:f8b0:4002:c04::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VN6d2-0003IW-NV
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2013 19:44:37 +0000
Received: by mail-ye0-f178.google.com with SMTP id m5so299993yen.23
 for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2013 12:44:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: correct extemded param page error handling
Date: Fri, 20 Sep 2013 12:44:02 -0700
Message-Id: <1379706242-20548-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the ONFI extended parameter page gives codeword_size == 0, the
extended ECC information is corrupt and should not be used. Currently,
we (correctly) avoid using the information, but we don't report the
error to the caller, so the caller doesn't know that we didn't
initialize ecc_strength_ds and ecc_step_ds. Now the caller can warn the
user that it does not have sufficient information.

This also removes the false and useless "ONFI extended param page
detected" debug message (it was printed even on the aforementioned
corruption, and for the success case, we don't really want a print).

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 00022b4..0b39d0c 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2912,12 +2912,13 @@ static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
 	/* get the info we want. */
 	ecc = (struct onfi_ext_ecc_info *)cursor;
 
-	if (ecc->codeword_size) {
-		chip->ecc_strength_ds = ecc->ecc_bits;
-		chip->ecc_step_ds = 1 << ecc->codeword_size;
+	if (!ecc->codeword_size) {
+		pr_debug("Invalid codeword size\n");
+		goto ext_out;
 	}
 
-	pr_info("ONFI extended param page detected.\n");
+	chip->ecc_strength_ds = ecc->ecc_bits;
+	chip->ecc_step_ds = 1 << ecc->codeword_size;
 	ret = 0;
 
 ext_out:
-- 
1.8.4
