Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmHzy-0007hm-4g
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 09:05:26 +0000
From: Javier Martinez Canillas <javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Fengguang Wu <fengguang.wu@intel.com>,
 Luis de Bethencourt <luisbg@osg.samsung.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>, Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH] mtd: Make MTD_BCM47XXSFLASH to depend on MIPS
Date: Wed, 14 Oct 2015 11:04:54 +0200
Message-Id: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The bcm47xxsflash driver uses the KSEG0ADDR() function to map an address
to a certain kernel segment. But that is only defined if the MIPS config
symbol is enabled. The driver does not have an explicit dependency on it
and relies on a transitive dependency relation:

MTD_BCM47XXSFLASH -> BCMA_SFLASH -> BCMA_DRIVER_MIPS -> BCMA && MIPS

But BCMA_SFLASH and BCMA_DRIVER_MIPS have only runtime and not buildtime
dependency with MIPS so can be changed to be built test using the config
COMPILE_TEST symbol. But that would make MTD_BCM47XXSFLASH be built with
MIPS not enabled and cause the following build error:

drivers/mtd/devices//bcm47xxsflash.c: In function 'bcm47xxsflash_read':
drivers/mtd/devices//bcm47xxsflash.c:112:2: error: implicit declaration of function 'KSEG0ADDR' [-Werror=implicit-function-declaration]
  memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(b47s->window + from),
  ^

Make MTD_BCM47XXSFLASH depend on MIPS since has a buildtime dependency.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/mtd/devices/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index f73c41697a00..f5eab3c19356 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -114,7 +114,7 @@ config MTD_SST25L
 
 config MTD_BCM47XXSFLASH
 	tristate "R/O support for serial flash on BCMA bus"
-	depends on BCMA_SFLASH
+	depends on BCMA_SFLASH && MIPS
 	help
 	  BCMA bus can have various flash memories attached, they are
 	  registered by bcma as platform devices. This enables driver for
-- 
2.4.3
