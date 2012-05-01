From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <linux@arm.linux.org.uk>, <khilman@ti.com>,
 <balbi@ti.com>, <dwmw2@infradead.org>, <kyungmin.park@samsung.com>,
 <gregkh@linuxfoundation.org>, <nm@ti.com>, <grinberg@compulab.co.il>,
 <notasas@gmail.com>, <artem.bityutskiy@linux.intel.com>,
 <vimal.newwork@gmail.com>, <dbaryshkov@gmail.com>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 19/39] ARM: OMAP2+: board omap3evm: gpmc driver adaptation
Date: Tue, 1 May 2012 17:51:49 +0530
Message-ID: <8e2ba4d68c6419c71c77d029cfc808172ea6ccd9.1335874494.git.afzal@ti.com>
In-Reply-To: <cover.1335874494.git.afzal@ti.com>
References: <cover.1335874494.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Afzal Mohammed <afzal@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gpmc code has been converted to driver. Modify the board
code to provide gpmc driver with required information

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/board-omap3evm.c |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-omap3evm.c b/arch/arm/mach-omap2/board-omap3evm.c
index fd1b481..b00765e 100644
--- a/arch/arm/mach-omap2/board-omap3evm.c
+++ b/arch/arm/mach-omap2/board-omap3evm.c
@@ -43,6 +43,7 @@
 
 #include <plat/board.h>
 #include <plat/usb.h>
+#include <plat/gpmc.h>
 #include "common.h"
 #include <plat/mcspi.h>
 #include <video/omapdss.h>
@@ -102,6 +103,12 @@ static void __init omap3_evm_get_revision(void)
 	}
 }
 
+static struct gpmc_device_pdata *gpmc_device_data[1];
+
+static struct gpmc_pdata gpmc_data = {
+	.device_pdata = gpmc_device_data,
+};
+
 #if defined(CONFIG_SMSC911X) || defined(CONFIG_SMSC911X_MODULE)
 #include <plat/gpmc-smsc911x.h>
 
@@ -122,7 +129,11 @@ static inline void __init omap3evm_init_smsc911x(void)
 			smsc911x_cfg.gpio_reset = OMAP3EVM_GEN2_ETHR_GPIO_RST;
 	}
 
-	gpmc_smsc911x_init(&smsc911x_cfg);
+	*gpmc_device_data = gpmc_smsc911x_init(&smsc911x_cfg);
+	if (*gpmc_device_data)
+		gpmc_data.num_device++;
+	else
+		pr_err("error: unable to initilaize gpmc smsc911x\n");
 }
 
 #else
@@ -679,6 +690,7 @@ static void __init omap3_evm_init(void)
 	usbhs_init(&usbhs_bdata);
 	omap_ads7846_init(1, OMAP3_EVM_TS_GPIO, 310, NULL);
 	omap3evm_init_smsc911x();
+	omap_init_gpmc(&gpmc_data);
 	omap3_evm_display_init();
 	omap3_evm_wl12xx_init();
 }
-- 
1.7.10
