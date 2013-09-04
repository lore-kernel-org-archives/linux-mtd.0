Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmG-0004mS-71
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:04 +0000
Received: by mail-ie0-f173.google.com with SMTP id qa5so1222580ieb.4
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/12] nand: docg4: use nand_base's default BBT scan
Date: Wed,  4 Sep 2013 11:25:15 -0700
Message-Id: <1378319126-24473-2-git-send-email-computersforpeace@gmail.com>
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

There's no point in the low level driver doing the work that nand_base
already is doing; just let nand_base set the default BBT scanning
function.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/docg4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 548db23..7c38b8a 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1239,7 +1239,6 @@ static void __init init_mtd_structs(struct mtd_info *mtd)
 	nand->block_markbad = docg4_block_markbad;
 	nand->read_buf = docg4_read_buf;
 	nand->write_buf = docg4_write_buf16;
-	nand->scan_bbt = nand_default_bbt;
 	nand->erase_cmd = docg4_erase_block;
 	nand->ecc.read_page = docg4_read_page;
 	nand->ecc.write_page = docg4_write_page;
-- 
1.8.4
