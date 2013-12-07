Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpIug-0007sr-Mz
 for linux-mtd@lists.infradead.org; Sat, 07 Dec 2013 14:31:23 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: sh_flctl: Remove unneeded CONFIG_OF
Date: Sat,  7 Dec 2013 11:31:01 -0300
Message-Id: <1386426661-24549-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since the of_mtd header provides dummy stubs for !CONFIG_OF, it's safe
to remove the #ifdef CONFIG_OF. Build tested only.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/sh_flctl.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index a3c84eb..8332a49 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1021,7 +1021,6 @@ static irqreturn_t flctl_handle_flste(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-#ifdef CONFIG_OF
 struct flctl_soc_config {
 	unsigned long flcmncr_val;
 	unsigned has_hwecc:1;
@@ -1080,12 +1079,6 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 
 	return pdata;
 }
-#else /* CONFIG_OF */
-static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
-{
-	return NULL;
-}
-#endif /* CONFIG_OF */
 
 static int flctl_probe(struct platform_device *pdev)
 {
-- 
1.8.1.5
