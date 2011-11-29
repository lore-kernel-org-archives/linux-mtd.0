Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVC3G-0002Ix-Ca
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 01:00:03 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/5] MTD: modify mtd api to return bitflip info on read
 operations
Date: Mon, 28 Nov 2011 16:58:35 -0800
Message-Id: <1322528315-19631-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Sukumar Ghorai <s-ghorai@ti.com>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
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

Hi,

These patches propose a change to the mtd API for the purpose of returning to
the caller information on the number of bit errors corrected by the ecc
facilities of the device during read operations.  The affected functions are
read() and read_oob().

Currently, the -EUCLEAN value returned by read() and read_oob() is the only
information available to the caller regarding bit error corrections.  This
return value indicates simply that one or more bit errors were corrected.  To
make matters worse, this applies to the entire read operation, which can
potentially span the entire device.  Some NAND flash chips are error prone, and
compensate for that by using strong ecc algorithms capable of correcting
multiple errors in a single page.  In order for higher level code (e.g. UBI) to
effectively detect degradation of the integrity of erase blocks on these
devices, more detailed information is needed.

For the read() method, an unsigned int * argument is added, which the driver
uses to return to the caller the maximum number of bitflips that were corrected
on any single page.  For read_oob(), an element is added to the mtd_oob_ops
structure for the same purpose.  Devices without ecc capabilities (NOR flash,
etc) would simply set the value to 0.

The first patch shows the propsed api change, and the remainder implement it
throughout the mtd subsystem.  It has been tested on mtdram, nandsim,
onenandsim, and the diskonchip G4 flash (nand driver currently out-of-tree), on
partitioned and unpartitioned devices.  Drivers for other devices have been
compile-tested only, but the changes are trivial in most cases.  Comments,
criticisms, objections, gratefully received.

Thanks,
Mike


Mike Dunn (5):
  mtd api changed to return bitflips on read operations
  backport mtd api change to mtd infrastructure
  backport mtd api change to nand, onenand infrastructure
  backport mtd api change to ubi
  backport mtd api change to everything else: devices, chips,
    partitioning, translation layers, etc

 drivers/mtd/afs.c                   |    8 +++++-
 drivers/mtd/ar7part.c               |   10 +++++---
 drivers/mtd/chips/cfi_cmdset_0001.c |    9 +++++--
 drivers/mtd/chips/cfi_cmdset_0002.c |    9 +++++--
 drivers/mtd/chips/cfi_cmdset_0020.c |    9 +++++--
 drivers/mtd/chips/map_absent.c      |    9 +++++--
 drivers/mtd/chips/map_ram.c         |    7 ++++-
 drivers/mtd/chips/map_rom.c         |    7 ++++-
 drivers/mtd/devices/block2mtd.c     |    5 +++-
 drivers/mtd/devices/doc2000.c       |    8 ++++--
 drivers/mtd/devices/doc2001.c       |    8 +++++-
 drivers/mtd/devices/doc2001plus.c   |    7 ++++-
 drivers/mtd/devices/docg3.c         |    5 +++-
 drivers/mtd/devices/lart.c          |    4 ++-
 drivers/mtd/devices/m25p80.c        |    4 ++-
 drivers/mtd/devices/ms02-nv.c       |    5 ++-
 drivers/mtd/devices/mtd_dataflash.c |    5 ++-
 drivers/mtd/devices/mtdram.c        |    3 +-
 drivers/mtd/devices/phram.c         |    4 ++-
 drivers/mtd/devices/pmc551.c        |    5 +++-
 drivers/mtd/devices/slram.c         |    7 ++++-
 drivers/mtd/devices/sst25l.c        |    5 +++-
 drivers/mtd/ftl.c                   |   34 ++++++++++++++++++++---------
 drivers/mtd/inftlcore.c             |    9 +++++--
 drivers/mtd/inftlmount.c            |    9 +++++--
 drivers/mtd/lpddr/lpddr_cmds.c      |    4 +-
 drivers/mtd/maps/bcm963xx-flash.c   |    7 ++++-
 drivers/mtd/mtdblock.c              |   11 +++++++--
 drivers/mtd/mtdblock_ro.c           |    4 ++-
 drivers/mtd/mtdchar.c               |   16 +++++++++----
 drivers/mtd/mtdconcat.c             |   12 +++++++---
 drivers/mtd/mtdoops.c               |    4 ++-
 drivers/mtd/mtdpart.c               |    4 +-
 drivers/mtd/mtdswap.c               |    7 ++++-
 drivers/mtd/nand/diskonchip.c       |    6 +++-
 drivers/mtd/nand/nand_base.c        |   19 ++++++++++++++--
 drivers/mtd/nand/nand_bbt.c         |   11 +++++++--
 drivers/mtd/nftlcore.c              |    9 +++++--
 drivers/mtd/nftlmount.c             |    9 +++++--
 drivers/mtd/onenand/onenand_base.c  |    5 +++-
 drivers/mtd/redboot.c               |    4 ++-
 drivers/mtd/rfd_ftl.c               |   18 +++++++++++----
 drivers/mtd/ssfdc.c                 |    7 ++++-
 drivers/mtd/tests/mtd_pagetest.c    |   40 ++++++++++++++++++++++------------
 drivers/mtd/tests/mtd_readtest.c    |    4 ++-
 drivers/mtd/tests/mtd_speedtest.c   |   12 +++++++---
 drivers/mtd/tests/mtd_stresstest.c  |    3 +-
 drivers/mtd/tests/mtd_subpagetest.c |   13 +++++++---
 drivers/mtd/tests/mtd_torturetest.c |    3 +-
 drivers/mtd/ubi/io.c                |    9 +++++--
 include/linux/mtd/mtd.h             |   11 ++++++++-
 include/linux/mtd/pmc551.h          |    3 +-
 52 files changed, 315 insertions(+), 135 deletions(-)

-- 
1.7.3.4
