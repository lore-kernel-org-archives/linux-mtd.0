Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STs0K-0007Wz-Og
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 09:55:52 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <dwmw2@infradead.org>,
 <artem.bityutskiy@linux.intel.com>, <dedekind1@gmail.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] ARM: OMAP2+: gpmc-onenand: provide memory as resource
Date: Mon, 14 May 2012 15:09:16 +0530
Message-ID: <43e5ef744d15c89d12324320daa583f819313e2b.1336985941.git.afzal@ti.com>
In-Reply-To: <cover.1336985941.git.afzal@ti.com>
References: <cover.1336985941.git.afzal@ti.com>
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

Currently omap onenand driver invokes gpmc_cs_request, obtains address
space allocated by gpmc to onenand. Remove this, instead use resource
structure; this is now updated with address space for onenand by gpmc
initialization with the help of gpmc_cs_request. And remove usage of
gpmc_cs_request in onenand driver.

This helps in smooth migration of gpmc to driver.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/gpmc-onenand.c |   23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/gpmc-onenand.c b/arch/arm/mach-omap2/gpmc-onenand.c
index a0fa9bb..71d7c07 100644
--- a/arch/arm/mach-omap2/gpmc-onenand.c
+++ b/arch/arm/mach-omap2/gpmc-onenand.c
@@ -23,11 +23,19 @@
 #include <plat/board.h>
 #include <plat/gpmc.h>
 
+#define	ONENAND_IO_SIZE	SZ_128K
+
 static struct omap_onenand_platform_data *gpmc_onenand_data;
 
+static struct resource gpmc_onenand_resource = {
+	.flags		= IORESOURCE_MEM,
+};
+
 static struct platform_device gpmc_onenand_device = {
 	.name		= "omap2-onenand",
 	.id		= -1,
+	.num_resources	= 1,
+	.resource	= &gpmc_onenand_resource,
 };
 
 static int omap2_onenand_set_async_mode(int cs, void __iomem *onenand_base)
@@ -390,6 +398,8 @@ static int gpmc_onenand_setup(void __iomem *onenand_base, int *freq_ptr)
 
 void __init gpmc_onenand_init(struct omap_onenand_platform_data *_onenand_data)
 {
+	int err;
+
 	gpmc_onenand_data = _onenand_data;
 	gpmc_onenand_data->onenand_setup = gpmc_onenand_setup;
 	gpmc_onenand_device.dev.platform_data = gpmc_onenand_data;
@@ -401,8 +411,19 @@ void __init gpmc_onenand_init(struct omap_onenand_platform_data *_onenand_data)
 		gpmc_onenand_data->flags |= ONENAND_SYNC_READ;
 	}
 
+	err = gpmc_cs_request(gpmc_onenand_data->cs, ONENAND_IO_SIZE,
+				(unsigned long *)&gpmc_onenand_resource.start);
+	if (err < 0) {
+		pr_err("%s: Cannot request GPMC CS\n", __func__);
+		return;
+	}
+
+	gpmc_onenand_resource.end = gpmc_onenand_resource.start +
+							ONENAND_IO_SIZE - 1;
+
 	if (platform_device_register(&gpmc_onenand_device) < 0) {
-		printk(KERN_ERR "Unable to register OneNAND device\n");
+		pr_err("%s: Unable to register OneNAND device\n", __func__);
+		gpmc_cs_free(gpmc_onenand_data->cs);
 		return;
 	}
 }
-- 
1.7.10
