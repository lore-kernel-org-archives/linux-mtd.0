Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dxZwk-0002la-8x
 for linux-mtd@lists.infradead.org; Thu, 28 Sep 2017 14:37:53 +0000
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>,
 Yehuda Yitschak <yehuday@marvell.com>, Omri Itach <omrii@marvell.com>,
 Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>,
 Marcin Wojtas <mw@semihalf.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH] mtd: nand: pxa3xx_nand: Update Kconfig information
Date: Thu, 28 Sep 2017 16:36:57 +0200
Message-Id: <20170928143657.26728-1-gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

More and more SoCs use the pxa3xx_nand driver for their controller but
the list of them was not updated. This patch add the last SoCs using the
driver.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/mtd/nand/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3f2036f31da4..d8633e0b7e20 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -318,7 +318,8 @@ config MTD_NAND_PXA3xx
 	depends on PXA3xx || ARCH_MMP || PLAT_ORION || ARCH_MVEBU
 	help
 	  This enables the driver for the NAND flash device found on
-	  PXA3xx processors (NFCv1) and also on Armada 370/XP (NFCv2).
+	  PXA3xx processors (NFCv1) and also on Armada 32bits(XP, 370, 375,
+	  38x, 39x) and 64bits (7K, 8K) (NFCv2).
 
 config MTD_NAND_SLC_LPC32XX
 	tristate "NXP LPC32xx SLC Controller"
-- 
2.14.1
