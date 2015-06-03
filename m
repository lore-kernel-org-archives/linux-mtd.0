Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0GCQ-0003Q9-Kj
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2015 21:27:47 +0000
Date: 3 Jun 2015 21:26:42 -0000
Message-Id: <3234c12c90eabbeeb6d33604a324231937e309ec.1433364398.git.hramrach@gmail.com>
In-Reply-To: <cover.1433364398.git.hramrach@gmail.com>
References: <cover.1433364398.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH 11/11] dt: Exynos: add Snow SPI NOR node.
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
  Mark Rutland <mark.rutland@arm.com>,
  Ian Campbell <ijc+devicetree@hellion.org.uk>,
  Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>,
  Kukjin Kim <kgene@kernel.org>,
  Krzysztof Kozlowski <k.kozlowski@samsung.com>,
  Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
  David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>,
  "Rafał Miłecki" <zajec5@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>,
  Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
  Knut Wohlrab <knut.wohlrab@de.bosch.com>,
  "Bean Huo 霍斌斌 \(beanhuo\)" <beanhuo@micron.com>,
  "grmoore@altera.com" <grmoore@altera.com>, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org,
  linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Snow has onboard SPI NOR flash which contains the bootloader.

Add DT node for this flash chip. The flash is rated 133MHz but the pl330
controller can transfer only up to 128 bytes at this speed so use more
conservative settings. Even at 40MHz pl330 can transfer at most 64k with
the current driver.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1fa72cf..38e4cda 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -691,6 +691,18 @@
 	num-cs = <1>;
 	cs-gpios = <&gpa2 5 0>;
 	status = "okay";
+		flash: m25p80@0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <40000000>;
+			linux,max_tx_len = <65536>;
+			m25p,fast-read;
+			controller-data {
+				samsung,spi-feedback-delay = <0>;
+			};
+		};
 };
 
 &usbdrd_dwc3 {
-- 
2.1.4
