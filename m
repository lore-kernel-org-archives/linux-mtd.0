Received: from mail4-relais-sop.national.inria.fr ([192.134.164.105])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7qdj-0002cm-8M
 for linux-mtd@lists.infradead.org; Sat, 01 Sep 2012 16:33:43 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 3/4] drivers/mtd/maps/autcpu12-nvram.c: drop frees of devm_
 alloc'd data
Date: Sat,  1 Sep 2012 18:33:11 +0200
Message-Id: <1346517191-8794-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346517191-8794-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1346517191-8794-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm free functions should not have to be explicitly used.

A semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

(
* devm_kfree(...);
|
* devm_free_irq(...);
|
* devm_iounmap(...);
|
* devm_release_region(...);
|
* devm_release_mem_region(...);
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/maps/autcpu12-nvram.c |   18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/maps/autcpu12-nvram.c b/drivers/mtd/maps/autcpu12-nvram.c
index ef420d9..76fb594 100644
--- a/drivers/mtd/maps/autcpu12-nvram.c
+++ b/drivers/mtd/maps/autcpu12-nvram.c
@@ -38,7 +38,6 @@ static int __devinit autcpu12_nvram_probe(struct platform_device *pdev)
 	map_word tmp, save0, save1;
 	struct resource *res;
 	struct autcpu12_nvram_priv *priv;
-	int err;
 
 	priv = devm_kzalloc(&pdev->dev,
 			    sizeof(struct autcpu12_nvram_priv), GFP_KERNEL);
@@ -50,8 +49,7 @@ static int __devinit autcpu12_nvram_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "failed to get memory resource\n");
-		err = -ENOENT;
-		goto out;
+		return -ENOENT;
 	}
 
 	priv->map.bankwidth	= 4;
@@ -61,8 +59,7 @@ static int __devinit autcpu12_nvram_probe(struct platform_device *pdev)
 	strcpy((char *)priv->map.name, res->name);
 	if (!priv->map.virt) {
 		dev_err(&pdev->dev, "failed to remap mem resource\n");
-		err = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	simple_map_init(&priv->map);
@@ -90,8 +87,7 @@ static int __devinit autcpu12_nvram_probe(struct platform_device *pdev)
 	priv->mtd = do_map_probe("map_ram", &priv->map);
 	if (!priv->mtd) {
 		dev_err(&pdev->dev, "probing failed\n");
-		err = -ENXIO;
-		goto out;
+		return -ENXIO;
 	}
 
 	priv->mtd->owner	= THIS_MODULE;
@@ -106,12 +102,7 @@ static int __devinit autcpu12_nvram_probe(struct platform_device *pdev)
 
 	map_destroy(priv->mtd);
 	dev_err(&pdev->dev, "NV-RAM device addition failed\n");
-	err = -ENOMEM;
-
-out:
-	devm_kfree(&pdev->dev, priv);
-
-	return err;
+	return -ENOMEM;
 }
 
 static int __devexit autcpu12_nvram_remove(struct platform_device *pdev)
@@ -120,7 +111,6 @@ static int __devexit autcpu12_nvram_remove(struct platform_device *pdev)
 
 	mtd_device_unregister(priv->mtd);
 	map_destroy(priv->mtd);
-	devm_kfree(&pdev->dev, priv);
 
 	return 0;
 }
