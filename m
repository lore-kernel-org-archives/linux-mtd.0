Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AqnKG-0008FT-OT
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2004 05:54:20 +0000
Received: from 192.168.1.100 (bluefire.joshuawise.com [192.168.1.100])
	52EED17958	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Feb 2004 00:54:37 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 11 Feb 2004 00:54:27 -0500
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200402110054.31831.joshua@joshuawise.com>
Subject: cfi_cmdset_0002.c: do_xxlock_oneblock: overflow subtract causing
	oopsen on iPAQ h1900
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have done some debugging and traced an oops during unlock to this functio=
n.

I have an AMD AM29LV400BT flash chip as detected by MTD.

When I try to unlock address 0x0, I get the following: (with my debugging=20
statements added).

unlock_varsize: about to frob!
unlock_varsize: ofs: 00000000. len: 00000000.
frob: about to frob ---> 00000000 00000000
frob: about to REALLY from: adr 00000000
about to write 0000 to ca471002 (ca871000 + ffc00002)
<1>Unable to handle kernel paging request at virtual address ca471002

Note that ca871000 is the virtbase of the chip - doing an overflow subtract=
=20
obviously FUBARs things there by bringing it below the ioremapped base!

The offending line of code seems to be the following:
adr =3D ((adr & ~0xffff) | 0x2) + ~0x3fffff;

This is approximately line 2119 in drivers/mtd/chips/cfi_cmdset_0002.c - gi=
ve=20
or take a few lines because of my debugging statements added.

Can anybody shed a little bit of light on why we are doing a 4MiB overflow=
=20
subtract? Indeed the comment is annotated with a little "(danger)"... I=20
assume that we cannot always expect there to be lock block registers=20
ioremapped below on all platforms (this does not make sense on systems wher=
e=20
boot flash is at 0x0, so I know it's not just an oddity in what I'm doing :)

Thanks,
joshua


=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAKcOTPn9tWOqA4LMRAgAOAJ92vd+ZYZe1jslalcVzAJ42rw1vKACfT9uh
WZQ/olAVv+aDm5cGpKhg6mI=3D
=3DOlba
=2D----END PGP SIGNATURE-----
