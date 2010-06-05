Message-ID: <4C0A157C.1050909@gmail.com>
Date: Sat, 05 Jun 2010 17:14:36 +0800
From: Wan ZongShun <mcuos.com@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, Eric Miao <eric.y.miao@gmail.com>
Subject: [PATCHv2 3/3] MTD/pxa: patch for error return value method of
	pxa2xx-flash
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is to re-implement the 'pxa2xx-flash.c' error return value method
of probe() and remove() function,the old return way can arouse the 'info' memory
leak risk.

This patch has been reviewed by Eric, according to his advice, I modify some wrong
issues of previous patch and resend to maillist.

Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>

---
 drivers/mtd/maps/pxa2xx-flash.c |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c
index b5bb1a4..e789358 100644
--- a/drivers/mtd/maps/pxa2xx-flash.c
+++ b/drivers/mtd/maps/pxa2xx-flash.c
@@ -78,7 +78,8 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	if (!info->map.virt) {
 		printk(KERN_WARNING "Failed to ioremap %s\n",
 		       info->map.name);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto fail1;
 	}
 	info->map.cached =
 		ioremap_cached(info->map.phys, info->map.size);
@@ -97,10 +98,8 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)
 	info->mtd = do_map_probe(flash->map_name, &info->map);

 	if (!info->mtd) {
-		iounmap((void *)info->map.virt);
-		if (info->map.cached)
-			iounmap(info->map.cached);
-		return -EIO;
+		ret = -EIO;
+		goto fail2;
 	}
 	info->mtd->owner = THIS_MODULE;

@@ -124,6 +123,12 @@ static int __devinit pxa2xx_flash_probe(struct platform_device *pdev)

 	platform_set_drvdata(pdev, info);
 	return 0;
+
+fail2:	iounmap(info->map.virt);
+	if (info->map.cached)
+		iounmap(info->map.cached);
+fail1:	kfree(info);
+	return ret;
 }

 static int __devexit pxa2xx_flash_remove(struct platform_device *dev)
-- 
1.6.3.3
