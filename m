Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPbWa-0001bU-5v
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 17:40:32 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [RFC/PATCH] mtd: nand: Account the blocks used by the BBT in the
 ecc_stats
Date: Mon, 17 Mar 2014 14:39:45 -0300
Message-Id: <1395077985-8065-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Strictly speaking we should be updating the ecc_stats in the master
MTD object, with the blocks used by the bad block table.

This is already being done for bad and reserved blocks detected doing
the BBT search, but not for the blocks used by the BBT itself. This commit
adds the latter.

It should be noted that the ecc_stats structure is kept only for userspace
information, accesible through an ioctl. However, since the master MTD object
is not tied to any /dev/mtd{N} device node in the filesystem, there's currently
no way to retrieve this information.

This ecc_stats is used for the MTD partitions typically allocated and
registered by mtd_device_parse_register(). These have a device node, but scan
for bad blocks and updates the ecc_stats in a different code path.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
For the reasons exposed above, it's not clear we should remove the ecc_stats
update in the master MTD altogether or simply take account of the BBT blocks
for consistency. I've chosen the latter, for it seemed a safer changer.
I'm open to discussion.

 drivers/mtd/nand/nand_bbt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c0615d1..ea9a266 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -991,6 +991,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 			block = td->pages[i] >> (this->bbt_erase_shift - this->page_shift);
 			oldval = bbt_get_entry(this, block);
 			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			mtd->ecc_stats.bbtblocks++;
 			if ((oldval != BBT_BLOCK_RESERVED) &&
 					td->reserved_block_code)
 				nand_update_bbt(mtd, (loff_t)block <<
@@ -1005,6 +1006,7 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		for (j = 0; j < td->maxblocks; j++) {
 			oldval = bbt_get_entry(this, block);
 			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
+			mtd->ecc_stats.bbtblocks++;
 			if (oldval != BBT_BLOCK_RESERVED)
 				update = 1;
 			block++;
-- 
1.9.0
