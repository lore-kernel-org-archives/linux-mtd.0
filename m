Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJZwN-0000UU-W2
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 07:36:42 +0000
Date: Fri, 18 May 2018 09:36:18 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>, Brian Norris
 <computersforpeace@gmail.com>
Subject: mtd: Fixes for 4.17-rc6
Message-ID: <20180518093618.0250d922@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Linus,

Here is the MTD fixes PR for 4.17-rc6.

Regards,

Boris

The following changes since commit 67b8d5c7081221efa252e111cd52532ec6d4266f:

  Linux 4.17-rc5 (2018-05-13 16:15:17 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.17-rc6

for you to fetch changes up to 9f825e74d761c13b0cfaa5f65344d64ff970e252:

  mtd: rawnand: Fix return type of __DIVIDE() when called with 32-bit (2018-05-15 14:40:34 +0200)

----------------------------------------------------------------
NAND fixes:
- Fix read path of the Marvell NAND driver
- Make sure we don't pass a u64 to ndelay()

CFI fixes:
- Fix the map_word_andequal() implementation

----------------------------------------------------------------
Ben Hutchings (1):
      mtd: Fix comparison in map_word_andequal()

Boris Brezillon (1):
      mtd: rawnand: marvell: Fix read logic for layouts with ->nchunks > 2

Geert Uytterhoeven (1):
      mtd: rawnand: Fix return type of __DIVIDE() when called with 32-bit

 drivers/mtd/nand/raw/marvell_nand.c |  8 +++++---
 include/linux/mtd/map.h             |  2 +-
 include/linux/mtd/rawnand.h         | 16 +++++++++++-----
 3 files changed, 17 insertions(+), 9 deletions(-)


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
