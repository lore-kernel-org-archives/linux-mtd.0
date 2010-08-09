From: Sekhar Nori <nsekhar@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] davinci: am18x/da850/omap-l138 evm: setup NAND flash
	timing
Date: Mon,  9 Aug 2010 15:46:39 +0530
Message-Id: <1281349000-822-6-git-send-email-nsekhar@ti.com>
In-Reply-To: <1281349000-822-5-git-send-email-nsekhar@ti.com>
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
	<1281349000-822-2-git-send-email-nsekhar@ti.com>
	<1281349000-822-3-git-send-email-nsekhar@ti.com>
	<1281349000-822-4-git-send-email-nsekhar@ti.com>
	<1281349000-822-5-git-send-email-nsekhar@ti.com>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, Sekhar Nori <nsekhar@ti.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	Mukul Bhatnagar <mbhatnagar@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Setup the NAND flash timings for DA850 EVM

Before configuring the timing values, throughput calculation
using dd command yielded 469 kB/s write and 966 kB/s read speed.

After the timing configuration, the throughput was measured to
be 2.4 MB/s write and 5 MB/s read.

[Mukul Bhatnagar: actual calculation of timing values from the
NAND datasheet]

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
Cc: Mukul Bhatnagar <mbhatnagar@ti.com>
Acked-by: Kevin Hilman <khilman@deeprootsystems.com>
---
 arch/arm/mach-davinci/board-da850-evm.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index fa429cc..b5ac86f 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -36,6 +36,7 @@
 #include <mach/da8xx.h>
 #include <mach/nand.h>
 #include <mach/mux.h>
+#include <mach/aemif.h>
 
 #define DA850_EVM_PHY_MASK		0x1
 #define DA850_EVM_MDIO_FREQUENCY	2200000 /* PHY bus frequency */
@@ -143,12 +144,23 @@ static struct mtd_partition da850_evm_nandflash_partition[] = {
 	},
 };
 
+static struct davinci_aemif_timing da850_evm_nandflash_timing = {
+	.wsetup		= 24,
+	.wstrobe	= 21,
+	.whold		= 14,
+	.rsetup		= 19,
+	.rstrobe	= 50,
+	.rhold		= 0,
+	.ta		= 20,
+};
+
 static struct davinci_nand_pdata da850_evm_nandflash_data = {
 	.parts		= da850_evm_nandflash_partition,
 	.nr_parts	= ARRAY_SIZE(da850_evm_nandflash_partition),
 	.ecc_mode	= NAND_ECC_HW,
 	.ecc_bits	= 4,
 	.options	= NAND_USE_FLASH_BBT,
+	.timing		= &da850_evm_nandflash_timing,
 };
 
 static struct resource da850_evm_nandflash_resource[] = {
-- 
1.6.2.4
