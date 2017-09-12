From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Josh Wu <rainyfeeling@outlook.com>, Wan ZongShun <mcuos.com@gmail.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Wenyou Yang <wenyou.yang@atmel.com>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] mtd: nand: introduce NAND_ROW_ADDR_3 flag and improve
 Denali driver
Date: Tue, 12 Sep 2017 11:37:29 +0900
Message-Id: <1505183851-29355-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, Denali NAND driver always expects 3 row address cycle
devices because the driver init code hard-code the register setting.
I will fix it in 2/2.

Many drivers check chip->chipsize if the third row address cycle
is needed or not.  This is not nice because 32MB, 128MB are
magic numbers.  nand_scan_ident can decide it and provide a
driver-friendly flag.

1/2 is touching verious drivers.
I hope Acked-by from driver maintainers if this change looks good.



Masahiro Yamada (2):
  mtd: nand: introduce NAND_ROW_ADDR_3 flag
  mtd: nand: denali: support two row address cycle devices

 drivers/mtd/nand/atmel/nand-controller.c | 3 +--
 drivers/mtd/nand/au1550nd.c              | 3 +--
 drivers/mtd/nand/denali.c                | 4 ++--
 drivers/mtd/nand/diskonchip.c            | 3 +--
 drivers/mtd/nand/hisi504_nand.c          | 3 +--
 drivers/mtd/nand/mxc_nand.c              | 3 +--
 drivers/mtd/nand/nand_base.c             | 9 +++++----
 drivers/mtd/nand/nuc900_nand.c           | 2 +-
 include/linux/mtd/rawnand.h              | 3 +++
 9 files changed, 16 insertions(+), 17 deletions(-)

-- 
2.7.4
