Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4RFi-0006Ov-Cg
 for linux-mtd@lists.infradead.org; Thu, 23 Aug 2012 06:50:51 +0000
Message-ID: <1345704908.2848.202.camel@sauron.fi.intel.com>
Subject: [GIT PULL] UBIFS fixes for 3.6-rc3
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Aug 2012 09:55:08 +0300
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-5MC7wlDKSaZt2X01cAPj"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Maling List <linux-kernel@vger.kernel.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-5MC7wlDKSaZt2X01cAPj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

The following changes since commit d9875690d9b89a866022ff49e3fcea892345ad92=
:

  Linux 3.6-rc2 (2012-08-16 14:51:24 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.6-rc3

for you to fetch changes up to 69f9025894c391fec2f7c7ea9150203418454915:

  UBIFS: fix error messages spelling (2012-08-22 17:41:09 +0300)

----------------------------------------------------------------
UBIFS fixes for 3.6:
1. Fix crash on error which prevents emulated power-cut testing.
2. Fix log reply regression introduced in 3.6-rc1.
3. Fix UBIFS complaints about too small debug buffer size which.
4. Fix error message spelling, and remove incorrect commentary.

----------------------------------------------------------------
Artem Bityutskiy (5):
      UBIFS: remove stale commentary
      UBIFS: fix crash on error path
      UBIFS: fix replay regression
      UBIFS: fix complaints about too small debug buffer size
      UBIFS: fix error messages spelling

 fs/ubifs/debug.h    |    2 +-
 fs/ubifs/lpt.c      |    5 ++++-
 fs/ubifs/recovery.c |    2 +-
 fs/ubifs/replay.c   |    3 +--
 fs/ubifs/super.c    |    3 ---
 5 files changed, 7 insertions(+), 8 deletions(-)

--=20
Best Regards,
Artem Bityutskiy

--=-5MC7wlDKSaZt2X01cAPj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNdPMAAoJECmIfjd9wqK0f2MP/jYbC6kGArBSrt7siASvHZJ+
5hsa/1f4fCCFZOYgARonTkDkO8iWpH/Sf5Qs22pubVMaRiemjuD7O0MhSCTgbBcr
w8Lc2lmGKcmvirjpJzv5h9+WMRlEjm4s8zz1IZs6LIy4k75A9JUyar3F3+PaRcB8
3fy7tBtlX+e2fwMJSEUuwPeXmXf3AUll/8Gef3t5UtjdIa9K3/yUTedCl9ugZqBV
DBzpMfQyGfUDQfD1RhAKRSOHiNzyl+Yer6+7vTgiSbggcICKRk7b8B2zmPZG7Ak0
FulszZJgiytRI1VEHiL+y7PRuuu8q4/BcJChVtOIgJhWC+COta1eR7XNB47UlC7K
Cr3HytSzMqKWqIdUvouZB2Vwgyjb3Anx8z3Ts6UutHVaFAEiGZKZW49txs/h2Jrb
GkFkFV0tKBwF3dzW/ft8fLVzruIZnMOGeqEwP8dYX3k9Fi4yXm5cfXVWFQiQ1JLN
pAFgDnHDhPRwIqy6DOC5IVyJAk/CqRUFop1SBzXJvmbhIwraznZKXlZ+Ac09zdq1
5CuFuGttQiAvOqGRFTgM3puVOJqJDyDs9Kf3Oaxh+Jaym5j4pMqR9O0ez3kZlEBB
EDqtHFmzY6a+JckWVYlxf2DtZjIsYHPnw9OXbI1Fs6sfeOcvaMCD39bbBTwDuAod
ac7d41hodKVlNGjG9uln
=am7i
-----END PGP SIGNATURE-----

--=-5MC7wlDKSaZt2X01cAPj--
