Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAYo1-0005hB-L0
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2018 11:07:29 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: docg3: don't set conflicting BCH_CONST_PARAMS option
Date: Thu, 11 Oct 2018 13:06:16 +0200
Message-Id: <20181011110639.2649053-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I noticed during the creation of another bugfix that the BCH_CONST_PARAMS
option that is set by DOCG3 breaks setting variable parameters for any
other users of the BCH library code.

The only other user we have today is the MTD_NAND software BCH
implementation (most flash controllers use hardware BCH these days
and are not affected). I considered removing BCH_CONST_PARAMS entirely
because of the inherent conflict, but according to the description in
lib/bch.c there is a significant performance benefit in keeping it.

To avoid the immediate problem of the conflict between MTD_NAND_BCH
and DOCG3, this only sets the constant parameters if MTD_NAND_BCH
is disabled, which should fix the problem for all cases that
are affected. This should also work for all stable kernels.

Note that there is only one machine that actually seems to use the
DOCG3 driver (arch/arm/mach-pxa/mioa701.c), so most users should have
the driver disabled, but it almost certainly shows up if we wanted
to test random kernels on machines that use software BCH in MTD.

Fixes: d13d19ece39f ("mtd: docg3: add ECC correction code")
Cc: stable@vger.kernel.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/devices/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index e514d57a0419..aa983422aa97 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -207,7 +207,7 @@ comment "Disk-On-Chip Device Drivers"
 config MTD_DOCG3
 	tristate "M-Systems Disk-On-Chip G3"
 	select BCH
-	select BCH_CONST_PARAMS
+	select BCH_CONST_PARAMS if !MTD_NAND_BCH
 	select BITREVERSE
 	help
 	  This provides an MTD device driver for the M-Systems DiskOnChip
-- 
2.18.0
