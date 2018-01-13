Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eaJSG-00035D-9Z
 for linux-mtd@lists.infradead.org; Sat, 13 Jan 2018 10:54:30 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] MAINTAINERS: Add entry for Marvell NAND controller driver
Date: Sat, 13 Jan 2018 11:54:10 +0100
Message-Id: <20180113105410.2555-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add entry for Marvell NAND controller driver and its bindings which will
soon replace the old driver pxa3xx_nand.c.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa71ab52fd76..ca8bb8077e70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8409,6 +8409,13 @@ L:	linux-wireless@vger.kernel.org
 S:	Odd Fixes
 F:	drivers/net/wireless/marvell/mwl8k.c
 
+MARVELL NAND CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@free-electrons.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/marvell_nand.c
+F:	Documentation/devicetree/bindings/mtd/marvell-nand.txt
+
 MARVELL SOC MMC/SD/SDIO CONTROLLER DRIVER
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Odd Fixes
-- 
2.11.0
