Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a55GH-0005Vt-EC
 for linux-mtd@lists.infradead.org; Sat, 05 Dec 2015 05:19:58 +0000
Received: by pfnn128 with SMTP id n128so36306210pfn.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 21:19:36 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Arlott <simon@fire.lp0.eu>,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Jonas Gorski <jogo@openwrt.org>,
 Brian Norris <computersforpeace@gmail.com>, <devicetree@vger.kernel.org>,
 <devicetree-spec@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>,
 David Hendricks <dhendrix@chromium.org>
Subject: [RFC PATCH 0/7] mtd: partitions: add of_match_table support
Date: Fri,  4 Dec 2015 21:19:16 -0800
Message-Id: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

There have been several discussions [1] about adding a device tree binding for
associating flash devices with the partition parser(s) that are used on the
flash. There are a few reasons:

 (1) drivers shouldn't have to be encoding platform knowledge by listing what
     parsers might be used on a given system (this is the currently all that's
     supported)
 (2) we can't just scan for all supported parsers (like the block system does), since
     there is a wide diversity of "formats" (no standardization), and it is not
     always safe or efficient to attempt to do so, particularly since many of
     them allow their data structures to be placed anywhere on the flash, and
     so require scanning the entire flash device to find them.

So instead, let's support a new binding so that a device tree can specify what
partition formats might be used. This seems like a reasonable choice (even
though it's not strictly a hardware description) because the flash layout /
partitioning is often very closely tied with the bootloader/firmware, at
production time.

Also, as an example first-use of this mechanism, I support Google's FMAP flash
structure, used on Chrome OS devices.

Note that this is an RFC, mainly for the reason noted in patch 6 ("RFC: mtd:
partitions: enable of_match_table matching"): the of_match_table support won't
yet autoload a partition parser that is built as a module. I'm not quite sure
if there's a lot of value in supporting MTD parsers as modules (block partition
support can't be), but that is supported for "by-name" parser lookups in MTD
already, so I don't feel like dropping that feature yet. Tips or thoughts are
particularly welcome on this aspect!

Also note that there's an existing undocumented binding for a
"linux,part-probe" property, but it is only usable on the physmap_of.c driver
at the moment, and it is IMO not a good binding. I posted my thoughts on that
previously here [2], and since no one else cared to make a better one...I did
it myself.

I'd love it if we could kill the unreviewed binding off in favor of something
more like this...

Currently based on v2 of "mtd: partitions: support cleanup callback for
parsers":

  http://lkml.kernel.org/g/1449271518-118900-1-git-send-email-computersforpeace@gmail.com

and this series
("mtd: ofpart: don't complain about missing 'partitions' node too loudly" and
"doc: dt: mtd: partitions: add compatible property to "partitions" node"):

  http://lkml.kernel.org/g/1449194529-145705-1-git-send-email-computersforpeace@gmail.com

Both of which should hopefully be merged soon.

The current total of this work is stashed here for now:

  git fetch git://git.infradead.org/users/norris/linux-mtd.git partition-of-match

I may rewrite this branch if I post future revisions of these patch sets, FYI.

I look forward to your reviews.

Regards,
Brian

[1] Trying to extend "linux,part-probe":
    http://patchwork.ozlabs.org/patch/475988/
    For bcm47xxpart:
    http://patchwork.ozlabs.org/patch/475986/
    For AFS:
    http://patchwork.ozlabs.org/patch/537827/

[2] "mtd: document linux-specific partition parser DT binding"
    http://lists.infradead.org/pipermail/linux-mtd/2015-October/062773.html

Brian Norris (7):
  mtd: move partition parsers to drivers/mtd/partitions/
  mtd: move partition parsers' Kconfig under a sub-menu
  doc: dt: mtd: partition: add on-flash format binding
  mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
  mtd: partitions: factor out "match by name" handling
  RFC: mtd: partitions: enable of_match_table matching
  mtd: partitions: add Google's FMAP partition parser

 .../devicetree/bindings/mtd/partition.txt          |  75 ++++++-
 drivers/mtd/Kconfig                                | 134 +-----------
 drivers/mtd/Makefile                               |   8 +-
 drivers/mtd/mtdpart.c                              |  99 +++++++--
 drivers/mtd/partitions/Kconfig                     | 138 +++++++++++++
 drivers/mtd/partitions/Makefile                    |   8 +
 drivers/mtd/{ => partitions}/afs.c                 |   0
 drivers/mtd/{ => partitions}/ar7part.c             |   0
 drivers/mtd/{ => partitions}/bcm47xxpart.c         |   0
 drivers/mtd/{ => partitions}/bcm63xxpart.c         |   0
 drivers/mtd/{ => partitions}/cmdlinepart.c         |   0
 drivers/mtd/partitions/google_fmap.c               | 226 +++++++++++++++++++++
 drivers/mtd/{ => partitions}/ofpart.c              |   0
 drivers/mtd/{ => partitions}/redboot.c             |   0
 drivers/of/of_mtd.c                                |  33 +++
 include/linux/mtd/partitions.h                     |   2 +
 include/linux/of_mtd.h                             |  13 ++
 17 files changed, 577 insertions(+), 159 deletions(-)
 create mode 100644 drivers/mtd/partitions/Kconfig
 create mode 100644 drivers/mtd/partitions/Makefile
 rename drivers/mtd/{ => partitions}/afs.c (100%)
 rename drivers/mtd/{ => partitions}/ar7part.c (100%)
 rename drivers/mtd/{ => partitions}/bcm47xxpart.c (100%)
 rename drivers/mtd/{ => partitions}/bcm63xxpart.c (100%)
 rename drivers/mtd/{ => partitions}/cmdlinepart.c (100%)
 create mode 100644 drivers/mtd/partitions/google_fmap.c
 rename drivers/mtd/{ => partitions}/ofpart.c (100%)
 rename drivers/mtd/{ => partitions}/redboot.c (100%)

-- 
2.6.0.rc2.230.g3dd15c0
