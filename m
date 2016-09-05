Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgvsD-00060I-Uh
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 15:31:50 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/6] UBI: add support for 'SLC mode' volumes
Date: Mon,  5 Sep 2016 17:31:21 +0200
Message-Id: <1473089487-29285-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch series is adding support for SLC mode volumes.
This is particularly useful on MLC NANDs, where using the NAND in MLC
mode is not reliable.

The first part of the series (patch 1 and 2) are reworking the on-flash
format versioning to support several on-flash format versions with the
same UBI implementation.
Richard, I know you already proposed a solution for the on-flash format
versioning, and after reading the discussion again, I didn't find any
good reason to add the features field we were discussing. Maybe, I'm
wrong, and maybe this is really needed, so feel free to comment on the
current proposal.

The remaining patches prepare the introduction of SLC mode. Note that
we are introducing a new on-flash version (version 2), and SLC mode
volumes are only accepted when the on-flash format version is greater
than 1.

On a side note, this SLC mode and the MLC_SAFE mode we will introduce
later on are quite different. The MLC_SAFE will allow one to use almost
all the MLC NAND capacity in a reliable way, SLC mode only expose half
the real capacity (when used on top of an MLC NAND).

This series depends on the UBI cleanup series [1] I posted earlier
today, and on the MTD pairing scheme [2] series I posted a few weeks
ago.

Regards,

Boris

[1]https://lkml.org/lkml/2016/9/5/459
[2]https://lkml.org/lkml/2016/6/20/459

Boris Brezillon (6):
  UBI: dissociate the on-flash format version and the userspace ABI
    version
  UBI: rework the on-flash format versioning logic
  UBI: use vol->usable_leb_size instead of (ubi->leb_size -
    vol->data_pad)
  UBI: introduce per-volume leb_size
  UBI: io: support SLC mode accesses
  UBI: add SLC mode support

 drivers/mtd/ubi/attach.c    |  59 +++++++--
 drivers/mtd/ubi/build.c     |  10 +-
 drivers/mtd/ubi/cdev.c      |  11 +-
 drivers/mtd/ubi/debug.c     |   4 +
 drivers/mtd/ubi/eba.c       |  64 ++++++++--
 drivers/mtd/ubi/fastmap.c   |   9 +-
 drivers/mtd/ubi/io.c        | 305 ++++++++++++++++++++++++++++++++++++++------
 drivers/mtd/ubi/ubi-media.h |  37 +++++-
 drivers/mtd/ubi/ubi.h       |  99 +++++++++++++-
 drivers/mtd/ubi/upd.c       |   2 +-
 drivers/mtd/ubi/vmt.c       |  41 ++++--
 drivers/mtd/ubi/vtbl.c      |  52 +++++++-
 include/uapi/mtd/ubi-user.h |  24 +++-
 13 files changed, 621 insertions(+), 96 deletions(-)

-- 
2.7.4
