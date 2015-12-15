Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ifZ-0008Kf-9B
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:01:07 +0000
Received: by pabtx6 with SMTP id tx6so842974pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 22:00:44 -0800 (PST)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fransklaver@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH v2 07/12] mtd: nand: make nand_erase_nand() static
Date: Tue, 15 Dec 2015 05:59:33 +0000
Message-Id: <1450159178-29895-8-git-send-email-peterpandong@micron.com>
In-Reply-To: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
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
index 28d7a58..3058bb9 100644
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
@@ -2881,7 +2884,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
  *
  * Erase one ore more blocks.
  */
-int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
+static int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt)
 {
 	int page, status, pages_per_block, ret, chipnr;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 12c9c07..2051bd9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -866,8 +866,6 @@ extern struct nand_manufacturers nand_manuf_ids[];
 extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
-extern int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
-			   int allowbbt);
 extern int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, uint8_t *buf);
 
-- 
1.9.1
