Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4Kfe-0007e4-25
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 00:53:42 +0000
Received: by mail-pd0-f171.google.com with SMTP id y14so94244pdi.16
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 17:53:20 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/6] mtd: nand: cleanups to BBT
Date: Tue, 30 Jul 2013 17:52:54 -0700
Message-Id: <1375231980-13721-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
References: <1374647279-14083-1-git-send-email-computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

This is v2 of my NAND BBT cleanup. The net diff is exactly the same as v1, but
it splits up a few logical changes.

v1 -> v2:
  Split up first patch into 3 patches, according to Ezequiel's comments.
  Hopefully this makes it easier to read and review.

Brian Norris (6):
  mtd: nand: add accessors, macros for in-memory BBT
  mtd: nand: remove multiplied-by-2 block logic
  mtd: nand: eliminate cast
  mtd: nand: refactor chip->block_markbad interface
  mtd: nand: hide in-memory BBT implementation details
  mtd: nand: remove NAND_BBT_SCANEMPTY

 Documentation/DocBook/mtdnand.tmpl     |    2 -
 drivers/mtd/nand/docg4.c               |    6 -
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   44 +++-----
 drivers/mtd/nand/nand_base.c           |  113 ++++++++++---------
 drivers/mtd/nand/nand_bbt.c            |  194 +++++++++++++++++---------------
 drivers/mtd/nand/omap2.c               |    2 +-
 drivers/mtd/nand/sm_common.c           |    9 +-
 drivers/mtd/onenand/onenand_bbt.c      |    1 -
 include/linux/mtd/bbm.h                |    2 -
 include/linux/mtd/nand.h               |    2 +-
 10 files changed, 185 insertions(+), 190 deletions(-)

-- 
1.7.9.5
