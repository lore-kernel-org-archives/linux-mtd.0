Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7VgC-0002g7-Ls
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2015 21:56:45 +0000
Subject: [PATCH linux-next (v3) 2/3] MIPS: bcm63xx: nvram: Use nvram structure
 definition from header file
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Kevin Cernekee <cernekee@gmail.com>
References: <566B460F.1040603@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MIPS Mailing List <linux-mips@linux-mips.org>, linux-api@vger.kernel.org
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566B4681.7030904@simon.arlott.org.uk>
Date: Fri, 11 Dec 2015 21:56:17 +0000
MIME-Version: 1.0
In-Reply-To: <566B460F.1040603@simon.arlott.org.uk>
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

Use the common definition of the nvram structure from the header file
include/uapi/linux/bcm963xx_nvram.h instead of maintaining a separate
copy.

Read the version 5 size of nvram data from memory and then support the
version 4 and version 5 variants of nvram data checksums.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
Compile tested only (there is no support for brcmnand on mach-bcm63xx).

v3: No changes (reworded commit message).

v2: Use external struct bcm963xx_nvram definition for bcm963268part.

 arch/mips/bcm63xx/nvram.c | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/arch/mips/bcm63xx/nvram.c b/arch/mips/bcm63xx/nvram.c
index 4b50d40..36e74f9 100644
--- a/arch/mips/bcm63xx/nvram.c
+++ b/arch/mips/bcm63xx/nvram.c
@@ -16,25 +16,9 @@
 #include <linux/kernel.h>
 #include <linux/if_ether.h>
 
+#include <uapi/linux/bcm963xx_nvram.h>
 #include <bcm63xx_nvram.h>
 
-/*
- * nvram structure
- */
-struct bcm963xx_nvram {
-	u32	version;
-	u8	reserved1[256];
-	u8	name[16];
-	u32	main_tp_number;
-	u32	psi_size;
-	u32	mac_addr_count;
-	u8	mac_addr_base[ETH_ALEN];
-	u8	reserved2[2];
-	u32	checksum_old;
-	u8	reserved3[720];
-	u32	checksum_high;
-};
-
 #define BCM63XX_DEFAULT_PSI_SIZE	64
 
 static struct bcm963xx_nvram nvram;
@@ -47,17 +31,17 @@ void __init bcm63xx_nvram_init(void *addr)
 	u8 hcs_mac_addr[ETH_ALEN] = { 0x00, 0x10, 0x18, 0xff, 0xff, 0xff };
 
 	/* extract nvram data */
-	memcpy(&nvram, addr, sizeof(nvram));
+	memcpy(&nvram, addr, BCM963XX_NVRAM_V5_SIZE);
 
 	/* check checksum before using data */
 	if (nvram.version <= 4) {
-		check_len = offsetof(struct bcm963xx_nvram, reserved3);
-		expected_crc = nvram.checksum_old;
-		nvram.checksum_old = 0;
+		check_len = BCM963XX_NVRAM_V4_SIZE;
+		expected_crc = nvram.checksum_v4;
+		nvram.checksum_v4 = 0;
 	} else {
-		check_len = sizeof(nvram);
-		expected_crc = nvram.checksum_high;
-		nvram.checksum_high = 0;
+		check_len = BCM963XX_NVRAM_V5_SIZE;
+		expected_crc = nvram.checksum_v5;
+		nvram.checksum_v5 = 0;
 	}
 
 	crc = crc32_le(~0, (u8 *)&nvram, check_len);
-- 
2.1.4

-- 
Simon Arlott
