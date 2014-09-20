Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVNvz-0005Kt-9q
 for linux-mtd@lists.infradead.org; Sat, 20 Sep 2014 16:54:56 +0000
Received: by mail-wi0-f177.google.com with SMTP id q5so956862wiv.16
 for <linux-mtd@lists.infradead.org>; Sat, 20 Sep 2014 09:54:32 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v4 0/5] nand: OMAP collected fixes
Date: Sat, 20 Sep 2014 17:53:11 +0100
Message-Id: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've collected all the changes recently discussed in a whole patchset.
If you are just reading this for the first time please take a look at:

[1] http://www.spinics.net/lists/linux-omap/msg110965.html
[2] http://www.spinics.net/lists/linux-omap/msg110958.html 

As requested by Roger, the omap_elm is a 'bool' driver now. The plan
is to merge it inside omap2_nand, but my queue is really filled, so
if anyone feels like doing, please be my guest.

Although I'm hoping this to be the last round, feedback and testing
is welcome.

Brian: I wonder if it's too late for v3.18?

Thanks!

Ezequiel Garcia (5):
  nand: omap2: Remove horrible ifdefs to fix module probe
  nand: omap2: Replace pr_err with dev_err
  mtd: nand: Move ELM driver and rename as omap_elm
  mtd: nand: Rename OMAP NAND driver
  mtd: nand: Constrain omap_elm to built-in

 drivers/mtd/devices/Makefile                   |   1 -
 drivers/mtd/nand/Kconfig                       |   2 +-
 drivers/mtd/nand/Makefile                      |   3 +-
 drivers/mtd/nand/{omap2.c => omap2_nand.c}     | 160 ++++++++++++++-----------
 drivers/mtd/{devices/elm.c => nand/omap_elm.c} |   0
 include/linux/platform_data/elm.h              |  16 +++
 6 files changed, 107 insertions(+), 75 deletions(-)
 rename drivers/mtd/nand/{omap2.c => omap2_nand.c} (95%)
 rename drivers/mtd/{devices/elm.c => nand/omap_elm.c} (100%)

-- 
2.1.0
