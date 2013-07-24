Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1sZ5-0001xp-NJ
 for linux-mtd@lists.infradead.org; Wed, 24 Jul 2013 06:28:48 +0000
Received: by mail-pb0-f43.google.com with SMTP id md12so9276889pbc.30
 for <linux-mtd@lists.infradead.org>; Tue, 23 Jul 2013 23:28:25 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/4] mtd: nand: cleanups to BBT
Date: Tue, 23 Jul 2013 23:27:55 -0700
Message-Id: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few random BBT cleanups, some of which I've had sitting around for a
while. There will probably be some more in the near future.

Brian Norris (4):
  mtd: nand: add accessors, macros for in-memory BBT
  mtd: nand: refactor chip->block_markbad interface
  mtd: nand: hide in-memory BBT implementation details
  mtd: nand: remove NAND_BBT_SCANEMPTY

 Documentation/DocBook/mtdnand.tmpl     |   2 -
 drivers/mtd/nand/docg4.c               |   6 -
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  44 +++-----
 drivers/mtd/nand/nand_base.c           | 113 ++++++++++---------
 drivers/mtd/nand/nand_bbt.c            | 194 +++++++++++++++++----------------
 drivers/mtd/nand/omap2.c               |   2 +-
 drivers/mtd/nand/sm_common.c           |   9 +-
 drivers/mtd/onenand/onenand_bbt.c      |   1 -
 include/linux/mtd/bbm.h                |   2 -
 include/linux/mtd/nand.h               |   2 +-
 10 files changed, 185 insertions(+), 190 deletions(-)

-- 
1.8.3.2
