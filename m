Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwSi-0001Ql-Gg
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:36:53 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:36:52 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 05/44] mtd: bfin-async-flash.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:04 +0400
Message-Id: <1307453803-31950-6-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/bfin-async-flash.c |   16 ++--------------
 1 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/maps/bfin-async-flash.c b/drivers/mtd/maps/bfin-async-flash.c
index d4297a9..246890e 100644
--- a/drivers/mtd/maps/bfin-async-flash.c
+++ b/drivers/mtd/maps/bfin-async-flash.c
@@ -41,7 +41,6 @@ struct async_state {
 	uint32_t flash_ambctl0, flash_ambctl1;
 	uint32_t save_ambctl0, save_ambctl1;
 	unsigned long irq_flags;
-	struct mtd_partition *parts;
 };
 
 static void switch_to_flash(struct async_state *state)
@@ -165,18 +164,8 @@ static int __devinit bfin_flash_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	ret = parse_mtd_partitions(state->mtd, part_probe_types, &pdata->parts, 0);
-	if (ret > 0) {
-		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using commandline partition definition\n");
-		mtd_device_register(state->mtd, pdata->parts, ret);
-		state->parts = pdata->parts;
-	} else if (pdata->nr_parts) {
-		pr_devinit(KERN_NOTICE DRIVER_NAME ": Using board partition definition\n");
-		mtd_device_register(state->mtd, pdata->parts, pdata->nr_parts);
-	} else {
-		pr_devinit(KERN_NOTICE DRIVER_NAME ": no partition info available, registering whole flash at once\n");
-		mtd_device_register(state->mtd, NULL, 0);
-	}
+	mtd_device_parse_register(state->mtd, part_probe_types, 0,
+			pdata->parts, pdata->nr_parts);
 
 	platform_set_drvdata(pdev, state);
 
@@ -188,7 +177,6 @@ static int __devexit bfin_flash_remove(struct platform_device *pdev)
 	struct async_state *state = platform_get_drvdata(pdev);
 	gpio_free(state->enet_flash_pin);
 	mtd_device_unregister(state->mtd);
-	kfree(state->parts);
 	map_destroy(state->mtd);
 	kfree(state);
 	return 0;
-- 
1.7.4.4
