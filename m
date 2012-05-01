From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <linux@arm.linux.org.uk>, <khilman@ti.com>,
 <balbi@ti.com>, <dwmw2@infradead.org>, <kyungmin.park@samsung.com>,
 <gregkh@linuxfoundation.org>, <nm@ti.com>, <grinberg@compulab.co.il>,
 <notasas@gmail.com>, <artem.bityutskiy@linux.intel.com>,
 <vimal.newwork@gmail.com>, <dbaryshkov@gmail.com>,
 <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 31/39] ARM: OMAP2+: board omap3pandora: gpmc driver
 adaptation
Date: Tue, 1 May 2012 17:53:06 +0530
Message-ID: <84e89d05d2218d8c788a4bc92a81f7a45d66a8ab.1335874494.git.afzal@ti.com>
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
 arch/arm/mach-omap2/board-omap3pandora.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/board-omap3pandora.c b/arch/arm/mach-omap2/board-omap3pandora.c
index 33d995d..25b2de6 100644
--- a/arch/arm/mach-omap2/board-omap3pandora.c
+++ b/arch/arm/mach-omap2/board-omap3pandora.c
@@ -57,6 +57,12 @@
 #define PANDORA_WIFI_NRESET_GPIO	23
 #define OMAP3_PANDORA_TS_GPIO		94
 
+static struct gpmc_device_pdata *gpmc_device_data[1];
+
+static struct gpmc_pdata gpmc_data = {
+	.device_pdata = gpmc_device_data,
+};
+
 static struct mtd_partition omap3pandora_nand_partitions[] = {
 	{
 		.name           = "xloader",
@@ -607,8 +613,9 @@ static void __init omap3pandora_init(void)
 	omap_ads7846_init(1, OMAP3_PANDORA_TS_GPIO, 0, NULL);
 	usbhs_init(&usbhs_bdata);
 	usb_musb_init(NULL);
-	gpmc_nand_init(&pandora_nand_data);
-
+	*gpmc_device_data = gpmc_nand_init(&pandora_nand_data);
+	gpmc_data.num_device++;
+	omap_init_gpmc(&gpmc_data);
 	/* Ensure SDRC pins are mux'd for self-refresh */
 	omap_mux_init_signal("sdrc_cke0", OMAP_PIN_OUTPUT);
 	omap_mux_init_signal("sdrc_cke1", OMAP_PIN_OUTPUT);
-- 
1.7.10
