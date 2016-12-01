Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYna-0002zd-1g
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:21:49 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 00/24] UBIFS File Encryption v2
Date: Thu,  1 Dec 2016 22:20:47 +0100
Message-Id: <1480627271-10441-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series implements file level encryption for UBIFS.
It makes use of the generic fscrypto framework as used by ext4 and f2fs.
Among file contents also file names are encrypted,
for more details on fscrypto please see [0] and [1].

To support encrypted files in UBIFS multiple preparations were needed.
UBIFS has a different IO model than ext4 and f2fs because it uses MTD
instead of the block layer. But the changes are small and non-invasive.
In UBIFS itself the biggest change was supporting hash lookups.
Now UBIFS is able to provide a 64bit cookie which can be used later
to locate a file. This change will also allow us implementing proper
NFS and telldir() support, but that will be a different patch series.
Because of these changes the UBIFS write version is now 5.

As userspace component I'm currently using e4crypt from e2fsprogs with
EXT2FS_KEY_DESC_PREFIX set to "fscrypt:" instead of "ext4:".
A common tool will hopefully emerge soon[2]. I don't want an UBIFS
specific tool in mtd-utils.

The series is based on the fscrypt tree[3].
It can be obtained from:
git://git.infradead.org/users/rw/linux.git ubifs_crypt_v3
Sorry for the off-by-one in the version number, starting with v0 was not
a good idea. ;-\

[0] https://lwn.net/Articles/639427/
[1] https://docs.google.com/document/d/1ft26lUQyuSpiu6VleP70_npaWdRfXFoNnB8JYnykNTg/edit
[2] http://www.spinics.net/lists/linux-fsdevel/msg103107.html
[3] git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git fscrypt

Changes since v1, http://lists.infradead.org/pipermail/linux-mtd/2016-November/070268.html
 - Rebased to Ted's fscrypt tree[3], this tree contains also David's fscrypo specific
   changes
 - Fixed a build regression

Changes since v0, https://lwn.net/Articles/704261/
 - Rebased to v4.9-rc4
 - Made fscrypto functions generic instead of adding new versions (hch)
 - Addressed various comments (Eric and Ted)

Richard Weinberger (24):
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

 fs/ubifs/Kconfig       |  11 ++
 fs/ubifs/Makefile      |   1 +
 fs/ubifs/crypto.c      |  97 ++++++++++
 fs/ubifs/debug.c       |  14 +-
 fs/ubifs/dir.c         | 478 +++++++++++++++++++++++++++++++++++++++++--------
 fs/ubifs/file.c        | 108 ++++++++++-
 fs/ubifs/ioctl.c       |  40 +++++
 fs/ubifs/journal.c     | 224 +++++++++++++----------
 fs/ubifs/key.h         |  21 +--
 fs/ubifs/replay.c      |  10 +-
 fs/ubifs/sb.c          |  59 ++++++
 fs/ubifs/super.c       |  17 +-
 fs/ubifs/tnc.c         | 159 ++++++++++++----
 fs/ubifs/ubifs-media.h |  29 ++-
 fs/ubifs/ubifs.h       | 106 +++++++++--
 fs/ubifs/xattr.c       | 116 +++++++-----
 16 files changed, 1202 insertions(+), 288 deletions(-)
 create mode 100644 fs/ubifs/crypto.c

-- 
2.7.3
