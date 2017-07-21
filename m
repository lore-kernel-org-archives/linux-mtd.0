From: Guochun Mao <guochun.mao@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Mark
 Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Guochun Mao <guochun.mao@mediatek.com>
Subject: [PATCH] Documentation: mtk-quadspi: update DT bindings
Date: Fri, 21 Jul 2017 10:36:35 +0800
Message-ID: <1500604595-21185-2-git-send-email-guochun.mao@mediatek.com>
In-Reply-To: <1500604595-21185-1-git-send-email-guochun.mao@mediatek.com>
References: <1500604595-21185-1-git-send-email-guochun.mao@mediatek.com>
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

Add "mediatek,mt2712-nor" for nor flash node's compatible.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
---
 .../devicetree/bindings/mtd/mtk-quadspi.txt        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
index 5ded66a..35974eb 100644
--- a/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/mtk-quadspi.txt
@@ -3,6 +3,7 @@
 Required properties:
 - compatible: 	  The possible values are:
 		  "mediatek,mt2701-nor"
+		  "mediatek,mt2712-nor"
 		  "mediatek,mt7623-nor"
 		  "mediatek,mt8173-nor"
 		  For mt8173, compatible should be "mediatek,mt8173-nor".
-- 
1.7.9.5
