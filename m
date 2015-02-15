Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMyGO-0007e3-VL
 for linux-mtd@lists.infradead.org; Sun, 15 Feb 2015 12:25:30 +0000
Message-ID: <54E0901C.7060105@nod.at>
Date: Sun, 15 Feb 2015 13:25:00 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] UBI and UBIFS updates for v3.20
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

the following changes since commit c59c961ca511dc7ee2f4f7e9c224d16f5c76ca6e:

  Merge branch 'drm-fixes' of git://people.freedesktop.org/~airlied/linux (2015-01-27 19:12:38 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git for-linus-v3.20

for you to fetch changes up to 8168b9bba6a88fe8a81be5b5f0937faeb3f6775d:

  UBI: block: Fix checking for NULL instead of IS_ERR() (2015-02-12 23:33:32 +0100)

----------------------------------------------------------------
- Cleanups and bug fixes all over UBI and UBIFS
- block-mq support for UBI Block
- UBI volumes can now be renamed while they are in use
- security.* XATTR support for UBIFS
- A maintainer update

----------------------------------------------------------------
Artem Bityutskiy (3):
      UBI: clean-up printing helpers
      UBI: do propagate positive error codes up
      UBIFS: add a couple of extra asserts

Dan Carpenter (1):
      UBI: block: Fix checking for NULL instead of IS_ERR()

Dan Ehrenberg (1):
      UBI: block: Continue creating ubiblocks after an initialization error

Richard Weinberger (7):
      Add myself as UBI co-maintainer
      UBI: Implement UBI_METAONLY
      UBI: rename_volumes: Use UBI_METAONLY
      UBI: Add initial support for scatter gather
      UBI: Block: Add blk-mq support
      UBI: Fastmap: Care about the protection queue
      UBI: Block: Explain usage of blk_rq_map_sg()

Subodh Nijsure (3):
      UBIFS: Add xattr support for symlinks
      UBIFS: Add security.* XATTR support for the UBIFS
      UBIFS: add ubifs_err() to print error reason

Tanya Brokhman (1):
      UBI: extend UBI layer debug/messaging capabilities - cosmetics

hujianyang (2):
      UBI: fix soft lockup in ubi_check_volume()
      UBIFS: return -EINVAL if log head is empty

 MAINTAINERS               |   9 +-
 drivers/mtd/ubi/block.c   | 247 +++++++++++++++++++++++-----------------------
 drivers/mtd/ubi/build.c   |   6 +-
 drivers/mtd/ubi/cdev.c    |  19 ++--
 drivers/mtd/ubi/eba.c     |  56 +++++++++++
 drivers/mtd/ubi/fastmap.c |  13 +++
 drivers/mtd/ubi/io.c      |   3 +-
 drivers/mtd/ubi/kapi.c    | 110 +++++++++++++++++----
 drivers/mtd/ubi/misc.c    |   2 +
 drivers/mtd/ubi/ubi.h     |  19 ++--
 drivers/mtd/ubi/vtbl.c    |   7 +-
 drivers/mtd/ubi/wl.c      |  10 +-
 fs/ubifs/debug.c          |   4 +
 fs/ubifs/dir.c            |  16 +++
 fs/ubifs/file.c           |   4 +
 fs/ubifs/replay.c         |  19 +++-
 fs/ubifs/super.c          |   1 +
 fs/ubifs/ubifs.h          |   4 +
 fs/ubifs/xattr.c          | 112 +++++++++++++++++++--
 include/linux/mtd/ubi.h   |  53 +++++++++-
 20 files changed, 521 insertions(+), 193 deletions(-)

Thanks,
//richard
