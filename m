From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Piotr Sroka <piotrs@cadence.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: uniphier: add input-delay properties to Cadence
 eMMC node
Date: Fri, 31 Mar 2017 13:20:45 +0900
Message-Id: <1490934045-18874-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit a04e2b383401 ("mmc: sdhci-cadence: Update PHY delay
configuration"), PHY parameters must be specified by DT.

The hard-coded settings have been converted as follows:
- SDHCI_CDNS_PHY_DLY_SD_DEFAULT -> cdns,phy-input-delay-legacy
- SDHCI_CDNS_PHY_DLY_EMMC_SDR   -> cdns,phy-input-delay-mmc-highspeed
- SDHCI_CDNS_PHY_DLY_EMMC_DDR   -> cdns,phy-input-delay-mmc-ddr

The following have not been moved:
- SDHCI_CDNS_PHY_DLY_SD_HS
   this is unneeded in the eMMC configuration
- SDHCI_CDNS_PHY_DLY_EMMC_LEGACY
   this is never enabled by the driver as it is covered by
   SDHCI_CDNS_PHY_DLY_SD_DEFAULT

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 3 +++
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 5dc5124..b6ebdc9 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -310,6 +310,9 @@
 			bus-width = <8>;
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
+			cdns,phy-input-delay-legacy = <4>;
+			cdns,phy-input-delay-mmc-highspeed = <2>;
+			cdns,phy-input-delay-mmc-ddr = <3>;
 		};
 
 		usb0: usb@5a800100 {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 6c9a72d..0ab6c2e 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -394,6 +394,9 @@
 			bus-width = <8>;
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
+			cdns,phy-input-delay-legacy = <4>;
+			cdns,phy-input-delay-mmc-highspeed = <2>;
+			cdns,phy-input-delay-mmc-ddr = <3>;
 		};
 
 		sd: sdhc@5a400000 {
-- 
2.7.4
