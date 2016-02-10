Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aTRWA-0004Pw-3c
 for linux-mtd@lists.infradead.org; Wed, 10 Feb 2016 09:57:05 +0000
Received: by mail-wm0-x243.google.com with SMTP id p63so3081018wmp.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Feb 2016 01:56:41 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>
Cc: Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Rob Herring <robh@kernel.org>, Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v4 5/5] ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
Date: Wed, 10 Feb 2016 10:56:27 +0100
Message-Id: <1455098187-9442-6-git-send-email-romain.izard.pro@gmail.com>
In-Reply-To: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
References: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Both nodes are required to access NAND Flash memory. Additional
settings will be necessary at the board level to use it.

Tested-by: Wenyou Yang <wenyou.yang@atmel.com>
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
v4: collect Tested-by and Reviewed-by tags
v3: no change
v2: fix device address, hexadecimal with minuscules

 arch/arm/boot/dts/sama5d2.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 3f750f6170f2..484bd8ea6602 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -263,6 +263,44 @@
 			cache-level = <2>;
 		};
 
+		nand0: nand@80000000 {
+			compatible = "atmel,sama5d2-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			reg = < /* EBI CS3 */
+				0x80000000 0x08000000
+				/* SMC PMECC regs */
+				0xf8014070 0x00000490
+				/* SMC PMECC Error Location regs */
+				0xf8014500 0x00000200
+				/* ROM Galois tables */
+				0x00040000 0x00018000
+				>;
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH 6>;
+			atmel,nand-addr-offset = <21>;
+			atmel,nand-cmd-offset = <22>;
+			atmel,nand-has-dma;
+			atmel,has-pmecc;
+			atmel,pmecc-lookup-table-offset = <0x0 0x8000>;
+			status = "disabled";
+
+			nfc@c0000000 {
+				compatible = "atmel,sama5d4-nfc";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = < /* NFC Command Registers */
+					0xc0000000 0x08000000
+					/* NFC HSMC regs */
+					0xf8014000 0x00000070
+					/* NFC SRAM banks */
+					0x00100000 0x00100000
+					>;
+				clocks = <&hsmc_clk>;
+				atmel,write-by-sram;
+			};
+		};
+
 		sdmmc0: sdio-host@a0000000 {
 			compatible = "atmel,sama5d2-sdhci";
 			reg = <0xa0000000 0x300>;
-- 
2.5.0
