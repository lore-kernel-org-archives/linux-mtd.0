Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTKXr-0004q3-Gq
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2018 05:11:41 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@sigma-star.at>,
 Philipp Rosenberger <p.rosenberger@linutronix.de>,
 Rob Herring <robh@kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 0/3] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Date: Thu, 14 Jun 2018 14:11:04 +0900
Message-Id: <1528953067-24324-1-git-send-email-yamada.masahiro@socionext.com>
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


Changes in v2:
  - Split patches into sensible chunks

Masahiro Yamada (3):
  mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
  mtd: rawnand: denali_dt: add more clocks based on IP datasheet
  mtd: rawnand: denali: optimize timing parameters for data interface

 .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++
 drivers/mtd/nand/raw/denali.c                      | 49 ++++++++--------
 drivers/mtd/nand/raw/denali.h                      |  1 +
 drivers/mtd/nand/raw/denali_dt.c                   | 66 ++++++++++++++++++----
 drivers/mtd/nand/raw/denali_pci.c                  |  1 +
 5 files changed, 86 insertions(+), 36 deletions(-)

-- 
2.7.4
