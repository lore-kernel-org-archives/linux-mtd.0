Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZjfo-0007dD-K0
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2015 18:00:45 +0000
Received: by padhk3 with SMTP id hk3so16746377pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2015 11:00:23 -0700 (PDT)
Date: Wed, 9 Sep 2015 11:00:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MTD updates #2 for 4.3-rc1
Message-ID: <20150909180020.GE81844@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

There was one significant bug in my first pull request, fixed here. I
also threw in a few trivial ID additions and a small module rename.

The following changes since commit 718e38b4d96085b4dab08d3d32e5e033aa1ba6e9:

  mtd: mtd_oobtest: Fix the address offset with vary_offset case (2015-08-27 16:30:01 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150909

for you to fetch changes up to 2ff46e6fea6254ac8fa97aeb9c14e51436ab95f6:

  mtd: spi-nor: fix NULL dereference when no match found in spi_nor_ids[] (2015-09-02 16:34:35 -0700)

----------------------------------------------------------------
MTD updates #2 for 4.3-rc1:

 * SPI NOR: bug fix for a "end of table" check that resulted in a NULL
   dereference in some cases

 * SPI NOR: a few new IDs / feature flags

 * OMAP2 NAND: rename module so it doesn't conflict with onenand omap2.ko

----------------------------------------------------------------
Alexis Ballier (1):
      mtd: spi-nor: Add support for sst25wf020a

Brian Norris (1):
      mtd: spi-nor: fix NULL dereference when no match found in spi_nor_ids[]

Joachim Eastwood (1):
      mtd: spi-nor: s25sl064p supports both dual and quad I/O

Jonas Gorski (1):
      mtd: spi-nor: allow dual/quad reads on S25FL129P

Mika Westerberg (1):
      mtd: spi-nor: Add support for Micron n25q064a serial flash

Roger Quadros (1):
      mtd: nand: omap2: Rename shippable module to omap2_nand

 drivers/mtd/nand/Makefile     |  3 ++-
 drivers/mtd/spi-nor/spi-nor.c | 10 ++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)
