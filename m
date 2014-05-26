Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wp3AF-0000zY-Dk
 for linux-mtd@lists.infradead.org; Mon, 26 May 2014 22:14:39 +0000
Received: from eiche.ahsoftware (p57B20CCF.dip0.t-ipconnect.de [87.178.12.207])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id AA95E423C304
 for <linux-mtd@lists.infradead.org>; Tue, 27 May 2014 00:14:18 +0200 (CEST)
From: Alexander Holler <holler@ahsoftware.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/27] mtd: nand: gpio: show device structure in sysfs
Date: Tue, 27 May 2014 00:12:30 +0200
Message-Id: <1401142372-14148-6-git-send-email-holler@ahsoftware.de>
In-Reply-To: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Alexander Holler <holler@ahsoftware.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a common error in nand-drivers which do not set up a parent device for
the mtd-device by using a new inline function.

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 drivers/mtd/nand/gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 117ce33..bbe55ab 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -272,9 +272,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip->chip_delay	= gpiomtd->plat.chip_delay;
 	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
 
-	gpiomtd->mtd_info.priv	= chip;
-	gpiomtd->mtd_info.owner	= THIS_MODULE;
-
+	mtd_setup_common_members(&gpiomtd->mtd_info, chip, pdev);
 	platform_set_drvdata(pdev, gpiomtd);
 
 	if (gpio_is_valid(gpiomtd->plat.gpio_nwp))
-- 
1.8.3.2
