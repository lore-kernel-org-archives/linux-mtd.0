Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhIHu-0003SD-Lb
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 11:42:00 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH v4,1/3] ARM: dts: AM33XX: Add ELM node
Date: Tue, 28 May 2013 17:11:23 +0530
Message-ID: <1369741285-1967-2-git-send-email-pekon@ti.com>
In-Reply-To: <1369741285-1967-1-git-send-email-pekon@ti.com>
References: <1369741285-1967-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: "Nori, Sekhar" <nsekhar@ti.com>, hvaibhav@ti.com, "Balbi,
 Felipe" <balbi@ti.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Philip, Avinash" <avinashphilip@ti.com>

Add ELM data node to AM33XX device tree file.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
Acked-by: Peter Korsgaard <jacmet@sunsite.dk>
Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 1460d9b..0425af8 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -404,6 +404,14 @@
 			ti,hwmods = "wkup_m3";
 		};
 
+		elm: elm@48080000 {
+			compatible = "ti,am3352-elm";
+			reg = <0x48080000 0x2000>;
+			interrupts = <4>;
+			ti,hwmods = "elm";
+			status = "disabled";
+		};
+
 		gpmc: gpmc@50000000 {
 			compatible = "ti,am3352-gpmc";
 			ti,hwmods = "gpmc";
-- 
1.8.1
