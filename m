Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJ01w-0001cs-Cg
 for linux-mtd@lists.infradead.org; Tue, 12 Jan 2016 14:34:41 +0000
Received: by mail-wm0-x242.google.com with SMTP id f206so31675236wmf.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jan 2016 06:34:23 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Josh Wu <josh.wu@atmel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [RFC PATCH 4/4] ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
Date: Tue, 12 Jan 2016 15:33:43 +0100
Message-Id: <1452609223-14790-5-git-send-email-romain.izard.pro@gmail.com>
In-Reply-To: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
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

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
 arch/arm/boot/dts/sama5d2.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index aee571448342..80420177ec1a 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -265,6 +265,44 @@
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
+			nfc@90000000 {
+				compatible = "atmel,sama5d4-nfc";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = < /* NFC Command Registers */
+					0xC0000000 0x08000000
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
