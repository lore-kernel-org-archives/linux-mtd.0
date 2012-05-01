From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <linux@arm.linux.org.uk>, <khilman@ti.com>,
 <balbi@ti.com>, <dwmw2@infradead.org>, <kyungmin.park@samsung.com>,
 <gregkh@linuxfoundation.org>, <nm@ti.com>, <grinberg@compulab.co.il>,
 <notasas@gmail.com>, <artem.bityutskiy@linux.intel.com>,
 <vimal.newwork@gmail.com>, <dbaryshkov@gmail.com>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 35/39] ARM: OMAP2+: board rm680: gpmc driver adaptation
Date: Tue, 1 May 2012 17:40:15 +0530
Message-ID: <45fd684a3913087c6b5007e9bfad61b4259b12a3.1335873032.git.afzal@ti.com>
In-Reply-To: <cover.1335873032.git.afzal@ti.com>
References: <cover.1335873032.git.afzal@ti.com>
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
 arch/arm/mach-omap2/board-rm680.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-rm680.c b/arch/arm/mach-omap2/board-rm680.c
index ae53d71..e28e606 100644
--- a/arch/arm/mach-omap2/board-rm680.c
+++ b/arch/arm/mach-omap2/board-rm680.c
@@ -33,6 +33,12 @@
 #include "sdram-nokia.h"
 #include "common-board-devices.h"
 
+static struct gpmc_device_pdata *gpmc_device_data[1];
+
+static struct gpmc_pdata gpmc_data = {
+	.device_pdata = gpmc_device_data,
+};
+
 static struct regulator_consumer_supply rm680_vemmc_consumers[] = {
 	REGULATOR_SUPPLY("vmmc", "omap_hsmmc.1"),
 };
@@ -119,7 +125,8 @@ static void __init rm680_peripherals_init(void)
 	platform_add_devices(rm680_peripherals_devices,
 				ARRAY_SIZE(rm680_peripherals_devices));
 	rm680_i2c_init();
-	gpmc_onenand_init(board_onenand_data);
+	*gpmc_device_data = gpmc_onenand_init(board_onenand_data);
+	gpmc_data.num_device++;
 	omap_hsmmc_init(mmc);
 }
 
@@ -141,6 +148,7 @@ static void __init rm680_init(void)
 
 	usb_musb_init(NULL);
 	rm680_peripherals_init();
+	omap_init_gpmc(&gpmc_data);
 }
 
 MACHINE_START(NOKIA_RM680, "Nokia RM-680 board")
-- 
1.7.10
