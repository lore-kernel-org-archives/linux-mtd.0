Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORN9-0002TB-O0
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:25 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:23 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/62] mtd/octeon: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:22:54 +0100
Message-Id: <1306142623-24952-14-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	Ralf Baechle <ralf@linux-mips.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/mips/cavium-octeon/flash_setup.c |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 008f657..0ee02f5 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -16,7 +16,6 @@
 
 static struct map_info flash_map;
 static struct mtd_info *mymtd;
-#ifdef CONFIG_MTD_PARTITIONS
 static int nr_parts;
 static struct mtd_partition *parts;
 static const char *part_probe_types[] = {
@@ -26,7 +25,6 @@ static const char *part_probe_types[] = {
 #endif
 	NULL
 };
-#endif
 
 /**
  * Module/ driver initialization.
@@ -63,17 +61,10 @@ static int __init flash_init(void)
 		if (mymtd) {
 			mymtd->owner = THIS_MODULE;
 
-#ifdef CONFIG_MTD_PARTITIONS
 			nr_parts = parse_mtd_partitions(mymtd,
 							part_probe_types,
 							&parts, 0);
-			if (nr_parts > 0)
-				add_mtd_partitions(mymtd, parts, nr_parts);
-			else
-				add_mtd_device(mymtd);
-#else
-			add_mtd_device(mymtd);
-#endif
+			mtd_device_register(mymtd, parts, nr_parts);
 		} else {
 			pr_err("Failed to register MTD device for flash\n");
 		}
-- 
1.7.4.4
