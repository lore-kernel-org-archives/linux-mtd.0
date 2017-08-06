Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deQG1-0003hP-Vj
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 18:26:35 +0000
From: matthew.gerlach@linux.intel.com
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH 1/2] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Date: Sun,  6 Aug 2017 11:24:02 -0700
Message-Id: <1502043844-3626-2-git-send-email-matthew.gerlach@linux.intel.com>
In-Reply-To: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Device Tree bindinds for Altera ASMI Parallel II IP Core.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
 .../devicetree/bindings/mtd/altera-asmip2.txt      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt

diff --git a/Documentation/devicetree/bindings/mtd/altera-asmip2.txt b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
new file mode 100644
index 0000000..3380366
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
@@ -0,0 +1,22 @@
+* Altera ASMI Parallel II IP Core
+
+Required properties:
+- compatible : Should be "altr,asmi_parallel2".
+- reg : A tuple consisting of a physical address and length.
+
+Optional subnodes:
+Subnodes of the Altera ASMI Paralllel II IP Core are spi slave nodes.
+- reg : chip select value
+- label : optional user friendly label
+
+Example:
+
+qspi: spi@a0001000 {
+	compatible = "altr,asmi_parallel2";
+	reg = <0xa0001000 0x10>;
+
+	flash@0 {
+		reg = <0>;
+		label = "FPGA Image";
+	};
+};
-- 
2.7.4
