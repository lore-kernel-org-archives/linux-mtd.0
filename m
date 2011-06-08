Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULGe-0007Bf-K4
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:06 +0000
Received: by mail-ww0-f41.google.com with SMTP id 18so3505551wwi.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:04 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/43] mtd: gpio-addr-flash.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:15 +0400
Message-Id: <1307549152-7085-7-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
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
 drivers/mtd/maps/gpio-addr-flash.c |   16 ++--------------
 1 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 7568c5f..1ec66f0 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -187,7 +187,6 @@ static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
  */
 static int __devinit gpio_flash_probe(struct platform_device *pdev)
 {
-	int nr_parts;
 	size_t i, arr_size;
 	struct physmap_flash_data *pdata;
 	struct resource *memory;
@@ -252,20 +251,9 @@ static int __devinit gpio_flash_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	nr_parts = parse_mtd_partitions(state->mtd, part_probe_types,
-					&pdata->parts, 0);
-	if (nr_parts > 0) {
-		pr_devinit(KERN_NOTICE PFX "Using commandline partition definition\n");
-		kfree(pdata->parts);
-	} else if (pdata->nr_parts) {
-		pr_devinit(KERN_NOTICE PFX "Using board partition definition\n");
-		nr_parts = pdata->nr_parts;
-	} else {
-		pr_devinit(KERN_NOTICE PFX "no partition info available, registering whole flash at once\n");
-		nr_parts = 0;
-	}
 
-	mtd_device_register(state->mtd, pdata->parts, nr_parts);
+	mtd_device_parse_register(state->mtd, part_probe_types, 0,
+			pdata->parts, pdata->nr_parts);
 
 	return 0;
 }
-- 
1.7.4.4
