From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH 2/2] ARM: at91: sama5d4: dts: change the nand compatible string
Date: Mon, 19 Jan 2015 16:33:07 +0800
Message-ID: <1421656387-12538-2-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1421656387-12538-1-git-send-email-josh.wu@atmel.com>
References: <1421656387-12538-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Josh Wu <josh.wu@atmel.com>, Rob
 Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As we introduce a new "atmel,sama5d4-nand" compatible string for sama5d4,
so we need to apply it for sama5d4 chip.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---

 arch/arm/boot/dts/sama5d4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 1b0f30c..02d67c2 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -267,7 +267,7 @@
 		};
 
 		nand0: nand@80000000 {
-			compatible = "atmel,at91rm9200-nand";
+			compatible = "atmel,sama5d4-nand";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-- 
1.9.1
