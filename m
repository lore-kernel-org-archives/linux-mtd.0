Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0PJP-0000Hk-9Y
	for linux-mtd@lists.infradead.org; Wed, 12 Nov 2008 23:39:51 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd/physmap: use parse_mtd()
Date: Wed, 12 Nov 2008 18:39:48 -0500
Message-Id: <1226533189-8492-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Call parse_mtd() to handle partition/device registration rather than doing
it all ourself.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/maps/physmap.c |   21 +--------------------
 1 files changed, 1 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 42d844f..9b87fd8 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -84,9 +84,6 @@ static int physmap_flash_remove(struct platform_device *dev)
 }
 
 static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
-#ifdef CONFIG_MTD_PARTITIONS
-static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
-#endif
 
 static int physmap_flash_probe(struct platform_device *dev)
 {
@@ -170,23 +167,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 	if (err)
 		goto err_out;
 
-#ifdef CONFIG_MTD_PARTITIONS
-	err = parse_mtd_partitions(info->cmtd, part_probe_types, &info->parts, 0);
-	if (err > 0) {
-		add_mtd_partitions(info->cmtd, info->parts, err);
-		return 0;
-	}
-
-	if (physmap_data->nr_parts) {
-		printk(KERN_NOTICE "Using physmap partition information\n");
-		add_mtd_partitions(info->cmtd, physmap_data->parts,
-				   physmap_data->nr_parts);
-		return 0;
-	}
-#endif
-
-	add_mtd_device(info->cmtd);
-	return 0;
+	return parse_mtd(info->cmtd, NULL, physmap_data->parts, physmap_data->nr_parts);
 
 err_out:
 	physmap_flash_remove(dev);
-- 
1.6.0.3
