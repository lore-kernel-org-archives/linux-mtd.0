From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/2] mtd: nand: sunxi: cleanup
Date: Wed, 16 Sep 2015 09:46:35 +0200
Message-Id: <1442389597-30698-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Those two patches aim at cleaning up the sunxi_nand driver by first adding
some consistency in the macro definitions, and then factorizing the code
duplicated code found in hw_ecc and hw_syndrome_ecc implementations.

Best Regards,

Boris

Boris Brezillon (2):
  mtd: nand: sunxi: rework macros
  mtd: sunxi: nand: refactor ->read_page()/->write_page() code

 drivers/mtd/nand/sunxi_nand.c | 487 ++++++++++++++++++++++--------------------
 1 file changed, 256 insertions(+), 231 deletions(-)

-- 
1.9.1
