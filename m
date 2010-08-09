From: Sekhar Nori <nsekhar@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 6/6] davinci: dm6467t evm: setup NAND flash timing
Date: Mon,  9 Aug 2010 15:46:40 +0530
Message-Id: <1281349000-822-7-git-send-email-nsekhar@ti.com>
In-Reply-To: <1281349000-822-6-git-send-email-nsekhar@ti.com>
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
	<1281349000-822-2-git-send-email-nsekhar@ti.com>
	<1281349000-822-3-git-send-email-nsekhar@ti.com>
	<1281349000-822-4-git-send-email-nsekhar@ti.com>
	<1281349000-822-5-git-send-email-nsekhar@ti.com>
	<1281349000-822-6-git-send-email-nsekhar@ti.com>
Cc: Kevin Hilman <khilman@deeprootsystems.com>, Sekhar Nori <nsekhar@ti.com>,
	davinci-linux-open-source@linux.davincidsp.com,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Setup NAND flash timing on DM6467T EVM.

Without the timing setup, the NAND flash on DM6467T
RevC EVM reports a number of random bad blocks because
of read errors.

Also, with this, copying a 100M file on RevB EVM takes
~35 sec against 1 minute 30 seconds earlier.

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
Acked-by: Kevin Hilman <khilman@deeprootsystems.com>
---
v2: DM6467T and DM6467 EVMs use slightly different NAND parts, made the
    timing configuration specific to DM6467T.

 arch/arm/mach-davinci/board-dm646x-evm.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index b8b1dec..c8843c9 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -42,6 +42,7 @@
 #include <mach/nand.h>
 #include <mach/clock.h>
 #include <mach/cdce949.h>
+#include <mach/aemif.h>
 
 #include "clock.h"
 
@@ -71,6 +72,16 @@ static struct mtd_partition davinci_nand_partitions[] = {
 	}
 };
 
+static struct davinci_aemif_timing dm6467tevm_nandflash_timing = {
+	.wsetup		= 29,
+	.wstrobe	= 24,
+	.whold		= 14,
+	.rsetup		= 19,
+	.rstrobe	= 33,
+	.rhold		= 0,
+	.ta		= 29,
+};
+
 static struct davinci_nand_pdata davinci_nand_data = {
 	.mask_cle 		= 0x80000,
 	.mask_ale 		= 0x40000,
@@ -763,6 +774,9 @@ static __init void evm_init(void)
 	dm646x_init_mcasp0(&dm646x_evm_snd_data[0]);
 	dm646x_init_mcasp1(&dm646x_evm_snd_data[1]);
 
+	if (machine_is_davinci_dm6467tevm())
+		davinci_nand_data.timing = &dm6467tevm_nandflash_timing;
+
 	platform_device_register(&davinci_nand_device);
 
 	dm646x_init_edma(dm646x_edma_rsv);
-- 
1.6.2.4
