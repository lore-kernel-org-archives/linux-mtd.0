From: "Gupta, Pekon" <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>, <b-cousson@ti.com>, <tony@atomide.com>,
 <linux@arm.linux.org.uk>
Subject: [v2,2/3] ARM: dts: AM33XX: Add GPMC node
Date: Mon, 29 Apr 2013 13:25:36 +0530
Message-ID: <2645efefa3d36388ff1d4b64255d880b6587770f.1359007746.git.avinashphilip@ti.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: devicetree-discuss@lists.ozlabs.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, hvaibhav@ti.com, gururaja.hebbar@ti.com,
 zonque@gmail.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: avinash philip <avinashphilip@ti.com>

From: "Philip, Avinash" <avinashphilip@ti.com>

Add GPMC data node to AM33XX device tree file.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
Acked-by: Peter Korsgaard <jacmet@sunsite.dk>
Tested-by: Pekon Gupta <pekon@ti.com>

---
Changes since v2:
	- Change number of chip select to 7

 arch/arm/boot/dts/am33xx.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 115bf28..fbcb90b 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -397,5 +397,17 @@
 			ti,hwmods = "elm";
 			status = "disabled";
 		};
+
+		gpmc: gpmc@50000000 {
+			compatible = "ti,am3352-gpmc";
+			ti,hwmods = "gpmc";
+			reg = <0x50000000 0x2000>;
+			interrupts = <100>;
+			num-cs = <7>;
+			num-waitpins = <2>;
+			#address-cells = <2>;
+			#size-cells = <1>;
+			status = "disabled";
+		};
 	};
 };
