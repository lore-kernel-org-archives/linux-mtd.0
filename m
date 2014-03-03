Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKQut-00043j-RR
 for linux-mtd@lists.infradead.org; Mon, 03 Mar 2014 11:20:16 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 4/4] mtd: devices: elm: update DRIVER_NAME as "omap-elm"
Date: Mon, 3 Mar 2014 16:49:23 +0530
Message-ID: <1393845563-7800-5-git-send-email-pekon@ti.com>
In-Reply-To: <1393845563-7800-1-git-send-email-pekon@ti.com>
References: <1393845563-7800-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use "omap-elm" as DRIVER_NAME
prefix DRIVER_NAME in debug and error messages

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/devices/elm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 43fd81d..16e62ae 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -15,6 +15,9 @@
  *
  */
 
+#define	DRIVER_NAME	"omap-elm"
+#define pr_fmt(fmt)	DRIVER_NAME ": " fmt
+
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -522,7 +525,7 @@ MODULE_DEVICE_TABLE(of, elm_of_match);
 
 static struct platform_driver elm_driver = {
 	.driver	= {
-		.name	= "elm",
+		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(elm_of_match),
 		.pm	= &elm_pm_ops,
-- 
1.8.5.1.163.gd7aced9
