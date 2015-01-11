Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAIFN-0003El-4K
 for linux-mtd@lists.infradead.org; Sun, 11 Jan 2015 13:08:02 +0000
Received: by mail-pa0-f54.google.com with SMTP id fb1so27262734pad.13
 for <linux-mtd@lists.infradead.org>; Sun, 11 Jan 2015 05:07:38 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: ams-delta: fix overwritten mtd_info->owner in
 initialization
Date: Sun, 11 Jan 2015 22:07:20 +0900
Message-Id: <1420981640-16495-1-git-send-email-akinobu.mita@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Jonathan McDowell <noodles@earth.li>, David Woodhouse <dwmw2@infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In initialization routine, mtd_info->owner is overwritten by memset()
just after being initialized.  This can be fixed by moving memset() calls
to just before setting mtd_info->owner.  But the memory region is allocated
by kmalloc, so we can fix it by using kzalloc instead of kmalloc.

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Jonathan McDowell <noodles@earth.li>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/ams-delta.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index f1d555c..842f8fe 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -183,7 +183,7 @@ static int ams_delta_init(struct platform_device *pdev)
 		return -ENXIO;
 
 	/* Allocate memory for MTD device structure and private data */
-	ams_delta_mtd = kmalloc(sizeof(struct mtd_info) +
+	ams_delta_mtd = kzalloc(sizeof(struct mtd_info) +
 				sizeof(struct nand_chip), GFP_KERNEL);
 	if (!ams_delta_mtd) {
 		printk (KERN_WARNING "Unable to allocate E3 NAND MTD device structure.\n");
@@ -196,10 +196,6 @@ static int ams_delta_init(struct platform_device *pdev)
 	/* Get pointer to private data */
 	this = (struct nand_chip *) (&ams_delta_mtd[1]);
 
-	/* Initialize structures */
-	memset(ams_delta_mtd, 0, sizeof(struct mtd_info));
-	memset(this, 0, sizeof(struct nand_chip));
-
 	/* Link the private data with the MTD structure */
 	ams_delta_mtd->priv = this;
 
-- 
1.9.1
