Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmK-0004mU-PH
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:09 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so1400918iej.8
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:47 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/12] mtd: nand: stop exporting nand_default_bbt
Date: Wed,  4 Sep 2013 11:25:18 -0700
Message-Id: <1378319126-24473-5-git-send-email-computersforpeace@gmail.com>
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

I removed the last non-nand_base users of this, and we shouldn't have
any more modules that need to access it. It's only non-static to share
between nand_base and nand_bbt.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index bc06196..c75b6a7 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -1392,4 +1392,3 @@ int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
 }
 
 EXPORT_SYMBOL(nand_scan_bbt);
-EXPORT_SYMBOL(nand_default_bbt);
-- 
1.8.4
