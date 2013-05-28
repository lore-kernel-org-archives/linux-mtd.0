Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhIHu-0003SC-LZ
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 11:42:00 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
Subject: [PATCH v4,2/3] ARM: dts: AM33XX: update GPMC node
Date: Tue, 28 May 2013 17:11:24 +0530
Message-ID: <1369741285-1967-3-git-send-email-pekon@ti.com>
In-Reply-To: <1369741285-1967-1-git-send-email-pekon@ti.com>
References: <1369741285-1967-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: "Balbi,
 Felipe" <balbi@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>, hvaibhav@ti.com,
 "Gupta, Pekon" <pekon@ti.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Gupta, Pekon" <pekon@ti.com>

add prefix to 'gpmc' specific properties

Signed-off-by: Gupta, Pekon <pekon@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 0425af8..095f696 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -418,7 +418,7 @@
 			reg = <0x50000000 0x2000>;
 			interrupts = <100>;
 			num-cs = <7>;
-			num-waitpins = <2>;
+			gpmc,num-waitpins = <2>;
 			#address-cells = <2>;
 			#size-cells = <1>;
 			status = "disabled";
-- 
1.8.1
