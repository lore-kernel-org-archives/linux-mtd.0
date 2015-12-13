Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FOs-0005TS-62
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:45:55 +0000
Subject: [PATCH linux-next v4 01/11] MIPS: bcm963xx: Add Broadcom BCM963xx
 board nvram data structure
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF50A.3090902@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:45:30 +0000
MIME-Version: 1.0
In-Reply-To: <566DF43B.5010400@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Broadcom BCM963xx boards have multiple nvram variants across different
SoCs with additional checksum fields added whenever the size of the
nvram was extended.

Add this structure as a header file so that multiple drivers can use it.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v4: Move out of uapi.

    Add nand offset/size functions/macros.

    Add checksum calculation function.

v3: Fix includes/type names, add comments explaining the nvram struct.

v2: Use external struct bcm963xx_nvram definition for bcm963268part.

 MAINTAINERS                    |   1 +
 include/linux/bcm963xx_nvram.h | 112 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 include/linux/bcm963xx_nvram.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 31fc0bf..ac7de1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2391,6 +2391,7 @@ F:	arch/mips/kernel/*bmips*
 F:	arch/mips/boot/dts/brcm/bcm*.dts*
 F:	drivers/irqchip/irq-bcm7*
 F:	drivers/irqchip/irq-brcmstb*
+F:	include/linux/bcm963xx_nvram.h
 
 BROADCOM TG3 GIGABIT ETHERNET DRIVER
 M:	Prashant Sreedharan <prashant@broadcom.com>
diff --git a/include/linux/bcm963xx_nvram.h b/include/linux/bcm963xx_nvram.h
new file mode 100644
index 0000000..290c231
--- /dev/null
+++ b/include/linux/bcm963xx_nvram.h
@@ -0,0 +1,112 @@
+#ifndef __LINUX_BCM963XX_NVRAM_H__
+#define __LINUX_BCM963XX_NVRAM_H__
+
+#include <linux/crc32.h>
+#include <linux/if_ether.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+/*
+ * Broadcom BCM963xx SoC board nvram data structure.
+ *
+ * The nvram structure varies in size depending on the SoC board version. Use
+ * the appropriate minimum BCM963XX_NVRAM_*_SIZE define for the information
+ * you need instead of sizeof(struct bcm963xx_nvram) as this may change.
+ */
+
+#define BCM963XX_NVRAM_V4_SIZE		300
+#define BCM963XX_NVRAM_V5_SIZE		(1 * SZ_1K)
+
+#define BCM963XX_DEFAULT_PSI_SIZE	64
+
+enum bcm963xx_nvram_nand_part {
+	BCM963XX_NVRAM_NAND_PART_BOOT = 0,
+	BCM963XX_NVRAM_NAND_PART_ROOTFS_1,
+	BCM963XX_NVRAM_NAND_PART_ROOTFS_2,
+	BCM963XX_NVRAM_NAND_PART_DATA,
+	BCM963XX_NVRAM_NAND_PART_BBT,
+
+	__BCM963XX_NVRAM_NAND_NR_PARTS
+};
+
+struct bcm963xx_nvram {
+	u32	version;
+	char	bootline[256];
+	char	name[16];
+	u32	main_tp_number;
+	u32	psi_size;
+	u32	mac_addr_count;
+	u8	mac_addr_base[ETH_ALEN];
+	u8	__reserved1[2];
+	u32	checksum_v4;
+
+	u8	__reserved2[292];
+	u32	nand_part_offset[__BCM963XX_NVRAM_NAND_NR_PARTS];
+	u32	nand_part_size[__BCM963XX_NVRAM_NAND_NR_PARTS];
+	u8	__reserved3[388];
+	u32	checksum_v5;
+};
+
+#define BCM963XX_NVRAM_NAND_PART_OFFSET(nvram, part) \
+	bcm963xx_nvram_nand_part_offset(nvram, BCM963XX_NVRAM_NAND_PART_ ##part)
+
+static inline u64 __pure bcm963xx_nvram_nand_part_offset(
+	const struct bcm963xx_nvram *nvram,
+	enum bcm963xx_nvram_nand_part part)
+{
+	return nvram->nand_part_offset[part] * SZ_1K;
+}
+
+#define BCM963XX_NVRAM_NAND_PART_SIZE(nvram, part) \
+	bcm963xx_nvram_nand_part_size(nvram, BCM963XX_NVRAM_NAND_PART_ ##part)
+
+static inline u64 __pure bcm963xx_nvram_nand_part_size(
+	const struct bcm963xx_nvram *nvram,
+	enum bcm963xx_nvram_nand_part part)
+{
+	return nvram->nand_part_size[part] * SZ_1K;
+}
+
+/*
+ * bcm963xx_nvram_checksum - Verify nvram checksum
+ *
+ * @nvram: pointer to full size nvram data structure
+ * @expected_out: optional pointer to store expected checksum value
+ * @actual_out: optional pointer to store actual checksum value
+ *
+ * Return: 0 if the checksum is valid, otherwise -EINVAL
+ */
+static int __maybe_unused bcm963xx_nvram_checksum(
+	const struct bcm963xx_nvram *nvram,
+	u32 *expected_out, u32 *actual_out)
+{
+	u32 expected, actual;
+	size_t len;
+
+	if (nvram->version <= 4) {
+		expected = nvram->checksum_v4;
+		len = BCM963XX_NVRAM_V4_SIZE - sizeof(u32);
+	} else {
+		expected = nvram->checksum_v5;
+		len = BCM963XX_NVRAM_V5_SIZE - sizeof(u32);
+	}
+
+	/*
+	 * Calculate the CRC32 value for the nvram with a checksum value
+	 * of 0 without modifying or copying the nvram by combining:
+	 * - The CRC32 of the nvram without the checksum value
+	 * - The CRC32 of a zero checksum value (which is also 0)
+	 */
+	actual = crc32_le_combine(
+		crc32_le(~0, (u8 *)nvram, len), 0, sizeof(u32));
+
+	if (expected_out)
+		*expected_out = expected;
+
+	if (actual_out)
+		*actual_out = actual;
+
+	return expected == actual ? 0 : -EINVAL;
+};
+
+#endif /* __LINUX_BCM963XX_NVRAM_H__ */
-- 
2.1.4

-- 
Simon Arlott
