Received: from arrakis.dune.hu ([78.24.191.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJOAv-0001s0-CQ
 for linux-mtd@lists.infradead.org; Sat, 23 Mar 2013 13:07:59 +0000
From: Jonas Gorski <jogo@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] MIPS: BCM63XX: export PSI size from nvram
Date: Sat, 23 Mar 2013 14:07:48 +0100
Message-Id: <1364044070-10486-3-git-send-email-jogo@openwrt.org>
In-Reply-To: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
References: <1364044070-10486-1-git-send-email-jogo@openwrt.org>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 arch/mips/bcm63xx/nvram.c                          |   11 +++++++++++
 arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h |    2 ++
 2 files changed, 13 insertions(+)

diff --git a/arch/mips/bcm63xx/nvram.c b/arch/mips/bcm63xx/nvram.c
index 6206116..44af608 100644
--- a/arch/mips/bcm63xx/nvram.c
+++ b/arch/mips/bcm63xx/nvram.c
@@ -35,6 +35,8 @@ struct bcm963xx_nvram {
 	u32	checksum_high;
 };
 
+#define BCM63XX_DEFAULT_PSI_SIZE	64
+
 static struct bcm963xx_nvram nvram;
 static int mac_addr_used;
 
@@ -105,3 +107,12 @@ int bcm63xx_nvram_get_mac_address(u8 *mac)
 	return 0;
 }
 EXPORT_SYMBOL(bcm63xx_nvram_get_mac_address);
+
+int bcm63xx_nvram_get_psi_size(void)
+{
+	if (nvram.psi_size > 0)
+		return nvram.psi_size;
+
+	return BCM63XX_DEFAULT_PSI_SIZE;
+}
+EXPORT_SYMBOL(bcm63xx_nvram_get_psi_size);
diff --git a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
index 62d6a3b..d76a486 100644
--- a/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
+++ b/arch/mips/include/asm/mach-bcm63xx/bcm63xx_nvram.h
@@ -32,4 +32,6 @@ u8 *bcm63xx_nvram_get_name(void);
  */
 int bcm63xx_nvram_get_mac_address(u8 *mac);
 
+int bcm63xx_nvram_get_psi_size(void);
+
 #endif /* BCM63XX_NVRAM_H */
-- 
1.7.10.4
