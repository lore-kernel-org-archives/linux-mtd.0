Received: from p01c11o144.mxlogic.net ([208.65.144.67])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OmFUY-0006jY-Qf
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 00:29:56 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd/ubi: cleanup and simplify Kconfig
Date: Thu, 19 Aug 2010 17:28:50 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201008191728.50871.hartleys@visionengravers.com>
Cc: dwmw2@infradead.org, linux-mtd <linux-mtd@lists.infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cleanup the Kconfig for UBI by using menuconfig to enable/disable the entire
driver. Remove the dependency checks for MTD_UBI and MTD_UBI_DEBUG by
wrapping the options in if/endif blocks and remove any redundant checks.
Remove all default n since that is the Kconfig default. Change menu "Additional
UBI debugging messages" into a comment to remove one menu level.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>

---

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index f702a16..3cf193f 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -1,9 +1,5 @@
-menu "UBI - Unsorted block images"
-	depends on MTD
-
-config MTD_UBI
-	tristate "Enable UBI"
-	depends on MTD
+menuconfig MTD_UBI
+	tristate "Enable UBI - Unsorted block images"
 	select CRC32
 	help
 	  UBI is a software layer above MTD layer which admits of LVM-like
@@ -12,11 +8,12 @@ config MTD_UBI
 	  capabilities. Please, consult the MTD web site for more details
 	  (www.linux-mtd.infradead.org).
 
+if MTD_UBI
+
 config MTD_UBI_WL_THRESHOLD
 	int "UBI wear-leveling threshold"
 	default 4096
 	range 2 65536
-	depends on MTD_UBI
 	help
 	  This parameter defines the maximum difference between the highest
 	  erase counter value and the lowest erase counter value of eraseblocks
@@ -34,7 +31,6 @@ config MTD_UBI_BEB_RESERVE
 	int "Percentage of reserved eraseblocks for bad eraseblocks handling"
 	default 1
 	range 0 25
-	depends on MTD_UBI
 	help
 	  If the MTD device admits of bad eraseblocks (e.g. NAND flash), UBI
 	  reserves some amount of physical eraseblocks to handle new bad
@@ -48,8 +44,6 @@ config MTD_UBI_BEB_RESERVE
 
 config MTD_UBI_GLUEBI
 	tristate "MTD devices emulation driver (gluebi)"
-	default n
-	depends on MTD_UBI
 	help
 	   This option enables gluebi - an additional driver which emulates MTD
 	   devices on top of UBI volumes: for each UBI volumes an MTD device is
@@ -59,4 +53,5 @@ config MTD_UBI_GLUEBI
 	   software.
 
 source "drivers/mtd/ubi/Kconfig.debug"
-endmenu
+
+endif # MTD_UBI
diff --git a/drivers/mtd/ubi/Kconfig.debug b/drivers/mtd/ubi/Kconfig.debug
index 2246f15..d508b78 100644
--- a/drivers/mtd/ubi/Kconfig.debug
+++ b/drivers/mtd/ubi/Kconfig.debug
@@ -1,94 +1,73 @@
 comment "UBI debugging options"
-	depends on MTD_UBI
 
 config MTD_UBI_DEBUG
 	bool "UBI debugging"
 	depends on SYSFS
-	depends on MTD_UBI
 	select DEBUG_FS
 	select KALLSYMS_ALL
 	help
 	  This option enables UBI debugging.
 
+if MTD_UBI_DEBUG
+
 config MTD_UBI_DEBUG_MSG
 	bool "UBI debugging messages"
-	depends on MTD_UBI_DEBUG
-	default n
 	help
 	  This option enables UBI debugging messages.
 
 config MTD_UBI_DEBUG_PARANOID
 	bool "Extra self-checks"
-	default n
-	depends on MTD_UBI_DEBUG
 	help
 	  This option enables extra checks in UBI code. Note this slows UBI down
 	  significantly.
 
 config MTD_UBI_DEBUG_DISABLE_BGT
 	bool "Do not enable the UBI background thread"
-	depends on MTD_UBI_DEBUG
-	default n
 	help
 	  This option switches the background thread off by default. The thread
 	  may be also be enabled/disabled via UBI sysfs.
 
 config MTD_UBI_DEBUG_EMULATE_BITFLIPS
 	bool "Emulate flash bit-flips"
-	depends on MTD_UBI_DEBUG
-	default n
 	help
 	  This option emulates bit-flips with probability 1/50, which in turn
 	  causes scrubbing. Useful for debugging and stressing UBI.
 
 config MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES
 	bool "Emulate flash write failures"
-	depends on MTD_UBI_DEBUG
-	default n
 	help
 	  This option emulates write failures with probability 1/100. Useful for
 	  debugging and testing how UBI handlines errors.
 
 config MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES
 	bool "Emulate flash erase failures"
-	depends on MTD_UBI_DEBUG
-	default n
 	help
 	  This option emulates erase failures with probability 1/100. Useful for
 	  debugging and testing how UBI handlines errors.
 
-menu "Additional UBI debugging messages"
-	depends on MTD_UBI_DEBUG
+comment "Additional UBI debugging messages"
 
 config MTD_UBI_DEBUG_MSG_BLD
 	bool "Additional UBI initialization and build messages"
-	default n
-	depends on MTD_UBI_DEBUG
 	help
 	  This option enables detailed UBI initialization and device build
 	  debugging messages.
 
 config MTD_UBI_DEBUG_MSG_EBA
 	bool "Eraseblock association unit messages"
-	default n
-	depends on MTD_UBI_DEBUG
 	help
 	  This option enables debugging messages from the UBI eraseblock
 	  association unit.
 
 config MTD_UBI_DEBUG_MSG_WL
 	bool "Wear-leveling unit messages"
-	default n
-	depends on MTD_UBI_DEBUG
 	help
 	  This option enables debugging messages from the UBI wear-leveling
 	  unit.
 
 config MTD_UBI_DEBUG_MSG_IO
 	bool "Input/output unit messages"
-	default n
-	depends on MTD_UBI_DEBUG
 	help
 	  This option enables debugging messages from the UBI input/output unit.
 
-endmenu # UBI debugging messages
+endif # MTD_UBI_DEBUG
