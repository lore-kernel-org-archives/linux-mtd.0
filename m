Received: from mail-yw0-f204.google.com ([209.85.211.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N8JuI-0003Co-0d
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 20:35:14 +0000
Received: by ywh42 with SMTP id 42so1434239ywh.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Nov 2009 12:35:08 -0800 (PST)
Message-ID: <4AFB22CA.2050106@gmail.com>
Date: Wed, 11 Nov 2009 21:47:06 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: error return -EIO instead of EIO
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Return a negative error value instead of a positive

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
 drivers/mtd/maps/physmap.c    |    2 +-
 drivers/mtd/maps/vmu-flash.c  |    2 +-
 drivers/mtd/nand/atmel_nand.c |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 380648e..a5a72b2 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -130,7 +130,7 @@ static int physmap_flash_probe(struct platform_device *dev)
 						 info->map[i].size);
 		if (info->map[i].virt == NULL) {
 			dev_err(&dev->dev, "Failed to ioremap flash region\n");
-			err = EIO;
+			err = -EIO;
 			goto err_out;
 		}
 
diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 1f73297..b02db6f 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -621,7 +621,7 @@ static int __devinit vmu_connect(struct maple_device *mdev)
 
 	card = kmalloc(sizeof(struct memcard), GFP_KERNEL);
 	if (!card) {
-		error = ENOMEM;
+		error = -ENOMEM;
 		goto fail_nomem;
 	}
 
diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index f8e9975..e4aeeed 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -464,7 +464,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 	if (host->board->det_pin) {
 		if (gpio_get_value(host->board->det_pin)) {
 			printk(KERN_INFO "No SmartMedia card inserted.\n");
-			res = ENXIO;
+			res = -ENXIO;
 			goto err_no_card;
 		}
 	}
@@ -535,7 +535,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
 
 	if ((!partitions) || (num_partitions == 0)) {
 		printk(KERN_ERR "atmel_nand: No partitions defined, or unsupported device.\n");
-		res = ENXIO;
+		res = -ENXIO;
 		goto err_no_partitions;
 	}
 
