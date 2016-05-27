Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6NF7-0008OS-1w
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 19:16:22 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBI/UBIFS updates for v4.7-rc1
Message-ID: <57489CEA.3030002@nod.at>
Date: Fri, 27 May 2016 21:15:54 +0200
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

The following changes since commit 04974df8049fc4240d22759a91e035082ccd18b4:

  Linux 4.6-rc6 (2016-05-01 15:52:31 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.7-rc1

for you to fetch changes up to 1112018cefc586cba924770a2b28bff6d2f0aa5c:

  ubifs: ubifs_dump_inode: Fix dumping field bulk_read (2016-05-24 15:29:44 +0200)

----------------------------------------------------------------
This pull request contains mostly cleanups and minor
improvements of UBI and UBIFS.

----------------------------------------------------------------
Andreas Gruenbacher (1):
      ubifs: ubifs_dump_inode: Fix dumping field bulk_read

Dan Carpenter (2):
      UBI: Clean up return in ubi_remove_volume()
      UBI: Silence an unintialized variable warning

Ezequiel Garcia (1):
      UBI: Add ro-mode sysfs attribute

Heiko Schocher (1):
      UBI: Set free_count to zero before walking through erase list

Richard Weinberger (2):
      UBI: Don't read back all data in ubi_eba_copy_leb()
      UBI: Fix static volume checks when Fastmap is used

z00189512 (1):
      UBI: Modify wrong comment in ubi_leb_map function.

 Documentation/ABI/stable/sysfs-class-ubi |  9 ++++++
 drivers/mtd/ubi/build.c                  |  5 ++++
 drivers/mtd/ubi/debug.c                  |  3 +-
 drivers/mtd/ubi/eba.c                    | 47 +++++++++++++-------------------
 drivers/mtd/ubi/fastmap.c                |  1 +
 drivers/mtd/ubi/kapi.c                   |  2 +-
 drivers/mtd/ubi/ubi.h                    |  2 ++
 drivers/mtd/ubi/vmt.c                    |  2 +-
 drivers/mtd/ubi/wl.c                     |  2 +-
 fs/ubifs/debug.c                         |  2 +-
 10 files changed, 42 insertions(+), 33 deletions(-)
