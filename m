Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LkJym-0002fA-14
	for linux-mtd@lists.infradead.org; Thu, 19 Mar 2009 15:16:27 +0000
From: Wolfgang Grandegger <wg@grandegger.com>
To: linux-mtd@lists.infradead.org,
	linuxppc-dev@ozlabs.org
Subject: [PATCH v2 5/5] powerpc/85xx: TQM8548: Update DTS file for multi-chip
	support
Date: Thu, 19 Mar 2009 16:16:08 +0100
Message-Id: <1237475768-11481-6-git-send-email-wg@grandegger.com>
In-Reply-To: <1237475768-11481-5-git-send-email-wg@grandegger.com>
References: <1237475768-11481-1-git-send-email-wg@grandegger.com>
	<1237475768-11481-2-git-send-email-wg@grandegger.com>
	<1237475768-11481-3-git-send-email-wg@grandegger.com>
	<1237475768-11481-4-git-send-email-wg@grandegger.com>
	<1237475768-11481-5-git-send-email-wg@grandegger.com>
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>,
	Wolfgang Grandegger <wg@grandegger.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds multi-chip support for the Micron MT29F8G08FAB NAND
flash memory on the TQM8548 modules.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 arch/powerpc/boot/dts/tqm8548-bigflash.dts |    7 ++++++-
 arch/powerpc/boot/dts/tqm8548.dts          |    7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/tqm8548-bigflash.dts b/arch/powerpc/boot/dts/tqm8548-bigflash.dts
index 29a2b6f..2730467 100644
--- a/arch/powerpc/boot/dts/tqm8548-bigflash.dts
+++ b/arch/powerpc/boot/dts/tqm8548-bigflash.dts
@@ -389,6 +389,11 @@
 			reg = <3 0x0 0x800>;
 			fsl,upm-addr-offset = <0x10>;
 			fsl,upm-cmd-offset = <0x08>;
+			fsl,upm-wait-flags = <0x5>;
+			/* Multi-chip device */
+			fsl,upm-mar-chip-offset = <0x200>;
+			num-chips = <2>;
+			chip-offset = <0x200>;
 			chip-delay = <25>; // in micro-seconds
 
 			nand@0 {
@@ -397,7 +402,7 @@
 
 				partition@0 {
 					    label = "fs";
-					    reg = <0x00000000 0x01000000>;
+					    reg = <0x00000000 0x10000000>;
 				};
 			};
 		};
diff --git a/arch/powerpc/boot/dts/tqm8548.dts b/arch/powerpc/boot/dts/tqm8548.dts
index 81d3fbb..d7477fc 100644
--- a/arch/powerpc/boot/dts/tqm8548.dts
+++ b/arch/powerpc/boot/dts/tqm8548.dts
@@ -389,6 +389,11 @@
 			reg = <3 0x0 0x800>;
 			fsl,upm-addr-offset = <0x10>;
 			fsl,upm-cmd-offset = <0x08>;
+			fsl,upm-wait-flags = <0x5>;
+			/* Multi-chip device */
+			fsl,upm-mar-chip-offset = <0x200>;
+			num-chips = <2>;
+			chip-offset = <0x200>;
 			chip-delay = <25>; // in micro-seconds
 
 			nand@0 {
@@ -397,7 +402,7 @@
 
 				partition@0 {
 					    label = "fs";
-					    reg = <0x00000000 0x01000000>;
+					    reg = <0x00000000 0x10000000>;
 				};
 			};
 		};
-- 
1.6.0.6
