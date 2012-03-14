Received: from eu1sys200aog112.obsmtp.com ([207.126.144.133])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXM-0002jf-Hz
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:17 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 02/13] nand/fsmc: Remove default partition information from
 driver
Date: Wed, 14 Mar 2012 11:47:08 +0530
Message-ID: <df54c552b11d53acac2f1cfdf47e298acdec0b2b.1331705527.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sr@denx.de, Armando Visconti <armando.visconti@st.com>,
 linus.walleij@linaro.org, spear-devel@list.st.com,
 Vipin Kumar <vipin.kumar@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Armando Visconti <armando.visconti@st.com>

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   58 ------------------------------------------
 1 files changed, 0 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 2d7683b..ac45b41 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -269,64 +269,6 @@ static struct fsmc_eccplace fsmc_ecc4_sp_place = {
 	}
 };
 
-/*
- * Default partition tables to be used if the partition information not
- * provided through platform data.
- *
- * Default partition layout for small page(= 512 bytes) devices
- * Size for "Root file system" is updated in driver based on actual device size
- */
-static struct mtd_partition partition_info_16KB_blk[] = {
-	{
-		.name = "X-loader",
-		.offset = 0,
-		.size = 4*0x4000,
-	},
-	{
-		.name = "U-Boot",
-		.offset = 0x10000,
-		.size = 20*0x4000,
-	},
-	{
-		.name = "Kernel",
-		.offset = 0x60000,
-		.size = 256*0x4000,
-	},
-	{
-		.name = "Root File System",
-		.offset = 0x460000,
-		.size = MTDPART_SIZ_FULL,
-	},
-};
-
-/*
- * Default partition layout for large page(> 512 bytes) devices
- * Size for "Root file system" is updated in driver based on actual device size
- */
-static struct mtd_partition partition_info_128KB_blk[] = {
-	{
-		.name = "X-loader",
-		.offset = 0,
-		.size = 4*0x20000,
-	},
-	{
-		.name = "U-Boot",
-		.offset = 0x80000,
-		.size = 12*0x20000,
-	},
-	{
-		.name = "Kernel",
-		.offset = 0x200000,
-		.size = 48*0x20000,
-	},
-	{
-		.name = "Root File System",
-		.offset = 0x800000,
-		.size = MTDPART_SIZ_FULL,
-	},
-};
-
-
 /**
  * struct fsmc_nand_data - structure for FSMC NAND device state
  *
-- 
1.7.0.4
