Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byJfx-0005JM-2g
 for linux-mtd@lists.infradead.org; Sun, 23 Oct 2016 14:23:02 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS fixes for 4.9-rc2
Message-ID: <21b545f1-0374-ab2c-03ac-93d8717f9ce3@nod.at>
Date: Sun, 23 Oct 2016 16:22:34 +0200
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

The following changes since commit c3f8f7fa8b19e274e7eb99dee428ad3a9b2ad8eb:

  Merge tag 'platform-drivers-x86-v4.9-2' of git://git.infradead.org/users/dvhart/linux-platform-drivers-x86 (2016-10-19 11:45:06 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.9-rc2

for you to fetch changes up to c83ed4c9dbb358b9e7707486e167e940d48bfeed:

  ubifs: Abort readdir upon error (2016-10-20 00:06:11 +0200)

----------------------------------------------------------------
This pull requests contains fixes for issues in both UBI and UBIFS:
- Fallout from the merge window, refactoring UBI code introduced some issues.
- Fixes for an UBIFS readdir bug which can cause getdents() to busy loop
  for ever and a bug in the UBIFS xattr code.

----------------------------------------------------------------
Colin Ian King (1):
      ubi: fix swapped arguments to call to ubi_alloc_aeb

Geert Uytterhoeven (1):
      UBI: Fix crash in try_recover_peb()

Richard Weinberger (3):
      ubifs: Rename ubifs_rename2
      ubifs: Fix xattr_names length in exit paths
      ubifs: Abort readdir upon error

 drivers/mtd/ubi/eba.c     |  1 +
 drivers/mtd/ubi/fastmap.c |  2 +-
 fs/ubifs/dir.c            | 20 +++++++++-----------
 fs/ubifs/xattr.c          |  2 ++
 4 files changed, 13 insertions(+), 12 deletions(-)
