Received: from mail-wg0-x244.google.com ([2a00:1450:400c:c00::244])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn5-0005E5-RQ
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:04 +0000
Received: by wggy19 with SMTP id y19so8968544wgg.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:45 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 34/60] mtd: nand: gpio: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:48 +0200
Message-Id: <1433968754-10651-35-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 73c4048..9ab97f9 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -275,7 +275,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
 
 	gpiomtd->mtd_info.priv	= chip;
-	gpiomtd->mtd_info.owner	= THIS_MODULE;
+	gpiomtd->mtd_info.dev.parent = &pdev->dev;
 
 	platform_set_drvdata(pdev, gpiomtd);
 
-- 
2.4.0
