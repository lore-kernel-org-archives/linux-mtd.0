Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZvO3-0001xp-6l
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 09:44:49 +0000
From: Quentin Schulz <quentin.schulz@bootlin.com>
To: dedekind1@gmail.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com,
 marek.vasut@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH v5 0/2] ubi: add possibility to skip CRC check for static UBI
 volumes
Date: Mon,  2 Jul 2018 11:43:49 +0200
Message-Id: <cover.ab725a3c64626915f8184e28937870f36684db61.1530524405.git-series.quentin.schulz@bootlin.com>
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

mtd-utils patches are already merged. See:
http://git.infradead.org/mtd-utils.git/commit/9095d213f536aec0f3c37f6666177f3b907afde7
http://git.infradead.org/mtd-utils.git/commit/7b4a65a27d2621b58c634d02c6a068ed9562383c
http://git.infradead.org/mtd-utils.git/commit/5e9bc0daa41d84ce5de81c4a1665d65f51893c10
http://git.infradead.org/mtd-utils.git/commit/8ba21ab75b41a1f9a6e27eed3ea80c9829669c5a

I forgot to address Artem's comment in v4, sorry for the noise.

Thanks,
Quentin

v5:
  - add comment for vol_cdev_write ignoring skip_check flag,

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

 drivers/mtd/ubi/cdev.c      | 11 +++++++++++
 drivers/mtd/ubi/kapi.c      |  2 +-
 drivers/mtd/ubi/ubi-media.h |  6 ++++++
 drivers/mtd/ubi/ubi.h       |  4 ++++
 drivers/mtd/ubi/vmt.c       | 12 ++++++++++++
 drivers/mtd/ubi/vtbl.c      |  3 +++
 include/uapi/mtd/ubi-user.h | 18 ++++++++++++++++--
 7 files changed, 53 insertions(+), 3 deletions(-)

base-commit: 69877f06915f1c7a9f1704442993bcc12c13ace2
-- 
git-series 0.9.1
