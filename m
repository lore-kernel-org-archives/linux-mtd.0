Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXaA9-0006rE-80
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 15:09:02 +0000
Received: by fabs1 with SMTP id s1so1350834fab.36
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2011 07:08:58 -0800 (PST)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/7] MTD: MAPS: remove bcm963xx-flash
Date: Mon,  5 Dec 2011 16:08:04 +0100
Message-Id: <1323097691-16414-1-git-send-email-jonas.gorski@gmail.com>
Cc: linux-mips@linux-mips.org, Artem Bityutskiy <Artem.Bityutskiy@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>,
 Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While trying to improve the bcm963xx CFE partition parsing, I noticed
that it could be completely replaced by the generic physmap flash
driver using a custom parser.

The following patch set tries to accomplish that.

The first few patches clean take care of some minor code style issues
first to prevent checkpatch from complaining when moving code around.

After that I move the CFE partition parsing into a parser and make
bcm963xx-flash use it to make sure I don't create a non working version.

Finally I'll allow physmap_flash_data to take partition parser names for
overriding the default parsers list (the OF version already allows that),
let BCM63XX use it, and remove the bcm963xx-flash driver as it is now
completely replaced by physmap + CFE parser.

While most patches are limited to the MTD tree, patch 6/7 touches MIPS,
so it could go in either tree. But since the MTD tree already has some
modifications for bcm963xx-flash, I think it's better to let it go
through the MTD tree, to reduce the (potential for) conflicts.

Regards
Jonas

P.S: This patchset is based on l2-mtd-2.6.git, which seems to be the
"correct" tree now (the website says mtd-2.6.git, but it doesn't look
like the correct one, having no commits). 

Jonas Gorski (7):
  MTD: MAPS: bcm963xx-flash: fix word order for spare partition
  MTD: MAPS: bcm963xx-flash: remove superfluous semicolons
  MTD: MAPS: bcm963xx-flash: clean up printk usage
  MTD: MAPS: bcm963xx-flash: make CFE partition parsing an mtd parser
  MTD: MAPS: physmap: allow partition parsers for physmap_flash_data
  MIPS: BCM63XX: use the new bcm63xxpart parser
  MTD: MAPS: remove the now unused bcm963xx-flash

 arch/mips/bcm63xx/boards/board_bcm963xx.c |    3 +
 drivers/mtd/Kconfig                       |    8 +
 drivers/mtd/Makefile                      |    1 +
 drivers/mtd/bcm63xxpart.c                 |  189 ++++++++++++++++++++
 drivers/mtd/maps/Kconfig                  |    1 +
 drivers/mtd/maps/bcm963xx-flash.c         |  265 -----------------------------
 drivers/mtd/maps/physmap.c                |    5 +-
 include/linux/mtd/physmap.h               |    1 +
 8 files changed, 207 insertions(+), 266 deletions(-)
 create mode 100644 drivers/mtd/bcm63xxpart.c
 delete mode 100644 drivers/mtd/maps/bcm963xx-flash.c

-- 
1.7.2.5
