Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmP-0004ma-QL
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:15 +0000
Received: by mail-ie0-f170.google.com with SMTP id 16so1264611iea.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:52 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/12] mtd: onenand: remove redundant offset check
Date: Wed,  4 Sep 2013 11:25:23 -0700
Message-Id: <1378319126-24473-10-git-send-email-computersforpeace@gmail.com>
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

The mtd_block_isbad() interface already checks for this.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/onenand/onenand_base.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index b3f41f2..7b7c1d2 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2556,10 +2556,6 @@ static int onenand_block_isbad(struct mtd_info *mtd, loff_t ofs)
 {
 	int ret;
 
-	/* Check for invalid offset */
-	if (ofs > mtd->size)
-		return -EINVAL;
-
 	onenand_get_device(mtd, FL_READING);
 	ret = onenand_block_isbad_nolock(mtd, ofs, 0);
 	onenand_release_device(mtd);
-- 
1.8.4
