Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3kyI-0001c9-BE
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 09:42:02 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <artem.bityutskiy@linux.intel.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 01/10] ARM: OMAP2+: gpmc: update nand register helper
Date: Tue, 21 Aug 2012 15:11:54 +0530
Message-ID: <48595cde3c92e81ddd790d491461895a4272757f.1344609341.git.afzal@ti.com>
In-Reply-To: <cover.1344609341.git.afzal@ti.com>
References: <cover.1344609341.git.afzal@ti.com>
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

Provide helper function for updating NAND register details for
the necessary chip select. NAND drivers platform data can be
updated with this information so that NAND driver can handle
GPMC NAND operations by itself.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/gpmc.c             |   20 ++++++++++++++++++++
 arch/arm/plat-omap/include/plat/gpmc.h |   18 ++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index b2b5759..5cce9b0 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -682,6 +682,26 @@ int gpmc_prefetch_reset(int cs)
 }
 EXPORT_SYMBOL(gpmc_prefetch_reset);
 
+void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs)
+{
+	reg->gpmc_status = gpmc_base + GPMC_STATUS;
+	reg->gpmc_nand_command = gpmc_base + GPMC_CS0_OFFSET +
+				GPMC_CS_NAND_COMMAND + GPMC_CS_SIZE * cs;
+	reg->gpmc_nand_address = gpmc_base + GPMC_CS0_OFFSET +
+				GPMC_CS_NAND_ADDRESS + GPMC_CS_SIZE * cs;
+	reg->gpmc_nand_data = gpmc_base + GPMC_CS0_OFFSET +
+				GPMC_CS_NAND_DATA + GPMC_CS_SIZE * cs;
+	reg->gpmc_prefetch_config1 = gpmc_base + GPMC_PREFETCH_CONFIG1;
+	reg->gpmc_prefetch_config2 = gpmc_base + GPMC_PREFETCH_CONFIG2;
+	reg->gpmc_prefetch_control = gpmc_base + GPMC_PREFETCH_CONTROL;
+	reg->gpmc_prefetch_status = gpmc_base + GPMC_PREFETCH_STATUS;
+	reg->gpmc_ecc_config = gpmc_base + GPMC_ECC_CONFIG;
+	reg->gpmc_ecc_control = gpmc_base + GPMC_ECC_CONTROL;
+	reg->gpmc_ecc_size_config = gpmc_base + GPMC_ECC_SIZE_CONFIG;
+	reg->gpmc_ecc1_result = gpmc_base + GPMC_ECC1_RESULT;
+	reg->gpmc_bch_result0 = gpmc_base + GPMC_ECC_BCH_RESULT_0;
+}
+
 static void __init gpmc_mem_init(void)
 {
 	int cs;
diff --git a/arch/arm/plat-omap/include/plat/gpmc.h b/arch/arm/plat-omap/include/plat/gpmc.h
index f37764a..06198a5 100644
--- a/arch/arm/plat-omap/include/plat/gpmc.h
+++ b/arch/arm/plat-omap/include/plat/gpmc.h
@@ -133,6 +133,24 @@ struct gpmc_timings {
 	u16 wr_data_mux_bus;	/* WRDATAONADMUXBUS */
 };
 
+struct gpmc_nand_regs {
+	void __iomem	*gpmc_status;
+	void __iomem	*gpmc_nand_command;
+	void __iomem	*gpmc_nand_address;
+	void __iomem	*gpmc_nand_data;
+	void __iomem	*gpmc_prefetch_config1;
+	void __iomem	*gpmc_prefetch_config2;
+	void __iomem	*gpmc_prefetch_control;
+	void __iomem	*gpmc_prefetch_status;
+	void __iomem	*gpmc_ecc_config;
+	void __iomem	*gpmc_ecc_control;
+	void __iomem	*gpmc_ecc_size_config;
+	void __iomem	*gpmc_ecc1_result;
+	void __iomem	*gpmc_bch_result0;
+};
+
+extern void gpmc_update_nand_reg(struct gpmc_nand_regs *reg, int cs);
+
 extern unsigned int gpmc_ns_to_ticks(unsigned int time_ns);
 extern unsigned int gpmc_ps_to_ticks(unsigned int time_ps);
 extern unsigned int gpmc_ticks_to_ns(unsigned int ticks);
-- 
1.7.1
