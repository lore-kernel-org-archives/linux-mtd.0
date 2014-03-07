Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLuQd-0008Ag-JV
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 13:03:09 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v6 4/4] mtd: devices: elm: update DRIVER_NAME as "omap-elm"
Date: Fri, 7 Mar 2014 18:32:24 +0530
Message-ID: <1394197344-9468-5-git-send-email-pekon@ti.com>
In-Reply-To: <1394197344-9468-1-git-send-email-pekon@ti.com>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: avinashphilipk@gmail.com, Felipe Balbi <balbi@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Roese <sr@denx.de>
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
