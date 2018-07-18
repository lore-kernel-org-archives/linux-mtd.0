Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffiGs-00082Z-FU
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:57:21 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 0/4] mtd: rawnand: Improve compile-test coverage
Date: Wed, 18 Jul 2018 10:56:48 +0200
Message-Id: <20180718085652.30391-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is an attempt at adding "depends || COMPILE_TEST" to all NAND
drivers that have no compile-time dependencies on arch
features/headers.

This will hopefully help us (NAND/MTD maintainers) in detecting build
issues earlier. Unfortunately we still have a few drivers that can't
easily be modified to be arch independent.

Regards,

Boris

Changes in v2:
- Fix a few problems reported by kbuild robots and Stephen Rothwell

Changes in v3:
- Drop depends on !IA64 since Arnd has added {read,write}s{b,w,l}()
  accessors to this arch
- Make sure the orion driver compiles when __LINUX_ARM_ARCH__ is not
  defined

Boris Brezillon (4):
  mtd: rawnand: s3c2410: Allow selection of this driver when
    COMPILE_TEST=y
  mtd: rawnand: orion: Avoid direct inclusion of asm headers
  mtd: rawnand: orion: Handle cases where __LINUX_ARM_ARCH__ is not
    defined
  mtd: rawnand: orion: Allow selection of this driver when
    COMPILE_TEST=y

 drivers/mtd/nand/raw/Kconfig      | 6 ++++--
 drivers/mtd/nand/raw/orion_nand.c | 6 +++---
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.14.1
