Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZig8-0001Nc-I3
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 12:06:37 +0000
Received: by wwf22 with SMTP id 22so1295642wwf.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 05:05:46 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/5] Few additional cleanup patches
Date: Thu, 23 Jun 2011 16:05:26 +0400
Message-Id: <1308830731-5698-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following changes since commit 8c2ce1c78ba6cce94d0dfe6c674ea6c0cba56899:

  mtd: socrates_nand.c: use mtd_device_parse_register (2011-06-23 10:43:39 +0300)

are available in the git repository at:
  git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-big-cleanup

Dmitry Eremin-Solenikov (5):
      mtd/maps: drop edb7312 support
      mtd/nand: drop edb7312 support
      mtd: hide parse_mtd_partitions
      mtd: remove put_partition_parser() from public header
      mtd: drop mtd_device_register

 drivers/mtd/maps/Kconfig       |    7 --
 drivers/mtd/maps/Makefile      |    1 -
 drivers/mtd/maps/edb7312.c     |  135 ----------------------------
 drivers/mtd/mtdcore.c          |   23 -----
 drivers/mtd/mtdcore.h          |    4 +
 drivers/mtd/mtdpart.c          |    3 +-
 drivers/mtd/nand/Kconfig       |    7 --
 drivers/mtd/nand/Makefile      |    1 -
 drivers/mtd/nand/edb7312.c     |  188 ----------------------------------------
 include/linux/mtd/mtd.h        |    5 +-
 include/linux/mtd/partitions.h |    5 -
 11 files changed, 8 insertions(+), 371 deletions(-)
 delete mode 100644 drivers/mtd/maps/edb7312.c
 delete mode 100644 drivers/mtd/nand/edb7312.c
