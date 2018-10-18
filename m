Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RC-000438-N7
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:16 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 00/42] mtd-utils: Add fscrypt support to mkfs.ubifs
Date: Thu, 18 Oct 2018 16:36:36 +0200
Message-Id: <20181018143718.26298-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This took a little longer than expected.
I had the PoC code for some time on my desk but never found the
time to bring it into upstream shape.
With David's help I've been able to make it finally happen.

With this series applied, mkfs.ubifs is able to produce an encrypted
UBIFS filesystem.
Currently it supports only encrypting the whole filesystem.
Supported ciphers are AES-128-CBC and AES-256-XES.

Example usage:
$ dd if=3D/dev/urandom of=3Dkey.data count=3D64 bs=3D1 # XTS needs a 512b=
it key
$ mkfs.ubifs --cipher AES-256-XTS --key key.data -r /rootfs -m 2048 -e 12=
9024 -c 2048 ubifs.enc.img
$ ubiupdatevol /dev/ubi0_0 ubifs.enc.img
$ fscryptctl insert_key < key.data
$ mount -t ubifs /dev/ubi0_0 /new_root

Thanks,
//richard

David Oberhollenzer (15):
  mkfs.ubifs: Add crypto helper functions
  mkfs.ubifs: Implement UBIFS_FLG_DOUBLE_HASH
  mkfs.ubifs: Move symlink data encryption to helper function
  mkfs.ubifs: Seperate path encryption from symlink encryption helper
  mkfs.ubifs: Cleanup add_dent_node, user path encryption helper
  mkfs.ubifs: Replace constant values with parameters in
    init_fscrypt_context
  mkfs.ubifs: Make encryption dependend on (not-yet-existant) command
    line options
  mkfs.ubifs: Get key descriptor from command line and master key from
    file
  mkfs.ubifs: Specify padding policy via command line
  mkfs.ubifs: Initial support for encryption command lines
  mkfs.ubifs: Remove cipher implementations from public header
  mkfs.ubifs: Move fscrypt definitions and functions out of mkfs.ubifs.c
  mkfs.ubifs: Cleanup over-long lines
  mkfs.ubifs: Check length of master key
  mkfs.ubifs: Accept 0x prefix for key descriptor

Richard Weinberger (27):
  Import latest ubifs-media.h
  common: Add round functions
  mkfs.ubifs: Make r5 hash binary string aware
  mkfs.ubifs: Add fscrypto defines
  mkfs.ubifs: Add basic fscrypto functions
  mkfs.ubifs: Implement UBIFS_FLG_ENCRYPTION
  mkfs.ubifs: Implement basic fscrypto context passing
  mkfs.ubifs: Implement fscrypto context store as xattr
  mkfs.ubifs: Store directory name len in the temporary index
  mkfs.ubifs: Implement filename encryption
  mkfs.ubifs: Add dummy setup for crypto
  mkfs.ubifs: Pass source/dest key len to key derive function
  mkfs.ubifs: Add encrypted symlink support
  mkfs.ubifs: Implement file contents encryption
  mkfs.ubifs: Make sure we catch nodes that should or should not have
    name
  mkfs.ubifs: Free all index entry names
  mkfs.ubifs: Correctly use iv lengths in aes-cts mode
  mkfs.ubifs: Enable Cipher selection
  mkfs.ubifs: Use correct sizes for keys and hash lengths
  mkfs.ubifs: Fixup AES-XTS mode
  mkfs.ubifs: Compute encryption key descriptor automatically
  mkfs.ubifs: Fix key descriptor printing
  mkfs.ubifs: More fscryptctl compatibility
  mkfs.ubifs: Move RAND_poll to crypto.c
  mkfs.ubifs: Enable support for building without crypto
  mkfs.ubifs: Print key descriptor only when generated
  mkfs.ubifs: Use AES-256-XTS as default

 Makefile.am                         |   4 +
 configure.ac                        |  26 +-
 include/common.h                    |  10 +
 include/mtd/ubifs-media.h           |  67 ++++-
 ubifs-utils/Makemodule.am           |  10 +-
 ubifs-utils/mkfs.ubifs/crypto.c     | 362 ++++++++++++++++++++++++
 ubifs-utils/mkfs.ubifs/crypto.h     |  58 ++++
 ubifs-utils/mkfs.ubifs/fscrypt.c    | 270 ++++++++++++++++++
 ubifs-utils/mkfs.ubifs/fscrypt.h    | 171 ++++++++++++
 ubifs-utils/mkfs.ubifs/key.h        |  17 +-
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 409 +++++++++++++++++++++++-----
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h |   2 +
 ubifs-utils/mkfs.ubifs/ubifs.h      |   3 +
 13 files changed, 1321 insertions(+), 88 deletions(-)
 create mode 100644 ubifs-utils/mkfs.ubifs/crypto.c
 create mode 100644 ubifs-utils/mkfs.ubifs/crypto.h
 create mode 100644 ubifs-utils/mkfs.ubifs/fscrypt.c
 create mode 100644 ubifs-utils/mkfs.ubifs/fscrypt.h

--=20
2.19.1
