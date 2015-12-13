Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FPb-0005cs-KQ
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:46:40 +0000
Subject: [PATCH linux-next v4 02/11] MIPS: bcm63xx: nvram: Use nvram structure
 definition from header file
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF537.4080602@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:46:15 +0000
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

Use the common definition of the nvram structure from the header file
include/linux/bcm963xx_nvram.h instead of maintaining a separate copy.

Read the version 5 size of nvram data from memory and then call the
new checksum verification function from the header file.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v4: Use checksum verification function from header file.

v3: No changes (reworded commit message).

v2: Use external struct bcm963xx_nvram definition for bcm963268part.

 arch/mips/bcm63xx/nvram.c | 35 +++--------------------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/arch/mips/bcm63xx/nvram.c b/arch/mips/bcm63xx/nvram.c
index 4b50d40..05757ae 100644
--- a/arch/mips/bcm63xx/nvram.c
+++ b/arch/mips/bcm63xx/nvram.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "bcm63xx_nvram: " fmt
 
+#include <linux/bcm963xx_nvram.h>
 #include <linux/init.h>
 #include <linux/crc32.h>
 #include <linux/export.h>
@@ -18,23 +19,6 @@
 
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
@@ -42,27 +26,14 @@ static int mac_addr_used;
 
 void __init bcm63xx_nvram_init(void *addr)
 {
-	unsigned int check_len;
 	u32 crc, expected_crc;
 	u8 hcs_mac_addr[ETH_ALEN] = { 0x00, 0x10, 0x18, 0xff, 0xff, 0xff };
 
 	/* extract nvram data */
-	memcpy(&nvram, addr, sizeof(nvram));
+	memcpy(&nvram, addr, BCM963XX_NVRAM_V5_SIZE);
 
 	/* check checksum before using data */
-	if (nvram.version <= 4) {
-		check_len = offsetof(struct bcm963xx_nvram, reserved3);
-		expected_crc = nvram.checksum_old;
-		nvram.checksum_old = 0;
-	} else {
-		check_len = sizeof(nvram);
-		expected_crc = nvram.checksum_high;
-		nvram.checksum_high = 0;
-	}
-
-	crc = crc32_le(~0, (u8 *)&nvram, check_len);
-
-	if (crc != expected_crc)
+	if (bcm963xx_nvram_checksum(&nvram, &expected_crc, &crc))
 		pr_warn("nvram checksum failed, contents may be invalid (expected %08x, got %08x)\n",
 			expected_crc, crc);
 
-- 
2.1.4

-- 
Simon Arlott
