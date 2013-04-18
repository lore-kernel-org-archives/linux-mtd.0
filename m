Received: from smtp27.mail.ru ([94.100.176.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USs3I-0003oU-5v
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2013 16:51:18 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND 3/5] mtd: nand-gpio: Use default dev_ready function if
 RDY-pin is missing in configuration
Date: Thu, 18 Apr 2013 20:50:44 +0400
Message-Id: <1366303846-20384-4-git-send-email-shc_work@mail.ru>
In-Reply-To: <1366303846-20384-1-git-send-email-shc_work@mail.ru>
References: <1366303846-20384-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/nand/gpio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 3f2cdae..49beecd 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -135,10 +135,7 @@ static int gpio_nand_devready(struct mtd_info *mtd)
 {
 	struct gpiomtd *gpiomtd = gpio_nand_getpriv(mtd);
 
-	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
-		return gpio_get_value(gpiomtd->plat.gpio_rdy);
-
-	return 1;
+	return gpio_get_value(gpiomtd->plat.gpio_rdy);
 }
 
 #ifdef CONFIG_OF
@@ -297,6 +294,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 		gpio_direction_input(gpiomtd->plat.gpio_rdy);
+		chip->dev_ready = gpio_nand_devready;
 	}
 
 
@@ -305,7 +303,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip->options		= gpiomtd->plat.options;
 	chip->chip_delay	= gpiomtd->plat.chip_delay;
 	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
-	chip->dev_ready		= gpio_nand_devready;
 
 	if (chip->options & NAND_BUSWIDTH_16) {
 		chip->read_buf	= gpio_nand_readbuf16;
-- 
1.8.1.5
