Received: from smtp.falooley.org ([66.180.170.91])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PUgMK-0008Ip-Jd
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2010 14:05:07 +0000
Date: Mon, 20 Dec 2010 09:04:54 -0500
From: Jason Lunz <lunz@acm.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: allow mtd and jffs2 when ARCH=um
Message-ID: <20101220140454.GA26229@falooley.org>
References: <20101207072919.GA8511@falooley.org>
	<AANLkTineLxHdcDKZEUGiqVNAauSX_xyQrs49kKaqhiWo@mail.gmail.com>
	<20101207182012.GA10546@falooley.org>
	<1292343878.2538.80.camel@localhost>
	<20101214195124.GA6010@falooley.org> <20101216230110.65156c55@wker>
	<20101217042759.GA3148@falooley.org>
	<1292777276.2140.1.camel@koala>
	<20101219190720.GA16710@falooley.org>
	<1292844216.13362.19.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1292844216.13362.19.camel@koala>
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 20, 2010 at 01:23:36PM +0200, Artem Bityutskiy wrote:
> Ok, could you please re-sent the final patch with the commit message
> etc?

Sure, here's everything as a single patch.

------------------------------------->8
Allow parts of drivers/mtd to compile on uml by pushing the HAS_IOMEM
dependencies down closer to the parts of mtd that actually need it.
This allows enough of mtd to build to let jffs2 be used on uml.

Signed-off-by: Jason Lunz <lunz@acm.org>
---
 arch/um/Kconfig.rest |    4 +---
 drivers/mtd/Kconfig  |    8 ++++++--
 drivers/mtd/Makefile |    3 ++-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/um/Kconfig.rest b/arch/um/Kconfig.rest
index 0ccad0f..e34f399 100644
--- a/arch/um/Kconfig.rest
+++ b/arch/um/Kconfig.rest
@@ -28,9 +28,7 @@ source "drivers/scsi/Kconfig"
 
 source "drivers/md/Kconfig"
 
-if BROKEN
-	source "drivers/mtd/Kconfig"
-endif
+source "drivers/mtd/Kconfig"
 
 source "drivers/leds/Kconfig"
 
diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index 7741470..603e447 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -1,6 +1,5 @@
 menuconfig MTD
 	tristate "Memory Technology Device (MTD) support"
-	depends on HAS_IOMEM
 	help
 	  Memory Technology Devices are flash, RAM and similar chips, often
 	  used for solid state file systems on embedded devices. This option
@@ -178,6 +177,7 @@ comment "User Modules And Translation Layers"
 
 config MTD_CHAR
 	tristate "Direct char device access to MTD devices"
+	depends on HAS_IOMEM
 	help
 	  This provides a character device for each MTD device present in
 	  the system, allowing the user to read and write directly to the
@@ -310,7 +310,7 @@ config SSFDC
 
 config SM_FTL
 	tristate "SmartMedia/xD new translation layer"
-	depends on EXPERIMENTAL && BLOCK
+	depends on EXPERIMENTAL && BLOCK && HAS_IOMEM
 	select MTD_BLKDEVS
 	select MTD_NAND_ECC
 	help
@@ -333,6 +333,8 @@ config MTD_OOPS
 	  To use, add console=ttyMTDx to the kernel command line,
 	  where x is the MTD device number to use.
 
+if HAS_IOMEM
+
 source "drivers/mtd/chips/Kconfig"
 
 source "drivers/mtd/maps/Kconfig"
@@ -345,6 +347,8 @@ source "drivers/mtd/onenand/Kconfig"
 
 source "drivers/mtd/lpddr/Kconfig"
 
+endif # HAS_IOMEM
+
 source "drivers/mtd/ubi/Kconfig"
 
 endif # MTD
diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index d4e7f25..c83eee4 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_MTD_OOPS)		+= mtdoops.o
 nftl-objs		:= nftlcore.o nftlmount.o
 inftl-objs		:= inftlcore.o inftlmount.o
 
-obj-y		+= chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
+obj-y			+= tests/
+obj-$(CONFIG_HAS_IOMEM)	+= chips/ lpddr/ maps/ devices/ nand/ onenand/
 
 obj-$(CONFIG_MTD_UBI)		+= ubi/
-- 
1.7.2.3
