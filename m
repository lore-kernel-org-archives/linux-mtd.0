Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dWNXH-00017E-Bi
 for linux-mtd@lists.infradead.org; Sat, 15 Jul 2017 13:55:09 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBIFS updates for 4.13-rc1
Message-ID: <1a4aa727-2caf-9f77-ccba-cffad06d015a@nod.at>
Date: Sat, 15 Jul 2017 15:54:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

The following changes since commit 32c1431eea4881a6b17bd7c639315010aeefa452:

  Linux 4.12-rc5 (2017-06-11 16:48:20 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.13-rc1

for you to fetch changes up to a6664433d383eeb71cbdeb9aea2c66eeea76e742:

  ubifs: Set double hash cookie also for RENAME_EXCHANGE (2017-07-14 22:50:57 +0200)

----------------------------------------------------------------
This pull request contains updates for UBIFS:
- Updates and fixes for the file encryption mode
- Minor improvements
- Random fixes

----------------------------------------------------------------
David Gstir (1):
      ubifs: Don't encrypt special files on creation

David Oberhollenzer (1):
      ubifs: Fix data node size for truncating uncompressed nodes

Eric Biggers (2):
      ubifs: require key for truncate(2) of encrypted file
      ubifs: don't bother checking for encryption key in ->mmap()

Hyunchul Lee (3):
      ubifs: Fix inode data budget in ubifs_mknod
      ubifs: Fix memory leak in RENAME_WHITEOUT error path in do_rename
      ubifs: Change gfp flags in page allocation for bulk read

Rabin Vincent (1):
      ubifs: allow userspace to map mounts to volumes

Richard Weinberger (10):
      ubifs: Unexport ubifs_inode_slab
      ubifs: Correctly evict xattr inodes
      ubifs: Fix unlink code wrt. double hash lookups
      ubifs: Add assert to dent_key_init()
      ubifs: Massage debug prints wrt. fscrypt
      ubifs: Remove dead code from ubifs_get_link()
      ubifs: Wire-up statx() support
      ubifs: Fail commit if TNC is obviously inconsistent
      ubifs: Don't leak kernel memory to the MTD
      ubifs: Set double hash cookie also for RENAME_EXCHANGE

Xiaolei Li (1):
      ubifs: Massage assert in ubifs_xattr_set() wrt. init_xattrs

karam.lee (1):
      ubifs: Fix oops when remounting with no_bulk_read.

 fs/ubifs/crypto.c     |   7 ++-
 fs/ubifs/dir.c        |  32 ++++++++----
 fs/ubifs/file.c       |  27 ++++------
 fs/ubifs/journal.c    |  36 ++++++-------
 fs/ubifs/key.h        |   1 +
 fs/ubifs/super.c      |  11 +++-
 fs/ubifs/tnc.c        | 140 ++++++++++++++++++++++++++++++++++++++++----------
 fs/ubifs/tnc_commit.c |   4 ++
 fs/ubifs/ubifs.h      |   6 ++-
 fs/ubifs/xattr.c      |  39 ++++++++++----
 10 files changed, 218 insertions(+), 85 deletions(-)
