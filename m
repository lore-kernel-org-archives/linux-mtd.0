Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ArN5m-0007GY-R4
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2004 20:05:47 +0000
From: Joshua Wise <joshua@joshuawise.com>
To: tharbaugh@lnxi.com
Date: Thu, 12 Feb 2004 15:04:40 -0500
References: <200402110054.31831.joshua@joshuawise.com>
	<200402112259.53361.joshua@joshuawise.com>
	<1076595846.19353.590.camel@tubarao>
In-Reply-To: <1076595846.19353.590.camel@tubarao>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200402121505.49177.joshua@joshuawise.com>
cc: linux-mtd@lists.infradead.org
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

> - adr =3D ((adr & ~0xffff) | 0x2) + ~0x3fffff;
> + adr =3D ((adr & ~0xffff) | 0x2);
That may indeed be the correct way to unlock flash on other platforms ... t=
hat=20
is the change that I am using, and it does not seem to cause any harm.

joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAK9xbPn9tWOqA4LMRAqIPAJ9TatM6muNW/NgFgszZGQPwnKsekgCffdbM
4q4tfkOZu/qyZCtvWg+fYqw=3D
=3DJ2EX
=2D----END PGP SIGNATURE-----
