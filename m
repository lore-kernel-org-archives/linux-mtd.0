Received: from mail-oa0-x231.google.com ([2607:f8b0:4003:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDl0k-0007To-PA
 for linux-mtd@lists.infradead.org; Thu, 13 Feb 2014 01:22:43 +0000
Received: by mail-oa0-f49.google.com with SMTP id i7so11741508oag.8
 for <linux-mtd@lists.infradead.org>; Wed, 12 Feb 2014 17:22:21 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: nand: fix off-by-one read retry mode counting
Date: Wed, 12 Feb 2014 17:22:11 -0800
Message-Id: <1392254531-1796-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A flash may support N read retry voltage threshold modes, numbered 1
through N-1 (where mode 0 represents the initial state). However,
nand_do_read_ops() tries to use mode 0 through N.

This off-by-one error shows up, for instance, when using nanddump, and
we have cycled through available modes:

    nand: setting READ RETRY mode 0
    nand: setting READ RETRY mode 1
    nand: setting READ RETRY mode 2
    nand: setting READ RETRY mode 3
    nand: setting READ RETRY mode 4
    nand: setting READ RETRY mode 5
    nand: setting READ RETRY mode 6
    nand: setting READ RETRY mode 7
    nand: setting READ RETRY mode 8
    libmtd: error!: cannot read 8192 bytes from mtd0 (eraseblock 20, offset 0)
            error 22 (Invalid argument)
    nanddump: error!: mtd_read

Tested on Micron MT29F64G08CBCBBH1, with 8 retry modes.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v1 -> v2: N modes means we should use modes 0 to N-1, not 0 to N

 drivers/mtd/nand/nand_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9be7842f300e..3cb1cefcd926 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1586,7 +1586,7 @@ read_retry:
 			}
 
 			if (mtd->ecc_stats.failed - ecc_failures) {
-				if (retry_mode + 1 <= chip->read_retries) {
+				if (retry_mode + 1 < chip->read_retries) {
 					retry_mode++;
 					ret = nand_setup_read_retry(mtd,
 							retry_mode);
-- 
1.8.3.2
