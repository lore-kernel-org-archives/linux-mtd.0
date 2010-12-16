Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTMWc-0006dG-VK
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2010 22:42:15 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/6] Fix UBIFS recovery issues observed on NOR flash
Date: Thu, 16 Dec 2010 23:42:13 +0100
Message-Id: <1292539339-25111-1-git-send-email-agust@denx.de>
In-Reply-To: <292342500.2538.65.camel@localhost>
References: <292342500.2538.65.camel@localhost>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This v2 patch series is the next attempt to fix UBIFS recovery
issues on NOR flash partitions. Previously only one patch
has been submitted. Now, as requested by Artem, the patch
is split into several patches and additionally the setting
of writebufsize for NAND/OneNAND flash is also done. Comments
from Artem to the previous patch have been addressed, too.

Anatolij Gustschin (6):
  mtd: add writebufsize field to mtd_info struct
  mtd: cfi: add writebufsize initialization
  mtd: nand: add mtd->writebufsize initialization
  mtd: onenand: add mtd->writebufsize initialization
  mtd: initialize writebufsize in the MTD object of a partition
  UBI: use mtd->writebufsize to set minimal I/O unit size

 drivers/mtd/chips/cfi_cmdset_0001.c |    1 +
 drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
 drivers/mtd/chips/cfi_cmdset_0020.c |    1 +
 drivers/mtd/mtdconcat.c             |    1 +
 drivers/mtd/mtdpart.c               |    1 +
 drivers/mtd/nand/nand_base.c        |    1 +
 drivers/mtd/onenand/onenand_base.c  |    1 +
 drivers/mtd/ubi/build.c             |   19 ++++++++++++++++++-
 include/linux/mtd/mtd.h             |   13 +++++++++++++
 9 files changed, 41 insertions(+), 1 deletions(-)
