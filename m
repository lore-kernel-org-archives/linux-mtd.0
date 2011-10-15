Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REud1-0007Ez-3E
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2011 03:09:39 +0000
Received: by iarr31 with SMTP id r31so3959844iar.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 20:09:36 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: initialize ops.mode
Date: Fri, 14 Oct 2011 20:09:33 -0700
Message-Id: <1318648173-17775-1-git-send-email-computersforpeace@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Our `ops' information was converted to a local variable recently, and
apparently, old code relied on the fact that the global version was
often left in a valid mode. We can't make this assumption on local
structs, and we shouldn't be relying on a previous state anyway.

Instead, we initialize mode to 0 for don't-care situations (i.e., the
operation does not use OOB anyway) and MTD_OPS_PLACE_OOB when we want to
place OOB data.

This fixes a bug with nand_default_block_markbad(), where we catch on
the BUG() call in nand_fill_oob():

Kernel bug detected[#1]:
...
Call Trace:
[<80307350>] nand_fill_oob.clone.5+0xa4/0x15c
[<803075d8>] nand_do_write_oob+0x1d0/0x260
[<803077c4>] nand_default_block_markbad+0x15c/0x1a8
[<802e8c2c>] part_block_markbad+0x80/0x98
[<802ebc74>] mtd_ioctl+0x6d8/0xbd0
[<802ec1a4>] mtd_unlocked_ioctl+0x38/0x5c
[<800d9c60>] do_vfs_ioctl+0xa4/0x6e4
[<800da2e4>] sys_ioctl+0x44/0xa0
[<8001381c>] stack_done+0x20/0x40

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 51653d9..3ed9c5e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -420,6 +420,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		ops.datbuf = NULL;
 		ops.oobbuf = buf;
 		ops.ooboffs = chip->badblockpos & ~0x01;
+		ops.mode = MTD_OPS_PLACE_OOB;
 		do {
 			ret = nand_do_write_oob(mtd, ofs, &ops);
 
@@ -1596,6 +1597,7 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ops.len = len;
 	ops.datbuf = buf;
 	ops.oobbuf = NULL;
+	ops.mode = 0;
 
 	ret = nand_do_read_ops(mtd, from, &ops);
 
@@ -2306,6 +2308,7 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
 	ops.oobbuf = NULL;
+	ops.mode = 0;
 
 	ret = nand_do_write_ops(mtd, to, &ops);
 
@@ -2341,6 +2344,7 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
 	ops.oobbuf = NULL;
+	ops.mode = 0;
 
 	ret = nand_do_write_ops(mtd, to, &ops);
 
-- 
1.7.5.4
