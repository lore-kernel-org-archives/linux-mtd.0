Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVvM-0002Ap-Tx
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:27:29 +0000
Received: by wwi18 with SMTP id 18so5421984wwi.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:27:26 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 5/7] nand/gpio: convert to mtd_device_register()
Date: Thu, 12 May 2011 14:26:56 +0100
Message-Id: <1305206818-31752-6-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/nand/gpio.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index 0cde618..914fe56 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -25,7 +25,6 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
-#include <linux/mtd/partitions.h>
 #include <linux/mtd/nand-gpio.h>
 
 struct gpiomtd {
@@ -316,8 +315,8 @@ static int __devinit gpio_nand_probe(struct platform_device *dev)
 		gpiomtd->plat.adjust_parts(&gpiomtd->plat,
 					   gpiomtd->mtd_info.size);
 
-	add_mtd_partitions(&gpiomtd->mtd_info, gpiomtd->plat.parts,
-			   gpiomtd->plat.num_parts);
+	mtd_device_register(&gpiomtd->mtd_info, gpiomtd->plat.parts,
+			    gpiomtd->plat.num_parts);
 	platform_set_drvdata(dev, gpiomtd);
 
 	return 0;
-- 
1.7.4.4
