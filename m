Received: from relmlor4.renesas.com ([210.160.252.174]
 helo=relmlie3.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gICC7-00039f-CR
 for linux-mtd@lists.infradead.org; Thu, 01 Nov 2018 12:35:29 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, Richard Weinberger <richard@nod.at>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/4] spi: rspi: Add r8a77470 to the compatible list
Date: Thu,  1 Nov 2018 12:35:02 +0000
Message-Id: <1541075705-1333-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1541075705-1333-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1541075705-1333-1-git-send-email-fabrizio.castro@bp.renesas.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add r8a77470 to the list of examples with soctypes.
No driver change is needed as "renesas,qspi" will activate
the right code within the corresponding driver.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---

As per Mark Brown's comment on patch "dt-bindings: spi: rspi: Add
r8a7744 to the compatible list", this patch doesn't come with the
"dt-bindings" prefix in the title.

 Documentation/devicetree/bindings/spi/spi-rspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rspi.txt b/Documentation/devicetree/bindings/spi/spi-rspi.txt
index fc97ad6..421722b 100644
--- a/Documentation/devicetree/bindings/spi/spi-rspi.txt
+++ b/Documentation/devicetree/bindings/spi/spi-rspi.txt
@@ -15,6 +15,7 @@ Required properties:
 			- "renesas,qspi-r8a7743" (RZ/G1M)
 			- "renesas,qspi-r8a7744" (RZ/G1N)
 			- "renesas,qspi-r8a7745" (RZ/G1E)
+			- "renesas,qspi-r8a77470" (RZ/G1C)
 			- "renesas,qspi-r8a7790" (R-Car H2)
 			- "renesas,qspi-r8a7791" (R-Car M2-W)
 			- "renesas,qspi-r8a7792" (R-Car V2H)
-- 
2.7.4
