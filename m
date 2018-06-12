Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSZmC-0005Ur-Gx
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2018 03:15:22 +0000
Received: by mail-pl0-x241.google.com with SMTP id a7-v6so11019200plp.3
 for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2018 20:15:09 -0700 (PDT)
From: Zhouyang Jia <jiazhouyang09@gmail.com>
To: 
Cc: Zhouyang Jia <jiazhouyang09@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: gpio_flash: add error handling for ioremap_nocache
Date: Tue, 12 Jun 2018 11:15:00 +0800
Message-Id: <1528773302-37265-1-git-send-email-jiazhouyang09@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When ioremap_nocache fails, the lack of error-handling code may
cause unexpected results.

This patch adds error-handling code after calling ioremap_nocache.

Signed-off-by: Zhouyang Jia <jiazhouyang09@gmail.com>
---
 drivers/mtd/maps/gpio-addr-flash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 385305e..7fbba02 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -242,6 +242,9 @@ static int gpio_flash_probe(struct platform_device *pdev)
 	state->map.phys       = NO_XIP;
 	state->map.map_priv_1 = (unsigned long)state;
 
+	if (!state->map.virt)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, state);
 
 	i = 0;
-- 
2.7.4
