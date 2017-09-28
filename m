Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxN9t-0001TS-80
 for linux-mtd@lists.infradead.org; Thu, 28 Sep 2017 00:58:35 +0000
From: Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com,
 ezequiel.garcia@free-electrons.com, miquel.raynal@free-electrons.com,
 devicetree@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 chris.packham@alliedtelesis.co.nz,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>
Subject: [PATCH v3 0/1] Set FORCE_CSX bit when arbitration between NAND and
 NOR is enabled.
Date: Thu, 28 Sep 2017 13:57:55 +1300
Message-Id: <20170928005756.3938-1-kalyan.kinthada@alliedtelesis.co.nz>
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
needs to be set to 1 according to guidleine GL-5830741
mentioned in Marvell Errata document MV-S501377-00, Rev. D.

Set the FORCE_CSX bit in NDCR for ARMADA370 variants as the arbitration
is always enabled by default. This change does not apply for pxa3xx
variants because FORCE_CSX bit does not exist/reserved on the NFCv1.

Ran the "flash_speed" tool on NAND flash on a board with
Armada-xp based SoC which uses only one NAND chip and not using
the arbiter. There is no regression or speed penalty
introduced due to this change.

Changes since v2:
Thanks Miquel RAYNAL for the suggestion.

* "mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants."
  Modified commit message to mention that this change does not apply
  for pxa3xx variants.
  Fixed the missing space in comments.
  Removed unused macros "NDCR_ND_MODE" and "NDCR_NAND_MODE".

Changes since v1:
Thanks Miquel RAYNAL for the suggestion.

* Deleted: "dt-bindings: mtd: pxa3xx: Add "marvell,nand-force-csx" compatible string"
  Not necessary to create a new compatible string.

* "mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants."
  Modified commit message.
  This commit sets the FORCE_CSX bit for all ARMADA370 variants.

-----

Kalyan Kinthada (1):
  mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants.

 drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.14.1
