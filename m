From: Huang Shijie <b32955@freescale.com>
To: <shawn.guo@linaro.org>
Subject: [PATCH] ARM: dts: mxs: add the `clock-names` for gpmi-nand
Date: Wed, 10 Oct 2012 14:15:40 +0800
Message-ID: <1349849740-14090-1-git-send-email-b32955@freescale.com>
In-Reply-To: <CAOMZO5A0UX6y3MtHdzZ8V2Z52qsH8Yy-BVtOYEN_OpBezEsvQw@mail.gmail.com>
References: <CAOMZO5A0UX6y3MtHdzZ8V2Z52qsH8Yy-BVtOYEN_OpBezEsvQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, linux-mtd@lists.infradead.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current DT nodes for mx23/mx28 miss the `clocks-names` item for gpmi-nand.
So the gpmi-nand driver could not find the proper clock.

This patch fixes this issue.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 arch/arm/boot/dts/imx23.dtsi |    1 +
 arch/arm/boot/dts/imx28.dtsi |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
index 9ca4ca7..6d31aa3 100644
--- a/arch/arm/boot/dts/imx23.dtsi
+++ b/arch/arm/boot/dts/imx23.dtsi
@@ -69,6 +69,7 @@
 				interrupts = <13>, <56>;
 				interrupt-names = "gpmi-dma", "bch";
 				clocks = <&clks 34>;
+				clock-names = "gpmi_io";
 				fsl,gpmi-dma-channel = <4>;
 				status = "disabled";
 			};
diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index e16d631..55c57ea 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -85,6 +85,7 @@
 				interrupts = <88>, <41>;
 				interrupt-names = "gpmi-dma", "bch";
 				clocks = <&clks 50>;
+				clock-names = "gpmi_io";
 				fsl,gpmi-dma-channel = <4>;
 				status = "disabled";
 			};
-- 
1.7.0.4
