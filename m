From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] mtd: nand: sunxi: fix SLC NAND support
Date: Mon,  6 Jun 2016 13:59:11 +0200
Message-Id: <1465214354-31493-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Those 3 patches aims a fixing support for SLC NANDs with rather small
NAND pages (<= 4k).

The first patch promote 512 bytes ECC steps to 1k steps, which should
both save a few OOB bytes and provide stronger ECC.
The second patch checks the ECC step value, and rejects any NAND that
requires ECC steps != 512 | 1024.
The last patch implements ecc->write_subpage(), thus fixing a NULL
pointer dereference when the NAND chip supports subpage write.

Best Regards,

Boris

Boris Brezillon (3):
  mtd: nand: sunxi: prefer 1k ECC blocks when applicable
  mtd: nand: sunxi: check ecc->size values
  mtd: nand: sunxi: fix subpage write

 drivers/mtd/nand/sunxi_nand.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

-- 
2.7.4
