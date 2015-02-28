Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReEs-00006G-Ag
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:03:15 +0000
Received: by pdjz10 with SMTP id z10so27050808pdj.0
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:02:52 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/7] mtd: various fixes caught by Coverity
Date: Sat, 28 Feb 2015 02:02:23 -0800
Message-Id: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Masahiro Yamada <yamada.m@jp.panasonic.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Several unrelated MTD fixes inspired by Coverity Scan results. I couldn't test
all of them, but they're all pretty obvious.

Brian Norris (7):
  mtd: docg3: drop dead code
  mtd: onenand: drop dead code
  mtd: tests: fix more potential integer overflows
  mtd: nand: fixup bounds checks for nand_{lock,unlock}()
  mtd: nand: denali: drop dead code
  mtd: blkdevs: remove dead code
  mtd: nand: fully initialize mtd_oob_ops

 drivers/mtd/devices/docg3.c        |  2 --
 drivers/mtd/mtd_blkdevs.c          |  3 ---
 drivers/mtd/nand/denali.c          |  3 ---
 drivers/mtd/nand/nand_base.c       | 12 ++++++------
 drivers/mtd/onenand/onenand_base.c | 12 +++---------
 drivers/mtd/tests/oobtest.c        |  2 +-
 drivers/mtd/tests/speedtest.c      |  2 +-
 drivers/mtd/tests/stresstest.c     |  4 ++--
 drivers/mtd/tests/subpagetest.c    |  4 ++--
 drivers/mtd/tests/torturetest.c    |  8 ++++----
 10 files changed, 19 insertions(+), 33 deletions(-)

-- 
2.1.0
