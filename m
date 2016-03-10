Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae7W5-0007qm-JY
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 20:49:06 +0000
Received: by mail-pa0-x22e.google.com with SMTP id tt10so75424210pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2016 12:48:45 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Archit Taneja <architt@codeaurora.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: remove kerneldoc for removed function parameter
Date: Thu, 10 Mar 2016 12:47:23 -0800
Message-Id: <1457642843-16935-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The 'getchip' parameter is gone as of commit 9f3e04297b08 ("mtd: nand:
don't select chip in nand_chip's block_bad op"), so kill the doc with
it.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d49b01df3513..b6facac54fc0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -313,7 +313,6 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
  * nand_block_bad - [DEFAULT] Read bad block marker from the chip
  * @mtd: MTD device structure
  * @ofs: offset from device start
- * @getchip: 0, if the chip is already selected
  *
  * Check, if the block is bad.
  */
-- 
2.7.0.rc3.207.g0ac5344
