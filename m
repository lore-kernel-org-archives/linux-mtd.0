Received: from mail2.gnudd.com ([213.203.150.91] helo=mail.gnudd.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUIyZ-000422-5R
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 11:30:16 +0000
Date: Fri, 24 Jul 2009 13:30:04 +0200
From: Alessandro Rubini <rubini-list@gnudd.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V5 2/2] OneNand support for Nomadik 8815 SoC (on NHK8815 board)
Message-ID: <1b28a6018f74eb9f5d14beaa1aac9c0fd4cb101d.1248434636.git.rubini@
	unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Sender: rubini-list@gnudd.com
References: <cover.1248434635.git.rubini@unipv.it>
In-Reply-To: <cover.1248434635.git.rubini@unipv.it>
Cc: STEricsson_nomadik_linux@list.st.com, linux@arm.linux.org.uk,
	andrea.gallo@stericsson.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alessandro Rubini <rubini@unipv.it>


Signed-off-by: Alessandro Rubini <rubini@unipv.it>
Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
---
 arch/arm/mach-nomadik/board-nhk8815.c |   63 +++++++++++++++++++++++++++++++++
 1 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-nomadik/board-nhk8815.c b/arch/arm/mach-nomadik/board-nhk8815.c
index 3fde972..0ad6bba 100644
--- a/arch/arm/mach-nomadik/board-nhk8815.c
+++ b/arch/arm/mach-nomadik/board-nhk8815.c
@@ -24,6 +24,7 @@
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
+#include <asm/mach/flash.h>
 #include <mach/setup.h>
 #include <mach/nand.h>
 #include <mach/fsmc.h>
@@ -112,6 +113,66 @@ static struct platform_device nhk8815_nand_device = {
 	.num_resources	= ARRAY_SIZE(nhk8815_nand_resources),
 };
 
+/* These are the partitions for the OneNand device, different from above */
+static struct mtd_partition nhk8815_onenand_partitions[] = {
+	{
+		.name	= "X-Loader(OneNAND)",
+		.offset = 0,
+		.size	= SZ_256K,
+	}, {
+		.name	= "MemInit(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_256K,
+	}, {
+		.name	= "BootLoader(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= SZ_2M-SZ_256K,
+	}, {
+		.name	= "SysImage(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 4 * SZ_1M,
+	}, {
+		.name	= "Root Filesystem(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= 22 * SZ_1M,
+	}, {
+		.name	= "User Filesystem(OneNAND)",
+		.offset	= MTDPART_OFS_APPEND,
+		.size	= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct flash_platform_data nhk8815_onenand_data = {
+	.parts		= nhk8815_onenand_partitions,
+	.nr_parts	= ARRAY_SIZE(nhk8815_onenand_partitions),
+};
+
+static struct resource nhk8815_onenand_resource[] = {
+	{
+		.start		= 0x30000000,
+		.end		= 0x30000000 + SZ_128K - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+};
+
+static struct platform_device nhk8815_onenand_device = {
+	.name		= "onenand",
+	.id		= -1,
+	.dev		= {
+		.platform_data	= &nhk8815_onenand_data,
+	},
+	.resource	= nhk8815_onenand_resource,
+	.num_resources	= ARRAY_SIZE(nhk8815_onenand_resource),
+};
+
+static void __init nhk8815_onenand_init(void)
+{
+#ifdef CONFIG_ONENAND
+       /* Set up SMCS0 for OneNand */
+       writel(0x000030db, FSMC_BCR0);
+       writel(0x02100551, FSMC_BTR0);
+#endif
+}
 
 #define __MEM_4K_RESOURCE(x) \
 	.res = {.start = (x), .end = (x) + SZ_4K - 1, .flags = IORESOURCE_MEM}
@@ -173,6 +234,7 @@ device_initcall(nhk8815_eth_init);
 
 static struct platform_device *nhk8815_platform_devices[] __initdata = {
 	&nhk8815_nand_device,
+	&nhk8815_onenand_device,
 	&nhk8815_eth_device,
 	/* will add more devices */
 };
@@ -182,6 +244,7 @@ static void __init nhk8815_platform_init(void)
 	int i;
 
 	cpu8815_platform_init();
+	nhk8815_onenand_init();
 	platform_add_devices(nhk8815_platform_devices,
 			     ARRAY_SIZE(nhk8815_platform_devices));
 
-- 
1.5.6.5
