Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CDONL-0003uV-1Y
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 10:27:12 -0400
Date: Fri, 1 Oct 2004 16:27:05 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: David Woodhouse <dwmw2@infradead.org>
Message-Id: <20041001162705.5873dc7c.nipo@ssji.net>
In-Reply-To: <1096639064.30942.477.camel@hades.cambridge.redhat.com>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Fri__1_Oct_2004_16_27_05_+0200_M9ZGbnH/ecwtuX0+"
Cc: linux-mtd@lists.infradead.org
Subject: Re: Issues with a Doc Milplus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Fri__1_Oct_2004_16_27_05_+0200_M9ZGbnH/ecwtuX0+
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Fri, 01 Oct 2004 14:57:45 +0100]
David Woodhouse <dwmw2@infradead.org> eut le bonheur d'=E9crire:

> Hmmm. We should probably use -1 for 'unconfigured' instead of zero.
> Want to provide a patch accordingly?

I could do so, but it could break current configs where 0 meant "probing
at prelisted addresses"... (but users should read docs anyway ;))

> > 2/ It was not known by nan_ids, I had to add the following line:
> > {"NAND 64MiB 3,3V", 0xa5, 26, 0x4000, 0},
>=20
> Are you sure that's a 64MiB chip?

In CE, there are 32Mib for system rom, and 32Mib for user, and chip is
alone on the board, so yes it is 64. I have chip ref somewhere if it can
help...

> > Could one chip be virtually two 32MiB chips ?
>=20
> I think that might actually be the case for the 64MiB DiskOnChip M+,
> yes.

Right then, it explains both points. I'll declare it as a 32Mib chip in
list.

[mmio - readb/writeb]
> If provide that in 'diff -u' form we can change that too.

Hm, there is already #ifdef-ing using
-32bit mmio for __arm__
-16bit mmio for __ppc__
-readb/writeb else.
I read other PDA's config based on the same arch (Xscale), where it
seems to work. This issue seems quite "local" to my works, could this be
a side effect of something else ?

I'll submit a patch for these.

--=20
Nipo <nipo@ssji.net>
Gnu-PGP: 1024D/1DBF658F
http://nipo.ssji.net/nipo.asc

--Signature=_Fri__1_Oct_2004_16_27_05_+0200_M9ZGbnH/ecwtuX0+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBXWk5Lh2qAR2/ZY8RAlKTAJ4tm6F+3Vc2C1N8BetcYn1AbmAfMACfeloG
8g9TVaXbOs4ZU9BOT1f24fQ=
=oJSv
-----END PGP SIGNATURE-----

--Signature=_Fri__1_Oct_2004_16_27_05_+0200_M9ZGbnH/ecwtuX0+--
