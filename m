Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SxDT6-0004l3-0B
 for linux-mtd@lists.infradead.org; Fri, 03 Aug 2012 08:42:49 +0000
Message-ID: <1343983637.1730.28.camel@sauron.fi.intel.com>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Fri, 03 Aug 2012 11:47:17 +0300
In-Reply-To: <1341836323-43916-1-git-send-email-richard@nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7jafR1D6KuWik6ZvXJrJ"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7jafR1D6KuWik6ZvXJrJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-09 at 14:18 +0200, Richard Weinberger wrote:
> This is the next round of UBI fastmap updates.
> It fixes all issues pointed out by Shmulik. :-)
>=20
> If you want to test fastmap you can use my git repo:
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v17

Richard,

I've added 'stress-test.sh' script to the UBI tests. This script runs
UBI tests on nandsim of different geometry. I plan to extend it further:
add mtdram tests, test with bit-flips emulation enabled, may be
something else.

We need to make sure all the tests pass and fastmap does not introduce
regressions.

Feel free to send patches. I am going to extend the test today, so 'git
pull' from time to time.

The tests will run very long time, so for debugging you can always
comment out unneeded things.

ATM, I have only nandsim tests with different geometry: 64MiB to 1GiB
total size, 2KiB and 512 byte pages, 16-256KiB eraseblocks.

Currently I am running this to unpatched UBI to check if they really
pass.

I tried to run it on the patched UBI and hit this issue:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
16MiB nandsim with 16KiB PEB, 512KiB NAND pages, fastmap enabled
Loaded NAND simulator (16MiB, 16KiB eraseblock, 512 bytes NAND page)
Running mkvol_basic /dev/ubi0
Running mkvol_bad /dev/ubi0
Running mkvol_paral /dev/ubi0
Running rsvol /dev/ubi0
Running io_basic /dev/ubi0
[io_basic] test_basic():70: function write() failed with error 28 (No
space left on device)
[io_basic] test_basic():70: written =3D 15808000, ret =3D -1
Error: io_basic failed
FAILURE
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On non-patched UBI it works. I think it is exactly what I was talking
about yesterday - fastmap grows unexpectedly because you do not reserve
the space.

Enjoy :-)

--=20
Best Regards,
Artem Bityutskiy

--=-7jafR1D6KuWik6ZvXJrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQG5AVAAoJECmIfjd9wqK0u74QALcaABfVJ0SPvi6OiLgRWZ0B
EXwLQNtVLbaELqb8cHC13C0PSu5P4/WqdOFDF0ruUBqCPI9WZUDEoo4nzlY07I+M
7W/V3SY2alSuKSruo2X+gpG8qVCHTkKgW0o6ImaZC9cfIWJsxEGFk86SbswslCP3
lxrtzQ72BUFwI9/fxlysW3vlUublKz14BoOIHOxND+IZreSpvl1MFsnR6RUaJcg9
uj1nOK5ASSlRAnLBnAHxFiHj4KC0k/pKvY8yUvmqNYhyVH2gA15Mzvv7sPTY5zSx
tRAu+SfBr/nTaUf65s66RUXGTbdk3Y897Dy3eBJU7FTV8guU5SizOPqJY4ew+ut0
X7gkdWnVU+xACX3OcqNu30vh+WD6Twrmb6a6u++uoH9Gb6o7XeHG+r5Lj9lFgZSq
EO+w7meS0gIysEHOZTNnIDQ0PnJpzjlUmFslNbEdpungectxjM8Dvm9CwzLtuTpP
nfoPXojox/xsc/6bIbJHkAxf2D75TfEdDQk49b3cwa+8CLZjP4WtNPYdAU0KPFpY
VIbuUX7ZRgtjs/IhiaKy1ighmFJ3US4xv78RL3tkp6QMsfXHftwNLLpmKZCNFImo
bnfVnA8qhfFrrRTZSiUHTd42A2Ri+pUwwZ2ZAEB5cURcgffKu5GEI8vU8ZxfpzQk
e8JUL6B1q0ptBlV6Uc7m
=0XDH
-----END PGP SIGNATURE-----

--=-7jafR1D6KuWik6ZvXJrJ--
