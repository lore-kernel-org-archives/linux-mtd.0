From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/10] pcmcia: remove Motorolla MBX860 support
Date: Tue, 12 Mar 2013 13:14:09 +0200
Message-Id: <1363086855-2847-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-m68k@lists.linux-m68k.org, linux-pcmcia@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The CONFIG_MBX symbol is not defined anywhere in the kernel tree, which means
this platform is not supported by the Linux kernel and we can remove the
corresponding code from the 'm8xx_pcmcia' driver.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-pcmcia@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 drivers/pcmcia/m8xx_pcmcia.c |   59 ------------------------------------------
 1 file changed, 59 deletions(-)

NOTE: this commit is independent, and I can merge it via the MTD tree with the
rest of the patches of this series. Of course, an ACK would be great to have.
And of course, if PCMCIA people wish to merge it via their tree, it is also
nice, just let me know.

diff --git a/drivers/pcmcia/m8xx_pcmcia.c b/drivers/pcmcia/m8xx_pcmcia.c
index a3a851e..9a12ead 100644
--- a/drivers/pcmcia/m8xx_pcmcia.c
+++ b/drivers/pcmcia/m8xx_pcmcia.c
@@ -419,65 +419,6 @@ static inline int voltage_set(int slot, int vcc, int vpp)
 
 #endif
 
-/* ------------------------------------------------------------------------- */
-/* Motorola MBX860                                                           */
-
-#if defined(CONFIG_MBX)
-
-#define PCMCIA_BOARD_MSG "MBX"
-
-static int voltage_set(int slot, int vcc, int vpp)
-{
-	u8 reg = 0;
-
-	switch (vcc) {
-	case 0:
-		break;
-	case 33:
-		reg |= CSR2_VCC_33;
-		break;
-	case 50:
-		reg |= CSR2_VCC_50;
-		break;
-	default:
-		return 1;
-	}
-
-	switch (vpp) {
-	case 0:
-		break;
-	case 33:
-	case 50:
-		if (vcc == vpp)
-			reg |= CSR2_VPP_VCC;
-		else
-			return 1;
-		break;
-	case 120:
-		if ((vcc == 33) || (vcc == 50))
-			reg |= CSR2_VPP_12;
-		else
-			return 1;
-	default:
-		return 1;
-	}
-
-	/* first, turn off all power */
-	out_8((u8 *) MBX_CSR2_ADDR,
-	      in_8((u8 *) MBX_CSR2_ADDR) & ~(CSR2_VCC_MASK | CSR2_VPP_MASK));
-
-	/* enable new powersettings */
-	out_8((u8 *) MBX_CSR2_ADDR, in_8((u8 *) MBX_CSR2_ADDR) | reg);
-
-	return 0;
-}
-
-#define socket_get(_slot_) PCMCIA_SOCKET_KEY_5V
-#define hardware_enable(_slot_)	/* No hardware to enable */
-#define hardware_disable(_slot_)	/* No hardware to disable */
-
-#endif				/* CONFIG_MBX */
-
 #if defined(CONFIG_PRxK)
 #include <asm/cpld.h>
 extern volatile fpga_pc_regs *fpga_pc;
-- 
1.7.10.4
