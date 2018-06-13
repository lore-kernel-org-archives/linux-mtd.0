Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fTDFV-0004qE-HW
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2018 21:24:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 00/14] ubi: Fastmap updates
Date: Wed, 13 Jun 2018 23:23:30 +0200
Message-Id: <20180613212344.11608-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

1. Support for preseeded fastmaps.
A preseeded fastmap is a fastmap created by tools such as ubinize.
That way fastmap deployment is less painful and fast attach is
available upon first boot.

2. Refine various checks.
Detect misconfigured setups better.

3. Allow a forcing a full scan.
Forcing a full scan is useful mostly for debugging and making sure that
it works.

4. Remove the experimental stigma.

Richard Weinberger (14):
  ubi: fastmap: Read PEB numbers more carefully
  ubi: Fix assert in ubi_wl_init
  ubi: fastmap: Add support for flags
  ubi: fastmap: Add UBI_FM_SB_PRESEEDED_FLG flag
  ubi: fastmap: Implement PEB translation
  ubi: fastmap: Handle bad block count for preseeded fastmap case
  ubi: fastmap: Fixup pool sizes for preseeded fastmaps
  ubi: fastmap: Scan empty space if fastmap is preseeded
  ubi: fastmap: Relax size check
  ubi: fastmap: Change a WARN_ON() to ubi_err()
  ubi: Add module parameter to force a full scan
  ubi: uapi: Add mode selector to attach request
  ubi: Wire up attach mode selector
  ubi: Remove experimental stigma from Fastmap

 drivers/mtd/ubi/Kconfig     |   7 +-
 drivers/mtd/ubi/attach.c    |  14 +-
 drivers/mtd/ubi/build.c     |  18 ++-
 drivers/mtd/ubi/cdev.c      |   7 +-
 drivers/mtd/ubi/fastmap.c   | 326 +++++++++++++++++++++++++++++++++++++++-----
 drivers/mtd/ubi/ubi-media.h |  15 +-
 drivers/mtd/ubi/ubi.h       |   7 +-
 drivers/mtd/ubi/wl.c        |  12 +-
 include/uapi/mtd/ubi-user.h |  14 +-
 9 files changed, 369 insertions(+), 51 deletions(-)

-- 
2.13.6
