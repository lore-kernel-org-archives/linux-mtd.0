From: Anup Patel <anup.patel@broadcom.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>,
 "Vikram Prakash" <vikramp@broadcom.com>, Sandeep Tripathy
 <tripathy@broadcom.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bcm-kernel-feedback-list@broadcom.com>, "Anup Patel"
 <anup.patel@broadcom.com>
Subject: [PATCH v2 4/4] arm64: dts: Add BRCM IPROC NAND DT node for NS2
Date: Fri, 16 Oct 2015 14:38:57 +0530
Message-ID: <1444986537-28387-5-git-send-email-anup.patel@broadcom.com>
In-Reply-To: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
References: <1444986537-28387-1-git-send-email-anup.patel@broadcom.com>
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

The NAND controller on NS2 SoC is compatible with existing
BRCM IPROC NAND driver so let's enable it in NS2 DT and
NS2 SVK DT.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index e5950d5..a754160 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -63,5 +63,17 @@
 		uart3: serial@66130000 {
 			status = "ok";
 		};
+
+		nand: nand@66460000 {
+			nandcs@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-ecc-mode = "hw";
+				nand-ecc-strength = <8>;
+				nand-ecc-step-size = <512>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index f603277..9610822 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -212,5 +212,19 @@
 			compatible = "brcm,iproc-rng200";
 			reg = <0x66220000 0x28>;
 		};
+
+		nand: nand@66460000 {
+			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
+			reg = <0x66460000 0x600>,
+			      <0x67015408 0x600>,
+			      <0x66460f00 0x20>;
+			reg-names = "nand", "iproc-idm", "iproc-ext";
+			interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			brcm,nand-has-wp;
+		};
 	};
 };
-- 
1.9.1
