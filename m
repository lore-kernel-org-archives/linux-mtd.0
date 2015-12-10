Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7AGn-0003zi-1q
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 23:05:06 +0000
From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH linux-next (v2) 1/3] MIPS: bcm963xx: Add nvram structure
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Kevin Cernekee <cernekee@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MIPS Mailing List <linux-mips@linux-mips.org>, linux-api@vger.kernel.org
Message-ID: <566A04FB.7000104@simon.arlott.org.uk>
Date: Thu, 10 Dec 2015 23:04:27 +0000
MIME-Version: 1.0
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

The BCM963xx has multiple nvram variants across different SoCs with
additional checksum fields added whenever the size of the nvram was
extended.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v2: Use external struct bcm963xx_nvram definition for bcm963268part.

 MAINTAINERS                         |  1 +
 include/uapi/linux/bcm963xx_nvram.h | 39 +++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/uapi/linux/bcm963xx_nvram.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1354720..5d2272c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2396,6 +2396,7 @@ F:	drivers/irqchip/irq-brcmstb*
 F:	drivers/power/bcm6358*
 F:	drivers/reset/bcm/reset-bcm6345*
 F:	include/linux/bcm63xx_wdt.h
+F:	include/uapi/linux/bcm963xx_nvram.h
 
 BROADCOM TG3 GIGABIT ETHERNET DRIVER
 M:	Prashant Sreedharan <prashant@broadcom.com>
diff --git a/include/uapi/linux/bcm963xx_nvram.h b/include/uapi/linux/bcm963xx_nvram.h
new file mode 100644
index 0000000..470a4b9
--- /dev/null
+++ b/include/uapi/linux/bcm963xx_nvram.h
@@ -0,0 +1,39 @@
+#ifndef _UAPI__LINUX_BCM963XX_NVRAM_H__
+#define _UAPI__LINUX_BCM963XX_NVRAM_H__
+
+#include <linux/sizes.h>
+#include <linux/types.h>
+#include <linux/if_ether.h>
+
+#define BCM963XX_NVRAM_V4_SIZE		300
+#define BCM963XX_NVRAM_V5_SIZE		(1 * SZ_1K)
+#define BCM963XX_NVRAM_V6_SIZE		BCM963XX_NVRAM_V5_SIZE
+#define BCM963XX_NVRAM_V7_SIZE		(3 * SZ_1K)
+
+#define BCM963XX_NVRAM_NR_PARTS		5
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
+	u32	nand_part_offset[BCM963XX_NVRAM_NR_PARTS];
+	u32	nand_part_size[BCM963XX_NVRAM_NR_PARTS];
+	u8	__reserved3[388];
+	union {
+		u32	checksum_v5;
+		u32	checksum_v6;
+	};
+
+	u8	__reserved4[2044];
+	u32	checksum_v7;
+} __packed;
+
+#endif /* _UAPI__LINUX_BCM963XX_NVRAM_H__ */
-- 
2.1.4

-- 
Simon Arlott
