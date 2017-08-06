Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deM9z-0004no-I9
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 14:04:06 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mtd: physmap_of: Fix resources leak in 'of_flash_probe()'
Date: Sun,  6 Aug 2017 14:55:01 +0200
Message-Id: <20170806125501.10368-1-christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If 'of_flash_probe_gemini()' or 'of_flash_probe_versatile()' fail, we must
reslease some resources, as already done in all error handling paths in
this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/maps/physmap_of_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
index 62fa6836f218..2c8cc97ce019 100644
--- a/drivers/mtd/maps/physmap_of_core.c
+++ b/drivers/mtd/maps/physmap_of_core.c
@@ -235,10 +235,10 @@ static int of_flash_probe(struct platform_device *dev)
 
 		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
 		if (err)
-			return err;
+			goto err_out;
 		err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
 		if (err)
-			return err;
+			goto err_out;
 
 		err = -ENOMEM;
 		info->list[i].map.virt = ioremap(info->list[i].map.phys,
-- 
2.11.0
