Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ar80q-0003MB-8X
	for linux-mtd@lists.infradead.org; Thu, 12 Feb 2004 03:59:40 +0000
From: Joshua Wise <joshua@joshuawise.com>
To: tharbaugh@lnxi.com
Date: Wed, 11 Feb 2004 22:59:52 -0500
References: <200402110054.31831.joshua@joshuawise.com>
	<1076516571.19353.582.camel@tubarao>
In-Reply-To: <1076516571.19353.582.camel@tubarao>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200402112259.53361.joshua@joshuawise.com>
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

> Yep, it's an incredibly ugly thing - I can see why it blows things out
> of the water.  I knew it was a bad thing to do - hence the comments.  At
> the time that it was added, there wasn't an unlock function and so
> adding, even a broken one, was a starting place.
Ok, I remember in the past that one of the flash chips that I was using did=
=20
not have an unlock function. It was probably the one in the 1900.

> In the end, please fix up the code so that it works for the general
> case.  I'll look at things later and see what I can do to either black
> list the SST parts or deal with them in a sane way that isn't dangerous
> and ugly.
Hrm ... you make it sound like there are different unlock codes for every=20
chip! Is there a general case here?

As to dealing with the SST parts, I believe that if there is not another wa=
y=20
to detect the parts (ie, doing something htat would cause one to reset, but=
=20
not another), you should probably make the user specify what type of part i=
t=20
is ... dangerous hacks like having to read/write 4MiB below the address spa=
ce=20
just to unlock does not seem like a good answer for all chips of the sort!

> SST, PLEASE FIX YOUR CHIPS AND USE UNIQUE IDS FOR NEW PARTS!!!
>
> Yes, I do mean to yell.
You have caps lock stuck... oh wait, you realized that ;)

joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAKvo4Pn9tWOqA4LMRAgAqAKCmmEsCDYpH38ZLcjnukqohExbKqgCgrP+s
/YIrhwTsNxFsO25fTd2/3A4=3D
=3DadYn
=2D----END PGP SIGNATURE-----
