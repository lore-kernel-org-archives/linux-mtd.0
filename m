Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sem4k-0001R6-Hm
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 11:49:27 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <artem.bityutskiy@linux.intel.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 09/10] ARM: OMAP2+: gpmc-nand: Modify Interrupt handling
Date: Wed, 13 Jun 2012 17:03:52 +0530
Message-ID: <560cc74916d5ad4959d4c123809a08cf54d6265f.1339586624.git.afzal@ti.com>
In-Reply-To: <cover.1339586624.git.afzal@ti.com>
References: <cover.1339586624.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ivan.djelic@parrot.com, Afzal Mohammed <afzal@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now GPMC provides its client with interrupts that can be handled
using the standard interrupt API. Modify GPMC NAND setup to work
with it.

Also disable write protect in GPMC code, so that NAND driver can
be ignorant of GPMC configuration.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/gpmc-nand.c |   26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
index c0320d2..045596a 100644
--- a/arch/arm/mach-omap2/gpmc-nand.c
+++ b/arch/arm/mach-omap2/gpmc-nand.c
@@ -21,15 +21,23 @@
 #include <plat/board.h>
 #include <plat/gpmc.h>
 
-static struct resource gpmc_nand_resource = {
-	.flags		= IORESOURCE_MEM,
+static struct resource gpmc_nand_resource[] = {
+	{
+		.flags		= IORESOURCE_MEM,
+	},
+	{
+		.flags		= IORESOURCE_IRQ,
+	},
+	{
+		.flags		= IORESOURCE_IRQ,
+	},
 };
 
 static struct platform_device gpmc_nand_device = {
 	.name		= "omap2-nand",
 	.id		= 0,
-	.num_resources	= 1,
-	.resource	= &gpmc_nand_resource,
+	.num_resources	= ARRAY_SIZE(gpmc_nand_resource),
+	.resource	= gpmc_nand_resource,
 };
 
 static int omap2_nand_gpmc_retime(struct omap_nand_platform_data *gpmc_nand_data)
@@ -75,6 +83,7 @@ static int omap2_nand_gpmc_retime(struct omap_nand_platform_data *gpmc_nand_data
 		gpmc_cs_configure(gpmc_nand_data->cs, GPMC_CONFIG_DEV_SIZE, 0);
 	gpmc_cs_configure(gpmc_nand_data->cs,
 			GPMC_CONFIG_DEV_TYPE, GPMC_DEVICETYPE_NAND);
+	gpmc_cs_configure(gpmc_nand_data->cs, GPMC_CONFIG_WP, 0);
 	err = gpmc_cs_set_timings(gpmc_nand_data->cs, &t);
 	if (err)
 		return err;
@@ -90,14 +99,19 @@ int __init gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data)
 	gpmc_nand_device.dev.platform_data = gpmc_nand_data;
 
 	err = gpmc_cs_request(gpmc_nand_data->cs, NAND_IO_SIZE,
-				(unsigned long *)&gpmc_nand_resource.start);
+				(unsigned long *)&gpmc_nand_resource[0].start);
 	if (err < 0) {
 		dev_err(dev, "Cannot request GPMC CS\n");
 		return err;
 	}
 
-	gpmc_nand_resource.end = gpmc_nand_resource.start + NAND_IO_SIZE - 1;
+	gpmc_nand_resource[0].end = gpmc_nand_resource[0].start +
+							NAND_IO_SIZE - 1;
 
+	gpmc_nand_resource[1].start =
+				gpmc_get_client_irq(GPMC_IRQ_FIFOEVENTENABLE);
+	gpmc_nand_resource[2].start =
+				gpmc_get_client_irq(GPMC_IRQ_COUNT_EVENT);
 	 /* Set timings in GPMC */
 	err = omap2_nand_gpmc_retime(gpmc_nand_data);
 	if (err < 0) {
-- 
1.7.10.2
