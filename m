Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vsr3M-0006T7-TA
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2013 09:35:01 +0000
Received: by mail-pd0-f170.google.com with SMTP id g10so6601962pdj.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2013 01:34:39 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand-gpio: don't waste memory for OF failure
Date: Tue, 17 Dec 2013 01:33:50 -0800
Message-Id: <1387272830-27514-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We shouldn't try to allocate a resource until we're sure the
of_property_read_u64() call didn't fail. This is especially important if
we use this code for both CONFIG_OF and !CONFIG_OF builds, since
of_property_read_u64() will always return -ENOSYS for !CONFIG_OF.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Compile tested only

 drivers/mtd/nand/gpio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index e826f898241f..11df33c1652b 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -132,13 +132,17 @@ static int gpio_nand_get_config_of(const struct device *dev,
 
 static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
 {
-	struct resource *r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
+	struct resource *r;
 	u64 addr;
 
-	if (!r || of_property_read_u64(pdev->dev.of_node,
+	if (of_property_read_u64(pdev->dev.of_node,
 				       "gpio-control-nand,io-sync-reg", &addr))
 		return NULL;
 
+	r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
+	if (!r)
+		return NULL;
+
 	r->start = addr;
 	r->end = r->start + 0x3;
 	r->flags = IORESOURCE_MEM;
-- 
1.8.3.2
