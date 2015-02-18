From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Gregory Clement <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v4 2/2] ARM: mvebu: a385-db-ap: Enable the NAND
Date: Wed, 18 Feb 2015 11:32:08 +0100
Message-Id: <1424255528-1717-3-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1424255528-1717-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1424255528-1717-1-git-send-email-maxime.ripard@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, Sudhakar Gundubogula <sudhakar@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, Boris Brezillon <boris@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Armada 385 Access Point Development Board has a 1GB NAND SLC chip from
Micron as its main storage. Enable it.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/armada-385-db-ap.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/armada-385-db-ap.dts b/arch/arm/boot/dts/armada-385-db-ap.dts
index b891b4c897f5..ee648fb19075 100644
--- a/arch/arm/boot/dts/armada-385-db-ap.dts
+++ b/arch/arm/boot/dts/armada-385-db-ap.dts
@@ -130,6 +130,19 @@
 				phy-mode = "rgmii-id";
 			};
 
+			nfc: flash@d0000 {
+				status = "okay";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				num-cs = <1>;
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+				marvell,nand-keep-config;
+				marvell,nand-enable-arbiter;
+				nand-on-flash-bbt;
+			};
+
 			usb3@f0000 {
 				status = "okay";
 				usb-phy = <&usb3_phy>;
-- 
2.3.0
