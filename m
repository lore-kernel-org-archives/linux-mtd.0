From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>,
 Yehuda Yitschak <yehuday@marvell.com>, Omri Itach <omrii@marvell.com>,
 Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>,
 Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH 1/2] mtd: nand: pxa3xx_nand: enable building on mvebu 64-bit
 platforms
Date: Wed, 19 Jul 2017 17:31:25 +0200
Message-Id: <20170719153126.16905-2-gregory.clement@free-electrons.com>
In-Reply-To: <20170719153126.16905-1-gregory.clement@free-electrons.com>
References: <20170719153126.16905-1-gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The controller supported by the pxa3xx_nand driver is also available on
the mvebu 64-bit SoCs, such as the Armada 7K and Armada 8K SoCs. This
patch updates the Kconfig dependency to allow building the kernel for
this SoC family too.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index dbfa72d61d5a..ca42503e42f7 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -315,7 +315,7 @@ config MTD_NAND_ATMEL
 
 config MTD_NAND_PXA3xx
 	tristate "NAND support on PXA3xx and Armada 370/XP"
-	depends on PXA3xx || ARCH_MMP || PLAT_ORION
+	depends on PXA3xx || ARCH_MMP || PLAT_ORION  || ARCH_MVEBU
 	help
 	  This enables the driver for the NAND flash device found on
 	  PXA3xx processors (NFCv1) and also on Armada 370/XP (NFCv2).
-- 
2.13.2
