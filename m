Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKRzg-0006bG-Tq
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 10:20:17 +0000
Received: by wgbds1 with SMTP id ds1so423951wgb.0
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 03:20:11 -0700 (PDT)
From: Bastian Hecht <hechtb@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC] mtd: nand: Add a STATUS CMD after write verification
Date: Wed, 18 Apr 2012 12:20:04 +0200
Message-Id: <1334744404-721-1-git-send-email-hechtb@gmail.com>
Cc: Bastian Hecht <hechtb@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When using CONFIG_MTD_NAND_VERIFY_WRITE=y an extra read command is sent
to the NAND chip after writing a page. We need an extra status command
to avoid hick-ups that lead to page write failures.
---

Hello all,

I'm experiencing problems with my current setup and
CONFIG_MTD_NAND_VERIFY_WRITE=y. Usually the command sequence is like
0x70 		Status read
0x80 0x10 	Page prog
0x70
0x80 0x10 	Page prog
0x70
...

When activating write verification there is a read command before the
page prog.
0x80 0x10
0x70
0x0		read
0x80 0x10
0x70
...
This makes my chip write garbage, while the patch fixes it.
Now I wonder if this problem is caused by my NAND chip only, or if this
is a general problem that should be adressed.
---
 drivers/mtd/nand/nand_base.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8a393f9..62d6691 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2101,6 +2101,8 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 	if (chip->verify_buf(mtd, buf, mtd->writesize))
 		return -EIO;
+	
+	chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
 #endif
 	return 0;
 }
-- 
1.7.5.4
