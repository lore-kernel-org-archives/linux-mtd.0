Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYRbY-00053y-Mj
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 07:45:38 +0000
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, thomas.petazzoni@bootlin.com,
 david.oberhollenzer@sigma-star.at,
 Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH v2 0/4] ubi-utils: add possibility to flag a static volume to
 skip CRC check when opening
Date: Thu, 28 Jun 2018 09:43:40 +0200
Message-Id: <20180628074344.10249-1-quentin.schulz@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some users of static UBI volumes implement their own integrity check,
thus making the volume CRC check done at open time by the kernel
useless. For instance, this is the case when one use the ubiblock +
dm-verity + squashfs combination, where dm-verity already checks
integrity of the block device but this time at the block granularity
instead of verifying the whole volume.

Skipping this test drastically improves the boot-time.

This patch adds the CRC check skip flagging of a volume to ubinize and ubimkvol.

This patch series requires the following patches in the Linux kernel to work:
https://lkml.org/lkml/2018/6/28/138 ("ubi: add possibility to skip CRC check for
static UBI volumes")

Thanks,
Quentin

v2:
  - fix a few typos,
  - split big patch in several patches,
  - add comment in ubinize for parsing vol_flags (very simple implementation
  based on autoresize and skip-check flags (the only supported flags to date)
  to be incompatible),

Quentin Schulz (4):
  UBI: update ubi-user.h and ubi-media.h
  libubi: add volume flags to ubi_mkvol_request
  ubi-utils: ubimkvol: add support for skipping CRC check of a static
    volume when opening
  ubi-utils: ubinize: add support for skipping CRC check of a static
    volume when opening

 include/libubi.h        |  2 ++
 include/mtd/ubi-media.h |  6 ++++++
 include/mtd/ubi-user.h  | 16 ++++++++++++++--
 lib/libubi.c            |  1 +
 ubi-utils/ubimkvol.c    | 19 ++++++++++++++++---
 ubi-utils/ubinize.c     | 16 ++++++++++++++++
 6 files changed, 55 insertions(+), 5 deletions(-)

-- 
2.14.1
