Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRsOW-0004aL-5w
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 05:28:18 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 0/2] mtd: rawnand: denali: clean-up unnecessary hook and
 device reset
Date: Wed, 28 Nov 2018 14:27:35 +0900
Message-Id: <1543382857-30827-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I sent this series on September,
and Miquel replied this series was applied:
http://patchwork.ozlabs.org/patch/967242/

But, It turned out not applied.

I rebased it and resending now.


Masahiro Yamada (2):
  mtd: rawnand: denali: remove ->dev_ready() hook
  mtd: rawnand: denali: remove denali_reset_banks()

 drivers/mtd/nand/raw/denali.c | 52 +------------------------------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

-- 
2.7.4
