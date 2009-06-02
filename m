Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBLGj-0005iL-3m
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 04:06:40 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/maps: Blackfin async: fix memory leaks in probe/remove
	funcs
Date: Tue,  2 Jun 2009 00:06:23 -0400
Message-Id: <1243915583-29577-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/maps/bfin-async-flash.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index 576611f..365c77b 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -40,6 +40,9 @@ struct async_state {
 	uint32_t flash_ambctl0, flash_ambctl1;
 	uint32_t save_ambctl0, save_ambctl1;
 	unsigned long irq_flags;
+#ifdef CONFIG_MTD_PARTITIONS
+	struct mtd_partition *parts;
+#endif
 };
 
 static void switch_to_flash(struct async_state *state)
@@ -170,6 +173,7 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 	if (ret > 0) {
 		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
 		add_mtd_partitions(state->mtd, pdata->parts, ret);
+		state->parts = pdata->parts;
 
 	} else if (pdata->nr_parts) {
 		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");
@@ -193,6 +197,7 @@ static int __devexit bfin_flash_remove(struct platform_device *pdev)
 	gpio_free(state->enet_flash_pin);
 #ifdef CONFIG_MTD_PARTITIONS
 	del_mtd_partitions(state->mtd);
+	kfree(state->parts);
 #endif
 	map_destroy(state->mtd);
 	kfree(state);
-- 
1.6.3.1
