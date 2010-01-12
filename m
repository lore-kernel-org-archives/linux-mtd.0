Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUpqV-0005ip-Ip
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 23:08:24 +0000
Subject: [PATCHv2 0/7] mtd: Dynamic allocation of device numbers
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Jan 2010 23:08:13 +0000
Message-Id: <1263337693.3011.14.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BFThis patch series removes the static array of MTD device pointers =
from
mtdcore and replaces it with an idr structure for dynamic allocation of
device numbers.  It removes MAX_MTD_DEVICES, which is now meaningless.

Patches 1-4 are unchanged from the first version.
Patch 5 was completely replaced.
=EF=BB=BFPatch 6 is unchanged from the first version.
Patch 7 is new and raises the limit on block translation devices.

Ben.

Ben Hutchings (7):
  mtd: Introduce and use iteration macro for reading the MTD device
    table
  mtd: Use get_mtd_device_nm() to find named device in get_sb_mtd()
  nandsim: Define CONFIG_NANDSIM_MAX_PARTS and use it instead of
    MAX_MTD_DEVICES
  mtd: Remove unnecessary comparisons with MAX_MTD_DEVICES
  mtdblock: Dynamically allocate cache info structures
  mtd: Replace static array of devices with an idr structure
  mtd: Raise limit on block device minor numbers

 drivers/mtd/devices/pmc551.c |    4 +-
 drivers/mtd/mtd_blkdevs.c    |   12 ++--
 drivers/mtd/mtdblock.c       |   74 +++++++---------
 drivers/mtd/mtdchar.c        |    3 -
 drivers/mtd/mtdcore.c        |  205 +++++++++++++++++++++-----------------=
---
 drivers/mtd/mtdcore.h        |    7 ++-
 drivers/mtd/mtdoops.c        |    5 -
 drivers/mtd/mtdsuper.c       |   18 ++---
 drivers/mtd/nand/nandsim.c   |    7 +-
 include/linux/mtd/mtd.h      |    1 -
 10 files changed, 161 insertions(+), 175 deletions(-)

--=20
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
