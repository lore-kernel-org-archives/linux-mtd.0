Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rlt5s-00023b-MV
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 02:11:45 +0000
Received: by iakl21 with SMTP id l21so6125714iak.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 18:11:43 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] mtd: nand: erase block before marking bad
Date: Fri, 13 Jan 2012 18:11:47 -0800
Message-Id: <1326507110-10893-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Many NAND flash systems (especially those with MLC NAND) cannot be
reliably written twice in a row. For instance, when marking a bad block,
the block may already have data written to it, and so we should attempt
to erase the block before writing a bad block marker to its OOB region.

We can ignore erase failures, since the block may be bad such that it
cannot be erased properly; we still attempt to write zeros to its spare
area.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8a393f9..f0e768f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -407,6 +407,14 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		ret = nand_update_bbt(mtd, ofs);
 	else {
 		struct mtd_oob_ops ops;
+		struct erase_info einfo;
+
+		/* Attempt erase before marking OOB */
+		memset(&einfo, 0, sizeof(einfo));
+		einfo.mtd = mtd;
+		einfo.addr = ofs;
+		einfo.len = 1 << chip->phys_erase_shift;
+		nand_erase_nand(mtd, &einfo, 0);
 
 		nand_get_device(chip, mtd, FL_WRITING);
 
-- 
1.7.5.4
