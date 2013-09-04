Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmM-0004mW-O2
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:12 +0000
Received: by mail-ie0-f182.google.com with SMTP id aq17so1459241iec.41
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/12] mtd: denali: make init function static
Date: Wed,  4 Sep 2013 11:25:20 -0700
Message-Id: <1378319126-24473-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's only used in this file.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/denali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 2ed2bb3..154b033 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1394,7 +1394,7 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 };
 
 /* initialize driver data structures */
-void denali_drv_init(struct denali_nand_info *denali)
+static void denali_drv_init(struct denali_nand_info *denali)
 {
 	denali->idx = 0;
 
-- 
1.8.4
