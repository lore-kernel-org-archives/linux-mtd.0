Received: from smtp20.mail.ru ([94.100.176.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TOMnz-0004b1-6u
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 06:08:36 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: gpio-nand: Ability to use driver for configurations
 without RDY-pin
Date: Wed, 17 Oct 2012 10:08:27 +0400
Message-Id: <1350454107-3754-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In some configurations of "gpio-nand" RDY-pin may be not connected.
This patch allow to use driver for these configurations. In this case
we are assume that device always ready.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/gpio.c |   22 +++++++++++++++-------
 1 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index bc73bc5..b1653bf 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -134,7 +134,11 @@ static void gpio_nand_readbuf16(struct mtd_info *mtd, u_char *buf, int len)
 static int gpio_nand_devready(struct mtd_info *mtd)
 {
 	struct gpiomtd *gpiomtd = gpio_nand_getpriv(mtd);
-	return gpio_get_value(gpiomtd->plat.gpio_rdy);
+
+	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
+		return gpio_get_value(gpiomtd->plat.gpio_rdy);
+
+	return 1;
 }
 
 #ifdef CONFIG_OF
@@ -252,7 +256,8 @@ static int __devexit gpio_nand_remove(struct platform_device *dev)
 	gpio_free(gpiomtd->plat.gpio_nce);
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_free(gpiomtd->plat.gpio_nwp);
-	gpio_free(gpiomtd->plat.gpio_rdy);
+	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
+		gpio_free(gpiomtd->plat.gpio_rdy);
 
 	kfree(gpiomtd);
 
@@ -336,10 +341,12 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 	if (ret)
 		goto err_cle;
 	gpio_direction_output(gpiomtd->plat.gpio_cle, 0);
-	ret = gpio_request(gpiomtd->plat.gpio_rdy, "NAND RDY");
-	if (ret)
-		goto err_rdy;
-	gpio_direction_input(gpiomtd->plat.gpio_rdy);
+	if (gpio_is_valid(gpiomtd->plat.gpio_rdy)) {
+		ret = gpio_request(gpiomtd->plat.gpio_rdy, "NAND RDY");
+		if (ret)
+			goto err_rdy;
+		gpio_direction_input(gpiomtd->plat.gpio_rdy);
+	}
 
 
 	this->IO_ADDR_W  = this->IO_ADDR_R;
@@ -386,7 +393,8 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 err_wp:
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
 		gpio_set_value(gpiomtd->plat.gpio_nwp, 0);
-	gpio_free(gpiomtd->plat.gpio_rdy);
+	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
+		gpio_free(gpiomtd->plat.gpio_rdy);
 err_rdy:
 	gpio_free(gpiomtd->plat.gpio_cle);
 err_cle:
-- 
1.7.3.4
