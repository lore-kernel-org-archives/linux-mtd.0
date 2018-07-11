Received: from mail-co1nam04on0620.outbound.protection.outlook.com
 ([2a01:111:f400:fe4d::620]
 helo=NAM04-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fd9h3-00019V-Ld
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 07:37:53 +0000
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <f.fainelli@gmail.com>, <mmayer@broadcom.com>, <rogerq@ti.com>,
 <ladis@linux-mips.org>, <ada@thorsis.co>, <honghui.zhang@mediatek.com>,
 <miquel.raynal@bootlin.com>, <linus.walleij@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nagasureshkumarrelli@gmail.com>, <michals@xilinx.com>, Naga Sureshkumar
 Relli <naga.sureshkumar.relli@xilinx.com>
Subject: [LINUX PATCH v11 2/3] memory: pl353: Add driver for arm pl353 static
 memory controller
Date: Wed, 11 Jul 2018 13:06:51 +0530
Message-ID: <1531294612-29526-3-git-send-email-naga.sureshkumar.relli@xilinx.com>
In-Reply-To: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
References: <1531294612-29526-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add driver for arm pl353 static memory controller. This controller is used in
Xilinx Zynq SoC for interfacing the NAND and NOR/SRAM memory devices.

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Changes in v11:
 - Added amba device registration and removed platform device, since it
   is an ARM Primecell Peripheral and it should register as an amba device
   as per Linus Walleji.
Changes in v10:
 - Corrected typos in commit message like xilinx to Xilinx
 - Added SoC specific compilation check in Kconfig as below
   "depends on ARCH_ZYNQ"
 - Modified return type from int to bool to the function
   pl353_smc_ecc_is_busy
 - Defined Macros for values in pl353_smc_get_ecc_val and modifed
   the logic to read ecc value from all 4 registers
 - Assinged the timeout value in pl353_smc_init_nand_interface()
   after declaration
 - Added compatibles on another line and aligned the data with them
 - Removed pl353-smc.h from platform-data and moved it to include/linux
Changes in v9:
 - Addressed the comments given by Julia Cartwright to the v8 series.
Changes in v8:
- None
Changes in v7:
- Corrected the kconfig to use tristate selection
- Corrected the GPL licence ident
- Added boundary checks for nand timing parameters
Changes in v6:
- Fixed checkpatch.pl reported warnings
Changes in v5:
- Added pl353_smc_get_clkrate function, made pl353_smc_set_cycles as public
  API
- Removed nand timing parameter initialization and moved it to nand driver
Changes in v4:
- Modified driver to support multiple instances
- Used sleep instaed of busywait for delay
Changes in v3:
- None
Changes in v2:
- Since now the timing parameters are in nano seconds, added logic to convert
  them to the cycles
---
 drivers/memory/Kconfig     |  10 +
 drivers/memory/Makefile    |   1 +
 drivers/memory/pl353-smc.c | 468 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pl353-smc.h  |  30 +++
 4 files changed, 509 insertions(+)
 create mode 100644 drivers/memory/pl353-smc.c
 create mode 100644 include/linux/pl353-smc.h

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index 19a0e83..1a84125 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -153,6 +153,16 @@ config DA8XX_DDRCTL
 	  Texas Instruments da8xx SoCs. It's used to tweak various memory
 	  controller configuration options.
 
+config PL353_SMC
+	tristate "ARM PL35X Static Memory Controller(SMC) driver"
+	default y
+	depends on ARM
+	depends on ARCH_ZYNQ
+	depends on ARM_AMBA
+	help
+	  This driver is for the ARM PL351/PL353 Static Memory
+	  Controller(SMC) module.
+
 source "drivers/memory/samsung/Kconfig"
 source "drivers/memory/tegra/Kconfig"
 
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 66f5524..58e794d 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_TEGRA20_MC)	+= tegra20-mc.o
 obj-$(CONFIG_JZ4780_NEMC)	+= jz4780-nemc.o
 obj-$(CONFIG_MTK_SMI)		+= mtk-smi.o
 obj-$(CONFIG_DA8XX_DDRCTL)	+= da8xx-ddrctl.o
+obj-$(CONFIG_PL353_SMC)		+= pl353-smc.o
 
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
new file mode 100644
index 0000000..bab5626
--- /dev/null
+++ b/drivers/memory/pl353-smc.c
@@ -0,0 +1,468 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM PL353 SMC driver
+ *
+ * Copyright (C) 2012 Xilinx, Inc
+ * Author: Punnaiah Choudary Kalluri <punnaiah@xilinx.com>
+ * Author: Naga Sureshkumar Relli <nagasure@xilinx.com>
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/pl353-smc.h>
+#include <linux/amba/bus.h>
+
+/* Register definitions */
+#define PL353_SMC_MEMC_STATUS_OFFS	0	/* Controller status reg, RO */
+#define PL353_SMC_CFG_CLR_OFFS		0xC	/* Clear config reg, WO */
+#define PL353_SMC_DIRECT_CMD_OFFS	0x10	/* Direct command reg, WO */
+#define PL353_SMC_SET_CYCLES_OFFS	0x14	/* Set cycles register, WO */
+#define PL353_SMC_SET_OPMODE_OFFS	0x18	/* Set opmode register, WO */
+#define PL353_SMC_ECC_STATUS_OFFS	0x400	/* ECC status register */
+#define PL353_SMC_ECC_MEMCFG_OFFS	0x404	/* ECC mem config reg */
+#define PL353_SMC_ECC_MEMCMD1_OFFS	0x408	/* ECC mem cmd1 reg */
+#define PL353_SMC_ECC_MEMCMD2_OFFS	0x40C	/* ECC mem cmd2 reg */
+#define PL353_SMC_ECC_VALUE0_OFFS	0x418	/* ECC value 0 reg */
+
+/* Controller status register specific constants */
+#define PL353_SMC_MEMC_STATUS_RAW_INT_1_SHIFT	6
+
+/* Clear configuration register specific constants */
+#define PL353_SMC_CFG_CLR_INT_CLR_1	0x10
+#define PL353_SMC_CFG_CLR_ECC_INT_DIS_1	0x40
+#define PL353_SMC_CFG_CLR_INT_DIS_1	0x2
+#define PL353_SMC_CFG_CLR_DEFAULT_MASK	(PL353_SMC_CFG_CLR_INT_CLR_1 | \
+					 PL353_SMC_CFG_CLR_ECC_INT_DIS_1 | \
+					 PL353_SMC_CFG_CLR_INT_DIS_1)
+
+/* Set cycles register specific constants */
+#define PL353_SMC_SET_CYCLES_T0_MASK	0xF
+#define PL353_SMC_SET_CYCLES_T0_SHIFT	0
+#define PL353_SMC_SET_CYCLES_T1_MASK	0xF
+#define PL353_SMC_SET_CYCLES_T1_SHIFT	4
+#define PL353_SMC_SET_CYCLES_T2_MASK	0x7
+#define PL353_SMC_SET_CYCLES_T2_SHIFT	8
+#define PL353_SMC_SET_CYCLES_T3_MASK	0x7
+#define PL353_SMC_SET_CYCLES_T3_SHIFT	11
+#define PL353_SMC_SET_CYCLES_T4_MASK	0x7
+#define PL353_SMC_SET_CYCLES_T4_SHIFT	14
+#define PL353_SMC_SET_CYCLES_T5_MASK	0x7
+#define PL353_SMC_SET_CYCLES_T5_SHIFT	17
+#define PL353_SMC_SET_CYCLES_T6_MASK	0xF
+#define PL353_SMC_SET_CYCLES_T6_SHIFT	20
+
+/* ECC status register specific constants */
+#define PL353_SMC_ECC_STATUS_BUSY	BIT(6)
+#define PL353_SMC_ECC_REG_SIZE_OFFS	4
+
+/* ECC memory config register specific constants */
+#define PL353_SMC_ECC_MEMCFG_MODE_MASK	0xC
+#define PL353_SMC_ECC_MEMCFG_MODE_SHIFT	2
+#define PL353_SMC_ECC_MEMCFG_PGSIZE_MASK	0xC
+
+#define PL353_SMC_DC_UPT_NAND_REGS	((4 << 23) |	/* CS: NAND chip */ \
+				 (2 << 21))	/* UpdateRegs operation */
+
+#define PL353_NAND_ECC_CMD1	((0x80)       |	/* Write command */ \
+				 (0 << 8)     |	/* Read command */ \
+				 (0x30 << 16) |	/* Read End command */ \
+				 (1 << 24))	/* Read End command calid */
+
+#define PL353_NAND_ECC_CMD2	((0x85)	      |	/* Write col change cmd */ \
+				 (5 << 8)     |	/* Read col change cmd */ \
+				 (0xE0 << 16) |	/* Read col change end cmd */ \
+				 (1 << 24)) /* Read col change end cmd valid */
+#define PL353_NAND_ECC_BUSY_TIMEOUT	(1 * HZ)
+/**
+ * struct pl353_smc_data - Private smc driver structure
+ * @memclk:		Pointer to the peripheral clock
+ * @aclk:		Pointer to the APER clock
+ */
+struct pl353_smc_data {
+	struct clk		*memclk;
+	struct clk		*aclk;
+};
+
+/* SMC virtual register base */
+static void __iomem *pl353_smc_base;
+
+/**
+ * pl353_smc_set_buswidth - Set memory buswidth
+ * @bw:	Memory buswidth (8 | 16)
+ * Return: 0 on success or negative errno.
+ */
+int pl353_smc_set_buswidth(unsigned int bw)
+{
+	if (bw != PL353_SMC_MEM_WIDTH_8  && bw != PL353_SMC_MEM_WIDTH_16)
+		return -EINVAL;
+
+	writel(bw, pl353_smc_base + PL353_SMC_SET_OPMODE_OFFS);
+	writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
+	       PL353_SMC_DIRECT_CMD_OFFS);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pl353_smc_set_buswidth);
+
+/**
+ * pl353_smc_set_cycles - Set memory timing parameters
+ * @timings: NAND controller timing parameters
+ *
+ * Sets NAND chip specific timing parameters.
+ */
+void pl353_smc_set_cycles(u32 timings[])
+{
+	/*
+	 * Set write pulse timing. This one is easy to extract:
+	 *
+	 * NWE_PULSE = tWP
+	 */
+	timings[0] &= PL353_SMC_SET_CYCLES_T0_MASK;
+	timings[1] = (timings[1] & PL353_SMC_SET_CYCLES_T1_MASK) <<
+			PL353_SMC_SET_CYCLES_T1_SHIFT;
+	timings[2] = (timings[2]  & PL353_SMC_SET_CYCLES_T2_MASK) <<
+			PL353_SMC_SET_CYCLES_T2_SHIFT;
+	timings[3] = (timings[3]  & PL353_SMC_SET_CYCLES_T3_MASK) <<
+			PL353_SMC_SET_CYCLES_T3_SHIFT;
+	timings[4] = (timings[4] & PL353_SMC_SET_CYCLES_T4_MASK) <<
+			PL353_SMC_SET_CYCLES_T4_SHIFT;
+	timings[5]  = (timings[5]  & PL353_SMC_SET_CYCLES_T5_MASK) <<
+			PL353_SMC_SET_CYCLES_T5_SHIFT;
+	timings[6]  = (timings[6]  & PL353_SMC_SET_CYCLES_T6_MASK) <<
+			PL353_SMC_SET_CYCLES_T6_SHIFT;
+	timings[0] |= timings[1] | timings[2] | timings[3] |
+			timings[4] | timings[5] | timings[6];
+
+	writel(timings[0], pl353_smc_base + PL353_SMC_SET_CYCLES_OFFS);
+	writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
+	       PL353_SMC_DIRECT_CMD_OFFS);
+}
+EXPORT_SYMBOL_GPL(pl353_smc_set_cycles);
+
+/**
+ * pl353_smc_ecc_is_busy - Read ecc busy flag
+ * Return: the ecc_status bit from the ecc_status register. 1 = busy, 0 = idle
+ */
+bool pl353_smc_ecc_is_busy(void)
+{
+	return ((readl(pl353_smc_base + PL353_SMC_ECC_STATUS_OFFS) &
+		  PL353_SMC_ECC_STATUS_BUSY) == PL353_SMC_ECC_STATUS_BUSY);
+}
+EXPORT_SYMBOL_GPL(pl353_smc_ecc_is_busy);
+
+/**
+ * pl353_smc_get_ecc_val - Read ecc_valueN registers
+ * @ecc_reg:	Index of the ecc_value reg (0..3)
+ * Return: the content of the requested ecc_value register.
+ *
+ * There are four valid ecc_value registers. The argument is truncated to stay
+ * within this valid boundary.
+ */
+u32 pl353_smc_get_ecc_val(int ecc_reg)
+{
+	u32 addr, reg;
+
+	addr = PL353_SMC_ECC_VALUE0_OFFS +
+		(ecc_reg * PL353_SMC_ECC_REG_SIZE_OFFS);
+	reg = readl(pl353_smc_base + addr);
+
+	return reg;
+}
+EXPORT_SYMBOL_GPL(pl353_smc_get_ecc_val);
+
+/**
+ * pl353_smc_get_nand_int_status_raw - Get NAND interrupt status bit
+ * Return: the raw_int_status1 bit from the memc_status register
+ */
+int pl353_smc_get_nand_int_status_raw(void)
+{
+	u32 reg;
+
+	reg = readl(pl353_smc_base + PL353_SMC_MEMC_STATUS_OFFS);
+	reg >>= PL353_SMC_MEMC_STATUS_RAW_INT_1_SHIFT;
+	reg &= 1;
+
+	return reg;
+}
+EXPORT_SYMBOL_GPL(pl353_smc_get_nand_int_status_raw);
+
+/**
+ * pl353_smc_clr_nand_int - Clear NAND interrupt
+ */
+void pl353_smc_clr_nand_int(void)
+{
+	writel(PL353_SMC_CFG_CLR_INT_CLR_1,
+	       pl353_smc_base + PL353_SMC_CFG_CLR_OFFS);
+}
+EXPORT_SYMBOL_GPL(pl353_smc_clr_nand_int);
+
+/**
+ * pl353_smc_set_ecc_mode - Set SMC ECC mode
+ * @mode:	ECC mode (BYPASS, APB, MEM)
+ * Return: 0 on success or negative errno.
+ */
+int pl353_smc_set_ecc_mode(enum pl353_smc_ecc_mode mode)
+{
+	u32 reg;
+	int ret = 0;
+
+	switch (mode) {
+	case PL353_SMC_ECCMODE_BYPASS:
+	case PL353_SMC_ECCMODE_APB:
+	case PL353_SMC_ECCMODE_MEM:
+
+		reg = readl(pl353_smc_base + PL353_SMC_ECC_MEMCFG_OFFS);
+		reg &= ~PL353_SMC_ECC_MEMCFG_MODE_MASK;
+		reg |= mode << PL353_SMC_ECC_MEMCFG_MODE_SHIFT;
+		writel(reg, pl353_smc_base + PL353_SMC_ECC_MEMCFG_OFFS);
+
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pl353_smc_set_ecc_mode);
+
+/**
+ * pl353_smc_set_ecc_pg_size - Set SMC ECC page size
+ * @pg_sz:	ECC page size
+ * Return: 0 on success or negative errno.
+ */
+int pl353_smc_set_ecc_pg_size(unsigned int pg_sz)
+{
+	u32 reg, sz;
+
+	switch (pg_sz) {
+	case 0:
+		sz = 0;
+		break;
+	case SZ_512:
+		sz = 1;
+		break;
+	case SZ_1K:
+		sz = 2;
+		break;
+	case SZ_2K:
+		sz = 3;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	reg = readl(pl353_smc_base + PL353_SMC_ECC_MEMCFG_OFFS);
+	reg &= ~PL353_SMC_ECC_MEMCFG_PGSIZE_MASK;
+	reg |= sz;
+	writel(reg, pl353_smc_base + PL353_SMC_ECC_MEMCFG_OFFS);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pl353_smc_set_ecc_pg_size);
+
+static int __maybe_unused pl353_smc_suspend(struct device *dev)
+{
+	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
+
+	clk_disable(pl353_smc->memclk);
+	clk_disable(pl353_smc->aclk);
+
+	return 0;
+}
+
+static int __maybe_unused pl353_smc_resume(struct device *dev)
+{
+	int ret;
+	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
+
+	ret = clk_enable(pl353_smc->aclk);
+	if (ret) {
+		dev_err(dev, "Cannot enable axi domain clock.\n");
+		return ret;
+	}
+
+	ret = clk_enable(pl353_smc->memclk);
+	if (ret) {
+		dev_err(dev, "Cannot enable memory clock.\n");
+		clk_disable(pl353_smc->aclk);
+		return ret;
+	}
+
+	return ret;
+}
+static struct amba_driver pl353_smc_driver;
+static SIMPLE_DEV_PM_OPS(pl353_smc_dev_pm_ops, pl353_smc_suspend,
+			 pl353_smc_resume);
+
+/**
+ * pl353_smc_init_nand_interface - Initialize the NAND interface
+ * @adev:	Pointer to the amba_device struct
+ * @nand_node:	Pointer to the pl353_nand device_node struct
+ */
+void pl353_smc_init_nand_interface(struct amba_device *adev,
+					struct device_node *nand_node)
+{
+	unsigned long timeout;
+
+	pl353_smc_set_buswidth(PL353_SMC_MEM_WIDTH_8);
+	writel(PL353_SMC_CFG_CLR_INT_CLR_1,
+	       pl353_smc_base + PL353_SMC_CFG_CLR_OFFS);
+	writel(PL353_SMC_DC_UPT_NAND_REGS, pl353_smc_base +
+	       PL353_SMC_DIRECT_CMD_OFFS);
+
+	timeout = jiffies + PL353_NAND_ECC_BUSY_TIMEOUT;
+	/* Wait till the ECC operation is complete */
+	do {
+		if (pl353_smc_ecc_is_busy())
+			cpu_relax();
+		else
+			break;
+	} while (!time_after_eq(jiffies, timeout));
+
+	if (time_after_eq(jiffies, timeout))
+		return;
+
+	writel(PL353_NAND_ECC_CMD1,
+	       pl353_smc_base + PL353_SMC_ECC_MEMCMD1_OFFS);
+	writel(PL353_NAND_ECC_CMD2,
+	       pl353_smc_base + PL353_SMC_ECC_MEMCMD2_OFFS);
+}
+
+static const struct of_device_id pl353_smc_supported_children[] = {
+	{
+		.compatible = "cfi-flash"
+	},
+	{
+		.compatible = "arm,pl353-nand-r2p1",
+		.data = pl353_smc_init_nand_interface
+	},
+	{}
+};
+
+static int pl353_smc_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct pl353_smc_data *pl353_smc;
+	struct device_node *child;
+	struct resource *res;
+	int err;
+	struct device_node *of_node = adev->dev.of_node;
+	void (*init)(struct amba_device *adev,
+		     struct device_node *nand_node);
+	const struct of_device_id *match = NULL;
+
+	pl353_smc = devm_kzalloc(&adev->dev, sizeof(*pl353_smc), GFP_KERNEL);
+	if (!pl353_smc)
+		return -ENOMEM;
+
+	/* Get the NAND controller virtual address */
+	res = &adev->res;
+	pl353_smc_base = devm_ioremap_resource(&adev->dev, res);
+	if (IS_ERR(pl353_smc_base))
+		return PTR_ERR(pl353_smc_base);
+
+	pl353_smc->aclk = devm_clk_get(&adev->dev, "apb_pclk");
+	if (IS_ERR(pl353_smc->aclk)) {
+		dev_err(&adev->dev, "aclk clock not found.\n");
+		return PTR_ERR(pl353_smc->aclk);
+	}
+
+	pl353_smc->memclk = devm_clk_get(&adev->dev, "memclk");
+	if (IS_ERR(pl353_smc->memclk)) {
+		dev_err(&adev->dev, "memclk clock not found.\n");
+		return PTR_ERR(pl353_smc->memclk);
+	}
+
+	err = clk_prepare_enable(pl353_smc->aclk);
+	if (err) {
+		dev_err(&adev->dev, "Unable to enable AXI clock.\n");
+		return err;
+	}
+
+	err = clk_prepare_enable(pl353_smc->memclk);
+	if (err) {
+		dev_err(&adev->dev, "Unable to enable memory clock.\n");
+		goto out_clk_dis_aper;
+	}
+
+	amba_set_drvdata(adev, pl353_smc);
+
+	/* clear interrupts */
+	writel(PL353_SMC_CFG_CLR_DEFAULT_MASK,
+	       pl353_smc_base + PL353_SMC_CFG_CLR_OFFS);
+
+	/* Find compatible children. Only a single child is supported */
+	for_each_available_child_of_node(of_node, child) {
+		match = of_match_node(pl353_smc_supported_children, child);
+		if (!match) {
+			dev_warn(&adev->dev, "unsupported child node\n");
+			continue;
+		}
+		break;
+	}
+	if (!match) {
+		dev_err(&adev->dev, "no matching children\n");
+		goto out_clk_disable;
+	}
+
+	init = match->data;
+	if (init)
+		init(adev, child);
+	of_platform_device_create(child, NULL, &adev->dev);
+
+	return 0;
+
+out_clk_disable:
+	clk_disable_unprepare(pl353_smc->memclk);
+out_clk_dis_aper:
+	clk_disable_unprepare(pl353_smc->aclk);
+
+	return err;
+}
+
+static int pl353_smc_remove(struct amba_device *adev)
+{
+	struct pl353_smc_data *pl353_smc = amba_get_drvdata(adev);
+
+	clk_disable_unprepare(pl353_smc->memclk);
+	clk_disable_unprepare(pl353_smc->aclk);
+
+	return 0;
+}
+
+/* Match table for device tree binding */
+static const struct of_device_id pl353_smc_of_match[] = {
+	{ .compatible = "arm,pl353-smc-r2p1" },
+	{ },
+};
+
+static const struct amba_id pl353_ids[] = {
+	{
+	.id = 0x00041353,
+	.mask = 0x000fffff,
+	},
+	{ 0, 0 },
+};
+MODULE_DEVICE_TABLE(amba, pl353_ids);
+
+static struct amba_driver pl353_smc_driver = {
+	.drv = {
+		.owner = THIS_MODULE,
+		.name = "pl353-smc",
+		.pm = &pl353_smc_dev_pm_ops,
+	},
+	.id_table = pl353_ids,
+	.probe		= pl353_smc_probe,
+	.remove		= pl353_smc_remove,
+};
+
+module_amba_driver(pl353_smc_driver);
+
+MODULE_AUTHOR("Xilinx, Inc.");
+MODULE_DESCRIPTION("ARM PL353 SMC Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/pl353-smc.h b/include/linux/pl353-smc.h
new file mode 100644
index 0000000..2939d49
--- /dev/null
+++ b/include/linux/pl353-smc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ARM PL353 SMC Driver Header
+ *
+ * Copyright (C) 2017 Xilinx, Inc
+ */
+
+#ifndef __LINUX_MEMORY_PL353_SMC_H
+#define __LINUX_MEMORY_PL353_SMC_H
+
+enum pl353_smc_ecc_mode {
+	PL353_SMC_ECCMODE_BYPASS = 0,
+	PL353_SMC_ECCMODE_APB = 1,
+	PL353_SMC_ECCMODE_MEM = 2
+};
+
+enum pl353_smc_mem_width {
+	PL353_SMC_MEM_WIDTH_8 = 0,
+	PL353_SMC_MEM_WIDTH_16 = 1
+};
+
+u32 pl353_smc_get_ecc_val(int ecc_reg);
+bool pl353_smc_ecc_is_busy(void);
+int pl353_smc_get_nand_int_status_raw(void);
+void pl353_smc_clr_nand_int(void);
+int pl353_smc_set_ecc_mode(enum pl353_smc_ecc_mode mode);
+int pl353_smc_set_ecc_pg_size(unsigned int pg_sz);
+int pl353_smc_set_buswidth(unsigned int bw);
+void pl353_smc_set_cycles(u32 timings[]);
+#endif
-- 
2.7.4
