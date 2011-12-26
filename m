Received: from mgw2.diku.dk ([130.225.96.92])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfEV2-0001Kj-BH
 for linux-mtd@lists.infradead.org; Mon, 26 Dec 2011 17:38:14 +0000
From: Julia Lawall <julia@diku.dk>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/2] drivers/mtd/maps/lantiq-flash.c: drop iounmap for devm_
 allocated data
Date: Mon, 26 Dec 2011 18:38:01 +0100
Message-Id: <1324921081-13161-2-git-send-email-julia@diku.dk>
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

From: Julia Lawall <julia@diku.dk>

Data allocated with devm_ioremap or devm_ioremap_nocache should not be
freed using iounmap, because doing so causes a dangling pointer, and a
subsequent double free.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression x;
@@
(
 x = devm_ioremap(...)
|
 x = devm_ioremap_nocache(...)
)

@@
expression r.x;
@@
* iounmap(x)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/lantiq-flash.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 4f10e27..7b889de 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -159,7 +159,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 	if (!ltq_mtd->mtd) {
 		dev_err(&pdev->dev, "probing failed\n");
 		err = -ENXIO;
-		goto err_unmap;
+		goto err_free;
 	}
 
 	ltq_mtd->mtd->owner = THIS_MODULE;
@@ -179,8 +179,6 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 err_destroy:
 	map_destroy(ltq_mtd->mtd);
-err_unmap:
-	iounmap(ltq_mtd->map->virt);
 err_free:
 	kfree(ltq_mtd->map);
 err_out:
@@ -198,8 +196,6 @@ ltq_mtd_remove(struct platform_device *pdev)
 			mtd_device_unregister(ltq_mtd->mtd);
 			map_destroy(ltq_mtd->mtd);
 		}
-		if (ltq_mtd->map->virt)
-			iounmap(ltq_mtd->map->virt);
 		kfree(ltq_mtd->map);
 		kfree(ltq_mtd);
 	}
