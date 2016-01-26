Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO1Yb-0002Qv-6e
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 11:13:12 +0000
Received: by mail-lf0-x231.google.com with SMTP id h129so103433666lfh.3
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 03:12:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/6] ARM: realview: add flash devices to the PB1176 DTS
Date: Tue, 26 Jan 2016 12:12:04 +0100
Message-Id: <1453806725-4880-6-git-send-email-linus.walleij@linaro.org>
In-Reply-To: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
References: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds the flash memories and ROM to the PB1175 DTS file.
The secure flash is marked as "disabled" by default so as to
protect the user from overwriting the boot monitor.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/arm-realview-pb1176.dts | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm-realview-pb1176.dts
index 1bc64cda819e..b7d727ef1868 100644
--- a/arch/arm/boot/dts/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm-realview-pb1176.dts
@@ -106,6 +106,31 @@
 		clock-frequency = <0>;
 	};
 
+	flash@30000000 {
+		compatible = "arm,versatile-flash", "cfi-flash";
+		reg = <0x30000000 0x4000000>;
+		bank-width = <4>;
+	};
+
+	fpga_flash@38000000 {
+		compatible = "arm,versatile-flash", "cfi-flash";
+		reg = <0x38000000 0x800000>;
+		bank-width = <4>;
+	};
+
+	/*
+	 * The "secure flash" contains things like the boot
+	 * monitor so we don't want people to accidentally
+	 * screw this up. Mark the device tree node disabled
+	 * by default.
+	 */
+	secflash@3c000000 {
+		compatible = "arm,versatile-flash", "cfi-flash";
+		reg = <0x3c000000 0x4000000>;
+		bank-width = <4>;
+		status = "disabled";
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -297,6 +322,13 @@
 			clocks = <&uartclk>, <&pclk>;
 			clock-names = "uartclk", "apb_pclk";
 		};
+
+		/* Direct-mapped development chip ROM */
+		pb1176_rom@10200000 {
+			compatible = "direct-mapped";
+			reg = <0x10200000 0x4000>;
+			bank-width = <1>;
+		};
 	};
 
 	/* These peripherals are inside the FPGA rather than the DevChip */
-- 
2.4.3
