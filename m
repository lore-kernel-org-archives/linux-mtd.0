From: Sekhar Nori <nsekhar@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/6] davinci: dm644x evm: setup NAND flash timing
Date: Mon,  9 Aug 2010 15:46:37 +0530
Message-Id: <1281349000-822-4-git-send-email-nsekhar@ti.com>
In-Reply-To: <1281349000-822-3-git-send-email-nsekhar@ti.com>
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
	<1281349000-822-2-git-send-email-nsekhar@ti.com>
	<1281349000-822-3-git-send-email-nsekhar@ti.com>
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

The DM644x EVM nand flash timing was earlier being
done as a special case in the NAND driver itself.

With the NAND driver now capable of progamming the
AEMIF interface using timing data passed from the
platform, the timing values are being moved into
their rightful place in the EVM specific board file.

The values being programmed match what was being done
earlier and thus do not represent any change in
performance/functionality.

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
Acked-by: Kevin Hilman <khilman@deeprootsystems.com>
---
 arch/arm/mach-davinci/board-dm644x-evm.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index 34c8b41..65bb940 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -37,6 +37,7 @@
 #include <mach/nand.h>
 #include <mach/mmc.h>
 #include <mach/usb.h>
+#include <mach/aemif.h>
 
 #define DM644X_EVM_PHY_MASK		(0x2)
 #define DM644X_EVM_MDIO_FREQUENCY	(2200000) /* PHY bus frequency */
@@ -137,11 +138,22 @@ static struct mtd_partition davinci_evm_nandflash_partition[] = {
 	 */
 };
 
+static struct davinci_aemif_timing davinci_evm_nandflash_timing = {
+	.wsetup		= 20,
+	.wstrobe	= 40,
+	.whold		= 20,
+	.rsetup		= 10,
+	.rstrobe	= 40,
+	.rhold		= 10,
+	.ta		= 40,
+};
+
 static struct davinci_nand_pdata davinci_evm_nandflash_data = {
 	.parts		= davinci_evm_nandflash_partition,
 	.nr_parts	= ARRAY_SIZE(davinci_evm_nandflash_partition),
 	.ecc_mode	= NAND_ECC_HW,
 	.options	= NAND_USE_FLASH_BBT,
+	.timing		= &davinci_evm_nandflash_timing,
 };
 
 static struct resource davinci_evm_nandflash_resource[] = {
-- 
1.6.2.4
