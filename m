Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sd2fH-0008DW-46
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2012 17:07:59 +0000
Content-Type: multipart/mixed; boundary="===============0519172466=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] UBI/UBIFS fixes for 3.5-rc2
Date: Fri, 8 Jun 2012 17:07:20 +0000
Message-ID: <1339175470.2392.6.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Maling List <linux-kernel@vger.kernel.org>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============0519172466==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-TlfdaFQP0S6PQxfhGQXu"

--=-TlfdaFQP0S6PQxfhGQXu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following changes since commit f8f5701bdaf9134b1f90e5044a82c66324d2073f=
:

  Linux 3.5-rc1 (2012-06-02 18:29:26 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-ubifs.git tags/upstream-3.5-rc2

for you to fetch changes up to 12027f1b3fd69a4e9017e6b13c72547a99c6cf54:

  UBI: correct ubi_wl_flush locking (2012-06-07 15:22:21 +0300)

----------------------------------------------------------------
Fix UBI and UBIFS - they refuse to work without debugfs. This was
broken by the 3.5-rc1 UBI/UBIFS changes when we removed the debugging
Kconfig switches.

Also, correct locking in 'ubi_wl_flush()' - it was extended to support
flushing a specific LEB in 3.5-rc1, and the locking was sub-optimal.

----------------------------------------------------------------
Artem Bityutskiy (3):
      UBI: fix debugfs-less systems support
      UBIFS: fix debugfs-less systems support
      UBI: correct ubi_wl_flush locking

 drivers/mtd/ubi/debug.c |   12 ++++++++++--
 drivers/mtd/ubi/wl.c    |   17 +++++++++++++----
 fs/ubifs/debug.c        |   12 ++++++++++--
 3 files changed, 33 insertions(+), 8 deletions(-)

--=20
Best Regards,
Artem Bityutskiy

--=-TlfdaFQP0S6PQxfhGQXu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0jIuAAoJECmIfjd9wqK0BbUQAJfiw86+LGhrPRwh1ulXl/2i
GGKg1MwINkcm4jSj5M2rOfPW+EzkFBcqYOtnIq5xjFgH1/i7wzsYX0ECIaZQU8sI
ssB90//lM2hVR2KTtZmok9+xo7Yb4OREoJDAM4jKmUB8S9EK5ehef5PggBOn1b2Z
2jfCxreMt1jMuwh0nBEL6VY1rUVC3oe6voYYkzICH44gN3hjS7KlnrbiqYhi0g8e
+w+dNi/mX3gfsiQBv8Q9YpyJrq4GbpvtEVSeomhf48sQDeeEfctuLmnj169h4PZD
c9fkjxH2X7nnlpiYfEUGBsQG45BVr+Q0AblC0Zb05VHhW0fMXa+fYXDSr8UZapxj
+bAdjRUsm1r8mak+0GEm41uIFa0n5/oDEYSm2E6DPeLrTGm5ZSfe/FDDSMPSEywJ
xJk+ziVf8WyVWZKen0s6hytoT2+8Q28YIr+PQaxTo8MnVzYozmWVaSlFOrG+g9zS
tdIZJSy17n2Ad9G2qrPVh1QoqT9u/vXhsEr8+FdS/AvIavTtTWnDxzQbeQHIhOS8
zTDY6cj+JBw/+oqxcKbWw8V1Zvju/whqNarp/RUhnPdgLUiQiIswD5LTdOUJtvon
lKDXM7nEy5w45//e0bm0dfoCnaikal/U4nAZ3WVIxAmR3o1uC7zUg8Svs1CxfoBe
22SRCzWlqE+GSR+Nyymq
=zlJ7
-----END PGP SIGNATURE-----

--=-TlfdaFQP0S6PQxfhGQXu--

--===============0519172466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============0519172466==--
