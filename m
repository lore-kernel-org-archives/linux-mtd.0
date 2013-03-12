From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/10] pcmcia: remove RPX board stuff
Date: Tue, 12 Mar 2013 13:14:12 +0200
Message-Id: <1363086855-2847-8-git-send-email-dedekind1@gmail.com>
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

The RPX board is not supported by the kernel because CONFIG_RPXCLASSIC and
CONFIG_RPXLITE symbols and not defined anywhere. Clean-up the m8xx_pcmcia
driver a little bit.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-pcmcia@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 drivers/pcmcia/m8xx_pcmcia.c |   81 ------------------------------------------
 1 file changed, 81 deletions(-)

NOTE: this commit is independent, and I can merge it via the MTD tree with the
rest of the patches of this series. Of course, an ACK would be great to have.
And of course, if PCMCIA people wish to merge it via their tree, it is also
nice, just let me know.

diff --git a/drivers/pcmcia/m8xx_pcmcia.c b/drivers/pcmcia/m8xx_pcmcia.c
index 9a12ead..18c0d8d 100644
--- a/drivers/pcmcia/m8xx_pcmcia.c
+++ b/drivers/pcmcia/m8xx_pcmcia.c
@@ -68,12 +68,6 @@ MODULE_LICENSE("Dual MPL/GPL");
 
 #if !defined(CONFIG_PCMCIA_SLOT_A) && !defined(CONFIG_PCMCIA_SLOT_B)
 
-/* The RPX series use SLOT_B */
-#if defined(CONFIG_RPXCLASSIC) || defined(CONFIG_RPXLITE)
-#define CONFIG_PCMCIA_SLOT_B
-#define CONFIG_BD_IS_MHZ
-#endif
-
 /* The ADS board use SLOT_A */
 #ifdef CONFIG_ADS
 #define CONFIG_PCMCIA_SLOT_A
@@ -253,81 +247,6 @@ static irqreturn_t m8xx_interrupt(int irq, void *dev);
 
 #define PCMCIA_BMT_LIMIT (15*4)	/* Bus Monitor Timeout value */
 
-/* ------------------------------------------------------------------------- */
-/* board specific stuff:                                                     */
-/* voltage_set(), hardware_enable() and hardware_disable()                   */
-/* ------------------------------------------------------------------------- */
-/* RPX Boards from Embedded Planet                                           */
-
-#if defined(CONFIG_RPXCLASSIC) || defined(CONFIG_RPXLITE)
-
-/* The RPX boards seems to have it's bus monitor timeout set to 6*8 clocks.
- * SYPCR is write once only, therefore must the slowest memory be faster
- * than the bus monitor or we will get a machine check due to the bus timeout.
- */
-
-#define PCMCIA_BOARD_MSG "RPX CLASSIC or RPX LITE"
-
-#undef PCMCIA_BMT_LIMIT
-#define PCMCIA_BMT_LIMIT (6*8)
-
-static int voltage_set(int slot, int vcc, int vpp)
-{
-	u32 reg = 0;
-
-	switch (vcc) {
-	case 0:
-		break;
-	case 33:
-		reg |= BCSR1_PCVCTL4;
-		break;
-	case 50:
-		reg |= BCSR1_PCVCTL5;
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
-			reg |= BCSR1_PCVCTL6;
-		else
-			return 1;
-		break;
-	case 120:
-		reg |= BCSR1_PCVCTL7;
-	default:
-		return 1;
-	}
-
-	if (!((vcc == 50) || (vcc == 0)))
-		return 1;
-
-	/* first, turn off all power */
-
-	out_be32(((u32 *) RPX_CSR_ADDR),
-		 in_be32(((u32 *) RPX_CSR_ADDR)) & ~(BCSR1_PCVCTL4 |
-						     BCSR1_PCVCTL5 |
-						     BCSR1_PCVCTL6 |
-						     BCSR1_PCVCTL7));
-
-	/* enable new powersettings */
-
-	out_be32(((u32 *) RPX_CSR_ADDR), in_be32(((u32 *) RPX_CSR_ADDR)) | reg);
-
-	return 0;
-}
-
-#define socket_get(_slot_) PCMCIA_SOCKET_KEY_5V
-#define hardware_enable(_slot_)	/* No hardware to enable */
-#define hardware_disable(_slot_)	/* No hardware to disable */
-
-#endif				/* CONFIG_RPXCLASSIC */
-
 /* FADS Boards from Motorola                                               */
 
 #if defined(CONFIG_FADS)
-- 
1.7.10.4
