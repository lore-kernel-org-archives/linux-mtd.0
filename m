From: vimalsingh@ti.com (Vimal Singh)
Date: Wed, 25 Nov 2009 18:23:15 +0530
Subject: [PATCH] Introducing 'gpmc-nand.c' for GPMC specific NAND init
Message-ID: <mailman.93.1260784065.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Introducing 'gpmc-nand.c' for GPMC specific NAND init.
For example: GPMC timing parameters and all.
This patch also migrates gpmc related calls from 'nand/omap2.c'
to 'gpmc-nand.c'.

Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---
 arch/arm/mach-omap2/Makefile           |    3 +
 arch/arm/mach-omap2/gpmc-nand.c        |  137 ++++++++++++++++++++++++++++++++
 arch/arm/plat-omap/include/plat/nand.h |    6 ++
 drivers/mtd/nand/omap2.c               |   26 +------
 4 files changed, 149 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm/mach-omap2/gpmc-nand.c

diff --git a/arch/arm/mach-omap2/Makefile b/arch/arm/mach-omap2/Makefile
index 59b0ccc..0dfe27a 100644
--- a/arch/arm/mach-omap2/Makefile
+++ b/arch/arm/mach-omap2/Makefile
@@ -103,5 +103,8 @@ obj-y					+= usb-ehci.o
 onenand-$(CONFIG_MTD_ONENAND_OMAP2)	:= gpmc-onenand.o
 obj-y					+= $(onenand-m) $(onenand-y)

+nand-$(CONFIG_MTD_NAND_OMAP2)		:= gpmc-nand.o
+obj-y					+= $(nand-m) $(nand-y)
+
 smc91x-$(CONFIG_SMC91X)			:= gpmc-smc91x.o
 obj-y					+= $(smc91x-m) $(smc91x-y)
diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
new file mode 100644
index 0000000..c0e8ba7
--- /dev/null
+++ b/arch/arm/mach-omap2/gpmc-nand.c
@@ -0,0 +1,137 @@
+/*
+ * gpmc-nand.c
+ *
+ * Copyright (C) 2009 Texas Instruments
+ * Vimal Singh <vimalsingh@ti.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+
+#include <asm/mach/flash.h>
+
+#include <plat/nand.h>
+#include <plat/board.h>
+#include <plat/gpmc.h>
+
+#define WR_RD_PIN_MONITORING	0x00600000
+#define MASKADDR		8
+
+static struct omap_nand_platform_data *gpmc_nand_data;
+
+static struct resource gpmc_nand_resource = {
+	.flags		= IORESOURCE_MEM,
+};
+
+static struct platform_device gpmc_nand_device = {
+	.name		= "omap2-nand",
+	.id		= 0,
+	.num_resources	= 1,
+	.resource	= &gpmc_nand_resource,
+};
+
+static int omap2_nand_gpmc_config(int cs, void __iomem *nand_base)
+{
+	struct gpmc_timings t;
+	int err;
+
+	const int cs_rd_off = 36;
+	const int cs_wr_off = 36;
+	const int adv_on = 6;
+	const int adv_rd_off = 24;
+	const int adv_wr_off = 36;
+	const int oe_off = 48;
+	const int we_off = 30;
+	const int rd_cycle = 72;
+	const int wr_cycle = 72;
+	const int access = 54;
+	const int wr_data_mux_bus = 0;
+	const int wr_access = 30;
+
+	memset(&t, 0, sizeof(t));
+	t.sync_clk = 0;
+	t.cs_on = 0;
+	t.adv_on = gpmc_round_ns_to_ticks(adv_on);
+
+	/* Read */
+	t.adv_rd_off = gpmc_round_ns_to_ticks(adv_rd_off);
+	t.oe_on  = t.adv_on;
+	t.access = gpmc_round_ns_to_ticks(access);
+	t.oe_off = gpmc_round_ns_to_ticks(oe_off);
+	t.cs_rd_off = gpmc_round_ns_to_ticks(cs_rd_off);
+	t.rd_cycle  = gpmc_round_ns_to_ticks(rd_cycle);
+
+	/* Write */
+	t.adv_wr_off = gpmc_round_ns_to_ticks(adv_wr_off);
+	t.we_on  = t.oe_on;
+	if (cpu_is_omap34xx()) {
+		t.wr_data_mux_bus = gpmc_round_ns_to_ticks(wr_data_mux_bus);
+		t.wr_access = gpmc_round_ns_to_ticks(wr_access);
+	}
+	t.we_off = gpmc_round_ns_to_ticks(we_off);
+	t.cs_wr_off = gpmc_round_ns_to_ticks(cs_wr_off);
+	t.wr_cycle  = gpmc_round_ns_to_ticks(wr_cycle);
+
+	/* Configure GPMC */
+	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1,
+			GPMC_CONFIG1_DEVICESIZE(gpmc_nand_data->devsize) |
+			GPMC_CONFIG1_DEVICETYPE_NAND);
+
+	err = gpmc_cs_set_timings(cs, &t);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int gpmc_nand_setup(void __iomem *nand_base)
+{
+	struct device *dev = &gpmc_nand_device.dev;
+
+	/* Set timings in GPMC */
+	if (omap2_nand_gpmc_config(gpmc_nand_data->cs, nand_base) < 0) {
+		dev_err(dev, "Unable to set gpmc timings\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int __init gpmc_nand_init(struct omap_nand_platform_data *_nand_data)
+{
+	unsigned int val;
+	int err	= 0;
+	struct device *dev = &gpmc_nand_device.dev;
+
+	gpmc_nand_data = _nand_data;
+	gpmc_nand_data->nand_setup = gpmc_nand_setup;
+	gpmc_nand_device.dev.platform_data = gpmc_nand_data;
+
+	err = gpmc_nand_setup(gpmc_nand_data->gpmc_cs_baseaddr);
+	if (err < 0) {
+		dev_err(dev, "NAND platform setup failed: %d\n", err);
+		return err;
+	}
+
+	/* Enable RD PIN Monitoring Reg */
+	if (gpmc_nand_data->dev_ready) {
+		val  = gpmc_cs_read_reg(gpmc_nand_data->cs,
+						 GPMC_CS_CONFIG1);
+		val |= WR_RD_PIN_MONITORING;
+		gpmc_cs_write_reg(gpmc_nand_data->cs,
+						GPMC_CS_CONFIG1, val);
+	}
+
+	err = platform_device_register(&gpmc_nand_device);
+	if (err < 0) {
+		dev_err(dev, "Unable to register NAND device\n");
+		return err;
+	}
+
+	return 0;
+}
diff --git a/arch/arm/plat-omap/include/plat/nand.h
b/arch/arm/plat-omap/include/plat/nand.h
index 631a7be..2ba9842 100644
--- a/arch/arm/plat-omap/include/plat/nand.h
+++ b/arch/arm/plat-omap/include/plat/nand.h
@@ -21,4 +21,10 @@ struct omap_nand_platform_data {
 	int			dma_channel;
 	void __iomem		*gpmc_cs_baseaddr;
 	void __iomem		*gpmc_baseaddr;
+	int			devsize;
 };
+
+/* size (4 KiB) for IO mapping */
+#define	NAND_IO_SIZE	SZ_4K
+
+extern int gpmc_nand_init(struct omap_nand_platform_data *d);
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 1bb799f..aaef170 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -30,12 +30,8 @@

 #define	DRIVER_NAME	"omap2-nand"

-/* size (4 KiB) for IO mapping */
-#define	NAND_IO_SIZE	SZ_4K
-
 #define	NAND_WP_OFF	0
 #define NAND_WP_BIT	0x00000010
-#define WR_RD_PIN_MONITORING	0x00600000

 #define	GPMC_BUF_FULL	0x00000001
 #define	GPMC_BUF_EMPTY	0x00000000
@@ -882,8 +878,6 @@ static int __devinit omap_nand_probe
 	struct omap_nand_info		*info;
 	struct omap_nand_platform_data	*pdata;
 	int				err;
-	unsigned long 			val;
-

 	pdata = pdev->dev.platform_data;
 	if (pdata == NULL) {
@@ -910,24 +904,15 @@ static int __devinit omap_nand_probe
 	info->mtd.name		= dev_name(&pdev->dev);
 	info->mtd.owner		= THIS_MODULE;

+	info->nand.options	|= pdata->devsize ? NAND_BUSWIDTH_16 : 0;
+	info->nand.options	|= NAND_SKIP_BBTSCAN;
+
 	err = gpmc_cs_request(info->gpmc_cs, NAND_IO_SIZE, &info->phys_base);
 	if (err < 0) {
 		dev_err(&pdev->dev, "Cannot request GPMC CS\n");
 		goto out_free_info;
 	}

-	/* Enable RD PIN Monitoring Reg */
-	if (pdata->dev_ready) {
-		val  = gpmc_cs_read_reg(info->gpmc_cs, GPMC_CS_CONFIG1);
-		val |= WR_RD_PIN_MONITORING;
-		gpmc_cs_write_reg(info->gpmc_cs, GPMC_CS_CONFIG1, val);
-	}
-
-	val  = gpmc_cs_read_reg(info->gpmc_cs, GPMC_CS_CONFIG7);
-	val &= ~(0xf << 8);
-	val |=  (0xc & 0xf) << 8;
-	gpmc_cs_write_reg(info->gpmc_cs, GPMC_CS_CONFIG7, val);
-
 	/* NAND write protect off */
 	omap_nand_wp(&info->mtd, NAND_WP_OFF);

@@ -963,11 +948,6 @@ static int __devinit omap_nand_probe
 		info->nand.chip_delay = 50;
 	}

-	info->nand.options  |= NAND_SKIP_BBTSCAN;
-	if ((gpmc_cs_read_reg(info->gpmc_cs, GPMC_CS_CONFIG1) & 0x3000)
-								== 0x1000)
-		info->nand.options  |= NAND_BUSWIDTH_16;
-
 	if (use_prefetch) {
 		/* copy the virtual address of nand base for fifo access */
 		info->nand_pref_fifo_add = info->nand.IO_ADDR_R;
-- 
1.5.5


>From bogus@does.not.exist.com  Fri Nov  6 13:01:15 2009
From: bogus@does.not.exist.com ()
Date: Fri, 06 Nov 2009 18:01:15 -0000
Subject: No subject
Message-ID: <mailman.131.1262949432.2170.linux-mtd@lists.infradead.org>

1>create an empty flash device (By default this uses the ram memory
but we can allocate other by the cache_file option)
2>mount ubi on it
3>mount ubifs on it
=> (Here we can load the previously stored image)
4>use it
5>while unmounting save the image on permanant storage

So as we can see, though NANDSIM can be effectively used for
simulating flash , it is of limited use in our project for testing
mount time as every time only the empty device is mounted.


>From bogus@does.not.exist.com  Fri Nov  6 13:01:15 2009
From: bogus@does.not.exist.com ()
Date: Fri, 06 Nov 2009 18:01:15 -0000
Subject: No subject
Message-ID: <mailman.132.1262949432.2170.linux-mtd@lists.infradead.org>

an empty device and in such case , all the system does is that it
initialises all its data structures.Hence we cannot show the
performance of our project on NANDSIM.

Our we missing some crucial point?
We would be grateful for clarification.


-- 
Shweta Shetty
http://shweta-kaleidoscope.blogspot.com/
Humility is a strange thing. The minute you know you have got it you
have lost it.


>From bogus@does.not.exist.com  Fri Nov  6 13:01:15 2009
From: bogus@does.not.exist.com ()
Date: Fri, 06 Nov 2009 18:01:15 -0000
Subject: No subject
Message-ID: <mailman.206.1265974331.2170.linux-mtd@lists.infradead.org>

I can also understand why there is a GC trigger here. GC is an optimization, and as such it should be triggered often enough for it do do the work.

But, why is this jffs_erase_pending_blocks in there?

In NOR case, after having rm'ed a large file, there are possibly a load of blocks on the pending list. The effect I notice is the same as Joakim noticed: after the rm, the system blocks for a while. Depending on the size of the file, this "while" might be rather long. I measured up to 30 seconds, which wreaks havoc with the innards of our userland software. And no, I can't change this by altering the process priority.

So, can you please enlighten me? What's the advantage of having the pending list erased in write_super? Can I possibly remove it without experiencing other problems?
--




>From bogus@does.not.exist.com  Fri Nov  6 13:01:15 2009
From: bogus@does.not.exist.com ()
Date: Fri, 06 Nov 2009 18:01:15 -0000
Subject: No subject
Message-ID: <mailman.257.1269191852.2170.linux-mtd@lists.infradead.org>

    Sometimes you need to make an `asm' operand be a specific register,
    but there's no matching constraint letter for that register _by
    itself_.  To force the operand into that register, use a local variable
    for the operand and specify the register in the variable declaration.
    *Note Explicit Reg Vars::.  Then for the `asm' operand, use any
    register constraint letter that matches the register:

         register int *p1 asm ("r0") = ...;
         register int *p2 asm ("r1") = ...;
         register int *result asm ("r0");
         asm ("sysint" : "=r" (result) : "0" (p1), "r" (p2));

Fwiw, that note is present in GCC-4.0.1, but not GCC-3.3.6.  But we've
depended on that behaviour for a long time.

Note that we've depended on GCC not copying values with a dereferenced
memory location for a long time too: E.g. "+m" (*ptr) is used a lot in
spinlocks.

I'm sure I've read email confirmation (on these very lists) that GCC
will always work with a memory constraint used in that way, without
copying the value to/from a different location such as a stack slot.

But suprisingly, the GCC documentation says:

    Extended asm supports input-output or read-write operands.  Use
    the constraint character `+' to indicate such an operand and list
    it with the output operands.  You should only use read-write
    operands when the constraints for the operand (or the operand in
    which only some of the bits are to be changed) allow a register.
                                                   ^^^^^^^^^^^^^^^^

Maybe we're relying on undefined GCC behaviour for the "+m" constraint?

> See the __asmeq() macro in <asm/system.h> for a dirty hack which will
> check which registers are used and abort at compile time, although your
> compilation is going to fail anyway so I'm not sure it makes much of a
> difference in this particular case.
> 
> The real fix here is to add an asm constraint to GCC which allows you to
> specify "any even GPR" (or whatever's most suitable for the ldrd
> instruction). Being able to give specific registers, like you can on
> other architectures, would be useful too.

See above GCC documentation for using register variables to designate
specific registers.  Many supported architectures don't have asm
letter constraints for each register - hence so many of the old
_syscallN macros in <asm/unistd.h> having to use register variables.

I am surprised GCC doesn't have a constraint for "any even register
suitable for ldrd" on ARM, but I've just checked gcc-4.4.3 and it doesn't.

However, if I'm reading the source correctly, if not compiling for
Thumb-1, and GCC believes the target machine supports ldrd, then all
doubleword values are constrained to an even register pair anyway.
That's why GCC itself does not need an even-register constraint letter.

...Which is I guess why it throws up only with OABI, or with pre-arm5e
archs: GCC doesn't consider OABI targets to support ldrd.  (It's
actually some more obscure condition, let's not go there).

Something else from the lovely GCC source:

    mfix-cortex-m3-ldrd
    Target Report Var(fix_cm3_ldrd) Init(2)
    Avoid overlapping destination and address registers on LDRD instructions
    that may trigger Cortex-M3 errata.

In other words, the "=&" earlyclobber *is* needed on Cortex-M3.

Enjoy!
-- Jamie
