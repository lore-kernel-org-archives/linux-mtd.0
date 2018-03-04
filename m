Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esZtl-00083K-6e
 for linux-mtd@lists.infradead.org; Sun, 04 Mar 2018 20:06:23 +0000
From: Stefan Agner <stefan@agner.ch>
To: han.xu@nxp.com,
	boris.brezillon@free-electrons.com
Cc: marek.vasut@gmail.com, richard@nod.at, dwmw2@infradead.org,
 cyrille.pitchen@wedev4u.fr, max.oss.09@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 2/2] dt-bindings: mtd: rawnand: gpmi: document specific ECC
 strength
Date: Sun,  4 Mar 2018 21:06:02 +0100
Message-Id: <20180304200602.11475-2-stefan@agner.ch>
In-Reply-To: <20180304200602.11475-1-stefan@agner.ch>
References: <20180304200602.11475-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Document newly supported device tree properties nand-ecc-strength/
nand-ecc-step-size to specify ECC strength/size.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index b289ef3c1b7e..393588385c6e 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -47,6 +47,11 @@ Optional properties:
                        partitions written from Linux with this feature
                        turned on may not be accessible by the BootROM
                        code.
+  - nand-ecc-strength: integer representing the number of bits to correct
+                       per ECC step. Needs to be a multiple of 2.
+  - nand-ecc-step-size: integer representing the number of data bytes
+                       that are covered by a single ECC step. The driver
+                       supports 512 and 1024.
 
 The device tree may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
-- 
2.16.2
