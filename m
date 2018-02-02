From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, han.xu@nxp.com,
 festevam@gmail.com, prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH v2 2/2] dt-bindings: spi: updated usage example for
 spi-rx/tx-bus-width properties
Date: Fri,  2 Feb 2018 11:01:24 +0530
Message-Id: <1517549484-6024-3-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1517549484-6024-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1517549484-6024-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Updated usage example by adding properties spi-rx-bus-width
and spi-tx-bus-width for slave node binding.

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
Changes for v2:
- None

 Documentation/devicetree/bindings/spi/spi-bus.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-bus.txt b/Documentation/devicetree/bindings/spi/spi-bus.txt
index 1f6e86f..4dbe267 100644
--- a/Documentation/devicetree/bindings/spi/spi-bus.txt
+++ b/Documentation/devicetree/bindings/spi/spi-bus.txt
@@ -101,6 +101,8 @@ SPI example for an MPC5200 SPI bus:
 			compatible = "micrel,ks8995m";
 			spi-max-frequency = <1000000>;
 			reg = <0>;
+			spi-rx-bus-width = 4;
+			spi-tx-bus-width = 4;
 		};
 
 		codec@1 {
-- 
1.9.1
