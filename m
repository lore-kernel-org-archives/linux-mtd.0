Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dx0db-00037Q-JY
 for linux-mtd@lists.infradead.org; Wed, 27 Sep 2017 00:55:48 +0000
From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 ezequiel.garcia@free-electrons.com, miquel.raynal@free-electrons.com,
 devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chris.packham@alliedtelesis.co.nz,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Subject: [PATCH v2 0/1] Set FORCE_CSX bit when arbitration between NAND and
 NOR is enabled.
Date: Wed, 27 Sep 2017 13:55:15 +1300
Message-Id: <20170927005516.28374-1-kalyan.kinthada@alliedtelesis.co.nz>
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

Set the FORCE_CSX bit in NDCR for ARMADA370 variants as the arbitration
is always enabled by default.

Changes since v1:

Thanks Miquel RAYNAL for the suggestion.
* Deleted: "dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string"
  Not necessary to create a new compatible string.

* "mtd-nand-pxa3xx-Set-FORCE_CSX-bit-to-ARMADA370-variants" 
  Modified commit message.
  This commit sets the FORCE_CSX bit for all ARMADA370 variants.

----
Kalyan Kinthada (1):
  mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants.

 drivers/mtd/nand/pxa3xx_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.14.1
