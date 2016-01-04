Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aG9wb-0007lz-6G
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2016 18:33:26 +0000
Received: by mail-pf0-x22b.google.com with SMTP id q63so169989445pfb.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jan 2016 10:33:04 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] mtd: nand: fix for drop unnecessary partition parser data
Date: Mon,  4 Jan 2016 10:32:54 -0800
Message-Id: <1451932374-64214-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Stephen Rothwell <sfr@canb.auug.org.au>

>From Stephen:

    Hi Brian,

    After merging the l2-mtd tree, today's linux-next build (powerpc
    ppc44x_defconfig) failed like this:

    drivers/mtd/nand/ndfc.c: In function 'ndfc_chip_init':
    drivers/mtd/nand/ndfc.c:177:2: error: 'ppdata' undeclared (first use in this function)
      ppdata.of_node = flash_np;
      ^

    Caused by commit

      a61ae81a1907 ("mtd: nand: drop unnecessary partition parser data")

The flash node is already correctly assigned using the new helper
(nand_set_flash_node()) so the correct fix is indeed to simply drop this
line.

Fixes: a61ae81a1907 ("mtd: nand: drop unnecessary partition parser data")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Resending Stephen's report from here:

https://lkml.org/lkml/2015/12/21/6

so that it gets a look on the MTD list. I've added just a tiny bit of
commentary too.

I don't plan to rebase my tree to fix the bisectability, since this is buried
far enough under other things that should be kept stable.

FWIW, I've now added this driver to my build tests.

 drivers/mtd/nand/ndfc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 0709ea9dd8ed..7d72f4fe06a1 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -174,7 +174,6 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 		return -ENODEV;
 	nand_set_flash_node(chip, flash_np);
 
-	ppdata.of_node = flash_np;
 	mtd->name = kasprintf(GFP_KERNEL, "%s.%s", dev_name(&ndfc->ofdev->dev),
 			      flash_np->name);
 	if (!mtd->name) {
-- 
2.6.0.rc2.230.g3dd15c0
