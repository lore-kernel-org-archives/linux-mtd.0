From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 27/28] ARM: mvebu: Enable NAND controller in Armada 370
 Mirabox
Date: Tue,  5 Nov 2013 09:55:34 -0300
Message-Id: <1383656135-8627-28-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383656135-8627-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Armada 370 Mirabox has a NAND flash, so enable it in the devicetree
and add the partitions as prepared in the factory images.

In order to skip the driver's custom device detection and use only
ONFI detection, the "marvell,keep-config" parameter is used.
This is needed because we have no support for setting the timings parameters yet.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 arch/arm/boot/dts/armada-370-mirabox.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/armada-370-mirabox.dts b/arch/arm/boot/dts/armada-370-mirabox.dts
index 2471d9d..1e73017 100644
--- a/arch/arm/boot/dts/armada-370-mirabox.dts
+++ b/arch/arm/boot/dts/armada-370-mirabox.dts
@@ -139,6 +139,27 @@
 					reg = <0x25>;
 				};
 			};
+
+			nand@d0000 {
+				status = "okay";
+				num-cs = <1>;
+				marvell,nand-keep-config;
+				marvell,nand-enable-arbiter;
+				nand-on-flash-bbt;
+
+				partition@0 {
+					label = "U-Boot";
+					reg = <0 0x400000>;
+				};
+				partition@400000 {
+					label = "Linux";
+					reg = <0x400000 0x400000>;
+				};
+				partition@800000 {
+					label = "Filesystem";
+					reg = <0x800000 0x3f800000>;
+				};
+			};
 		};
 	};
 };
-- 
1.8.1.5
