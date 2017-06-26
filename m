Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dPWeN-0006AZ-MR
 for linux-mtd@lists.infradead.org; Mon, 26 Jun 2017 16:14:09 +0000
From: matthew.gerlach@linux.intel.com
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 davem@davemloft.net, mchehab@kernel.org
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
Subject: [PATCH 1/3] ARM: dts: Bindings for Altera Quadspi Controller Version 2
Date: Mon, 26 Jun 2017 09:13:37 -0700
Message-Id: <1498493619-4633-2-git-send-email-matthew.gerlach@linux.intel.com>
In-Reply-To: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Device Tree bindings for Version 2 of the Altera Quadspi Controller
that can be optionally paired with a windowed bridge.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
 .../devicetree/bindings/mtd/altera-quadspi-v2.txt  | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt

diff --git a/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
new file mode 100644
index 0000000..8ba63d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/altera-quadspi-v2.txt
@@ -0,0 +1,37 @@
+* Altera Quad SPI Controller Version 2
+
+Required properties:
+- compatible : Should be "altr,quadspi-v2".
+- reg : Contains at least two entries, and possibly three entries, each of
+	which is a tuple consisting of a physical address and length.
+- reg-names : Should contain the names "avl_csr" and "avl_mem" corresponding
+	      to the control and status registers and qspi memory, respectively.
+
+
+The Altera Quad SPI Controller Version 2 can be paired with a windowed bridge
+in order to reduce the footprint of the memory interface.  When a windowed
+bridge is used, reads and writes of data must be 32 bits wide.
+
+Optional properties:
+- reg-names : Should contain the name "avl_window", if the windowed bridge
+	      is used.  This name corresponds to the register space that
+	      controls the window.
+- window-size : The size of the window which must be an even power of 2.
+- read-bit-reverse : A boolean indicating the data read from the flash should
+		     be bit reversed on a byte by byte basis before being
+		     delivered to the MTD layer.
+- write-bit-reverse : A boolean indicating the data written to the flash should
+		      be bit reversed on a byte by byte basis.
+
+Example:
+
+qspi: spi@a0001000 {
+	compatible = "altr,quadspi-v2";
+	reg = <0xa0001000 0x40>, <0xb0000000 0x4000000>;
+	reg-names = "avl_csr", "avl_mem";
+
+	flash@0 {
+		reg = <0>;
+		label = "FPGA Image";
+	};
+};
-- 
2.7.4
