Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5J63-000234-LA
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 22:15:25 +0000
From: matthew.gerlach@linux.intel.com
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org,
 tien.hock.loh@intel.com, hean.loong.ong@intel.com
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH v3 1/2] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Date: Thu, 19 Oct 2017 15:14:49 -0700
Message-Id: <1508451290-26426-2-git-send-email-matthew.gerlach@linux.intel.com>
In-Reply-To: <1508451290-26426-1-git-send-email-matthew.gerlach@linux.intel.com>
References: <1508451290-26426-1-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Device Tree bindings for Altera ASMI Parallel II IP Core
connected to a flash chip.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v2:
    Made substitutions suggested by Rob Herring.
    Emphasize driver expects controller is connected to spi-nor flash.

v3: add Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/altera-asmip2.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt

diff --git a/Documentation/devicetree/bindings/mtd/altera-asmip2.txt b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
new file mode 100644
index 0000000..2e58817
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
@@ -0,0 +1,15 @@
+* Altera ASMI Parallel II IP Core
+
+Devicetree bindings for an Altera ASMI Parallel II IP core connected to a
+spi-nor flash chip.
+
+Required properties:
+- compatible : Should be "altr,asmi-parallel2-spi-nor".
+- reg : A tuple consisting of a physical address and length.
+
+Example:
+
+qspi: spi@a0001000 {
+	compatible = "altr,asmi-parallel2-spi-nor";
+	reg = <0xa0001000 0x10>;
+};
-- 
2.7.4
