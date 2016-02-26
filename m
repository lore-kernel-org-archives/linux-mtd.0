Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZMHp-0007YF-2V
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 17:34:41 +0000
Received: by mail-wm0-x22a.google.com with SMTP id g62so82693266wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 09:34:20 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 dan.j.williams@intel.com, linux@arm.linux.org.uk
Cc: robert.jarzmik@free.fr,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 1/3] Revert "mtd: pxa2xx-flash: switch from ioremap_cache
 to memremap"
Date: Fri, 26 Feb 2016 18:34:11 +0100
Message-Id: <1456508053-15015-2-git-send-email-ard.biesheuvel@linaro.org>
In-Reply-To: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit 06968a54790d9dd87a5bb68e8197b5094eff63c3, since NOR
with memory semantics in array mode and RAM are not necessarily the same
thing, and architectures may implement ioremap_cache() and memremap()
with different memory attributes.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/mtd/maps/pxa2xx-flash.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index 7497090e9900..9adc4ef30891 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -71,8 +71,8 @@ static int pxa2xx_flash_probe(struct platform_device *pdev)
 		       info->map.name);
 		return -ENOMEM;
 	}
-	info->map.cached = memremap(info->map.phys, info->map.size,
-			MEMREMAP_WB);
+	info->map.cached =
+		ioremap_cache(info->map.phys, info->map.size);
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
