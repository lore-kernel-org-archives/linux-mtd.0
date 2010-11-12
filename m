Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PGok6-0004de-R1
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 08:12:23 +0000
From: Savinay Dharmappa <savinay.dharmappa@ti.com>
To: davinci-linux-open-source@linux.davincidsp.com
Subject: [PATCH v2 2/2] davinci: Platform support for OMAP-L137/AM17x NOR
	flash driver
Date: Fri, 12 Nov 2010 13:32:55 +0530
Message-Id: <1289548975-21296-1-git-send-email-savinay.dharmappa@ti.com>
Cc: sshtylyov@ru.mvista.com, Aleksey Makarov <amakarov@ru.mvista.com>,
	dgriego@mvista.com, linux-mtd@lists.infradead.org,
	Savinay Dharmappa <savinay.dharmappa@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Aleksey Makarov <amakarov@ru.mvista.com>

Adds platform support for OMAP-L137/AM17x NOR flash driver.

Also, configures chip select 3 to control NOR flash's upper
address lines.

Signed-off-by: Aleksey Makarov <amakarov@ru.mvista.com>
Signed-off-by: Savinay Dharmappa <savinay.dharmappa@ti.com>
---
Since v1:
  Addressed Sergei's comments at [1].

[1] http://linux.davincidsp.com/pipermail/davinci-linux-open-source/2010-November/020923.html 

 arch/arm/mach-davinci/Kconfig           |    8 +
 arch/arm/mach-davinci/board-da830-evm.c |  219 +++++++++++++++++++++++++++++++
 2 files changed, 227 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
index 9aca60c..baa39ee 100644
--- a/arch/arm/mach-davinci/Kconfig
+++ b/arch/arm/mach-davinci/Kconfig
@@ -142,6 +142,14 @@ config DA830_UI_NAND
 	help
 	  Say Y here to use the NAND flash. Do not forget to setup
 	  the switch correctly.
+
+config DA830_UI_NOR
+        bool "NOR flash"
+        help
+          Configure this option to specify the that AEMIF CE2/CE3 will be used to
+          communicate to the NOR flash. Do not forget to setup the switch SW1
+          on UI card correctly.
+
 endchoice
 
 config MACH_DAVINCI_DA850_EVM
diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index 1bb89d3..cd35198 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -20,6 +20,8 @@
 #include <linux/i2c/at24.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/mtd/latch-addr-flash.h>
+#include <linux/clk.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -429,6 +431,221 @@ static inline void da830_evm_init_nand(int mux_mode)
 static inline void da830_evm_init_nand(int mux_mode) { }
 #endif
 
+#ifdef CONFIG_DA830_UI_NOR
+/*
+ * Number of Address line going to the NOR flash that are latched using
+ * AEMIF address lines  B_EMIF_BA0-B_EMIF_A12  on CS2.
+ */
+#define NOR_WINDOW_SIZE_LOG2     15
+#define NOR_WINDOW_SIZE         (1 << NOR_WINDOW_SIZE_LOG2)
+
+static struct {
+	struct clk *clk;
+	struct {
+		struct resource *res;
+		void __iomem *addr;
+	} latch, aemif;
+} da830_evm_nor;
+
+static struct davinci_aemif_timing da830_evm_norflash_timing = {
+	.wsetup		= 0,
+	.wstrobe	= 40,
+	.whold		= 0,
+	.rsetup		= 0,
+	.rstrobe	= 130,
+	.rhold		= 0,
+	.ta		= 20,
+};
+
+static void da830_evm_nor_set_window(unsigned long offset, void *data)
+{
+	/*
+	 * CS2 and CS3 address lines are used to address NOR flash. Address
+	 * line A0-A14 going to the NOR flash are latched using AEMIF address
+	 * lines B_EMIF_BA0-B_EMIF_A12 on CS2. Address lines A15-A23 of the
+	 * NOR flash are latched using AEMIF address lines B_EMIF_A0-B_EMIF_A6
+	 * on CS3. The offset argument received by this function is the offset
+	 * within NOR flash. Upper address is obtained  by shifting the offset
+	 * by the number of CS2 address lines used (13) and masking it with
+	 * complement of 3 (2 address lines used to address banks) and adding
+	 * the resultant offset value to CS3 base address. Writing to this
+	 * address will latch the upper address lines.
+	 */
+	writeb(0x0, da830_evm_nor.latch.addr +
+		(~3UL & (offset >> (NOR_WINDOW_SIZE_LOG2 - 2))));
+}
+
+static void da830_evm_nor_done(void *data)
+{
+	clk_disable(da830_evm_nor.clk);
+	clk_put(da830_evm_nor.clk);
+	iounmap(da830_evm_nor.latch.addr);
+	release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
+	iounmap(da830_evm_nor.aemif.addr);
+	release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
+}
+
+static int da830_evm_nor_init(void *data, int cs)
+{
+	/* Turn on AEMIF clocks */
+	da830_evm_nor.clk = clk_get(NULL, "aemif");
+	if (IS_ERR(da830_evm_nor.clk)) {
+		pr_err("%s: could not get AEMIF clock\n", __func__);
+		da830_evm_nor.clk = NULL;
+		return -ENODEV;
+	}
+	clk_enable(da830_evm_nor.clk);
+
+	da830_evm_nor.aemif.res = request_mem_region(DA8XX_AEMIF_CTL_BASE,
+						     SZ_32K, "AEMIF control");
+	if (da830_evm_nor.aemif.res == NULL) {
+		pr_err("%s: could not request AEMIF control region\n",
+			__func__);
+		goto err_clk;
+	}
+
+	da830_evm_nor.aemif.addr = ioremap_nocache(DA8XX_AEMIF_CTL_BASE,
+						   SZ_32K);
+	if (da830_evm_nor.aemif.addr == NULL) {
+		pr_err("%s: could not remap AEMIF control region\n", __func__);
+		goto err_aemif_region;
+	}
+
+	/* Setup AEMIF -- timings, etc. */
+
+	/* Set maximum wait cycles */
+	davinci_aemif_setup_timing(&da830_evm_norflash_timing,
+						da830_evm_nor.aemif.addr, cs);
+
+	davinci_aemif_setup_timing(&da830_evm_norflash_timing,
+					da830_evm_nor.aemif.addr, cs + 1);
+
+	/* Setup the window to access the latch */
+	da830_evm_nor.latch.res =
+		request_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE,
+				   "DA830 UI NOR address latch");
+	if (da830_evm_nor.latch.res == NULL) {
+		pr_err("%s: could not request address latch region\n",
+			__func__);
+		goto err_aemif_ioremap;
+	}
+
+	da830_evm_nor.latch.addr =
+		ioremap_nocache(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
+	if (da830_evm_nor.latch.addr == NULL) {
+		pr_err("%s: could not remap address latch region\n", __func__);
+		goto err_latch_region;
+	}
+	return 0;
+
+err_latch_region:
+	release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
+
+err_aemif_ioremap:
+	iounmap(da830_evm_nor.aemif.addr);
+
+err_aemif_region:
+	release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
+
+err_clk:
+	clk_disable(da830_evm_nor.clk);
+	clk_put(da830_evm_nor.clk);
+
+	return -EBUSY;
+}
+
+static struct mtd_partition da830_evm_nor_partitions[] = {
+	/* bootloader (U-Boot, etc) in first 2 sectors */
+	[0] = {
+		.name           = "bootloader",
+		.offset		= 0,
+		.size           = SZ_128K,
+		.mask_flags     = MTD_WRITEABLE, /* force read-only */
+	},
+	/* bootloader parameters in the next 1 sector */
+	[1] = {
+		.name           = "params",
+		.offset         = MTDPART_OFS_APPEND,
+		.size           = SZ_64K,
+	},
+	/* kernel */
+	[2] = {
+		.name           = "kernel",
+		.offset         = MTDPART_OFS_APPEND,
+		.size           = SZ_2M,
+	},
+	/* file system */
+	[3] = {
+		.name           = "filesystem",
+		.offset         = MTDPART_OFS_APPEND,
+		.size           = MTDPART_SIZ_FULL,
+	}
+};
+
+static struct latch_addr_flash_data da830_evm_nor_pdata = {
+	.width          = 1,
+	.size           = SZ_4M,
+	.init           = da830_evm_nor_init,
+	.done           = da830_evm_nor_done,
+	.set_window     = da830_evm_nor_set_window,
+	.nr_parts       = ARRAY_SIZE(da830_evm_nor_partitions),
+	.parts          = da830_evm_nor_partitions,
+};
+
+static struct resource da830_evm_nor_resource[] = {
+	[0] = {
+		.start  = DA8XX_AEMIF_CS2_BASE,
+		.end    = DA8XX_AEMIF_CS2_BASE + NOR_WINDOW_SIZE - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start  = DA8XX_AEMIF_CS3_BASE,
+		.end    = DA8XX_AEMIF_CS3_BASE + PAGE_SIZE - 1,
+		.flags  = IORESOURCE_MEM,
+	},
+	[2] = {
+		.start  = DA8XX_AEMIF_CTL_BASE,
+		.end    = DA8XX_AEMIF_CTL_BASE + SZ_32K - 1,
+		.flags  = IORESOURCE_MEM,
+	}
+};
+
+static struct platform_device da830_evm_nor_device = {
+	.name           = "latch-addr-flash",
+	.id             = 0,
+	.dev            = {
+		.platform_data  = &da830_evm_nor_pdata,
+	},
+	.num_resources  = ARRAY_SIZE(da830_evm_nor_resource),
+	.resource       = da830_evm_nor_resource,
+};
+
+static inline void da830_evm_init_nor(int mux_mode)
+{
+	int ret;
+
+	if (HAS_MMC) {
+		pr_warning("WARNING: both MMC/SD and NOR are "
+				"enabled, but they share AEMIF pins.\n"
+					"\tDisable MMC/SD for NOR support.\n");
+		return;
+	}
+
+	ret = davinci_cfg_reg_list(da830_evm_emif25_pins);
+	if (ret)
+		pr_warning("da830_evm_init: EMIF 2.5 mux setup failed: %d\n",
+			  ret);
+
+	ret = platform_device_register(&da830_evm_nor_device);
+	if (ret)
+		pr_warning("da830_evm_init: NOR device not registered.\n");
+
+	gpio_direction_output(mux_mode, 1);
+}
+#else
+static inline void da830_evm_init_nor(int mux_mode) { }
+#endif  /* CONFIG_DA830_UI_NOR */
+
 #ifdef CONFIG_DA830_UI_LCD
 static inline void da830_evm_init_lcdc(int mux_mode)
 {
@@ -469,6 +686,8 @@ static int __init da830_evm_ui_expander_setup(struct i2c_client *client,
 
 	da830_evm_init_nand(gpio + 6);
 
+	da830_evm_init_nor(gpio + 6);
+
 	return 0;
 }
 
-- 
1.5.6
