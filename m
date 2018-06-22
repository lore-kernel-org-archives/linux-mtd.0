Received: from conuserg-12.nifty.com ([210.131.2.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fWOak-0005qD-TZ
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2018 16:07:21 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v4 0/5] mtd: rawnand: denali: add new clocks and improve
 setup_data_interface
Date: Sat, 23 Jun 2018 01:06:33 +0900
Message-Id: <1529683598-25783-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The ->setup_data_interface() hook needs to know the clock frequency.
In fact, this IP needs three clocks, but the current driver does not
represent it.  Thus, it is hard to understand what is the correct
clock frequency.
(at least, clock property is not described in the DT-binding at all.)

This series adds more clocks based on the IP datasheet, and document
it in the DT binding.
In the new binding, three clocks are required: core clock, bus interface
clock, ECC engine clock.

1/5 is a backport candidate to fix SOCFPGA.


Masahiro Yamada (5):
  mtd: rawnand: denali_dt: set clk_x_rate to 200 MHz unconditionally
  mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
  dt-binding: mtd: denali_dt: document clock property
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
