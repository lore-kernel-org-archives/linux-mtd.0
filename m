From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <linux@arm.linux.org.uk>, <khilman@ti.com>,
 <balbi@ti.com>, <dwmw2@infradead.org>, <kyungmin.park@samsung.com>,
 <gregkh@linuxfoundation.org>, <nm@ti.com>, <grinberg@compulab.co.il>,
 <notasas@gmail.com>, <artem.bityutskiy@linux.intel.com>,
 <vimal.newwork@gmail.com>, <dbaryshkov@gmail.com>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 32/39] ARM: OMAP2+: board omap3stalker: gpmc driver
 adaptation
Date: Tue, 1 May 2012 17:53:12 +0530
Message-ID: <35ff5cf81c4a3049d8de3112b1a403c04e62916f.1335874494.git.afzal@ti.com>
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
code to provide gpmc driver with required information.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/board-omap3stalker.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-omap3stalker.c b/arch/arm/mach-omap2/board-omap3stalker.c
index 4dffc95..5e92d54 100644
--- a/arch/arm/mach-omap2/board-omap3stalker.c
+++ b/arch/arm/mach-omap2/board-omap3stalker.c
@@ -56,6 +56,12 @@
 #include "hsmmc.h"
 #include "common-board-devices.h"
 
+static struct gpmc_device_pdata *gpmc_device_data[1];
+
+static struct gpmc_pdata gpmc_data = {
+	.device_pdata = gpmc_device_data,
+};
+
 #if defined(CONFIG_SMSC911X) || defined(CONFIG_SMSC911X_MODULE)
 #include <plat/gpmc-smsc911x.h>
 
@@ -74,7 +80,11 @@ static struct omap_smsc911x_platform_data smsc911x_cfg = {
 static inline void __init omap3stalker_init_eth(void)
 {
 	omap_mux_init_gpio(19, OMAP_PIN_INPUT_PULLUP);
-	gpmc_smsc911x_init(&smsc911x_cfg);
+	*gpmc_device_data = gpmc_smsc911x_init(&smsc911x_cfg);
+	if (*gpmc_device_data)
+		gpmc_data.num_device++;
+	else
+		pr_err("error: unable to initilaize gpmc smsc911x\n");
 }
 
 #else
@@ -443,6 +453,7 @@ static void __init omap3_stalker_init(void)
 	omap_mux_init_gpio(18, OMAP_PIN_INPUT_PULLUP);
 
 	omap3stalker_init_eth();
+	omap_init_gpmc(&gpmc_data);
 	omap3_stalker_display_init();
 /* Ensure SDRC pins are mux'd for self-refresh */
 	omap_mux_init_signal("sdr_cke0", OMAP_PIN_OUTPUT);
-- 
1.7.10
