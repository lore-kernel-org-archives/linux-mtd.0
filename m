Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fduNS-0007Qx-1W
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 09:28:44 +0000
Received: by mail-lf0-x243.google.com with SMTP id j8-v6so26637761lfb.4
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 02:28:27 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 3/4] mtd: maps: use mtd_device_register() where applicable
Date: Fri, 13 Jul 2018 11:27:33 +0200
Message-Id: <20180713092734.16408-4-zajec5@gmail.com>
In-Reply-To: <20180713092734.16408-1-zajec5@gmail.com>
References: <20180713092734.16408-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

If driver doesn't specify parsers it can use that little helper.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/maps/impa7.c            | 5 ++---
 drivers/mtd/maps/intel_vr_nor.c     | 2 +-
 drivers/mtd/maps/latch-addr-flash.c | 5 ++---
 drivers/mtd/maps/rbtx4939-flash.c   | 3 +--
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index a0b8fa7849a9..815e2db87955 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -88,9 +88,8 @@ static int __init init_impa7(void)
 		if (impa7_mtd[i]) {
 			impa7_mtd[i]->owner = THIS_MODULE;
 			devicesfound++;
-			mtd_device_parse_register(impa7_mtd[i], NULL, NULL,
-						  partitions,
-						  ARRAY_SIZE(partitions));
+			mtd_device_register(impa7_mtd[i], partitions,
+					    ARRAY_SIZE(partitions));
 		} else {
 			iounmap((void __iomem *)impa7_map[i].virt);
 		}
diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index dd5d6855f543..69503aef981e 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -71,7 +71,7 @@ static int vr_nor_init_partitions(struct vr_nor_mtd *p)
 {
 	/* register the flash bank */
 	/* partition the flash bank */
-	return mtd_device_parse_register(p->info, NULL, NULL, NULL, 0);
+	return mtd_device_register(p->info, NULL, 0);
 }
 
 static void vr_nor_destroy_mtd_setup(struct vr_nor_mtd *p)
diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index 6dc97aa667dc..51db24b7f88d 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -197,9 +197,8 @@ static int latch_addr_flash_probe(struct platform_device *dev)
 	}
 	info->mtd->dev.parent = &dev->dev;
 
-	mtd_device_parse_register(info->mtd, NULL, NULL,
-				  latch_addr_data->parts,
-				  latch_addr_data->nr_parts);
+	mtd_device_register(info->mtd, latch_addr_data->parts,
+			    latch_addr_data->nr_parts);
 	return 0;
 
 iounmap:
diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 3a06ecfc55ff..80a187167c92 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -97,8 +97,7 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 		goto err_out;
 	}
 	info->mtd->dev.parent = &dev->dev;
-	err = mtd_device_parse_register(info->mtd, NULL, NULL, pdata->parts,
-					pdata->nr_parts);
+	err = mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
 
 	if (err)
 		goto err_out;
-- 
2.13.7
