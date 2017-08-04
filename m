Received: from mail-bn3nam01on0055.outbound.protection.outlook.com
 ([104.47.33.55] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddj0N-0008PQ-1B
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 20:15:32 +0000
From: Alexandru Gagniuc <alex.g@adaptrum.com>
To: marek.vasut@gmail.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandru Gagniuc <alex.g@adaptrum.com>
Subject: [PATCH v2 7/7] dt-bindings: Add documentation for adaptrum,
 anarion-quadspi
Date: Fri,  4 Aug 2017 13:14:53 -0700
Message-Id: <20170804201453.16172-2-alex.g@adaptrum.com>
In-Reply-To: <20170804201453.16172-1-alex.g@adaptrum.com>
References: <1da97744-bc02-420e-d4e9-5ebf331475e8@gmail.com>
 <20170804201453.16172-1-alex.g@adaptrum.com>
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

Add devicetree binding documentation for the Anarion QSPI controller.

Signed-off-by: Alexandru Gagniuc <alex.g@adaptrum.com>
---
 .../devicetree/bindings/mtd/anarion-quadspi.txt    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/anarion-quadspi.txt

diff --git a/Documentation/devicetree/bindings/mtd/anarion-quadspi.txt b/Documentation/devicetree/bindings/mtd/anarion-quadspi.txt
new file mode 100644
index 0000000..b4971e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/anarion-quadspi.txt
@@ -0,0 +1,22 @@
+* Adaptrum Anarion Quad SPI controller
+
+Required properties:
+- compatible : Should be "adaptrum,anarion-qspi".
+- reg : Contains two entries, each of which is a tuple consisting of a
+	physical address and length. The first entry is the address and
+	length of the controller register set. The second entry is the
+	address and length of the memory-mapped flash. This second region is
+	the region where the controller responds to XIP requests, and may be
+	larger than the size of the attached flash.
+
+Example:
+
+	qspi: qspi@f200f000 {
+		compatible = "adaptrum,anarion-qspi";
+		reg = 	<0xf200f000 0x1000>,
+			<0x20000000 0x08000000>;
+
+		flash0: w25q128fvn@0 {
+			...
+		}
+	};
-- 
2.9.3
