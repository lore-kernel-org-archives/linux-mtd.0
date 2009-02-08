Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LW7H1-0002FL-F7
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 10:52:30 +0000
Date: Sun, 8 Feb 2009 10:52:26 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] [MTD] NAND: add ts7xxx driver
Message-ID: <20090208105226.GF11872@woodchuck>
References: <20090208085919.GD11872@woodchuck>
	<20090208102147.GL13433@xi.wantstofly.org>
	<20090208103904.GE11872@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090208103904.GE11872@woodchuck>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Alexander Clouter <alex@digriz.org.uk> [2009-02-08 10:39:04+0000]:
> 
> * Lennert Buytenhek <buytenh@wantstofly.org> [2009-02-08 11:21:47+0100]:
> > 
> > On Sun, Feb 08, 2009 at 08:59:19AM +0000, Alexander Clouter wrote:
> > >
> > > This patch adds support for the NAND found in Technologic Systems ARM
> > > boards[1].  The platform specific parts (IO address and parititoning
> > > schemes) have been moved into platform specific files whilst the driver
> > > it's self can be used as a complete replacement for the ts7250 NAND
> > > driver.
> > 
> > Why don't you morph the ts7250 into the form you want instead of adding
> > a parallel driver for the same thing?
> >
> 
> [snipped rant]
> 
> The driver I threw together makes a rather radical change to put all the 
> partitioning and iomem resources ranges back into the platform specific 
> code where they belong.  It was just easier to start clean, plus I 
> learnt a good deal about the MTD subsystem in the process, although 
> that's not a good reason for submission I know.
> 
Attached is the kind of change that affects the platform code.  
Meanwhile if I was to morph the ts7250 driver my first step would be to 
trim a huge chunk of the platform specific code that's in the NAND 
driver and then at the same time get the ARM platform driver amended 
otherwise you end up with a NAND less board.

It's been hard enough to submit my TS-7800 patches and break them up so 
the different subsystems gracefully get added.  To modify the existing 
ts7250 driver I would have to take on the tinkering and submission 
cycles with the TS-72[056]0 (when I don't own one) too.  As I so far 
have gotten zero feedback[1] from the community this seems to me the 
*only* way I can work on my patches with a view for upstream submission.

This way, with a separate driver, when things finally/if-ever get 
accepted nothing breaks.  I think the changes also being made are easier 
for someone

If you know of a way that the MTD folk are willing to tinker with the 
ARM subsystem code and vice versa (last time I was told by the ARM 
people to break up my MTD stuff and submit it to you guys separately) 
then I'm listening.

I'm stuck in a rut and it really is wearing me down...I'm not even a 
embedded developer, just a network packet pushing perl monkey who just 
wants to get his router working :-/

Cheers

[1] and I still do not understand why in the ts7000 mailing list there 
	is all this work on a seperate patch set for ts72[560]0 support 
	when they apparently do not have a NAND driver even?  Any ideas?

>From 94349d4dfd0f868d7475d5ec0e85dc9ec1f057a2 Mon Sep 17 00:00:00 2001
From: Alexander Clouter <alex@digriz.org.uk>
Date: Sat, 7 Feb 2009 12:38:43 +0000
Subject: [PATCH] [ARM] ep93xx: add hooks to ts7xxx NAND driver

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 arch/arm/mach-ep93xx/include/mach/ts72xx.h |    8 ++
 arch/arm/mach-ep93xx/ts72xx.c              |  129 +++++++++++++++++++++++++++-
 2 files changed, 136 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-ep93xx/include/mach/ts72xx.h b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
index 34ddec0..2244389 100644
--- a/arch/arm/mach-ep93xx/include/mach/ts72xx.h
+++ b/arch/arm/mach-ep93xx/include/mach/ts72xx.h
@@ -44,6 +44,7 @@
 #define TS72XX_NOR_PHYS_BASE		0x60000000
 #define TS72XX_NOR2_PHYS_BASE		0x62000000
 
+/* MTD_NAND_TS7250 defines */
 #define TS72XX_NAND1_DATA_PHYS_BASE	0x60000000
 #define TS72XX_NAND2_DATA_PHYS_BASE	0x70000000
 #define TS72XX_NAND_DATA_VIRT_BASE	0xfebfc000
@@ -59,6 +60,13 @@
 #define TS72XX_NAND_BUSY_VIRT_BASE	0xfebfa000
 #define TS72XX_NAND_BUSY_SIZE		0x00001000
 
+/* MTD_NAND_TS7XXX defines */
+#define TS72XX_NAND_DATA_PHYS_BASE	0x60000000
+#define TS72XX_NAND_CONTROL_PHYS_BASE	0x60400000
+#define TS72XX_NAND_BUSY_PHYS_BASE	0x60800000
+#define TS72XX_NAND_IO_SIZE		4
+#define TS72XX_NAND1_NAND2_DIFF		0x10000000
+
 
 #define TS72XX_RTC_INDEX_VIRT_BASE	0xfebf9000
 #define TS72XX_RTC_INDEX_PHYS_BASE	0x10800000
diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index 7ee024d..4c3ba22 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -19,6 +19,9 @@
 #include <linux/mtd/physmap.h>
 #include <linux/platform_device.h>
 #include <linux/m48t86.h>
+#include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/nand-ts7xxx.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
 #include <mach/hardware.h>
@@ -55,6 +58,7 @@ static struct map_desc ts72xx_io_desc[] __initdata = {
 	}
 };
 
+#ifdef CONFIG_MTD_NAND_TS7250
 static struct map_desc ts72xx_nand_io_desc[] __initdata = {
 	{
 		.virtual	= TS72XX_NAND_DATA_VIRT_BASE,
@@ -92,6 +96,7 @@ static struct map_desc ts72xx_alternate_nand_io_desc[] __initdata = {
 		.type		= MT_DEVICE,
 	}
 };
+#endif
 
 static void __init ts72xx_map_io(void)
 {
@@ -101,6 +106,7 @@ static void __init ts72xx_map_io(void)
 	/*
 	 * The TS-7200 has NOR flash, the other models have NAND flash.
 	 */
+#ifdef CONFIG_MTD_NAND_TS7250
 	if (!board_is_ts7200()) {
 		if (is_ts9420_installed()) {
 			iotable_init(ts72xx_alternate_nand_io_desc,
@@ -110,8 +116,125 @@ static void __init ts72xx_map_io(void)
 				ARRAY_SIZE(ts72xx_nand_io_desc));
 		}
 	}
+#endif
 }
 
+#ifdef CONFIG_MTD_NAND_TS7XXX
+static struct mtd_partition ts72xx_nand_parts32[] = {
+	{
+		.name		= "TS-BOOTROM",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "Linux",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= 29 * SZ_1M,
+	}, {
+		.name		= "RedBoot",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct mtd_partition ts72xx_nand_parts128[] = {
+	{
+		.name		= "TS-BOOTROM",
+		.offset		= 0,
+		.size		= SZ_128K,
+		.mask_flags	= MTD_WRITEABLE,
+	}, {
+		.name		= "Linux",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= 125 * SZ_1M,
+	}, {
+		.name		= "RedBoot",
+		.offset		= MTDPART_OFS_APPEND,
+		.size		= MTDPART_SIZ_FULL,
+	}
+};
+
+static struct ts7xxx_nand_data ts72xx_nand_data = {
+	.partitions	= NULL,
+	.nr_partitions	= 0,
+
+	.ioports	= {
+		.ctrl	= {
+			.res	= 0,
+			.offset	= 0,
+		},
+		.data	= {
+			.res	= 1,
+			.offset	= 0,
+		},
+
+		.busy	= {
+			.res	= 2,
+			.offset	= 0,
+		},
+	},
+};
+
+static struct resource ts72xx_nand_flash_resource[] = {
+	{
+		.flags		= IORESOURCE_MEM,
+		.start		= TS72XX_NAND_DATA_PHYS_BASE,
+		.end		= TS72XX_NAND_DATA_PHYS_BASE
+					+ TS72XX_NAND_IO_SIZE - 1,
+	}, {
+		.flags		= IORESOURCE_MEM,
+		.start		= TS72XX_NAND_DATA_PHYS_BASE,
+		.end		= TS72XX_NAND_DATA_PHYS_BASE
+					+ TS72XX_NAND_IO_SIZE - 1,
+	}, {
+		.flags		= IORESOURCE_MEM,
+		.start		= TS72XX_NAND_BUSY_PHYS_BASE,
+		.end		= TS72XX_NAND_BUSY_PHYS_BASE
+					+ TS72XX_NAND_IO_SIZE - 1,
+	},
+};
+
+static struct ts7xxx_nand_data *ts72xx_nand(unsigned int size)
+{
+	unsigned int i;
+
+	/*
+	 * The TS-72[56]0's come with either 32MiB or 128MiB of NAND
+	 */
+	if (size == 32 * SZ_1M) {
+		ts72xx_nand_data.partitions = ts72xx_nand_parts32;
+		ts72xx_nand_data.nr_partitions
+					= ARRAY_SIZE(ts72xx_nand_parts32);
+	} else if (size == 128 * SZ_1M) {
+		ts72xx_nand_data.partitions = ts72xx_nand_parts128;
+		ts72xx_nand_data.nr_partitions
+					= ARRAY_SIZE(ts72xx_nand_parts128);
+	}
+
+	/* we only munch this on the init (when size is zero) */
+	if (size == 0 && is_ts9420_installed()) {
+		for (i = 0; i < ARRAY_SIZE(ts72xx_nand_flash_resource); i++) {
+			ts72xx_nand_flash_resource[i].start
+				+= TS72XX_NAND1_NAND2_DIFF;
+			ts72xx_nand_flash_resource[i].end
+				+= TS72XX_NAND1_NAND2_DIFF;
+		}
+	}
+
+	return &ts72xx_nand_data;
+};
+
+static struct platform_device ts72xx_nand_flash = {
+	.name		= "ts7xxx_nand",
+	.id		= -1,
+	.dev		= {
+		.platform_data	= &ts72xx_nand,
+	},
+	.num_resources	= ARRAY_SIZE(ts72xx_nand_flash_resource),
+	.resource	= ts72xx_nand_flash_resource,
+};
+#endif
+
 static struct physmap_flash_data ts72xx_flash_data = {
 	.width		= 1,
 };
@@ -165,8 +288,12 @@ static struct ep93xx_eth_data ts72xx_eth_data = {
 static void __init ts72xx_init_machine(void)
 {
 	ep93xx_init_devices();
-	if (board_is_ts7200())
+	if (board_is_ts7200()) {
 		platform_device_register(&ts72xx_flash);
+#ifdef CONFIG_MTD_NAND_TS7XXX
+		platform_device_register(&ts72xx_nand_flash);
+#endif
+	}
 	platform_device_register(&ts72xx_rtc_device);
 
 	ep93xx_register_eth(&ts72xx_eth_data, 1);
-- 
1.5.6.5
