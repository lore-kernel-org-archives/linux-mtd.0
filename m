Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHYVe-0002Y8-RU
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2016 16:03:56 +0000
From: Richard Weinberger <richard@nod.at>
Subject: [GIT PULL] UBIFS updates for v4.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>
Message-ID: <46fff439-2b95-1c6b-e445-536b8f5b0166@nod.at>
Date: Thu, 15 Dec 2016 17:03:28 +0100
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

The following changes since commit 6a34e4d2be07255cc59e6ccaf820669cfd7f815c:

  fscrypt: Rename FS_WRITE_PATH_FL to FS_CTX_HAS_BOUNCE_BUFFER_FL (2016-12-11 16:33:18 -0500)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.10-rc1

for you to fetch changes up to ba75d570b60c05cda21c0b43c5fbdc4e344f892d:

  ubifs: Initialize fstr_real_len (2016-12-14 17:39:21 +0100)

This time my tree is based on Ted's fscrypt branch to avoid duplicate commits[0].
UBIFS file encryption required some changes in fscrypt which are carried
by Ted.
Stephen noticed also a merge conflict with Miklos' VFS tree[1].

[0] http://marc.info/?l=linux-fsdevel&m=147909285425300&w=2
[1] http://marc.info/?l=linux-next&m=148168934714195&w=2

----------------------------------------------------------------
This pull request contains:
* File encryption for UBIFS using the fscrypt framework
* A fix to honor the dirty_writeback_interval sysctl
* Removal of dead code

----------------------------------------------------------------
Christophe Jaillet (1):
      ubifs: Remove some dead code

Rafał Miłecki (2):
      ubifs: Drop softlimit and delta fields from struct ubifs_wbuf
      ubifs: Use dirty_writeback_interval value for wbuf timer

Richard Weinberger (27):
      ubifs: Export ubifs_check_dir_empty()
      ubifs: Export xattr get and set functions
      ubifs: Define UBIFS crypto context xattr
      ubifs: Add skeleton for fscrypto
      ubifs: Massage ubifs_listxattr() for encryption context
      ubifs: Implement directory open operation
      ubifs: Implement file open operation
      ubifs: Enforce crypto policy in ->link and ->rename
      ubifs: Preload crypto context in ->lookup()
      ubifs: Massage assert in ubifs_xattr_set() wrt. fscrypto
      ubifs: Enforce crypto policy in mmap
      ubifs: Introduce new data node field, compr_size
      ubifs: Constify struct inode pointer in ubifs_crypt_is_encrypted()
      ubifs: Implement encrypt/decrypt for all IO
      ubifs: Relax checks in ubifs_validate_entry()
      ubifs: Make r5 hash binary string aware
      ubifs: Implement encrypted filenames
      ubifs: Add support for encrypted symlinks
      ubifs: Rename tnc_read_node_nm
      ubifs: Add full hash lookup support
      ubifs: Use a random number for cookies
      ubifs: Implement UBIFS_FLG_DOUBLE_HASH
      ubifs: Implement UBIFS_FLG_ENCRYPTION
      ubifs: Raise write version to 5
      ubifs: Use FS_CFLG_OWN_PAGES
      ubifs: Use fscrypt ioctl() helpers
      ubifs: Initialize fstr_real_len

 fs/ubifs/Kconfig       |  11 ++
 fs/ubifs/Makefile      |   1 +
 fs/ubifs/crypto.c      |  97 ++++++++++
 fs/ubifs/debug.c       |  14 +-
 fs/ubifs/dir.c         | 478 +++++++++++++++++++++++++++++++++++++++++--------
 fs/ubifs/file.c        | 108 ++++++++++-
 fs/ubifs/gc.c          |   4 -
 fs/ubifs/io.c          |  18 +-
 fs/ubifs/ioctl.c       |  20 +++
 fs/ubifs/journal.c     | 224 +++++++++++++----------
 fs/ubifs/key.h         |  21 +--
 fs/ubifs/replay.c      |  10 +-
 fs/ubifs/sb.c          |  59 ++++++
 fs/ubifs/super.c       |  17 +-
 fs/ubifs/tnc.c         | 159 ++++++++++++----
 fs/ubifs/ubifs-media.h |  29 ++-
 fs/ubifs/ubifs.h       | 115 +++++++++---
 fs/ubifs/xattr.c       | 116 +++++++-----
 18 files changed, 1192 insertions(+), 309 deletions(-)
 create mode 100644 fs/ubifs/crypto.c
