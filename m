Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmL-0004mY-U7
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:11 +0000
Received: by mail-ie0-f181.google.com with SMTP id a14so1385126iee.26
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:50 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/12] mtd: nand: return failure when failing to get ECC from
 ONFI
Date: Wed,  4 Sep 2013 11:25:21 -0700
Message-Id: <1378319126-24473-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If ONFI fails to provide ECC information, we should not use it. Print
appropriate error messages and return.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7ed4841..38b8dd4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3010,8 +3010,13 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 			chip->cmdfunc = nand_command_lp;
 
 		/* The Extended Parameter Page is supported since ONFI 2.1. */
-		if (nand_flash_detect_ext_param_page(mtd, chip, p))
-			pr_info("Failed to detect the extended param page.\n");
+		if (nand_flash_detect_ext_param_page(mtd, chip, p)) {
+			pr_info("Failed to detect ONFI extended param page\n");
+			return 0;
+		}
+	} else {
+		pr_err("Could not retrieve ONFI ECC requirements\n");
+		return 0;
 	}
 
 	pr_info("ONFI flash detected\n");
-- 
1.8.4
