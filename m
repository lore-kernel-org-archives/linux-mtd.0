Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VowLy-0007Lo-4f
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 14:26:03 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 <computersforpeace@gmail.com>, <marex@denx.de>
Subject: [PATCHv2 08/10] Documentation: bindings: ti-qspi: update binding
 information.
Date: Fri, 6 Dec 2013 19:54:49 +0530
Message-ID: <1386339891-32717-9-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
References: <1386339891-32717-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, balbi@ti.com, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, Sourav Poddar <sourav.poddar@ti.com>,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These update binding information for ti qspi controller.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
---
v1->v2:
 Add 'reg-names' variables used in dts files.

 Documentation/devicetree/bindings/spi/ti_qspi.txt |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/ti_qspi.txt b/Documentation/devicetree/bindings/spi/ti_qspi.txt
index 1f9641a..601a360 100644
--- a/Documentation/devicetree/bindings/spi/ti_qspi.txt
+++ b/Documentation/devicetree/bindings/spi/ti_qspi.txt
@@ -3,6 +3,11 @@ TI QSPI controller.
 Required properties:
 - compatible : should be "ti,dra7xxx-qspi" or "ti,am4372-qspi".
 - reg: Should contain QSPI registers location and length.
+- reg-names: Should contain the resource reg names.
+	- qspi_base: Qspi configuration register Address space
+	- qspi_mmap: Memory mapped Address space
+	- (optional) qspi_ctrlmod: Control module Address space
+- interrupts: should contain the qspi interrupt number.
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
 - ti,hwmods: Name of the hwmod associated to the QSPI
 
@@ -14,7 +19,8 @@ Example:
 
 qspi: qspi@4b300000 {
 	compatible = "ti,dra7xxx-qspi";
-	reg = <0x4b300000 0x100>;
+	reg = <0x47900000 0x100>, <0x30000000 0x3ffffff>;
+	reg-names = "qspi_base", "qspi_mmap";
 	#address-cells = <1>;
 	#size-cells = <0>;
 	spi-max-frequency = <25000000>;
-- 
1.7.1
