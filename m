Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVv3-000297-AU
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:27:10 +0000
Received: by wwb39 with SMTP id 39so1274214wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:27:07 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/7] Removing CONFIG_MTD_PARTITIONS
Date: Thu, 12 May 2011 14:26:51 +0100
Message-Id: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series is an RFC for the removal of CONFIG_MTD_PARTITIONS.
Partitioning is still supported, but is always compiled in if CONFIG_MTD is
selected.  To transition, two new symbols are introduced -
mtd_device_{,un}register() that replace add_mtd_device(), add_mtd_partitions()
and their counterparts.  The series converts a number of drivers over to use
these new interfaces and the final patch removes the old symbols.

Note that this patch does not transition all of the drivers so is incomplete
(and not signed off!).  If this approach is suitable then I'll convert all of
the other drivers over.

Jamie Iles (7):
  mtd: always build partitioning support
  mtd: introduce mtd_device_(un)register()
  mtd/physmap: convert to mtd_device_register()
  mtd/nand: convert to mtd_device_unregister()
  nand/gpio: convert to mtd_device_register()
  mtd/plat_nand: convert to mtd_device_register()
  mtd: remove add_mtd_partitions, add_mtd_device and friends

 drivers/mtd/Kconfig            |   18 +-----------------
 drivers/mtd/Makefile           |    3 +--
 drivers/mtd/maps/physmap.c     |   31 +++++--------------------------
 drivers/mtd/mtdcore.c          |   30 +++++++++++++++++++++++++++---
 drivers/mtd/mtdcore.h          |    6 ++++++
 drivers/mtd/mtdpart.c          |    4 ++--
 drivers/mtd/nand/gpio.c        |    5 ++---
 drivers/mtd/nand/nand_base.c   |    7 +------
 drivers/mtd/nand/plat_nand.c   |   14 +++-----------
 include/linux/mtd/mtd.h        |   15 +++++----------
 include/linux/mtd/partitions.h |   11 +----------
 include/linux/mtd/physmap.h    |    4 ----
 12 files changed, 54 insertions(+), 94 deletions(-)

-- 
1.7.4.4
