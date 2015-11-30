From: Vignesh R <vigneshr@ti.com>
To: Tony Lindgren <tony@atomide.com>, Brian Norris
 <computersforpeace@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>,
 <hramrach@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 Vignesh R <vigneshr@ti.com>
Subject: [PATCH v4 4/5] ARM: dts: DRA7: add entry for qspi mmap region
Date: Mon, 30 Nov 2015 10:45:14 +0530
Message-ID: <1448860515-28336-5-git-send-email-vigneshr@ti.com>
In-Reply-To: <1448860515-28336-1-git-send-email-vigneshr@ti.com>
References: <1448860515-28336-1-git-send-email-vigneshr@ti.com>
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

Add qspi memory mapped region entries for DRA7xx based SoCs. Also,
update the binding documents for the controller to document this change.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vignesh R <vigneshr@ti.com>
---

v4: No changes.

 Documentation/devicetree/bindings/spi/ti_qspi.txt | 14 ++++++++++++++
 arch/arm/boot/dts/dra7.dtsi                       |  7 +++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/ti_qspi.txt b/Documentation/devicetree/bindings/spi/ti_qspi.txt
index 601a360531a5..334aa3f32cbc 100644
--- a/Documentation/devicetree/bindings/spi/ti_qspi.txt
+++ b/Documentation/devicetree/bindings/spi/ti_qspi.txt
@@ -26,3 +26,17 @@ qspi: qspi@4b300000 {
 	spi-max-frequency = <25000000>;
 	ti,hwmods = "qspi";
 };
+
+For dra7xx:
+qspi: qspi@4b300000 {
+	compatible = "ti,dra7xxx-qspi";
+	reg = <0x4b300000 0x100>,
+	      <0x5c000000 0x4000000>,
+	      <0x4a002558 0x4>;
+	reg-names = "qspi_base", "qspi_mmap",
+		    "qspi_ctrlmod";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	spi-max-frequency = <48000000>;
+	ti,hwmods = "qspi";
+};
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index fe99231cbde5..debe7523643d 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -1153,8 +1153,11 @@
 
 		qspi: qspi@4b300000 {
 			compatible = "ti,dra7xxx-qspi";
-			reg = <0x4b300000 0x100>;
-			reg-names = "qspi_base";
+			reg = <0x4b300000 0x100>,
+			      <0x5c000000 0x4000000>,
+			      <0x4a002558 0x4>;
+			reg-names = "qspi_base", "qspi_mmap",
+				    "qspi_ctrlmod";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			ti,hwmods = "qspi";
-- 
2.6.3
