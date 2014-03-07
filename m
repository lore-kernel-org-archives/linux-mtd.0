Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLwKE-0003bd-Ln
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 15:04:39 +0000
From: Philippe De Muyter <phdm@macqel.be>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Kconfig: give the CFI command set version in prompt and
 help
Date: Fri,  7 Mar 2014 16:04:01 +0100
Message-Id: <1394204641-23453-1-git-send-email-phdm@macqel.be>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enhances the help for the CFI command set choices.

Signed-off-by: Philippe De Muyter <phdm@macqel.be>
---
 drivers/mtd/chips/Kconfig |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index e4696b3..9f02c28 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -169,33 +169,33 @@ config MTD_OTP
 	  in the programming of OTP bits will waste them.
 
 config MTD_CFI_INTELEXT
-	tristate "Support for Intel/Sharp flash chips"
+	tristate "Support for CFI command set 0001 (Intel/Sharp chips)"
 	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
-	  provides support for one of those command sets, used on Intel
-	  StrataFlash and other parts.
+	  provides support for command set 0001, used on Intel StrataFlash
+	  and other parts.
 
 config MTD_CFI_AMDSTD
-	tristate "Support for AMD/Fujitsu/Spansion flash chips"
+	tristate "Support for CFI command set 0002 (AMD/Fujitsu/Spansion chips)"
 	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
-	  provides support for one of those command sets, used on chips
-	  including the AMD Am29LV320.
+	  provides support for command set 0002, used on chips including
+	  the AMD Am29LV320.
 
 config MTD_CFI_STAA
-	tristate "Support for ST (Advanced Architecture) flash chips"
+	tristate "Support for CFI command set 0020 (ST (Advanced Architecture) chips)"
 	depends on MTD_GEN_PROBE
 	select MTD_CFI_UTIL
 	help
 	  The Common Flash Interface defines a number of different command
 	  sets which a CFI-compliant chip may claim to implement. This code
-	  provides support for one of those command sets.
+	  provides support for command set 0020.
 
 config MTD_CFI_UTIL
 	tristate
-- 
1.7.5.3
