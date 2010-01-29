Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NaxsU-00072v-At
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 20:55:47 +0000
Subject: [PATCHv3 0/9] mtd: Remove static limit on device numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Fri, 29 Jan 2010 20:55:37 +0000
Message-Id: <1264798537.2785.25.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the third version of this patch series.  Please give me some
feedback, David?

Changes since v2:
- Export idr_get_next() to support building mtdcore as a module
- Correct the limit on block device numbers in mtd_blkdevs
- Register the full range of minor numbers in mtdchar

Ben.

Ben Hutchings (9):
  mtd: Introduce and use iteration macro for reading the MTD device
    table
  mtd: Use get_mtd_device_nm() to find named device in get_sb_mtd()
  nandsim: Define CONFIG_NANDSIM_MAX_PARTS and use it instead of
    MAX_MTD_DEVICES
  mtd: Remove unnecessary comparisons with MAX_MTD_DEVICES
  mtdblock: Dynamically allocate cache info structures
  idr: Export idr_get_next()
  mtd: Replace static array of devices with an idr structure
  mtd: Raise limit on block device minor numbers
  mtdchar: Register the full range of minor numbers

 drivers/mtd/devices/pmc551.c |    4 +-
 drivers/mtd/mtd_blkdevs.c    |   17 ++--
 drivers/mtd/mtdblock.c       |   74 +++++++---------
 drivers/mtd/mtdchar.c        |    8 +-
 drivers/mtd/mtdcore.c        |  205 +++++++++++++++++++++--------------------
 drivers/mtd/mtdcore.h        |    7 ++-
 drivers/mtd/mtdoops.c        |    5 -
 drivers/mtd/mtdsuper.c       |   18 ++---
 drivers/mtd/nand/nandsim.c   |    7 +-
 include/linux/mtd/mtd.h      |    1 -
 lib/idr.c                    |    2 +-
 11 files changed, 169 insertions(+), 179 deletions(-)

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
