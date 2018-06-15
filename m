Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTdOj-0002tW-1w
 for linux-mtd@lists.infradead.org; Fri, 15 Jun 2018 01:19:31 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org,
 Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 0/3] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Date: Fri, 15 Jun 2018 10:18:49 +0900
Message-Id: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The ->setup_data_interface() hook needs to know the clock frequency.
In fact, this IP needs three clocks, bus "which clock?" is really
confusing.  (It is not described in the DT-binding at all.)

This series adds more clocks.  In the new binding, three clocks
are required: core clock, bus interface clock, ECC engine clock.

This series also takes care of the backward compatibility by
providing hardcoded values in case the new clocks are missing.
So, existing DT should work.


Changes in v3:
  - Change the patch order so that the bug-fix one comes the first

Changes in v2:
  - Split patches into sensible chunks
  - Split patches into sensible chunks

Masahiro Yamada (3):
  mtd: rawnand: denali_dt: add more clocks based on IP datasheet
  mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
  mtd: rawnand: denali: optimize timing parameters for data interface

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++
 drivers/mtd/nand/raw/denali.c                      | 49 ++++++++--------
 drivers/mtd/nand/raw/denali.h                      |  1 +
 drivers/mtd/nand/raw/denali_dt.c                   | 66 ++++++++++++++++++----
 drivers/mtd/nand/raw/denali_pci.c                  |  1 +
 5 files changed, 86 insertions(+), 36 deletions(-)

-- 
2.7.4
