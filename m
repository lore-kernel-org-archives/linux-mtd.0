Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSy2B-0002NP-Dq
 for linux-mtd@lists.infradead.org; Sun, 24 Dec 2017 04:37:22 +0000
Received: from player699.ha.ovh.net (gw6.ovh.net [213.251.189.206])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 9F6A14D2FC
 for <linux-mtd@lists.infradead.org>; Sun, 24 Dec 2017 05:36:58 +0100 (CET)
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
To: computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, broonie@kernel.org, vigneshr@ti.com,
 linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org, nicolas.ferre@microchip.com,
 radu.pirea@microchip.com, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH 2/3] dt-bindings: mtd: atmel-quadspi: add an optional property
 'dmacap, memcpy'
Date: Sun, 24 Dec 2017 05:36:05 +0100
Message-Id: <143542c61ca674d53da4985bbabc142e8e6ebefc.1514087323.git.cyrille.pitchen@wedev4u.fr>
In-Reply-To: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
In-Reply-To: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The optional 'dmacap,memcpy' DT property tells the Atmel QSPI controller
driver to reserve some DMA channel then to use it to perform DMA
memcpy() during data transfers. This feature relies on the generic
bounce buffer helper from spi-nor.c.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
---
 Documentation/devicetree/bindings/mtd/atmel-quadspi.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
index b93c1e2f25dd..002d3f0a445b 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-quadspi.txt
@@ -12,6 +12,10 @@ Required properties:
 - #address-cells: Should be <1>.
 - #size-cells:    Should be <0>.
 
+Optional properties:
+- dmacap,memcpy:  Reserve a DMA channel to perform DMA memcpy() between the
+                  system memory and the QSPI mapped memory.
+
 Example:
 
 spi@f0020000 {
@@ -24,6 +28,7 @@ spi@f0020000 {
 	#size-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi0_default>;
+	dmacap,memcpy;
 
 	m25p80@0 {
 		...
-- 
2.11.0
