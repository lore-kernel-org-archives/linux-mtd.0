From: Shawn Lin <shawn.lin@rock-chips.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 1/2] mtd: spi-nor: Bindings for Rockchip serial flash
 controller
Date: Fri, 18 Nov 2016 10:59:04 +0800
Message-Id: <1479437945-27918-2-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
References: <1479437945-27918-1-git-send-email-shawn.lin@rock-chips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add binding document for the Rockchip serial flash controller.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v2: None

 .../devicetree/bindings/mtd/rockchip-sfc.txt       | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt

diff --git a/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
new file mode 100644
index 0000000..28430ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
@@ -0,0 +1,31 @@
+Rockchip Serial Flash Controller
+
+Required properties:
+- compatible : Should be
+		"rockchip,rk1108-sfc", "rockchip,sfc" for ROCKCHIP RK1108.
+- address-cells : Should be 1.
+- size-cells : Should be 0.
+- clocks: Must contain two entries for each entry in clock-names.
+- clock-names: Shall be "sfc" for the transfer-clock, and "hsfc" for
+		the peripheral clock.
+- interrupts : Should contain the interrupt for the device.
+- reg: Physical base address of the controller and length of memory mapped.
+
+Optional properties:
+- rockchip,sfc-no-dma: Indicate the controller doesn't support dma transfer.
+
+Example:
+nor_flash: sfc@301c0000 {
+	compatible = "rockchip,rk1108-sfc", "rockchip,sfc";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+	clock-names = "sfc", "hsfc";
+	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+	reg = <0x301c0000 0x1000>;
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <12000000>;
+		reg = <0>;
+	};
+};
-- 
1.9.1
