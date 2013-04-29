From: "Gupta, Pekon" <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>, <b-cousson@ti.com>, <tony@atomide.com>,
 <linux@arm.linux.org.uk>
Subject: [v2,1/3] ARM: dts: AM33XX: Add ELM node
Date: Mon, 29 Apr 2013 13:23:59 +0530
Message-ID: <7fa7438c9a7c5da575d762423815625d523c4689.1359007746.git.avinashphilip@ti.com>
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

Add ELM data node to AM33XX device tree file.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
Acked-by: Peter Korsgaard <jacmet@sunsite.dk>
Tested-by: Pekon Gupta <pekon@ti.com>

---
Changes since v2:
	- Replace <xx> literals to 52
	- remove tab

 arch/arm/boot/dts/am33xx.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index da79618..115bf28 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -389,5 +389,13 @@
 				mac-address = [ 00 00 00 00 00 00 ];
 			};
 		};
+
+		elm: elm@48080000 {
+			compatible = "ti,am3352-elm";
+			reg = <0x48080000 0x2000>;
+			interrupts = <4>;
+			ti,hwmods = "elm";
+			status = "disabled";
+		};
 	};
 };
