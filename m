Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuURD-0003ES-0w
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 23:27:11 +0000
Received: by pdbnk13 with SMTP id nk13so73098599pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 16:26:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: lantiq-flash: use default partition parsers
Date: Mon, 18 May 2015 16:26:42 -0700
Message-Id: <1431991602-25342-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The default implementation already probes for cmdlinepart and ofpart.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/maps/lantiq-flash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 33d26f5bee54..e2f878216048 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -45,7 +45,6 @@ struct ltq_mtd {
 };
 
 static const char ltq_map_name[] = "ltq_nor";
-static const char * const ltq_probe_types[] = { "cmdlinepart", "ofpart", NULL };
 
 static map_word
 ltq_read16(struct map_info *map, unsigned long adr)
@@ -168,8 +167,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 	cfi->addr_unlock2 ^= 1;
 
 	ppdata.of_node = pdev->dev.of_node;
-	err = mtd_device_parse_register(ltq_mtd->mtd, ltq_probe_types,
-					&ppdata, NULL, 0);
+	err = mtd_device_parse_register(ltq_mtd->mtd, NULL, &ppdata, NULL, 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to add partitions\n");
 		goto err_destroy;
-- 
1.9.1
