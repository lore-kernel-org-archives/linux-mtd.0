Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSBBj-00035M-UC
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 15:19:20 +0000
Subject: [PATCH 0/6] mtd: Dynamic allocation of device numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 05 Jan 2010 15:19:09 +0000
Message-Id: <1262704750.2837.3.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series removes the static array of MTD device pointers from
mtdcore and replaces it with an idr structure for dynamic allocation of
device numbers.  It removes MAX_MTD_DEVICES, which is now meaningless.

Ben.

Ben Hutchings (6):
  mtd: Introduce and use iteration macro for reading the MTD device
    table
  mtd: Use get_mtd_device_nm() to find named device in get_sb_mtd()
  nandsim: Define CONFIG_NANDSIM_MAX_PARTS and use it instead of
    MAX_MTD_DEVICES
  mtd: Remove unnecessary comparisons with MAX_MTD_DEVICES
  mtdblock: Replace array of block cache info with pointers in struct
    mtd_info
  mtd: Replace static array of devices with an idr structure

 drivers/mtd/devices/pmc551.c |    4 +-
 drivers/mtd/mtd_blkdevs.c    |   10 +-
 drivers/mtd/mtdblock.c       |   22 ++---
 drivers/mtd/mtdchar.c        |    3 -
 drivers/mtd/mtdcore.c        |  205 +++++++++++++++++++++--------------------
 drivers/mtd/mtdcore.h        |    7 ++-
 drivers/mtd/mtdoops.c        |    5 -
 drivers/mtd/mtdsuper.c       |   18 ++---
 drivers/mtd/nand/nandsim.c   |    7 +-
 include/linux/mtd/mtd.h      |    5 +-
 10 files changed, 143 insertions(+), 143 deletions(-)

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
