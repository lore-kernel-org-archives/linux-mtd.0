Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eLcsY-0004yc-TY
 for linux-mtd@lists.infradead.org; Sun, 03 Dec 2017 22:36:56 +0000
Received: by mail-qk0-x241.google.com with SMTP id d141so19285706qkc.12
 for <linux-mtd@lists.infradead.org>; Sun, 03 Dec 2017 14:36:34 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH] dt-bindings: mtd: fsl-quadspi: Pass the qspi clock names
Date: Sun,  3 Dec 2017 20:36:24 -0200
Message-Id: <1512340584-26894-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@nxp.com>

In order to improve the bindings documentation, explicitly pass the name
of the clocks: "qspi_en" and "qspi", which are mandatory.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index c34aa6f..cc3f579 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -12,7 +12,7 @@ Required properties:
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
   - interrupts : Should contain the interrupt for the device
   - clocks : The clocks needed by the QuadSPI controller
-  - clock-names : the name of the clocks
+  - clock-names : Should contain the name of the clocks: "qspi_en" and "qspi".
 
 Optional properties:
   - fsl,qspi-has-second-chip: The controller has two buses, bus A and bus B.
-- 
2.7.4
