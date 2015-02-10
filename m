From: Josh Wu <josh.wu@atmel.com>
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] ARM: at91: sama5d3/dts: add sama5d3 compatiable string
 for nand
Date: Tue, 10 Feb 2015 14:14:45 +0800
Message-ID: <1423548885-27589-3-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1423548885-27589-1-git-send-email-josh.wu@atmel.com>
References: <1423548885-27589-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Pawel Moll <pawel.moll@arm.com>, devicetree@vger.kernel.org,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Josh Wu <josh.wu@atmel.com>, Rob
 Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe
 Plagniol-Villard <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As we introduce a new "atmel,sama5d3-nand" compatible string for
sama5d3, Apply it for sama5d3 chip.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---

 arch/arm/boot/dts/sama5d3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index c0c3597..7b6c36f 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1398,7 +1398,7 @@
 		};
 
 		nand0: nand@60000000 {
-			compatible = "atmel,at91rm9200-nand";
+			compatible = "atmel,sama5d3-nand", "atmel,at91rm9200-nand";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
-- 
1.9.1
