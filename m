Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkLmn-0004Da-Pe
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 20:25:42 +0000
Received: by mail-iy0-f177.google.com with SMTP id k27so8400220iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 12:25:41 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 5/6] mtd: nand: differentiate 1- vs. 2-byte writes when
 marking bad blocks
Date: Mon,  9 Jan 2012 12:23:31 -0800
Message-Id: <1326140612-26323-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
References: <1326140612-26323-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems that we have developed a bad-block-marking "feature" out of
pure laziness:

  "We write two bytes per location, so we dont have to mess with 16 bit
  access."

It's relatively simple to write a 1 byte at a time on x8 devices and 2
bytes at a time on x16 devices, so let's do it.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8319242..030ffd3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -434,13 +434,17 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		/*
 		 * Write to first two pages if necessary. If we write to more
 		 * than one location, the first error encountered quits the
-		 * procedure. We write two bytes per location, so we dont have
-		 * to mess with 16 bit access.
+		 * procedure.
 		 */
-		ops.len = ops.ooblen = 2;
 		ops.datbuf = NULL;
 		ops.oobbuf = buf;
-		ops.ooboffs = chip->badblockpos & ~0x01;
+		ops.ooboffs = chip->badblockpos;
+		if (chip->options & NAND_BUSWIDTH_16) {
+			ops.ooboffs &= ~0x01;
+			ops.len = ops.ooblen = 2;
+		} else {
+			ops.len = ops.ooblen = 1;
+		}
 		ops.mode = MTD_OPS_PLACE_OOB;
 		do {
 			ret = nand_do_write_oob(mtd, ofs, &ops);
-- 
1.7.5.4
