Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlypI-0006w8-Kr
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 08:51:17 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dedekind1@gmail.com>
Subject: [PATCH 1/2] mtd: replace the hard code with the proper macro
Date: Tue, 3 Jul 2012 16:44:14 +0800
Message-ID: <1341305055-29218-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use the MTD_OPS_PLACE_OOB to replace the hard code "0".
Make the code more readable.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c58df65..5b8ab7f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1633,7 +1633,7 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ops.len = len;
 	ops.datbuf = buf;
 	ops.oobbuf = NULL;
-	ops.mode = 0;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ret = nand_do_read_ops(mtd, from, &ops);
 	*retlen = ops.retlen;
 	nand_release_device(mtd);
@@ -2336,7 +2336,7 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
 	ops.oobbuf = NULL;
-	ops.mode = 0;
+	ops.mode = MTD_OPS_PLACE_OOB;
 
 	ret = nand_do_write_ops(mtd, to, &ops);
 
@@ -2365,7 +2365,7 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	ops.len = len;
 	ops.datbuf = (uint8_t *)buf;
 	ops.oobbuf = NULL;
-	ops.mode = 0;
+	ops.mode = MTD_OPS_PLACE_OOB;
 	ret = nand_do_write_ops(mtd, to, &ops);
 	*retlen = ops.retlen;
 	nand_release_device(mtd);
-- 
1.7.0.4
