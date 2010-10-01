From: Viresh KUMAR <viresh.kumar@st.com>
To: linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com,
	a.zummo@towertech.it, dbrownell@users.sourceforge.net,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Subject: [PATCH V2 34/69] ST SPEAr: Replacing SIZE macro's with actual
	required size
Date: Fri,  1 Oct 2010 17:25:54 +0530
Message-Id: <c3401e12797cf90712981251c4b39f89a9d0c112.1285933332.git.viresh.kumar@st.com>
In-Reply-To: <cover.1285933331.git.viresh.kumar@st.com>
References: <cover.1285933331.git.viresh.kumar@st.com>
In-Reply-To: <cover.1285933331.git.viresh.kumar@st.com>
References: <cover.1285933331.git.viresh.kumar@st.com>
Cc: pratyush.anand@st.com, Viresh Kumar <viresh.kumar@st.com>,
	vipulkumar.samar@st.com, bhupesh.sharma@st.com,
	armando.visconti@st.com, vipin.kumar@st.com,
	Shiraz Hashim <shiraz.hashim@st.com>, rajeev-dlh.kumar@st.com,
	deepak.sikri@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shiraz Hashim <shiraz.hashim@st.com>

In arch specific files SIZE macro's were defined which were used for
creating memory/io mappings for sepecific devices. These macro's are
coming straight from h/w user manual and are much greated than required
sizes. Replacing these macros by actual required size.

Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
Signed-off-by: Rajeev Kumar <rajeev-dlh.kumar@st.com>
Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
 arch/arm/mach-spear3xx/spear300.c |    9 +++------
 arch/arm/mach-spear3xx/spear310.c |    2 +-
 arch/arm/mach-spear3xx/spear320.c |    2 +-
 arch/arm/mach-spear3xx/spear3xx.c |    8 ++++----
 arch/arm/mach-spear6xx/spear6xx.c |   10 +++++-----
 5 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-spear3xx/spear300.c b/arch/arm/mach-spear3xx/spear300.c
index c299e52..03e050b 100644
--- a/arch/arm/mach-spear3xx/spear300.c
+++ b/arch/arm/mach-spear3xx/spear300.c
@@ -604,8 +604,7 @@ struct spear_shirq shirq_ras1 = {
 void sdhci_i2s_mem_enable(u8 mask)
 {
 	u32 val;
-	void __iomem *base = ioremap(SPEAR300_SOC_CONFIG_BASE,
-			SPEAR300_SOC_CONFIG_SIZE);
+	void __iomem *base = ioremap(SPEAR300_SOC_CONFIG_BASE, SZ_4K);
 	if (!base) {
 		pr_debug("sdhci_i2s_enb: ioremap fail\n");
 		return;
@@ -628,8 +627,7 @@ void __init spear300_init(void)
 	spear3xx_init();
 
 	/* shared irq registeration */
-	shirq_ras1.regs.base =
-		ioremap(SPEAR300_TELECOM_BASE, SPEAR300_TELECOM_REG_SIZE);
+	shirq_ras1.regs.base = ioremap(SPEAR300_TELECOM_BASE, SZ_4K);
 	if (shirq_ras1.regs.base) {
 		ret = spear_shirq_register(&shirq_ras1);
 		if (ret)
@@ -637,8 +635,7 @@ void __init spear300_init(void)
 	}
 
 	/* pmx initialization */
-	pmx_driver.base = ioremap(SPEAR300_SOC_CONFIG_BASE,
-			SPEAR300_SOC_CONFIG_SIZE);
+	pmx_driver.base = ioremap(SPEAR300_SOC_CONFIG_BASE, SZ_4K);
 	if (pmx_driver.base) {
 		ret = pmx_register(&pmx_driver);
 		if (ret)
diff --git a/arch/arm/mach-spear3xx/spear310.c b/arch/arm/mach-spear3xx/spear310.c
index 1c84303..189e3d4 100644
--- a/arch/arm/mach-spear3xx/spear310.c
+++ b/arch/arm/mach-spear3xx/spear310.c
@@ -362,7 +362,7 @@ void __init spear310_init(void)
 	spear3xx_init();
 
 	/* shared irq registeration */
-	base = ioremap(SPEAR310_SOC_CONFIG_BASE, SPEAR310_SOC_CONFIG_SIZE);
+	base = ioremap(SPEAR310_SOC_CONFIG_BASE, SZ_4K);
 	if (base) {
 		/* shirq 1 */
 		shirq_ras1.regs.base = base;
diff --git a/arch/arm/mach-spear3xx/spear320.c b/arch/arm/mach-spear3xx/spear320.c
index c228286..3f1c88b 100644
--- a/arch/arm/mach-spear3xx/spear320.c
+++ b/arch/arm/mach-spear3xx/spear320.c
@@ -694,7 +694,7 @@ void __init spear320_init(void)
 	spear3xx_init();
 
 	/* shared irq registeration */
-	base = ioremap(SPEAR320_SOC_CONFIG_BASE, SPEAR320_SOC_CONFIG_SIZE);
+	base = ioremap(SPEAR320_SOC_CONFIG_BASE, SZ_4K);
 	if (base) {
 		/* shirq 1 */
 		shirq_ras1.regs.base = base;
diff --git a/arch/arm/mach-spear3xx/spear3xx.c b/arch/arm/mach-spear3xx/spear3xx.c
index 34d8286..f7b8915 100644
--- a/arch/arm/mach-spear3xx/spear3xx.c
+++ b/arch/arm/mach-spear3xx/spear3xx.c
@@ -254,22 +254,22 @@ struct map_desc spear3xx_io_desc[] __initdata = {
 	{
 		.virtual	= VA_SPEAR3XX_ICM1_UART_BASE,
 		.pfn		= __phys_to_pfn(SPEAR3XX_ICM1_UART_BASE),
-		.length		= SPEAR3XX_ICM1_UART_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	}, {
 		.virtual	= VA_SPEAR3XX_ML1_VIC_BASE,
 		.pfn		= __phys_to_pfn(SPEAR3XX_ML1_VIC_BASE),
-		.length		= SPEAR3XX_ML1_VIC_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	}, {
 		.virtual	= VA_SPEAR3XX_ICM3_SYS_CTRL_BASE,
 		.pfn		= __phys_to_pfn(SPEAR3XX_ICM3_SYS_CTRL_BASE),
-		.length		= SPEAR3XX_ICM3_SYS_CTRL_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	}, {
 		.virtual	= VA_SPEAR3XX_ICM3_MISC_REG_BASE,
 		.pfn		= __phys_to_pfn(SPEAR3XX_ICM3_MISC_REG_BASE),
-		.length		= SPEAR3XX_ICM3_MISC_REG_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	},
 };
diff --git a/arch/arm/mach-spear6xx/spear6xx.c b/arch/arm/mach-spear6xx/spear6xx.c
index e64fc57..f91380e 100644
--- a/arch/arm/mach-spear6xx/spear6xx.c
+++ b/arch/arm/mach-spear6xx/spear6xx.c
@@ -408,27 +408,27 @@ static struct map_desc spear6xx_io_desc[] __initdata = {
 	{
 		.virtual	= VA_SPEAR6XX_ICM1_UART0_BASE,
 		.pfn		= __phys_to_pfn(SPEAR6XX_ICM1_UART0_BASE),
-		.length		= SPEAR6XX_ICM1_UART0_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	}, {
 		.virtual	= VA_SPEAR6XX_CPU_VIC_PRI_BASE,
 		.pfn		= __phys_to_pfn(SPEAR6XX_CPU_VIC_PRI_BASE),
-		.length		= SPEAR6XX_CPU_VIC_PRI_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	}, {
 		.virtual	= VA_SPEAR6XX_CPU_VIC_SEC_BASE,
 		.pfn		= __phys_to_pfn(SPEAR6XX_CPU_VIC_SEC_BASE),
-		.length		= SPEAR6XX_CPU_VIC_SEC_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	}, {
 		.virtual	= VA_SPEAR6XX_ICM3_SYS_CTRL_BASE,
 		.pfn		= __phys_to_pfn(SPEAR6XX_ICM3_SYS_CTRL_BASE),
-		.length		= SPEAR6XX_ICM3_MISC_REG_BASE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	}, {
 		.virtual	= VA_SPEAR6XX_ICM3_MISC_REG_BASE,
 		.pfn		= __phys_to_pfn(SPEAR6XX_ICM3_MISC_REG_BASE),
-		.length		= SPEAR6XX_ICM3_MISC_REG_SIZE,
+		.length		= SZ_4K,
 		.type		= MT_DEVICE
 	},
 };
-- 
1.7.2.2
