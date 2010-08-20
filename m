Received: from p01c11o145.mxlogic.net ([208.65.144.68])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OmGFn-0001NE-Az
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 01:18:45 +0000
From: H Hartley Sweeten <hartleys@visionengravers.com>
To: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd/chips: cleanup Kconfig dependencies
Date: Thu, 19 Aug 2010 18:18:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-ID: <201008191818.21506.hartleys@visionengravers.com>
Cc: dwmw2@infradead.org, linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the MTD!=n dependency since that is handled by drivers/mtd/Kconfig.
Simplify the dependency checks for mtd/chips by using if/endif blocks. Remove
all default n since that is the Kconfig default.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 35c6a23..baac353 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -1,5 +1,4 @@
 menu "RAM/ROM/Flash chip drivers"
-	depends on MTD!=n
 
 config MTD_CFI
 	tristate "Detect flash chips by Common Flash Interface (CFI) probe"
@@ -27,9 +26,10 @@ config MTD_JEDECPROBE
 config MTD_GEN_PROBE
 	tristate
 
+if MTD_GEN_PROBE
+
 config MTD_CFI_ADV_OPTIONS
 	bool "Flash chip driver advanced configuration options"
-	depends on MTD_GEN_PROBE
 	help
 	  If you need to specify a specific endianness for access to flash
 	  chips, or if you wish to reduce the size of the kernel by including
@@ -39,9 +39,10 @@ config MTD_CFI_ADV_OPTIONS
 
 	  If unsure, say 'N'.
 
+if MTD_CFI_ADV_OPTIONS
+
 choice
 	prompt "Flash cmd/query data swapping"
-	depends on MTD_CFI_ADV_OPTIONS
 	default MTD_CFI_NOSWAP
 
 config MTD_CFI_NOSWAP
@@ -72,7 +73,6 @@ endchoice
 
 config MTD_CFI_GEOMETRY
 	bool "Specific CFI Flash geometry selection"
-	depends on MTD_CFI_ADV_OPTIONS
 	help
 	  This option does not affect the code directly, but will enable
 	  some other configuration options which would allow you to reduce
@@ -80,81 +80,78 @@ config MTD_CFI_GEOMETRY
 	  arrangements of CFI chips. If unsure, say 'N' and all options
 	  which are supported by the current code will be enabled.
 
+if MTD_CFI_GEOMETRY
+
 config MTD_MAP_BANK_WIDTH_1
-	bool "Support  8-bit buswidth" if MTD_CFI_GEOMETRY
+	bool "Support  8-bit buswidth"
 	default y
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  8 bits wide, say 'Y'.
 
 config MTD_MAP_BANK_WIDTH_2
-	bool "Support 16-bit buswidth" if MTD_CFI_GEOMETRY
+	bool "Support 16-bit buswidth"
 	default y
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  16 bits wide, say 'Y'.
 
 config MTD_MAP_BANK_WIDTH_4
-	bool "Support 32-bit buswidth" if MTD_CFI_GEOMETRY
+	bool "Support 32-bit buswidth"
 	default y
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  32 bits wide, say 'Y'.
 
 config MTD_MAP_BANK_WIDTH_8
-	bool "Support 64-bit buswidth" if MTD_CFI_GEOMETRY
-	default n
+	bool "Support 64-bit buswidth"
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  64 bits wide, say 'Y'.
 
 config MTD_MAP_BANK_WIDTH_16
-	bool "Support 128-bit buswidth" if MTD_CFI_GEOMETRY
-	default n
+	bool "Support 128-bit buswidth"
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  128 bits wide, say 'Y'.
 
 config MTD_MAP_BANK_WIDTH_32
-	bool "Support 256-bit buswidth" if MTD_CFI_GEOMETRY
-	default n
+	bool "Support 256-bit buswidth"
 	help
 	  If you wish to support CFI devices on a physical bus which is
 	  256 bits wide, say 'Y'.
 
 config MTD_CFI_I1
-	bool "Support 1-chip flash interleave" if MTD_CFI_GEOMETRY
+	bool "Support 1-chip flash interleave"
 	default y
 	help
 	  If your flash chips are not interleaved - i.e. you only have one
 	  flash chip addressed by each bus cycle, then say 'Y'.
 
 config MTD_CFI_I2
-	bool "Support 2-chip flash interleave" if MTD_CFI_GEOMETRY
+	bool "Support 2-chip flash interleave"
 	default y
 	help
 	  If your flash chips are interleaved in pairs - i.e. you have two
 	  flash chips addressed by each bus cycle, then say 'Y'.
 
 config MTD_CFI_I4
-	bool "Support 4-chip flash interleave" if MTD_CFI_GEOMETRY
-	default n
+	bool "Support 4-chip flash interleave"
 	help
 	  If your flash chips are interleaved in fours - i.e. you have four
 	  flash chips addressed by each bus cycle, then say 'Y'.
 
 config MTD_CFI_I8
-	bool "Support 8-chip flash interleave" if MTD_CFI_GEOMETRY
-	default n
+	bool "Support 8-chip flash interleave"
 	help
 	  If your flash chips are interleaved in eights - i.e. you have eight
 	  flash chips addressed by each bus cycle, then say 'Y'.
 
+endif # MTD_CFI_GEOMETRY
+
 config MTD_OTP
 	bool "Protection Registers aka one-time programmable (OTP) bits"
-	depends on MTD_CFI_ADV_OPTIONS
 	select HAVE_MTD_OTP
-	default n
 	help
 	  This enables support for reading, writing and locking so called
 	  "Protection Registers" present on some flash chips.
@@ -176,9 +173,10 @@ config MTD_OTP
 	  This feature should therefore be used with extreme care. Any mistake
 	  in the programming of OTP bits will waste them.
 
+endif # MTD_CFI_ADV_OPTIONS
+
 config MTD_CFI_INTELEXT
 	tristate "Support for Intel/Sharp flash chips"
-	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
@@ -188,7 +186,6 @@ config MTD_CFI_INTELEXT
 
 config MTD_CFI_AMDSTD
 	tristate "Support for AMD/Fujitsu/Spansion flash chips"
-	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
@@ -198,13 +195,14 @@ config MTD_CFI_AMDSTD
 
 config MTD_CFI_STAA
 	tristate "Support for ST (Advanced Architecture) flash chips"
-	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
 	  provides support for one of those command sets.
 
+endif # MTD_GEN_PROBE
+
 config MTD_CFI_UTIL
 	tristate
 
