Received: from juliette.telenet-ops.be ([195.130.137.74])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgJMU-0008Bt-2i
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 19:10:56 +0000
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] mtd: Remove superfluous name casts
Date: Tue, 12 Nov 2013 20:07:15 +0100
Message-Id: <1384283245-9419-3-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
References: <1384283245-9419-1-git-send-email-geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

map_info.name is "const char *"

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/pxa2xx-flash.c |    2 +-
 drivers/mtd/maps/sun_uflash.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index d210d131fef2..63b52f7080fa 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -61,7 +61,7 @@ static int pxa2xx_flash_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	info->map.name = (char *) flash->name;
+	info->map.name = flash->name;
 	info->map.bankwidth = flash->width;
 	info->map.phys = res->start;
 	info->map.size = resource_size(res);
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index d467f3b11c96..39cc4181f025 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -75,7 +75,7 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
 
 	up->name = of_get_property(dp, "model", NULL);
 	if (up->name && 0 < strlen(up->name))
-		up->map.name = (char *)up->name;
+		up->map.name = up->name;
 
 	up->map.phys = op->resource[0].start;
 
-- 
1.7.9.5
