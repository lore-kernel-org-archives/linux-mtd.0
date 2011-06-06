Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTaPj-0005ny-4H
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 14:04:20 +0000
Received: by wwb39 with SMTP id 39so3003859wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 07:04:16 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/3] mtd: cleanup plat-nand/ts72xx partitions interface
Date: Mon,  6 Jun 2011 18:04:13 +0400
Message-Id: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The following changes since commit d15fed205975d5b552c3f7deee5dc795b002932a:

  mtd: samsung/onenand don't specify default parsing options (2011-06-06 15:06:01 +0300)

are available in the git repository at:
  git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-retain

Dmitry Eremin-Solenikov (3):
      mtd: add a flags for partitions which should just leave smth. after them
      ts72xx: use MTDPART_OFS_RETAIN for mtd partitioning
      mtd: plat-nand: drop unused fields from platform_nand_data

 arch/arm/mach-ep93xx/ts72xx.c  |   23 +++++------------------
 drivers/mtd/mtdpart.c          |   13 +++++++++++++
 drivers/mtd/nand/plat_nand.c   |    2 --
 include/linux/mtd/nand.h       |    2 --
 include/linux/mtd/partitions.h |    5 ++++-
 5 files changed, 22 insertions(+), 23 deletions(-)
