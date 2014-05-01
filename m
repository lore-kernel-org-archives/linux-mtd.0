Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnpU-0002kf-5h
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 10:03:00 +0000
Received: by mail-wi0-f173.google.com with SMTP id bs8so395975wib.6
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 03:02:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/47] ARM: sti: Add BCH (NAND Flash) Controller support for
 STiH41x (Orly) SoCs
Date: Thu,  1 May 2014 10:56:08 +0100
Message-Id: <1398938214-17847-2-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
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

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih41x-b2020.dtsi | 39 ++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/stih41x-b2020.dtsi b/arch/arm/boot/dts/stih41x-b2020.dtsi
index bc5818d..0fdeb44 100644
--- a/arch/arm/boot/dts/stih41x-b2020.dtsi
+++ b/arch/arm/boot/dts/stih41x-b2020.dtsi
@@ -52,5 +52,44 @@
 			pinctrl-0	= <&pinctrl_rgmii1>;
 		};
 
+		nandbch: nand-bch {
+			compatible = "st,nand-bch";
+			reg = <0xfe901000 0x1000>, <0xfef00800 0x0800>;
+			reg-names = "nand_mem", "nand_dma";
+			interrupts = <0 139 0x0>;
+			interrupt-names = "nand_irq";
+			st,nand-banks = <&nand_banks>;
+
+			status = "okay";
+		};
+
+		nand_banks: nand-banks {
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
+					partition@0 {
+						/* 8MB */
+						label = "NAND Flash 1";
+						reg = <0x00000000 0x00800000>;
+					};
+					partition@800000 {
+						/* 1GB - 8MB */
+						label = "NAND Flash 2";
+						reg = <0x00800000 0x1F000000>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
1.8.3.2
