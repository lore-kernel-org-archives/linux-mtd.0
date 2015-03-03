Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaH-00076M-Ai
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:33 +0000
Received: by wggz12 with SMTP id z12so5616733wgg.9
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:12 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 34/60] mtd: nand: gpio: show device in sysfs
Date: Tue,  3 Mar 2015 22:40:18 +0100
Message-Id: <1425418844-25177-35-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
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

Fix a bug where devices aren't shown in sysfs.

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
2.2.2
