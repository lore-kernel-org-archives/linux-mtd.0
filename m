Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TykcX-000493-PO
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2013 14:51:10 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: physmap_of: Convert device allocation to managed
 devm_kzalloc()
Date: Fri, 25 Jan 2013 11:50:27 -0300
Message-Id: <1359125428-23801-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1359125428-23801-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1359125428-23801-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: thierry.reding@avionic-design.de, dwmw2@infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested by compilation only.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/maps/physmap_of.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 67cc73c..c69e5c4 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -68,9 +68,6 @@ static int of_flash_remove(struct platform_device *dev)
 			kfree(info->list[i].res);
 		}
 	}
-
-	kfree(info);
-
 	return 0;
 }
 
@@ -199,8 +196,9 @@ static int of_flash_probe(struct platform_device *dev)
 	map_indirect = of_property_read_bool(dp, "no-unaligned-direct-access");
 
 	err = -ENOMEM;
-	info = kzalloc(sizeof(struct of_flash) +
-		       sizeof(struct of_flash_list) * count, GFP_KERNEL);
+	info = devm_kzalloc(&dev->dev,
+			    sizeof(struct of_flash) +
+			    sizeof(struct of_flash_list) * count, GFP_KERNEL);
 	if (!info)
 		goto err_flash_remove;
 
-- 
1.7.8.6
