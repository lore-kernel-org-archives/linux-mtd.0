Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8FTR-0007mZ-JE
 for linux-mtd@lists.infradead.org; Sun, 13 Dec 2015 22:50:38 +0000
Subject: [PATCH linux-next v4 07/11] MIPS: bcm63xx: nvram: Remove unused
 bcm63xx_nvram_get_psi_size() function
To: Ralf Baechle <ralf@linux-mips.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
References: <566DF43B.5010400@simon.arlott.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <566DF625.3060801@simon.arlott.org.uk>
Date: Sun, 13 Dec 2015 22:50:13 +0000
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

Remove bcm63xx_nvram_get_psi_size() as it now has no users.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
v4: New patch.

 arch/mips/bcm63xx/nvram.c                          | 11 -----------
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |  2 --
 2 files changed, 13 deletions(-)

diff --git a/arch/mips/bcm63xx/nvram.c b/arch/mips/bcm63xx/nvram.c
index 05757ae..5f2bc1e 100644
--- a/arch/mips/bcm63xx/nvram.c
+++ b/arch/mips/bcm63xx/nvram.c
@@ -19,8 +19,6 @@
 
 #include <bcm63xx_nvram.h>
 
-#define BCM63XX_DEFAULT_PSI_SIZE	64
-
 static struct bcm963xx_nvram nvram;
 static int mac_addr_used;
 
@@ -87,12 +85,3 @@ int bcm63xx_nvram_get_mac_address(u8 *mac)
 	return 0;
 }
 EXPORT_SYMBOL(bcm63xx_nvram_get_mac_address);
-
-int bcm63xx_nvram_get_psi_size(void)
-{
-	if (nvram.psi_size > 0)
-		return nvram.psi_size;
-
-	return BCM63XX_DEFAULT_PSI_SIZE;
-}
-EXPORT_SYMBOL(bcm63xx_nvram_get_psi_size);
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
index 348df49..4e0b6bc 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
@@ -30,6 +30,4 @@ u8 *bcm63xx_nvram_get_name(void);
  */
 int bcm63xx_nvram_get_mac_address(u8 *mac);
 
-int bcm63xx_nvram_get_psi_size(void);
-
 #endif /* BCM63XX_NVRAM_H */
-- 
2.1.4

-- 
Simon Arlott
