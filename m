Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clWcg-00084T-GO
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 08:07:05 +0000
From: Artur Jedrysek <jartur@cadence.com>
To: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Artur Jedrysek <jartur@cadence.com>
Subject: [v2, 4/4] dt-bindings: mtd: Add Octal SPI support to Cadence QSPI.
Date: Wed, 8 Mar 2017 08:05:26 +0000
Message-ID: <1488960326-13858-1-git-send-email-jartur@cadence.com>
In-Reply-To: <1488959932-6657-1-git-send-email-jartur@cadence.com>
References: <1488959932-6657-1-git-send-email-jartur@cadence.com>
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
information about new compatible used to indicate, whether or not
Octal SPI transfers are supported by the device.

Signed-off-by: Artur Jedrysek <jartur@cadence.com>
---
Changelog:
v2: Use new compatible, instead of boolean property, to indicate
Octal SPI support.
---
 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index f248056..41d1e98 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -1,7 +1,9 @@
 * Cadence Quad SPI controller
 
 Required properties:
-- compatible : Should be "cdns,qspi-nor".
+- compatible : Should be "cdns,{qspi|ospi}-nor".
+  Use "cdns,qspi-nor" for Quad SPI controller.
+  Use "cdns,ospi-nor" for Octal SPI controller.
 - reg : Contains two entries, each of which is a tuple consisting of a
 	physical address and length. The first entry is the address and
 	length of the controller register set. The second entry is the
-- 
2.2.2
