Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMdTx-00060F-Jo
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 17:27:43 +0000
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] mtd: nand: gpio: Fix ALE gpio configuration
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Message-Id: <20171206172714.ABE156C6B0@po15668-vm-win7.idsi0.si.c-s.fr>
Date: Wed,  6 Dec 2017 18:27:14 +0100 (CET)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixes a copy/paste error in commit f3d0d8d938b4d ("mtd: nand: gpio:
Convert to use GPIO descriptors") which breaks gpio-nand driver

Fixes: f3d0d8d938b4d ("mtd: nand: gpio: Convert to use GPIO descriptors")
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/mtd/nand/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 484f7fbc3f7d..a8bde6665c24 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -253,9 +253,9 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		goto out_ce;
 	}
 
-	gpiomtd->nwp = devm_gpiod_get(dev, "ale", GPIOD_OUT_LOW);
-	if (IS_ERR(gpiomtd->nwp)) {
-		ret = PTR_ERR(gpiomtd->nwp);
+	gpiomtd->ale = devm_gpiod_get(dev, "ale", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiomtd->ale)) {
+		ret = PTR_ERR(gpiomtd->ale);
 		goto out_ce;
 	}
 
-- 
2.13.3
