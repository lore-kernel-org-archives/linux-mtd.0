Received: from smtp18.mail.ru ([94.100.176.155])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVnq5-0002p4-EP
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 18:57:47 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/7] mtd: nand-gpio: Use default dev_ready function if RDY
 is missing in configuration
Date: Fri, 26 Apr 2013 22:57:23 +0400
Message-Id: <1367002648-8269-2-git-send-email-shc_work@mail.ru>
In-Reply-To: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
References: <1367002648-8269-1-git-send-email-shc_work@mail.ru>
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
index c35f46e..8f102d1 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -136,10 +136,7 @@ static int gpio_nand_devready(struct mtd_info *mtd)
 {
 	struct gpiomtd *gpiomtd = gpio_nand_getpriv(mtd);
 
-	if (gpio_is_valid(gpiomtd->plat.gpio_rdy))
-		return gpio_get_value(gpiomtd->plat.gpio_rdy);
-
-	return 1;
+	return gpio_get_value(gpiomtd->plat.gpio_rdy);
 }
 
 #ifdef CONFIG_OF
@@ -307,6 +304,7 @@ static int gpio_nand_probe(struct platform_device *dev)
 		if (ret)
 			return ret;
 		gpio_direction_input(gpiomtd->plat.gpio_rdy);
+		this->dev_ready = gpio_nand_devready;
 	}
 
 	this->IO_ADDR_W  = this->IO_ADDR_R;
@@ -316,7 +314,6 @@ static int gpio_nand_probe(struct platform_device *dev)
 
 	/* install our routines */
 	this->cmd_ctrl   = gpio_nand_cmd_ctrl;
-	this->dev_ready  = gpio_nand_devready;
 
 	if (this->options & NAND_BUSWIDTH_16) {
 		this->read_buf   = gpio_nand_readbuf16;
-- 
1.8.1.5
