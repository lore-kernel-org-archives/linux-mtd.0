From: Viresh KUMAR <viresh.kumar@st.com>
To: linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com,
	a.zummo@towertech.it, dbrownell@users.sourceforge.net,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Subject: [PATCH V2 33/69] ST SPEAr: Changing resource size of amba devices to
	SZ_4K
Date: Fri,  1 Oct 2010 17:25:53 +0530
Message-Id: <1243c267fb4511427b22adaf6824d9cad25d3b36.1285933332.git.viresh.kumar@st.com>
In-Reply-To: <cover.1285933331.git.viresh.kumar@st.com>
References: <cover.1285933331.git.viresh.kumar@st.com>
In-Reply-To: <cover.1285933331.git.viresh.kumar@st.com>
References: <cover.1285933331.git.viresh.kumar@st.com>
Cc: pratyush.anand@st.com, Viresh Kumar <viresh.kumar@st.com>,
	vipulkumar.samar@st.com, bhupesh.sharma@st.com,
	armando.visconti@st.com, vipin.kumar@st.com,
	shiraz.hashim@st.com, rajeev-dlh.kumar@st.com, deepak.sikri@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
Signed-off-by: Rajeev Kumar <rajeev-dlh.kumar@st.com>
---
 arch/arm/mach-spear3xx/spear300.c |    2 +-
 arch/arm/mach-spear3xx/spear320.c |    2 +-
 arch/arm/mach-spear3xx/spear3xx.c |    2 +-
 arch/arm/mach-spear6xx/spear6xx.c |    8 +++-----
 4 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-spear3xx/spear300.c b/arch/arm/mach-spear3xx/spear300.c
index fd83f53..c299e52 100644
--- a/arch/arm/mach-spear3xx/spear300.c
+++ b/arch/arm/mach-spear3xx/spear300.c
@@ -382,7 +382,7 @@ struct amba_device clcd_device = {
 	},
 	.res = {
 		.start = SPEAR300_CLCD_BASE,
-		.end = SPEAR300_CLCD_BASE + SPEAR300_CLCD_SIZE - 1,
+		.end = SPEAR300_CLCD_BASE + SZ_4K - 1,
 		.flags = IORESOURCE_MEM,
 	},
 	.dma_mask = ~0,
diff --git a/arch/arm/mach-spear3xx/spear320.c b/arch/arm/mach-spear3xx/spear320.c
index e14e201..c228286 100644
--- a/arch/arm/mach-spear3xx/spear320.c
+++ b/arch/arm/mach-spear3xx/spear320.c
@@ -399,7 +399,7 @@ struct amba_device clcd_device = {
 	},
 	.res = {
 		.start = SPEAR320_CLCD_BASE,
-		.end = SPEAR320_CLCD_BASE + SPEAR320_CLCD_SIZE - 1,
+		.end = SPEAR320_CLCD_BASE + SZ_4K - 1,
 		.flags = IORESOURCE_MEM,
 	},
 	.dma_mask = ~0,
diff --git a/arch/arm/mach-spear3xx/spear3xx.c b/arch/arm/mach-spear3xx/spear3xx.c
index b4c3ad7..34d8286 100644
--- a/arch/arm/mach-spear3xx/spear3xx.c
+++ b/arch/arm/mach-spear3xx/spear3xx.c
@@ -79,7 +79,7 @@ struct amba_device uart_device = {
 	},
 	.res = {
 		.start = SPEAR3XX_ICM1_UART_BASE,
-		.end = SPEAR3XX_ICM1_UART_BASE + SPEAR3XX_ICM1_UART_SIZE - 1,
+		.end = SPEAR3XX_ICM1_UART_BASE + SZ_4K - 1,
 		.flags = IORESOURCE_MEM,
 	},
 	.irq = {IRQ_UART, NO_IRQ},
diff --git a/arch/arm/mach-spear6xx/spear6xx.c b/arch/arm/mach-spear6xx/spear6xx.c
index 82788e1..e64fc57 100644
--- a/arch/arm/mach-spear6xx/spear6xx.c
+++ b/arch/arm/mach-spear6xx/spear6xx.c
@@ -35,7 +35,7 @@ struct amba_device clcd_device = {
 	},
 	.res = {
 		.start = SPEAR6XX_ICM3_CLCD_BASE,
-		.end = SPEAR6XX_ICM3_CLCD_BASE + SPEAR6XX_ICM3_CLCD_SIZE - 1,
+		.end = SPEAR6XX_ICM3_CLCD_BASE + SZ_4K - 1,
 		.flags = IORESOURCE_MEM,
 	},
 	.dma_mask = ~0,
@@ -117,8 +117,7 @@ struct amba_device uart_device[] = {
 		},
 		.res = {
 			.start = SPEAR6XX_ICM1_UART0_BASE,
-			.end = SPEAR6XX_ICM1_UART0_BASE +
-				SPEAR6XX_ICM1_UART0_SIZE - 1,
+			.end = SPEAR6XX_ICM1_UART0_BASE + SZ_4K - 1,
 			.flags = IORESOURCE_MEM,
 		},
 		.irq = {IRQ_UART_0, NO_IRQ},
@@ -128,8 +127,7 @@ struct amba_device uart_device[] = {
 		},
 		.res = {
 			.start = SPEAR6XX_ICM1_UART1_BASE,
-			.end = SPEAR6XX_ICM1_UART1_BASE +
-				SPEAR6XX_ICM1_UART1_SIZE - 1,
+			.end = SPEAR6XX_ICM1_UART1_BASE + SZ_4K - 1,
 			.flags = IORESOURCE_MEM,
 		},
 		.irq = {IRQ_UART_1, NO_IRQ},
-- 
1.7.2.2
