Received: from mail-qk0-f173.google.com ([209.85.220.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAOcm-0002N8-Kj
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 20:28:53 +0000
Received: by qkhu186 with SMTP id u186so38183690qkh.0
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2015 13:28:31 -0700 (PDT)
From: Cory Tusar <cory.tusar@pid1solutions.com>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@freescale.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Cc: stefan@agner.ch, linux@arm.linux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, andrew@lunn.ch,
 Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [RFC PATCH 1/7] ARM: dts: vf610: Add missing QuadSPI register mapping
 and names.
Date: Wed,  1 Jul 2015 16:20:04 -0400
Message-Id: <1435782010-9809-3-git-send-email-cory.tusar@pid1solutions.com>
In-Reply-To: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
References: <1435782010-9809-1-git-send-email-cory.tusar@pid1solutions.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Both 'reg' and 'reg-names' are required properties according to binding
documentation, and both should contain two items.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 4aa3351..089a263 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -242,7 +242,8 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,vf610-qspi";
-				reg = <0x40044000 0x1000>;
+				reg = <0x40044000 0x1000>, <0x20000000 0x10000000>;
+				reg-names = "QuadSPI", "QuadSPI-memory";
 				interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks VF610_CLK_QSPI0_EN>,
 					<&clks VF610_CLK_QSPI0>;
-- 
2.3.6
