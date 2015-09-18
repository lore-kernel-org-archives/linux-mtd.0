From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 21/27] ARM: dts: dra7x-evm: Provide NAND ready pin
Date: Fri, 18 Sep 2015 17:53:43 +0300
Message-ID: <1442588029-13769-22-git-send-email-rogerq@ti.com>
In-Reply-To: <1442588029-13769-1-git-send-email-rogerq@ti.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On these boards NAND ready pin status is avilable over
GPMC_WAIT0 pin.

Read speed increases from 13768 KiB/ to 17246 KiB/s.
Write speed was unchanged at 7123 KiB/s.
Measured using mtd_speedtest.ko.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 arch/arm/boot/dts/dra7-evm.dts  | 1 +
 arch/arm/boot/dts/dra72-evm.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 8a31161..4760562 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -591,6 +591,7 @@
 		reg = <0 0 4>;		/* device IO registers */
 		interrupt-parent = <&crossbar_mpu>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		ready-gpio = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 pin */
 		ti,nand-ecc-opt = "bch8";
 		ti,elm-id = <&elm>;
 		nand-bus-width = <16>;
diff --git a/arch/arm/boot/dts/dra72-evm.dts b/arch/arm/boot/dts/dra72-evm.dts
index 245f5f9..a11a646 100644
--- a/arch/arm/boot/dts/dra72-evm.dts
+++ b/arch/arm/boot/dts/dra72-evm.dts
@@ -405,6 +405,7 @@
 		reg = <0 0 4>;		/* device IO registers */
 		interrupt-parent = <&crossbar_mpu>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		ready-gpio = <&gpmc 0 GPIO_ACTIVE_HIGH>; /* gpmc_wait0 pin */
 		ti,nand-ecc-opt = "bch8";
 		ti,elm-id = <&elm>;
 		nand-bus-width = <16>;
-- 
2.1.4
