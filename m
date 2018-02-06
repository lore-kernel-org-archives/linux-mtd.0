Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ej7EV-00026A-KN
 for linux-mtd@lists.infradead.org; Tue, 06 Feb 2018 17:40:41 +0000
From: Stefan Agner <stefan@agner.ch>
To: han.xu@nxp.com,
	boris.brezillon@free-electrons.com
Cc: marek.vasut@gmail.com, richard@nod.at, dwmw2@infradead.org,
 cyrille.pitchen@wedev4u.fr, max.oss.09@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/2] dt-bindings: mtd: gpmi-nand: specify fsl,
 use-minimum-ecc behavior
Date: Tue,  6 Feb 2018 18:40:20 +0100
Message-Id: <20180206174021.5947-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The dt property fsl,use-minimum-ecc requires a NAND chip to
provide a ECC strength/step size, otherwise the driver fails
to probe. This is by design to avoid that the driver uses a
fallback and later changes ECC parameters due to additionion
of a NAND chip driver. Document the current behavior.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index b289ef3c1b7e..eb2d9919d063 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -34,9 +34,8 @@ Optional properties:
                        automatically discoverable for some flash
                        (e.g., according to the ONFI standard).
                        However, note that if this strength is not
-                       discoverable or this property is not enabled,
-                       the software may chooses an implementation-defined
-                       ECC scheme.
+                       discoverable the driver will fail probing with
+                       an error.
   - fsl,no-blockmark-swap: Don't swap the bad block marker from the OOB
                        area with the byte in the data area but rely on the
                        flash based BBT for identifying bad blocks.
-- 
2.16.1
