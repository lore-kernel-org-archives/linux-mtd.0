Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YiTTG-00031T-3q
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2015 19:59:39 +0000
Message-ID: <552EC309.6050904@nod.at>
Date: Wed, 15 Apr 2015 21:59:05 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] UBI/UBIFS updates for 4.1
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="fJ8weTSE9pcd2ki7K7LMBpXRHmpcnH8Md"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fJ8weTSE9pcd2ki7K7LMBpXRHmpcnH8Md
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Linus,

the following changes since commit bc465aa9d045feb0e13b4a8f32cc33c1943f62=
d6:

  Linux 4.0-rc5 (2015-03-22 16:50:21 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-4.1-rc1

for you to fetch changes up to 502690674281a047abd45f81e64c498bc23a8bb3:

  UBI: power cut emulation for testing (2015-04-13 21:05:17 +0200)

----------------------------------------------------------------
This pull request includes the following UBI/UBIFS changes:
* Powercut emulation for UBI
* A huge update to UBI Fastmap
* Cleanups and bugfixes all over UBI and UBIFS

----------------------------------------------------------------
Artem Bityutskiy (1):
      Merge tag 'v4.0-rc5' into linux-next

Brian Norris (5):
      UBI: account for bitflips in both the VID header and data
      UBI: fix out of bounds write
      UBI: initialize LEB number variable
      UBI: fix check for "too many bytes"
      UBI: align comment for readability

Fabian Frederick (1):
      UBIFS: simplify returns

Richard Weinberger (38):
      UBI: Fastmap: Ensure that only one fastmap work is scheduled
      UBI: Fastmap: Ensure that all fastmap work is done upon WL shutdown=

      UBI: Fastmap: Fix races in ubi_wl_get_peb()
      UBI: Split __wl_get_peb()
      UBI: Fastmap: Make ubi_refill_pools() fair
      UBI: Fastmap: Don't allocate new ubi_wl_entry objects
      UBI: Fastmap: Fix memory leaks while closing the WL sub-system
      UBI: Fastmap: Notify user in case of an ubi_update_fastmap() failur=
e
      UBI: Fastmap: Wrap fastmap specific function in a ifdef
      UBI: Fastmap: Fix fastmap usage in ubi_volume_notify()
      UBI: Fastmap: Fix memory leak while attaching
      UBI: Remove alloc_ai() slab name from parameter list
      UBI: Fastmap: Fix race in ubi_eba_atomic_leb_change()
      UBI: Fastmap: Remove bogus ubi_assert()
      UBI: Fastmap: Remove eba_orphans logic
      UBI: Fastmap: Switch to ro mode if invalidate_fastmap() fails
      UBI: Fastmap: Make WL pool size 50% of user pool size
      UBI: Fastmap: Fix leb_count unbalance
      UBI: Fastmap: Fix race after ubi_wl_get_peb()
      UBI: Fastmap: Set used_ebs only for static volumes
      UBI: Fastmap: Locking updates
      UBI: Fastmap: Prepare for variable sized fastmaps
      UBI: Fastmap: Rework fastmap error paths
      UBI: Add initial support for fastmap self checks
      UBI: Fastmap: Enhance fastmap checking
      UBI: Fix stale pointers in ubi->lookuptbl
      UBI: Fastmap: Add self check to detect absent PEBs
      UBI: Fastmap: Make self_check_eba() depend on fastmap self checking=

      UBI: Fastmap: Add new module parameter fm_debug
      UBI: Move fastmap specific functions out of wl.c
      UBI: Add accessor functions for WL data structures
      UBI: Fastmap: Wire up WL accessor functions
      UBI: Fastmap: Introduce ubi_fastmap_init()
      UBI: Fastmap: Introduce may_reserve_for_fm()
      UBI: Fastmap: Remove else after return.
      UBI: Fastmap: Add blank line after declarations
      UBI: Fastmap: Remove is_fm_block()
      UBI: Fastmap: Fall back to scanning mode after ECC error

Sheng Yong (3):
      UBIFS: do not write master node if need recovery
      UBIFS: extend debug/message capabilities
      UBIFS: fix output format of INUM_WATERMARK

Taesoo Kim (1):
      UBIFS: fix incorrect unlocking handling

Yannick Guerrini (1):
      UBIFS: Fix trivial typos in comments

david.oberhollenzer@sigma-star.at (1):
      UBI: power cut emulation for testing

 drivers/mtd/ubi/attach.c     |  73 +++---
 drivers/mtd/ubi/build.c      |  29 ++-
 drivers/mtd/ubi/cdev.c       |   2 +-
 drivers/mtd/ubi/debug.c      | 100 +++++++-
 drivers/mtd/ubi/debug.h      |  12 +
 drivers/mtd/ubi/eba.c        |  54 ++--
 drivers/mtd/ubi/fastmap-wl.c | 362 ++++++++++++++++++++++++++
 drivers/mtd/ubi/fastmap.c    | 443 +++++++++++++++++---------------
 drivers/mtd/ubi/io.c         |   6 +
 drivers/mtd/ubi/ubi-media.h  |   2 -
 drivers/mtd/ubi/ubi.h        |  85 ++++++-
 drivers/mtd/ubi/wl.c         | 587 +++++++++++--------------------------=
------
 drivers/mtd/ubi/wl.h         |  28 +++
 fs/ubifs/budget.c            |   2 +-
 fs/ubifs/commit.c            |  12 +-
 fs/ubifs/compress.c          |  22 +-
 fs/ubifs/debug.c             | 186 +++++++-------
 fs/ubifs/dir.c               |  23 +-
 fs/ubifs/file.c              |  17 +-
 fs/ubifs/io.c                |  40 +--
 fs/ubifs/ioctl.c             |   2 +-
 fs/ubifs/journal.c           |  17 +-
 fs/ubifs/log.c               |   4 +-
 fs/ubifs/lprops.c            |  62 ++---
 fs/ubifs/lpt.c               |  59 ++---
 fs/ubifs/lpt_commit.c        |  34 +--
 fs/ubifs/master.c            |   6 +-
 fs/ubifs/orphan.c            |  26 +-
 fs/ubifs/recovery.c          |  44 ++--
 fs/ubifs/replay.c            |  34 +--
 fs/ubifs/sb.c                |  30 +--
 fs/ubifs/scan.c              |  24 +-
 fs/ubifs/super.c             | 107 ++++----
 fs/ubifs/tnc.c               |  20 +-
 fs/ubifs/tnc_commit.c        |  12 +-
 fs/ubifs/tnc_misc.c          |  24 +-
 fs/ubifs/ubifs.h             |  40 +--
 fs/ubifs/xattr.c             |  18 +-
 38 files changed, 1507 insertions(+), 1141 deletions(-)
 create mode 100644 drivers/mtd/ubi/fastmap-wl.c
 create mode 100644 drivers/mtd/ubi/wl.h



--fJ8weTSE9pcd2ki7K7LMBpXRHmpcnH8Md
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVLsMOAAoJEPmeIjfg4UaaZigP/RuBUXzyPtdIdEU9SkmslAjU
ZOCrsQig8vj34uAMZ43Z99VyLKNRIFX33cjMcsbDjBg6IH7DPBj9p82sEZOHdYwH
fLU1dWaYzRk78Z/zzAJF4NjZCpfIFQ6u+AA5Qu+ivU35daTUlJuXF+JJv0eJ+z1b
X6e5kLqcu319RhZjUf3mFjEriHH9Ds5x5Cc8JF5U2NA2zV1p4MKtttLMmdI/NgJo
JTVmVRznYQBPEXsVkQulta3qbWyaIKuy7KBKwBOw7neJ/2NIofRt7WAqZOTpFCRT
vpp/CfDFpstW5H6YAkn0DDsGlwf0FFTrOaKVeDNGO6huworcSUDJExY3aAksKgk2
xbxE4Q5SnOybv+9KZaIzpGn6Q869JRpfTAvQK2qR+jF8bI31kT6Yuqvs8UUykT/w
CFS5zWu4gFyuYjsPEuZksQ12+S9jEZGU0kkhBjbMWkH4SOPWBZrlReku0fhGT3u8
rKhCVsUwcC0rWSyajqH5NKxCL7NqDlsWTnH/S082dMonkhJ0SJXfyFORa6CukNxw
j8/O7PHUfExBdDQJgbvczLS7T51Xrx1k6zGh9B2MlvgfNpWt8ObF/Y+bnoj+aMM9
Mch8K+bLTFHLK9/NkEOaJ3FZ4v4Zpe27tTQX3ZL8clvyVI/rQbHq42FBzzlztvsv
ylK89yCxlpPM+E7jfzLx
=GJDT
-----END PGP SIGNATURE-----

--fJ8weTSE9pcd2ki7K7LMBpXRHmpcnH8Md--
