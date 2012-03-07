Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F65-0006VO-Kj
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:31:59 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/18] mtd/nand/fsmc: Move ALE,
 CLE defines to their respective platform
Date: Wed, 7 Mar 2012 17:00:52 +0530
Message-ID: <d1585fba77c15ddf8b7ed5bc7eb688116af7416b.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Artem.Bityutskiy@nokia.com, linus.walleij@linaro.org,
 Shiraz Hashim <shiraz.hashim@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shiraz Hashim <shiraz.hashim@st.com>

Address Latch Enable (ALE) and Command Latch Enable (CLE) defines are
platform specific and were wrongly put in driver specific fsmc.h file.
Move such defines to their respective platform.

Also instead of relying on fsmc driver, pass ALE, CLE offsets explicitly
from individual platform.

Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
---
 arch/arm/mach-u300/core.c                   |    2 ++
 arch/arm/mach-u300/include/mach/u300-regs.h |    5 +++++
 include/linux/mtd/fsmc.h                    |   13 -------------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
index 336526a..cb81d3c 100644
--- a/arch/arm/mach-u300/core.c
+++ b/arch/arm/mach-u300/core.c
@@ -1543,6 +1543,8 @@ static struct fsmc_nand_platform_data nand_platform_data = {
 	.nr_partitions = ARRAY_SIZE(u300_partitions),
 	.options = NAND_SKIP_BBTSCAN,
 	.width = FSMC_NAND_BW8,
+	.ale_off = PLAT_NAND_ALE,
+	.cle_off = PLAT_NAND_CLE,
 };
 
 static struct platform_device nand_device = {
diff --git a/arch/arm/mach-u300/include/mach/u300-regs.h b/arch/arm/mach-u300/include/mach/u300-regs.h
index 035fdc9..b9701fb 100644
--- a/arch/arm/mach-u300/include/mach/u300-regs.h
+++ b/arch/arm/mach-u300/include/mach/u300-regs.h
@@ -30,6 +30,11 @@
 /* NFIF */
 #define U300_NAND_IF_PHYS_BASE		0x9f800000
 
+/* ALE, CLE offset for FSMC NAND */
+#define PLAT_NAND_CLE			(1 << 16)
+#define PLAT_NAND_ALE			(1 << 17)
+
+
 /* AHB Peripherals */
 #define U300_AHB_PER_PHYS_BASE		0xa0000000
 #define U300_AHB_PER_VIRT_BASE		0xff010000
diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index 2cd655f..e877325 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -26,19 +26,6 @@
 #define FSMC_NAND_BW8		1
 #define FSMC_NAND_BW16		2
 
-/*
- * The placement of the Command Latch Enable (CLE) and
- * Address Latch Enable (ALE) is twisted around in the
- * SPEAR310 implementation.
- */
-#if defined(CONFIG_MACH_SPEAR310)
-#define PLAT_NAND_CLE		(1 << 17)
-#define PLAT_NAND_ALE		(1 << 16)
-#else
-#define PLAT_NAND_CLE		(1 << 16)
-#define PLAT_NAND_ALE		(1 << 17)
-#endif
-
 #define FSMC_MAX_NOR_BANKS	4
 #define FSMC_MAX_NAND_BANKS	4
 
-- 
1.7.0.4
