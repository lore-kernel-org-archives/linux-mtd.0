Received: from mail-ig0-f179.google.com ([209.85.213.179])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDx9o-0007Hv-Lw
 for linux-mtd@lists.infradead.org; Wed, 21 Jan 2015 15:25:25 +0000
Received: by mail-ig0-f179.google.com with SMTP id l13so22195690iga.0
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jan 2015 07:25:03 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/10] ARM: STi: stih416: Use new platform specific
 compatible string
Date: Wed, 21 Jan 2015 15:24:27 +0000
Message-Id: <1421853868-8262-10-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
References: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 lee.jones@linaro.org, kernel@stlinux.com, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The FSM SPI NOR driver now obtains syscfg particulars using DT match. In
order for this to happen each platform is required to supply their own
specific compatible string.

We're also remove the old, now unused vendor properties from the node.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih416.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index fad9073..2e35bab7 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -216,13 +216,11 @@
 
 		/* FSM */
 		spifsm: spifsm@fe902000 {
-			compatible	   = "st,spi-fsm";
+			compatible	   = "st,stih416-spi-fsm";
 			reg		   = <0xfe902000 0x1000>;
 			pinctrl-0	   = <&pinctrl_fsm>;
 
 			st,syscfg	   = <&syscfg_rear>;
-			st,boot-device-reg = <0x958>;
-			st,boot-device-spi = <0x1a>;
 
 			status = "disabled";
 		};
-- 
1.9.1
