Received: from mail1.bemta8.messagelabs.com ([216.82.243.206])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bP45m-0000d8-KC
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 08:40:00 +0000
From: Hector Palacios <hector.palacios@digi.com>
To: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <oss@buserror.net>, <stable@vger.kernel.org>, <hector.palacios@digi.com>
Subject: [PATCH] mtd: nand: fix bug writing 1 byte less than page size
Date: Mon, 18 Jul 2016 10:39:18 +0200
Message-ID: <1468831158-6172-1-git-send-email-hector.palacios@digi.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_do_write_ops() determines if it is writing a partial page with the
formula:
	part_pagewr = (column || writelen < (mtd->writesize - 1))

When 'writelen' is exactly 1 byte less than the NAND page size the formula
equates to zero, so the code doesn't process it as a partial write,
although it should.
As a consequence the function remains in the while(1) loop with 'writelen'
becoming 0xffffffff and iterating endlessly.

The bug may not be easy to reproduce in Linux since user space tools
usually force the padding or round-up the write size to a page-size
multiple.
This was discovered in U-Boot where the issue can be reproduced by
writing any size that is 1 byte less than a page-size multiple.
For example, on a NAND with 2K page (0x800):
	=> nand erase.part <partition>
	=> nand write $loadaddr <partition> 7ff

Signed-off-by: Hector Palacios <hector.palacios@digi.com>
---
 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 0b0dc29d2af7..77533f7f2429 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2610,7 +2610,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		int cached = writelen > bytes && page != blockmask;
 		uint8_t *wbuf = buf;
 		int use_bufpoi;
-		int part_pagewr = (column || writelen < (mtd->writesize - 1));
+		int part_pagewr = (column || writelen < mtd->writesize);
 
 		if (part_pagewr)
 			use_bufpoi = 1;
