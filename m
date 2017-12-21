Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSA7w-0004Mp-I4
 for linux-mtd@lists.infradead.org; Thu, 21 Dec 2017 23:20:08 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: ezequiel.garcia@free-electrons.com, boris.brezillon@free-electrons.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 miquel.raynal@free-electrons.com, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCHv4 0/1] Set FORCE_CSX bit when arbitration between NAND and NOR
 is enabled
Date: Fri, 22 Dec 2017 12:19:03 +1300
Message-Id: <20171221231904.21140-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Note: I've picked this up from Kalyan to try and get things into shape for
submission upstream.

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

Kalyan Kinthada (1):
  mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370 variants

 drivers/mtd/nand/pxa3xx_nand.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.15.1
