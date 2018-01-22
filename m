Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1edcoF-0000qS-En
 for linux-mtd@lists.infradead.org; Mon, 22 Jan 2018 14:10:53 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 "boris.brezillon" <boris.brezillon@free-electrons.com>
Subject: [GIT PULL] UBI/UBIFS changes for v4.16
Date: Mon, 22 Jan 2018 15:11:29 +0100
Message-ID: <1676165.UvfiLElynS@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

Sorry, I'm a week too early. Since I'm on vacation for the next two weeks
I'm sending the PR for UBI/UBIFS now and ask you to queue it until next
week (or as soon the merge window opens).

Thanks,
//richard

The following changes since commit a8750ddca918032d6349adbf9a4b6555e7db20da:

  Linux 4.15-rc8 (2018-01-14 15:32:30 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.16-rc1

for you to fetch changes up to 7f29ae9f977bcdc3654e68bc36d170223c52fd48:

  ubi: block: Fix locking for idr_alloc/idr_remove (2018-01-18 16:48:31 +0100)

----------------------------------------------------------------
This pull request contains updates for both UBI and UBIFS:
- Usage of new fscrypt APIs
- A fix for a Fastmap issue
- Other minor bug fixes

----------------------------------------------------------------
Bradley Bolen (1):
      ubi: block: Fix locking for idr_alloc/idr_remove

Clay McClure (1):
      ubi: Fix race condition between ubi volume creation and udev

Colin Ian King (1):
      ubi: fastmap: Clean up the initialization of pointer p

Eric Biggers (5):
      ubifs: switch to fscrypt_file_open()
      ubifs: switch to fscrypt_prepare_link()
      ubifs: switch to fscrypt_prepare_rename()
      ubifs: switch to fscrypt_prepare_lookup()
      ubifs: switch to fscrypt_prepare_setattr()

Geert Uytterhoeven (1):
      ubifs: Fix uninitialized variable in search_dh_cookie()

Jeff Westfahl (1):
      mtd: ubi: Use 'max_bad_blocks' to compute bad_peb_limit if available

Pan Bian (1):
      ubi: fastmap: Use kmem_cache_free to deallocate memory

Rock Lee (1):
      ubifs: remove error message in ubifs_xattr_get

Sascha Hauer (3):
      ubi: fastmap: Erase outdated anchor PEBs during attach
      ubi: Fastmap: Fix typo
      ubi: Fix copy/paste error in function documentation

Wei Yongjun (1):
      mtd: ubi: wl: Fix error return code in ubi_wl_init()

 drivers/mtd/ubi/block.c      | 42 +++++++++++++--------
 drivers/mtd/ubi/build.c      | 13 ++++++-
 drivers/mtd/ubi/eba.c        |  2 +-
 drivers/mtd/ubi/fastmap-wl.c |  2 +-
 drivers/mtd/ubi/fastmap.c    |  5 +--
 drivers/mtd/ubi/vmt.c        | 15 +++++---
 drivers/mtd/ubi/wl.c         | 87 ++++++++++++++++++++++++++++++++------------
 drivers/mtd/ubi/wl.h         |  2 +-
 fs/ubifs/dir.c               | 43 +++++++---------------
 fs/ubifs/file.c              | 41 ++-------------------
 fs/ubifs/tnc.c               | 21 ++++-------
 fs/ubifs/xattr.c             |  2 -
 12 files changed, 140 insertions(+), 135 deletions(-)
