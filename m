Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZuHO-0001hk-Ki
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 08:33:52 +0000
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH v4 0/2] ubi: add possibility to skip CRC check for static UBI
 volumes
Date: Mon,  2 Jul 2018 10:32:56 +0200
Message-Id: <cover.99f8f464b3a02f65080962001abf6fd1f8dff0e0.1530519426.git-series.quentin.schulz@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some users of static UBI volumes implement their own integrity check, thus
making the volume CRC check done at open time useless. For instance, this
is the case when one use the ubiblock + dm-verity + squashfs combination,
where dm-verity already checks integrity of the block device but this time
at the block granularity instead of verifying the whole volume.

Skipping this test drastically improves the boot-time.

Patches for mtd-utils will be available as well.

Thanks,
Quentin

v4:
  - add a valid flags mask and check the given volume flag is valid when
  doing verify_mkvol_req(),

v3:
  - fix a few typos,

v2:
  - use volume flags instead of arguments on the kernel command line as
  suggested by Richard,

Quentin Schulz (2):
  ubi: provide a way to skip CRC checks
  ubi: expose the volume CRC check skip flag

 drivers/mtd/ubi/cdev.c      |  7 +++++++
 drivers/mtd/ubi/kapi.c      |  2 +-
 drivers/mtd/ubi/ubi-media.h |  6 ++++++
 drivers/mtd/ubi/ubi.h       |  4 ++++
 drivers/mtd/ubi/vmt.c       | 12 ++++++++++++
 drivers/mtd/ubi/vtbl.c      |  3 +++
 include/uapi/mtd/ubi-user.h | 18 ++++++++++++++++--
 7 files changed, 49 insertions(+), 3 deletions(-)

base-commit: 69877f06915f1c7a9f1704442993bcc12c13ace2
-- 
git-series 0.9.1
