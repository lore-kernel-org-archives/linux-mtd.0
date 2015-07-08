Received: from mail-qk0-f176.google.com ([209.85.220.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCvrA-0001kk-In
 for linux-mtd@lists.infradead.org; Wed, 08 Jul 2015 20:22:13 +0000
Received: by qkei195 with SMTP id i195so171868894qke.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 13:21:52 -0700 (PDT)
From: Cory Tusar <cory.tusar@pid1solutions.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@freescale.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: stefan@agner.ch, linux@arm.linux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, andrew@lunn.ch,
 Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH v1 2/7] ARM: dts: vfxxx: Include support for qspi1
 functionality.
Date: Wed,  8 Jul 2015 16:21:16 -0400
Message-Id: <1436386881-28088-3-git-send-email-cory.tusar@pid1solutions.com>
In-Reply-To: <1436386881-28088-1-git-send-email-cory.tusar@pid1solutions.com>
References: <1436386881-28088-1-git-send-email-cory.tusar@pid1solutions.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit extends the existing Vybrid QSPI devicetree implementation
to also describe the qspi1 functional block.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vfxxx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 089a263..9554f3d 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -489,6 +489,19 @@
 				status = "disabled";
 			};
 
+			qspi1: quadspi@400c4000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,vf610-qspi";
+				reg = <0x400c4000 0x1000>, <0x50000000 0x10000000>;
+				reg-names = "QuadSPI", "QuadSPI-memory";
+				interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks VF610_CLK_QSPI1_EN>,
+					<&clks VF610_CLK_QSPI1>;
+				clock-names = "qspi_en", "qspi";
+				status = "disabled";
+			};
+
 			fec0: ethernet@400d0000 {
 				compatible = "fsl,mvf600-fec";
 				reg = <0x400d0000 0x1000>;
-- 
2.3.6
