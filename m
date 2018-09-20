Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2v7o-000420-JH
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 09:19:54 +0000
Date: Thu, 20 Sep 2018 11:19:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek
 Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: Fixes for 4.19-rc5
Message-ID: <20180920111928.6cef5b91@bbrezillon>
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

Hello Greg,

Here is a fixes PR for the MTD subsystem.

Regards,

Boris

The following changes since commit 11da3a7f84f19c26da6f86af878298694ede0804:

  Linux 4.19-rc3 (2018-09-09 17:26:43 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.19-rc5

for you to fetch changes up to 4a3e85f2674cbfb81052059107d0165269778e2f:

  mtd: devices: m25p80: Make sure the buffer passed in op is DMA-able (2018-09-18 10:17:48 +0200)

----------------------------------------------------------------
- Fixes a bug in the ->read/write_reg() implementation of the m25p80
  driver
- Make sure of_node_get/put() calls are balanced in the partition
  parsing code
- Fix a race in the denali NAND controller driver
- Fix false positive WARN_ON() in the marvell NAND controller driver

----------------------------------------------------------------
Boris Brezillon (1):
      mtd: devices: m25p80: Make sure the buffer passed in op is DMA-able

Masahiro Yamada (1):
      mtd: rawnand: denali: fix a race condition when DMA is kicked

Miquel Raynal (2):
      mtd: rawnand: marvell: prevent harmless warnings
      mtd: partitions: fix unbalanced of_node_get/put()

 drivers/mtd/devices/m25p80.c        | 26 +++++++++++++++++++++++---
 drivers/mtd/mtdpart.c               |  5 ++++-
 drivers/mtd/nand/raw/denali.c       |  6 ++++++
 drivers/mtd/nand/raw/marvell_nand.c |  4 +++-
 4 files changed, 36 insertions(+), 5 deletions(-)
