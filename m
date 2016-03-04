Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abmMF-0001Zh-SE
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2016 09:49:17 +0000
Received: by mail-wm0-x235.google.com with SMTP id l68so26705066wml.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 01:49:00 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux@arm.linux.org.uk, dan.j.williams@intel.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, robert.jarzmik@free.fr,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v3 2/4] mtd: pxa2xx-flash: switch back from memremap to
 ioremap_cached
Date: Fri,  4 Mar 2016 10:48:46 +0100
Message-Id: <1457084928-21179-3-git-send-email-ard.biesheuvel@linaro.org>
In-Reply-To: <1457084928-21179-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1457084928-21179-1-git-send-email-ard.biesheuvel@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit 06968a54790d ("mtd: pxa2xx-flash: switch from
ioremap_cache to memremap"), since NOR with memory semantics in array mode
and RAM are not necessarily the same thing, and architectures may implement
ioremap_cached() and memremap() with different memory attributes.

For this reason, ioremap_cached() has been brought back from the dead on
the ARM side, so switch this driver back to using it instead of memremap().

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/mtd/maps/pxa2xx-flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 7497090e9900..2cde28ed95c9 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -71,8 +71,8 @@ static int pxa2xx_flash_probe(struct platform_device *pdev)
 		       info->map.name);
 		return -ENOMEM;
 	}
-	info->map.cached = memremap(info->map.phys, info->map.size,
-			MEMREMAP_WB);
+	info->map.cached =
+		ioremap_cached(info->map.phys, info->map.size);
 	if (!info->map.cached)
 		printk(KERN_WARNING "Failed to ioremap cached %s\n",
 		       info->map.name);
@@ -111,7 +111,7 @@ static int pxa2xx_flash_remove(struct platform_device *dev)
 	map_destroy(info->mtd);
 	iounmap(info->map.virt);
 	if (info->map.cached)
-		memunmap(info->map.cached);
+		iounmap(info->map.cached);
 	kfree(info);
 	return 0;
 }
-- 
2.5.0
