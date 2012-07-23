Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1StE6Q-000845-CB
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 08:34:55 +0000
Message-ID: <1343032755.4060.121.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBI changes for 3.6-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Jul 2012 11:39:15 +0300
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Bm2ZnN8MwQLX/Zms0E6F"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Maling List <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Bm2ZnN8MwQLX/Zms0E6F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

The following changes since commit 84a1caf1453c3d44050bd22db958af4a7f99315c=
:

  Linux 3.5-rc7 (2012-07-14 15:40:28 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubi.git tags/upstream-3.6-rc1

for you to fetch changes up to 87e773c95eb0b363f2efcc7aff8a347dc18925d0:

  UBI: harmonize the update of ubi->beb_rsvd_pebs (2012-07-18 14:30:34 +030=
0)

----------------------------------------------------------------
Change the default amount of eraseblocks which UBI reserves for bad block
handling from 1% to 2%, because 1% does not meet most modern flashes
requirements. 1% was good enough in the past for old high-quality SLCs, but
nowadays 2% is much more appropriate.

Other changes are clean-ups.

----------------------------------------------------------------
Peter Meerwald (1):
      UBI: fix spelling of detach in debug output

Richard Genoud (1):
      UBI: Change the default percentage of reserved PEB

Shmulik Ladkani (2):
      UBI: trivial: fix comment of ubi_calculate_reserved function
      UBI: harmonize the update of ubi->beb_rsvd_pebs

 drivers/mtd/ubi/Kconfig |    2 +-
 drivers/mtd/ubi/cdev.c  |    2 +-
 drivers/mtd/ubi/misc.c  |   25 ++++++++++++++++++++++++-
 drivers/mtd/ubi/ubi.h   |    1 +
 drivers/mtd/ubi/vmt.c   |   20 ++------------------
 5 files changed, 29 insertions(+), 21 deletions(-)

--=20
Best Regards,
Artem Bityutskiy

--=-Bm2ZnN8MwQLX/Zms0E6F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQDQ2zAAoJECmIfjd9wqK00bwQAKj5kFQtqUW0IOOJkkvuTZPB
axGQ2HZs+0nOaJ3Kj256DjHnr9wg+EmiNrAHPKCiiMgtA7FRu8q+eO0LRsreFpXM
iU7oAFRt9096HYk5Cov8tvmpexdJnbZSrBxrE7YT2aeU4nuEN/27QUuOI/E/0ReO
LgqJQQhgLxyMdfrx0t5wWFx2lxE1Odz5Iq1UFVed9R7JKc62YabbHELQcA633Zpi
hPkcWY3LIVaqGFqtSfzjGcxalSr/bJUOVnyqXfQgxg/X8IGI/WgvvYJrncwqif1L
pl2e4Yw8jEEg4eKw/TYoru+d02yB+6CoQi6oZLPBi48JQGkNMrag2TIxg7cVlR2B
DcMXh0MoTyiaCqpM6LRylBhG26pYAp6hB3XkIM00ShlwY/3KePok+o5uNRrlR/RR
pOZWTdUOUT3ndqFIfiXPPHipRv9xbIGcY652EdRAOKemFjsSCzUv6lNTJY/48IWI
D9mApsYnlOZWv8gzYMu6FlwdMbmr8XCfyBDT/J5yb2Q6VsxIyj/L636075DfC44f
N9OdVasusDvabygjb7mrpmIk4D9qW87JIxG53F6A8EwDlZCzffeRKaxfgrosFCrj
8xoJDibwAEjjgFhcS6vBCSTas7y4qkSdm+LwsM0GwUOrdtMpHxYr1t9/NuWRSLx0
+JqS2BohHDAbamIKIHiQ
=+EDn
-----END PGP SIGNATURE-----

--=-Bm2ZnN8MwQLX/Zms0E6F--
