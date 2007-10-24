Received: from li6-103.members.linode.com ([66.160.141.103]
	helo=smtp.falooley.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IkUvJ-0001Ay-6J
	for linux-mtd@lists.infradead.org; Wed, 24 Oct 2007 02:20:45 +0100
Date: Tue, 23 Oct 2007 18:17:14 -0700
From: Jason Lunz <lunz@falooley.org>
To: atom ota <atomota@sleepyhammer.com>
Subject: [PATCH] allow use of mtd and jffs2 on uml
Message-ID: <20071024011712.GA3762@falooley.org>
References: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22c797d00709272118i33d32b9dy93d5f5ec8f8edd30@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
	David Woodhouse <dwmw2@infradead.org>, uml-user@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In gmane.linux.uml.user, you wrote:
> I need to do some experiments with JFFS2 on a recent Linux kernel (2.6.22.6)
> and was hoping to use UML, with block2mtd or nandsim as my MTD, but either
> MTD configuration and consequently JFFS2 configuration isn't available in
> "make ARCH=um menuconfig", or I just can't find it.
>
> I've searched Google and the list archive and it looks like JFFS2 worked
> with UML in the past, but maybe something has changed.
>
> Is it possible to configure a UML kernel to support JFFS2?  If so, how?

The patch below makes it work. It's crude and I make no excuses for it,
but it does let jffs2-on-block2mtd work on uml without problems.

I think the addition of CONFIG_MTD_CHIPREG is an ugly hack in
particular, and improperly done at that (it stays off for !UML, I
think).

But it should get you going. Maybe this could serve as a basis for
something mergable. It applies to 2.6.23; with some wiggling it works on
earlier versions too.

Signed-off-by: Jason Lunz <lunz@falooley.org>

---
 arch/um/Kconfig             |    4 +---
 drivers/mtd/Kconfig         |   12 +++++++-----
 drivers/mtd/chips/Kconfig   |   11 ++++++++---
 drivers/mtd/devices/Kconfig |    7 +++++++
 4 files changed, 23 insertions(+), 11 deletions(-)

Index: linux-2.6.23.1-uml/arch/um/Kconfig
===================================================================
--- linux-2.6.23.1-uml.orig/arch/um/Kconfig
+++ linux-2.6.23.1-uml/arch/um/Kconfig
@@ -326,9 +326,7 @@
 
 source "drivers/md/Kconfig"
 
-if BROKEN
-	source "drivers/mtd/Kconfig"
-endif
+source "drivers/mtd/Kconfig"
 
 #This is just to shut up some Kconfig warnings, so no prompt.
 config INPUT
Index: linux-2.6.23.1-uml/drivers/mtd/devices/Kconfig
===================================================================
--- linux-2.6.23.1-uml.orig/drivers/mtd/devices/Kconfig
+++ linux-2.6.23.1-uml/drivers/mtd/devices/Kconfig
@@ -78,6 +78,7 @@
 
 config MTD_SLRAM
 	tristate "Uncached system RAM"
+ 	depends on !UML
 	help
 	  If your CPU cannot cache all of the physical memory in your machine,
 	  you can still use it for storage or swap by using this driver to
@@ -85,6 +86,7 @@
 
 config MTD_PHRAM
 	tristate "Physical system RAM"
+ 	depends on !UML
 	help
 	  This is a re-implementation of the slram driver above.
 
@@ -151,10 +153,13 @@
 	  Testing MTD users (eg JFFS2) on large media and media that might
 	  be removed during a write (using the floppy drive).
 
+if !UML
 comment "Disk-On-Chip Device Drivers"
+endif
 
 config MTD_DOC2000
 	tristate "M-Systems Disk-On-Chip 2000 and Millennium (DEPRECATED)"
+ 	depends on !UML
 	select MTD_DOCPROBE
 	select MTD_NAND_IDS
 	---help---
@@ -177,6 +182,7 @@
 
 config MTD_DOC2001
 	tristate "M-Systems Disk-On-Chip Millennium-only alternative driver (DEPRECATED)"
+ 	depends on !UML
 	select MTD_DOCPROBE
 	select MTD_NAND_IDS
 	---help---
@@ -198,6 +204,7 @@
 
 config MTD_DOC2001PLUS
 	tristate "M-Systems Disk-On-Chip Millennium Plus"
+ 	depends on !UML
 	select MTD_DOCPROBE
 	select MTD_NAND_IDS
 	---help---
Index: linux-2.6.23.1-uml/drivers/mtd/Kconfig
===================================================================
--- linux-2.6.23.1-uml.orig/drivers/mtd/Kconfig
+++ linux-2.6.23.1-uml/drivers/mtd/Kconfig
@@ -2,7 +2,6 @@
 
 menuconfig MTD
 	tristate "Memory Technology Device (MTD) support"
-	depends on HAS_IOMEM
 	help
 	  Memory Technology Devices are flash, RAM and similar chips, often
 	  used for solid state file systems on embedded devices. This option
@@ -280,13 +279,16 @@
 
 source "drivers/mtd/chips/Kconfig"
 
-source "drivers/mtd/maps/Kconfig"
+if !UML
+	source "drivers/mtd/maps/Kconfig"
+endif
 
 source "drivers/mtd/devices/Kconfig"
 
-source "drivers/mtd/nand/Kconfig"
-
-source "drivers/mtd/onenand/Kconfig"
+if !UML
+	source "drivers/mtd/nand/Kconfig"
+	source "drivers/mtd/onenand/Kconfig"
+endif
 
 source "drivers/mtd/ubi/Kconfig"
 
Index: linux-2.6.23.1-uml/drivers/mtd/chips/Kconfig
===================================================================
--- linux-2.6.23.1-uml.orig/drivers/mtd/chips/Kconfig
+++ linux-2.6.23.1-uml/drivers/mtd/chips/Kconfig
@@ -3,8 +3,13 @@
 menu "RAM/ROM/Flash chip drivers"
 	depends on MTD!=n
 
+config MTD_CHIPREG
+	bool
+ 	depends on !UML
+
 config MTD_CFI
 	tristate "Detect flash chips by Common Flash Interface (CFI) probe"
+ 	depends on !UML
 	select MTD_GEN_PROBE
 	help
 	  The Common Flash Interface specification was developed by Intel,
@@ -16,6 +21,7 @@
 
 config MTD_JEDECPROBE
 	tristate "Detect non-CFI AMD/JEDEC-compatible flash chips"
+ 	depends on !UML
 	select MTD_GEN_PROBE
 	help
 	  This option enables JEDEC-style probing of flash chips which are not
@@ -178,7 +184,7 @@
 
 config MTD_CFI_INTELEXT
 	tristate "Support for Intel/Sharp flash chips"
-	depends on MTD_GEN_PROBE
+	depends on MTD_GEN_PROBE && !UML
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
@@ -188,7 +194,7 @@
 
 config MTD_CFI_AMDSTD
 	tristate "Support for AMD/Fujitsu flash chips"
-	depends on MTD_GEN_PROBE
+	depends on MTD_GEN_PROBE && !UML
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
@@ -198,7 +204,7 @@
 
 config MTD_CFI_STAA
 	tristate "Support for ST (Advanced Architecture) flash chips"
-	depends on MTD_GEN_PROBE
+	depends on MTD_GEN_PROBE && !UML
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
@@ -210,18 +216,21 @@
 
 config MTD_RAM
 	tristate "Support for RAM chips in bus mapping"
+ 	depends on !UML
 	help
 	  This option enables basic support for RAM chips accessed through
 	  a bus mapping driver.
 
 config MTD_ROM
 	tristate "Support for ROM chips in bus mapping"
+ 	depends on !UML
 	help
 	  This option enables basic support for ROM chips accessed through
 	  a bus mapping driver.
 
 config MTD_ABSENT
 	tristate "Support for absent chips in bus mapping"
+ 	depends on !UML
 	help
 	  This option enables support for a dummy probing driver used to
 	  allocated placeholder MTD devices on systems that have socketed
Index: linux-2.6.23.1-uml/drivers/mtd/chips/Makefile
===================================================================
--- linux-2.6.23.1-uml.orig/drivers/mtd/chips/Makefile
+++ linux-2.6.23.1-uml/drivers/mtd/chips/Makefile
@@ -2,7 +2,7 @@
 # linux/drivers/chips/Makefile
 #
 
-obj-$(CONFIG_MTD)		+= chipreg.o
+obj-$(CONFIG_MTD_CHIPREG)	+= chipreg.o
 obj-$(CONFIG_MTD_CFI)		+= cfi_probe.o
 obj-$(CONFIG_MTD_CFI_UTIL)	+= cfi_util.o
 obj-$(CONFIG_MTD_CFI_STAA)	+= cfi_cmdset_0020.o
