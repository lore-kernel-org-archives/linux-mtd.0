Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIb6-0004o6-4J
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:09 +0000
Received: by mail-pf0-x244.google.com with SMTP id n5so6869862pfn.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:52 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 07/11] mtd: nand: make nand_erase_nand() static
Date: Mon, 14 Mar 2016 02:48:00 +0000
Message-Id: <1457923684-13505-8-git-send-email-peterpandong@micron.com>
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Brian Norris <computersforpeace@gmail.com>

nand_bbt.c doesn't need to call nand_erase_nand() any more.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/nand_base.c | 5 ++++-
 include/linux/mtd/nand.h     | 2 --
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6f0e3b9..371e65f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -97,6 +97,9 @@ static int nand_get_device(struct mtd_info *mtd, int new_state);
 static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 			     struct mtd_oob_ops *ops);
 
+static int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
+			   int allowbbt);
+
 /*
  * For devices which display every fart in the system on a separate LED. Is
  * compiled away when LED support is disabled.
@@ -2897,7 +2900,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
  *
  * Erase one ore more blocks.
  */
-int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
+static int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt)
 {
 	int page, status, pages_per_block, ret, chipnr;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5072041..8730afd 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -896,8 +896,6 @@ extern struct nand_manufacturers nand_manuf_ids[];
 extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
-extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
-			   int allowbbt);
 extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, uint8_t *buf);
 
-- 
1.9.1
