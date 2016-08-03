Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bV0Gz-0003CI-3t
 for linux-mtd@lists.infradead.org; Wed, 03 Aug 2016 17:48:06 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS updates for v4.8-rc1
Message-ID: <57A22E3A.6020802@nod.at>
Date: Wed, 3 Aug 2016 19:47:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 523d939ef98fd712632d93a5a2b588e477a7565e:

  Linux 4.7 (2016-07-24 12:23:50 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.8-rc1

for you to fetch changes up to 5d71afb0084053687da6b66ce8133a3df3e52fc6:

  ubi: Use bitmaps in Fastmap self-check code (2016-07-29 23:32:58 +0200)

----------------------------------------------------------------
This pull request contains mostly cleanups and minor
improvements of UBI and UBIFS.

----------------------------------------------------------------
Ben Dooks (1):
      ubifs: Make xattr structures static

Daniel Golle (3):
      ubifs: Silence error output if MS_SILENT is set
      ubifs: Update comment for ubifs_errc
      ubifs: Silence early error messages if MS_SILENT is set

Iosif Harutyunov (1):
      ubi: Fix race condition between ubi device creation and udev

Richard Weinberger (10):
      ubi: gluebi: Fix double refcounting
      ubi: Fix early logging
      ubi: Make volume resize power cut aware
      ubi: Fix scan_fast() comment
      ubi: Introduce vol_ignored()
      ubi: Fix whitespace issue in count_fastmap_pebs()
      ubi: Rework Fastmap attach base code
      ubi: Check whether the Fastmap anchor matches the super block
      ubi: Be more paranoid while seaching for the most recent Fastmap
      ubi: Use bitmaps in Fastmap self-check code

Sascha Hauer (1):
      ubi: Only read necessary size when reading the VID header

Sylvain Etienne (1):
      ubifs: switch_gc_head: Remove redondant sync of wbuf

 drivers/mtd/ubi/attach.c  | 141 ++++++++++++++++++++++++++++++++++------------
 drivers/mtd/ubi/build.c   |  13 +++--
 drivers/mtd/ubi/fastmap.c |  65 ++++++++++++++++-----
 drivers/mtd/ubi/gluebi.c  |   5 --
 drivers/mtd/ubi/io.c      |   2 +-
 drivers/mtd/ubi/ubi.h     |  46 ++++++++++++++-
 drivers/mtd/ubi/vmt.c     |  25 +++++---
 drivers/mtd/ubi/wl.c      |  41 +++++++++++---
 fs/ubifs/gc.c             |   4 --
 fs/ubifs/super.c          |  19 ++++---
 fs/ubifs/ubifs.h          |   4 +-
 fs/ubifs/xattr.c          |   6 +-
 12 files changed, 278 insertions(+), 93 deletions(-)
