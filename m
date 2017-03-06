Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ckrri-000439-QO
 for linux-mtd@lists.infradead.org; Mon, 06 Mar 2017 12:35:52 +0000
From: Artur Jedrysek <jartur@cadence.com>
To: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Artur Jedrysek <jartur@cadence.com>
Subject: [PATCH 3/3] dt-bindings: mtd: Add Octal SPI support to Cadence QSPI.
Date: Mon, 6 Mar 2017 12:34:31 +0000
Message-ID: <1488803671-418-1-git-send-email-jartur@cadence.com>
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

This patch updates Cadence QSPI Device Tree documentation to include
information about new property used to indicate, whether or not
Octal SPI transfers are supported by the device.

Signed-off-by: Artur Jedrysek <jartur@cadence.com>
---
 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index f248056..8438184 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -14,6 +14,9 @@ Required properties:
 
 Optional properties:
 - cdns,is-decoded-cs : Flag to indicate whether decoder is used or not.
+- cdns,octal-controller : Flag to indicate, that used controller supports Octal
+                          SPI transfer mode. May be intentionally omitted to
+                          switch it back to Quad SPI mode.
 
 Optional subnodes:
 Subnodes of the Cadence Quad SPI controller are spi slave nodes with additional
@@ -44,6 +47,7 @@ Example:
 		cdns,fifo-depth = <128>;
 		cdns,fifo-width = <4>;
 		cdns,trigger-address = <0x00000000>;
+		#cdns,octal-controller
 
 		flash0: n25q00@0 {
 			...
-- 
2.2.2
