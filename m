Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCYRo-0004CX-9H
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 16:41:11 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <b32955@freescale.com>
Subject: [PATCH 03/12] arm: defconfigs: lpc32xx_defconfig: remove museum NAND
 option
Date: Mon,  4 Mar 2013 18:42:20 +0200
Message-Id: <1362415349-7107-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The MTD_NAND_MUSEUM_IDS configuration options was removed - update the
lpc32xx_defconfig file.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 arch/arm/configs/lpc32xx_defconfig |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 92386b2..e77326f 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -55,7 +55,6 @@ CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_M25P80=y
 CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_MUSEUM_IDS=y
 CONFIG_MTD_NAND_SLC_LPC32XX=y
 CONFIG_MTD_NAND_MLC_LPC32XX=y
 CONFIG_BLK_DEV_LOOP=y
-- 
1.7.10.4
