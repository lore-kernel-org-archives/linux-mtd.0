From: Josh Wu <josh.wu@atmel.com>
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] ARM: at91: sama5/dts: move hsmc_clk out of nfc node
Date: Tue, 10 Feb 2015 14:14:44 +0800
Message-ID: <1423548885-27589-2-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1423548885-27589-1-git-send-email-josh.wu@atmel.com>
References: <1423548885-27589-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Josh Wu <josh.wu@atmel.com>, Rob
 Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe
 Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In sama5d3, sama5d4 chips, pmecc will use the hsmc clock. As pmecc is
part of HSMC. So move out hsmc_clk from nfc node to nand node.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---

 arch/arm/boot/dts/sama5d3.dtsi | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 5f4144d..c0c3597 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1413,6 +1413,7 @@
 			atmel,nand-has-dma;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand0_ale_cle>;
+			clocks = <&hsmc_clk>;
 			atmel,pmecc-lookup-table-offset = <0x0 0x8000>;
 			status = "disabled";
 
@@ -1425,7 +1426,6 @@
 					0xffffc000 0x00000070	/* NFC HSMC regs */
 					0x00200000 0x00100000	/* NFC SRAM banks */
 					>;
-				clocks = <&hsmc_clk>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index c3b07d9..9b2139a 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -281,6 +281,7 @@
 			atmel,nand-has-dma;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand>;
+			clocks = <&hsmc_clk>;
 			status = "disabled";
 
 			nfc@90000000 {
@@ -292,7 +293,6 @@
 					0xfc05c000 0x00000070	/* NFC HSMC regs */
 					0x00100000 0x00100000	/* NFC SRAM banks */
                                          >;
-				clocks = <&hsmc_clk>;
 				atmel,write-by-sram;
 			};
 		};
-- 
1.9.1
