Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btz4T-0001O8-Ba
 for linux-mtd@lists.infradead.org; Tue, 11 Oct 2016 15:34:26 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS updates for 4.9-rc1
Message-ID: <3aa0f87a-ae67-5701-3fa7-4e91f0ea24ea@nod.at>
Date: Tue, 11 Oct 2016 17:33:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

The following changes since commit 3be7988674ab33565700a37b210f502563d932e6:

  Linux 4.8-rc7 (2016-09-18 17:27:41 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.9-rc1

for you to fetch changes up to ec037dfcc064f5f81982c78e95bab783568ae35f:

  UBIFS: improve function-level documentation (2016-10-02 22:55:02 +0200)

Please note that there is a small merge conflict with the vfs tree.
http://marc.info/?l=linux-kernel&m=147605883013879&w=2

----------------------------------------------------------------
This pull request contains:
* Fixes for both UBI and UBIFS
* overlayfs support (O_TMPFILE, RENAME_WHITEOUT/EXCHANGE)
* Code refactoring for the upcoming MLC support

----------------------------------------------------------------
Boris Brezillon (18):
      UBI: fastmap: use ubi_find_volume() instead of open coding it
      UBI: fix add_fastmap() to use the vid_hdr passed in argument
      UBI: fastmap: avoid multiple be32_to_cpu() when unneccesary
      UBI: fastmap: scrub PEB when bitflips are detected in a free PEB EC header
      UBI: use vol->usable_leb_size instead of (ubi->leb_size - vol->data_pad)
      UBI: factorize code used to manipulate volumes at attach time
      UBI: factorize destroy_av() and ubi_remove_av() code
      UBI: fastmap: use ubi_rb_for_each_entry() in unmap_peb()
      UBI: fastmap: use ubi_io_{read, write}_data() instead of ubi_io_{read, write}()
      UBI: provide helpers to allocate and free aeb elements
      UBI: move the global ech and vidh variables into struct ubi_attach_info
      UBI: simplify recover_peb() code
      UBI: simplify LEB write and atomic LEB change code
      UBI: add an helper to check lnum validity
      UBI: provide an helper to check whether a LEB is mapped or not
      UBI: provide an helper to query LEB information
      UBI: hide EBA internals
      UBI: introduce the VID buffer concept

Julia Lawall (1):
      UBIFS: improve function-level documentation

Pascal Eberhard (1):
      ubifs: fix host xattr_len when changing xattr

Richard Weinberger (7):
      ubi: Deal with interrupted erasures in WL
      ubi: Fix races around ubi_refill_pools()
      ubi: Fix Fastmap's update_vol()
      ubifs: Implement O_TMPFILE
      ubifs: Implement RENAME_WHITEOUT
      ubifs: Implement RENAME_EXCHANGE
      ubifs: Use move variable in ubifs_rename()

 drivers/mtd/ubi/attach.c     | 304 +++++++++++++-------
 drivers/mtd/ubi/build.c      |   2 +-
 drivers/mtd/ubi/cdev.c       |   6 +-
 drivers/mtd/ubi/eba.c        | 649 ++++++++++++++++++++++++++-----------------
 drivers/mtd/ubi/fastmap-wl.c |   6 +-
 drivers/mtd/ubi/fastmap.c    | 203 ++++++--------
 drivers/mtd/ubi/io.c         |  39 +--
 drivers/mtd/ubi/kapi.c       |  16 +-
 drivers/mtd/ubi/ubi.h        | 132 +++++++--
 drivers/mtd/ubi/vmt.c        |  40 ++-
 drivers/mtd/ubi/vtbl.c       |  17 +-
 drivers/mtd/ubi/wl.c         |  60 ++--
 fs/ubifs/dir.c               | 242 ++++++++++++++--
 fs/ubifs/file.c              |   2 +-
 fs/ubifs/gc.c                |   2 +-
 fs/ubifs/journal.c           | 188 ++++++++++++-
 fs/ubifs/lprops.c            |   2 +-
 fs/ubifs/lpt_commit.c        |   4 +-
 fs/ubifs/replay.c            |   2 +-
 fs/ubifs/ubifs.h             |   8 +-
 fs/ubifs/xattr.c             |   6 +-
 21 files changed, 1302 insertions(+), 628 deletions(-)
