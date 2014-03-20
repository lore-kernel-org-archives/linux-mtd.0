Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQcsm-0000Xo-Vn
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 13:19:42 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v8 4/4] mtd: devices: elm: update DRIVER_NAME as "omap-elm"
Date: Thu, 20 Mar 2014 18:48:37 +0530
Message-ID: <1395321517-4490-5-git-send-email-pekon@ti.com>
In-Reply-To: <1395321517-4490-1-git-send-email-pekon@ti.com>
References: <1395321517-4490-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use "omap-elm" as DRIVER_NAME

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/devices/elm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index 26df41f..1fd4a0f 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -15,6 +15,8 @@
  *
  */
 
+#define DRIVER_NAME	"omap-elm"
+
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -520,7 +522,7 @@ MODULE_DEVICE_TABLE(of, elm_of_match);
 
 static struct platform_driver elm_driver = {
 	.driver	= {
-		.name	= "elm",
+		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
 		.of_match_table = of_match_ptr(elm_of_match),
 		.pm	= &elm_pm_ops,
-- 
1.8.5.1.163.gd7aced9
