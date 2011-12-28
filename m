Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfrXE-0002BP-PW
 for linux-mtd@lists.infradead.org; Wed, 28 Dec 2011 11:19:05 +0000
Received: by lahc1 with SMTP id c1so10176250lah.36
 for <linux-mtd@lists.infradead.org>; Wed, 28 Dec 2011 03:19:00 -0800 (PST)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: gpio-nand: fix build breakage for !CONFIG_OF
Date: Wed, 28 Dec 2011 11:18:57 +0000
Message-Id: <1325071137-4063-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Whilst adding support for device tree probing I dropped a semicolon
resulting in:

drivers/mtd/nand/gpio.c: In function 'gpio_nand_get_io_sync_of':
drivers/mtd/nand/gpio.c:237:1: error: expected ';' before '}' token

Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---

This appeared to get lost in my mail system, so resending to be sure!

 drivers/mtd/nand/gpio.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index d4b5609..27000a5 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -233,7 +233,7 @@ static inline int gpio_nand_get_config_of(const struct device *dev,
 static inline struct resource *
 gpio_nand_get_io_sync_of(struct platform_device *pdev)
 {
-	return NULL
+	return NULL;
 }
 #endif /* CONFIG_OF */
 
-- 
1.7.5.4
