Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dwhJO-0007k0-Jc
 for linux-mtd@lists.infradead.org; Tue, 26 Sep 2017 04:17:37 +0000
From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 ezequiel.garcia@free-electrons.com, devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chris.packham@alliedtelesis.co.nz,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Subject: [PATCH 0/2] Implement guideline when NAND, NOR arbitration is enabled
Date: Tue, 26 Sep 2017 17:16:58 +1300
Message-Id: <20170926041700.22663-1-kalyan.kinthada@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the arbitration between NOR and NAND flash is enabled
the <FORCE_CSX> field bit[21] in the Data Flash Control Register
needs to be set to 1 according to guidleine GL-5830741.

This patch series contain the following patches:
* Patch 1: "dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string"
  * New binding is introduced to implement the guildeline GL-5830741 which will
    be activated in the appropriate device tree files.

* Patch 2: "mtd: nand: pxa3xx: Handle "marvell,nand-force-csx" compatible string"
  * Set the FORCE_CSX bit in Data Flash Control Register if "marvell,nand-force-csx"
    compatible string is activated in the device tree.

-----------------
Kalyan Kinthada (2):
[PATCH 1/2] dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string
[PATCH 2/2] mtd: nand: pxa3xx: Handle "marvell,nand-force-csx" compatible string

 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt | 1 +
 drivers/mtd/nand/pxa3xx_nand.c                        | 6 ++++++
 include/linux/platform_data/mtd-nand-pxa3xx.h         | 3 +++
 3 files changed, 10 insertions(+)

-- 
2.14.1
