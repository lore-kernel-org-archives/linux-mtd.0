Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQQm0-0002Xu-8A
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2016 02:32:57 +0000
Received: by mail-pf0-x243.google.com with SMTP id n128so8234061pfn.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 18:32:35 -0800 (PST)
From: Bean Huo <jackyard88@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com
Cc: beanhuo@micron.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, zszubbocsev@micron.com,
 peterpandong@micron.com
Subject: [PATCH v2 00/17] Add a bakvol module in UBI layer for MLC paired page
 power loss issue
Date: Tue,  2 Feb 2016 02:30:35 +0000
Message-Id: <1454380252-16170-1-git-send-email-jackyard88@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: BeanHuo <beanhuo@micron.com>

These patches aim to solve MLC NAND paired page power loss
issue,by adding a bakvol(backup volume) module in UBI layer.

MLC NAND paired page power loss issue is a known issue so far,
MLC NAND pages are coupled in a sense that if you cut power
while writing to a page, you corrupt not only this page, but
also one of the previous pages which is paired with the current
one.
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_ubifs_mlc

This paired page power loss solution is based on NAND multiple
plane program feature. Dual plane page program method can program
two different plane pages at the same time. as for this solution,
there are three main steps:

1. initialization
 While UBI attach process, if ubi first attach MTD to ubi device,
bakvol will be created, and reserve 20 PEBs for bakvol. if not,
scan every PEB to find out bakvol PEB, update a bakvol PEB table
in RAM.
2. recovery
 While UBIFS mount, and if there is a power loss, bakvol module will
 check if there are lower pages being dameged by last power loss, if
 yes, bakvol will apply for one new PEB, move uncorrupted data to this
 PEB, and recover dameged data by backup page data in bakvol PEB.
3. backup
if UBI proggrams one lower page, bakvol module will duplicate this lower
page data,and then program source page data and backup page data into two
different plane pages(one is user data volume and another is backup volume)
at the same time through dual plane program command.
If UBI porgrams upper page data, still uses mtd_write() to program. In
another word, backup only implements while program lower page.

These patches have already been tested on Micron 70s/80s MLC NAND.

Any suggestions and comments welcomed.

This version patches based on Linux kernel 4.2-rc7.
 
 v2:
   1.Add CRC32 protection for user OOB area data.
   2.Move recovery action from attach step to ubifs mount step.
   3.Add more comments for some key function.
   4.standard multi-plane program function.
   5.Standard send-mail patches

Bean Huo (17):
  include:mtd:add multi-plane page program command
  include:mtd:add multi-plane program in mtd_info
  drivers:mtd:add multi-plane page program support in partition layer
  drivers:mtd:nand:enable dual plane page program function
  drivers:mtd:ubi:add bakvol on-flash and RAM data structures
  drivers:mtd:ubi:add bakvol function define in ubi layer
  fs:ubifs:add bakvol function define in ubifs layer
  drivers:mtd:ubi:disable bakvol function while writing volume table
  drivers:mtd:ubi:get PEB according to specfied plane number
  drivers:mtd:ubi:enable bakvol function for fastmap operation
  drivers:mtd:ubi:add disable/enable bakvol while ubi write
  drivers:mtd:ubi:add disable bakvol while ubi detach
  drivers:mtd:ubi:add bakvol init while attach ubi
  drivers:mtd:ubi:add backup operation in ubi_io_write
  fs:ubifs:enable bakvol module and  recover operation
  driver:mtd:ubi:add new bakvol module in ubi layer
  drivers:mtd:ubi: Kconfig Makefile

 drivers/mtd/mtdpart.c        |   19 +
 drivers/mtd/nand/nand_base.c |  405 +++++++++++++
 drivers/mtd/ubi/Kconfig      |   15 +
 drivers/mtd/ubi/Makefile     |    2 +-
 drivers/mtd/ubi/attach.c     |   24 +-
 drivers/mtd/ubi/bakvol.c     | 1296 ++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/build.c      |    2 +
 drivers/mtd/ubi/eba.c        |   13 +-
 drivers/mtd/ubi/fastmap.c    |    2 +-
 drivers/mtd/ubi/io.c         |   73 ++-
 drivers/mtd/ubi/ubi-media.h  |   64 +++
 drivers/mtd/ubi/ubi.h        |   23 +-
 drivers/mtd/ubi/vtbl.c       |    2 +-
 drivers/mtd/ubi/wl.c         |  140 +++++
 fs/ubifs/super.c             |   11 +
 fs/ubifs/ubifs.h             |    2 +
 include/linux/mtd/mtd.h      |   19 +
 include/linux/mtd/nand.h     |    4 +
 18 files changed, 2091 insertions(+), 25 deletions(-)
 create mode 100644 drivers/mtd/ubi/bakvol.c

-- 
1.9.1
