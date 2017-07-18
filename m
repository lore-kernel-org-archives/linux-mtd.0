From: Ludovic Desroches <ludovic.desroches@microchip.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <lee.jones@linaro.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@free-electrons.com>,
 <boris.brezillon@free-electrons.com>, <computersforpeace@gmail.com>,
 <romain.izard.pro@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
Subject: [PATCH v2 1/3] mfd: syscon: update Atmel SMC binding doc
Date: Tue, 18 Jul 2017 15:22:18 +0200
Message-ID: <20170718132220.25018-2-ludovic.desroches@microchip.com>
In-Reply-To: <20170718132220.25018-1-ludovic.desroches@microchip.com>
References: <20170718132220.25018-1-ludovic.desroches@microchip.com>
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

A new compatible string is introduced for SMC on sama5d2 to manage a
different layout of the registers.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/atmel-smc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel-smc.txt b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
index 26eeed373934..1103ce2030fb 100644
--- a/Documentation/devicetree/bindings/mfd/atmel-smc.txt
+++ b/Documentation/devicetree/bindings/mfd/atmel-smc.txt
@@ -8,6 +8,7 @@ Required properties:
 - compatible:		Should be one of the following
 			"atmel,at91sam9260-smc", "syscon"
 			"atmel,sama5d3-smc", "syscon"
+			"atmel,sama5d2-smc", "syscon"
 - reg:			Contains offset/length value of the SMC memory
 			region.
 
-- 
2.12.2
