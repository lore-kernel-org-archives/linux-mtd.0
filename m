Received: from mail-ie0-x230.google.com ([2607:f8b0:4001:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV28x-0001Yk-47
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 18:11:07 +0000
Received: by iery20 with SMTP id y20so12413449ier.0
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 11:10:46 -0700 (PDT)
Date: Mon, 9 Mar 2015 11:10:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: maps: sa1100-flash: remove incorrect __exit markups
Message-ID: <20150309181041.GA25179@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Even if bus is not hot-pluggable, the devices can be unbound from the
driver via sysfs, so we should not be using __exit annotations on
remove() methods. The only exception is drivers registered with
platform_driver_probe() which specifically disables sysfs bind/unbind
attributes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mtd/maps/sa1100-flash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/sa1100-flash.c b/drivers/mtd/maps/sa1100-flash.c
index ea69720..892ad6a 100644
--- a/drivers/mtd/maps/sa1100-flash.c
+++ b/drivers/mtd/maps/sa1100-flash.c
@@ -274,7 +274,7 @@ static int sa1100_mtd_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int __exit sa1100_mtd_remove(struct platform_device *pdev)
+static int sa1100_mtd_remove(struct platform_device *pdev)
 {
 	struct sa_info *info = platform_get_drvdata(pdev);
 	struct flash_platform_data *plat = dev_get_platdata(&pdev->dev);
@@ -286,7 +286,7 @@ static int __exit sa1100_mtd_remove(struct platform_device *pdev)
 
 static struct platform_driver sa1100_mtd_driver = {
 	.probe		= sa1100_mtd_probe,
-	.remove		= __exit_p(sa1100_mtd_remove),
+	.remove		= sa1100_mtd_remove,
 	.driver		= {
 		.name	= "sa1100-mtd",
 	},
-- 
2.2.0.rc0.207.ga3a616c


-- 
Dmitry
