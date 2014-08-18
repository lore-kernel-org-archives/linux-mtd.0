Received: from mail-ig0-f176.google.com ([209.85.213.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJKEt-0008LI-1N
 for linux-mtd@lists.infradead.org; Mon, 18 Aug 2014 10:32:35 +0000
Received: by mail-ig0-f176.google.com with SMTP id hn18so7653390igb.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2014 03:32:14 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] ARM: sti: Add BCH (NAND Flash) Controller support for
 STiH41x (Orly) SoCs
Date: Mon, 18 Aug 2014 11:31:54 +0100
Message-Id: <1408357919-19793-4-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
References: <1408357919-19793-1-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, computersforpeace@gmail.com, lee.jones@linaro.org,
 kernel@stlinux.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Provide device information and flash layout for the NAND Micron
MT29F8G08ABABAWP chip found on the STM B2020 Development Board.

Reviewed-By: Pekon Gupta <pekon@pek-sem.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih41x-b2020.dtsi | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/stih41x-b2020.dtsi b/arch/arm/boot/dts/stih41x-b2020.dtsi
index d8a8429..553ee1f 100644
--- a/arch/arm/boot/dts/stih41x-b2020.dtsi
+++ b/arch/arm/boot/dts/stih41x-b2020.dtsi
@@ -74,5 +74,43 @@
 
 			pinctrl-0	= <&pinctrl_rgmii1>;
 		};
+
+		nand@fe901000 {
+			compatible = "st,nand-bch";
+			reg = <0xfe901000 0x1000>, <0xfef00000 0x107c>;
+			reg-names = "emi_nand", "emiss";
+			interrupts = <0 139 0x0>;
+			interrupt-names = "nand_irq";
+			status = "disabled";
+
+			/*
+			 * Micron MT29F8G08ABABAWP:
+			 *  - Size = 8Gib(1GiB); Page = 4096+224; Block = 512KiB
+			 *  - ECC = 4-bit/540B min
+			 *  - ONFI 2.1 (timing parameters retrieved during probe)
+			 */
+			bank0 {
+				nand-on-flash-bbt;
+				st,nand-csn		= <0>;
+				st,nand-timing-relax	= <0>;
+
+				partitions {
+					#address-cells	= <1>;
+					#size-cells	= <1>;
+
+					partition@0 {
+						/* 8MB */
+						label = "NANDFlash1";
+						reg = <0x00000000 0x00800000>;
+					};
+
+					partition@800000 {
+						/* 1GB - 8MB */
+						label = "NANDFlash2";
+						reg = <0x00800000 0x1f000000>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
1.9.1
