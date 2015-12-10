Received: from mail-bl2on0087.outbound.protection.outlook.com ([65.55.169.87]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a73SN-0007m4-0k
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 15:48:38 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>, Alan Tull
 <atull@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>, Graham Moore
 <grmoore@opensource.altera.com>
Subject: [PATCH] ARM: socfpga: dts: Add NAND device tree for Altera Arria10
Date: Thu, 10 Dec 2015 09:43:45 -0600
Message-ID: <1449762225-3592-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add socfpga_arria10_socdk_nand.dts board file for supporting NAND
on Altera Arria10.

Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
---
 arch/arm/boot/dts/Makefile                       |  1 +
 arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts | 44 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 30bbc37..7031603 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -556,6 +556,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += \
 	sh73a0-kzm9g.dtb
 dtb-$(CONFIG_ARCH_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
+	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
 	socfpga_cyclone5_socdk.dtb \
 	socfpga_cyclone5_de0_sockit.dtb \
diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts b/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
new file mode 100644
index 0000000..e69144b
--- /dev/null
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk_nand.dts
@@ -0,0 +1,44 @@
+/*
+ * Copyright (C) 2015 Altera Corporation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+/dts-v1/;
+#include "socfpga_arria10_socdk.dtsi"
+
+/ {
+	soc {
+		nand: nand@ffb90000 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "denali,denali-nand-dt";
+			reg = <0xffb90000 0x72000>, <0xffb80000 0x10000>;
+			reg-names = "nand_data", "denali_reg";
+			interrupts = <0 99 4>;
+			dma-mask = <0xffffffff>;
+			clocks = <&nand_clk>;
+			have-hw-ecc-fixup;
+			status = "okay";
+
+			partition@nand-boot {
+				label = "Boot and fpga data";
+				reg = <0x0 0x1C00000>;
+			};
+			partition@nand-rootfs {
+				label = "Root Filesystem - JFFS2";
+				reg = <0x1C00000 0x6400000>;
+			};
+		};
+	};
+};
-- 
2.5.0
