Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aupZG-0001ki-AG
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 23:05:27 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] physmap_of: ensure versatile code is reachable
Date: Tue, 26 Apr 2016 01:04:38 +0200
Message-Id: <1461625501-2160538-1-git-send-email-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With the newly added physmap_of_versatile code, we get a build error
when physmap_of is in a module, because of_flash_probe_versatile
is not exported:

ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!

This adds the export, and changes the Makefile so that the code is
also put into a loadable module rather than built-in when physmap_of
itself is a module.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/maps/Makefile               | 4 +++-
 drivers/mtd/maps/physmap_of_versatile.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 188873a..644f7d3 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -18,7 +18,9 @@ obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
 obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
-obj-$(CONFIG_MTD_PHYSMAP_OF_VERSATILE) += physmap_of_versatile.o
+ifdef CONFIG_MTD_PHYSMAP_OF_VERSATILE
+obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of_versatile.o
+endif
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
 obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o
diff --git a/drivers/mtd/maps/physmap_of_versatile.c b/drivers/mtd/maps/physmap_of_versatile.c
index fa40539..0f39b2a 100644
--- a/drivers/mtd/maps/physmap_of_versatile.c
+++ b/drivers/mtd/maps/physmap_of_versatile.c
@@ -19,6 +19,7 @@
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
  * MA 02111-1307 USA
  */
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -251,3 +252,4 @@ int of_flash_probe_versatile(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_flash_probe_versatile);
-- 
2.7.0
