From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] ARM: tegra: add "nor-jedec" flash compatible binding
Date: Fri,  8 May 2015 08:21:38 +0200
Message-Id: <1431066098-19821-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Starting with commits
8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
we have "nor-jedec" binding indicating support for JEDEC identification.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts    | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi      | 2 +-
 arch/arm/boot/dts/tegra124-venice2.dts    | 2 +-
 arch/arm/boot/dts/tegra20-trimslice.dts   | 2 +-
 arch/arm/boot/dts/tegra30-beaver.dts      | 2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi     | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 8b7aa0d..e30985b 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1082,7 +1082,7 @@
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-flash@0 {
-			compatible = "winbond,w25q32dw";
+			compatible = "winbond,w25q32dw", "nor-jedec";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index ed8a8ac..b2da4f0 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1611,7 +1611,7 @@
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-flash@0 {
-			compatible = "winbond,w25q32dw";
+			compatible = "winbond,w25q32dw", "nor-jedec";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index a9aec23..2dc3377 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -343,7 +343,7 @@
 		spi-max-frequency = <25000000>;
 
 		flash@0 {
-			compatible = "winbond,w25q32dw";
+			compatible = "winbond,w25q32dw", "nor-jedec";
 			spi-max-frequency = <25000000>;
 			reg = <0>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 5c3f781..73a30cd 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -866,7 +866,7 @@
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-flash@0 {
-			compatible = "winbond,w25q32dw";
+			compatible = "winbond,w25q32dw", "nor-jedec";
 			reg = <0>;
 			spi-max-frequency = <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra20-trimslice.dts b/arch/arm/boot/dts/tegra20-trimslice.dts
index d99af4e..ace7028 100644
--- a/arch/arm/boot/dts/tegra20-trimslice.dts
+++ b/arch/arm/boot/dts/tegra20-trimslice.dts
@@ -282,7 +282,7 @@
 		status = "okay";
 		spi-max-frequency = <48000000>;
 		spi-flash@0 {
-			compatible = "winbond,w25q80bl";
+			compatible = "winbond,w25q80bl", "nor-jedec";
 			reg = <0>;
 			spi-max-frequency = <48000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index 3dede39..43ae39a 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1884,7 +1884,7 @@
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-flash@1 {
-			compatible = "winbond,w25q32";
+			compatible = "winbond,w25q32", "nor-jedec";
 			reg = <1>;
 			spi-max-frequency = <20000000>;
 		};
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index a1b682e..665a941 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -353,7 +353,7 @@
 		status = "okay";
 		spi-max-frequency = <25000000>;
 		spi-flash@1 {
-			compatible = "winbond,w25q32";
+			compatible = "winbond,w25q32", "nor-jedec";
 			reg = <1>;
 			spi-max-frequency = <20000000>;
 		};
-- 
1.8.4.5
