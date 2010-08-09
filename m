From: Sekhar Nori <nsekhar@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] davinci: am17x/da830/omap-l137 evm: setup NAND flash
	timing
Date: Mon,  9 Aug 2010 15:46:38 +0530
Message-Id: <1281349000-822-5-git-send-email-nsekhar@ti.com>
In-Reply-To: <1281349000-822-4-git-send-email-nsekhar@ti.com>
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
	<1281349000-822-2-git-send-email-nsekhar@ti.com>
	<1281349000-822-3-git-send-email-nsekhar@ti.com>
	<1281349000-822-4-git-send-email-nsekhar@ti.com>
Cc: davinci-linux-open-source@linux.davincidsp.com,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	Kevin Hilman <khilman@deeprootsystems.com>, Sekhar Nori <nsekhar@ti.com>,
	Mukul Bhatnagar <mbhatnagar@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sudhakar Rajashekhara <sudhakar.raj@ti.com>

Setup the NAND flash timings for DA830 EVM.

Before configuring the timing values, throughput calculation
using dd command yielded 477 kB/s write and 970 kB/s read speed.

After the timing configuration, the throughput was measured to
be 2.5 MB/s write and 5.1 MB/s read.

[Mukul Bhatnagar: actual calculation of timing values from the
NAND datasheet]

Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Cc: Mukul Bhatnagar <mbhatnagar@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
Acked-by: Kevin Hilman <khilman@deeprootsystems.com>
---
 arch/arm/mach-davinci/board-da830-evm.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index b61e872..4edbf3d 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -29,6 +29,7 @@
 #include <mach/nand.h>
 #include <mach/da8xx.h>
 #include <mach/usb.h>
+#include <mach/aemif.h>
 
 #define DA830_EVM_PHY_MASK		0x0
 #define DA830_EVM_MDIO_FREQUENCY	2200000	/* PHY bus frequency */
@@ -360,6 +361,16 @@ static struct nand_bbt_descr da830_evm_nand_bbt_mirror_descr = {
 	.pattern	= da830_evm_nand_mirror_pattern
 };
 
+static struct davinci_aemif_timing da830_evm_nandflash_timing = {
+	.wsetup         = 24,
+	.wstrobe        = 21,
+	.whold          = 14,
+	.rsetup         = 19,
+	.rstrobe        = 50,
+	.rhold          = 0,
+	.ta             = 20,
+};
+
 static struct davinci_nand_pdata da830_evm_nand_pdata = {
 	.parts		= da830_evm_nand_partitions,
 	.nr_parts	= ARRAY_SIZE(da830_evm_nand_partitions),
@@ -368,6 +379,7 @@ static struct davinci_nand_pdata da830_evm_nand_pdata = {
 	.options	= NAND_USE_FLASH_BBT,
 	.bbt_td		= &da830_evm_nand_bbt_main_descr,
 	.bbt_md		= &da830_evm_nand_bbt_mirror_descr,
+	.timing         = &da830_evm_nandflash_timing,
 };
 
 static struct resource da830_evm_nand_resources[] = {
-- 
1.6.2.4
