Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Aqnbc-0008P9-Nr
	for linux-mtd@lists.infradead.org; Wed, 11 Feb 2004 06:12:16 +0000
Received: from 192.168.1.100 (bluefire.joshuawise.com [192.168.1.100])
	0569D18B3E	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Feb 2004 01:12:35 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 11 Feb 2004 01:12:28 -0500
References: <200402110054.31831.joshua@joshuawise.com>
In-Reply-To: <200402110054.31831.joshua@joshuawise.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200402110112.29600.joshua@joshuawise.com>
Subject: Re: cfi_cmdset_0002.c: do_xxlock_oneblock: overflow subtract
	causing oopsen on iPAQ h1900
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

> adr =3D ((adr & ~0xffff) | 0x2) + ~0x3fffff;
addendum: removing the + ~0x3fffff; makes it work properly.

j

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAKcfMPn9tWOqA4LMRAhWOAJkBQWfpe5dja2eC+cmteadRb5LM5QCgobsC
ilXDFb8bdF5QkgNzKwDJRP0=3D
=3D45de
=2D----END PGP SIGNATURE-----
