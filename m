Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CDuuR-0000if-CZ
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2004 21:11:33 -0400
Received: from yagoo.io.ssji.net ([2001:7a8:3030:0:240:5ff:fe35:fead]
	helo=yagoo) by zorglub.ssji.net with smtp (Exim 4.24)
	id 1CDuuJ-0004Si-EG
	for linux-mtd@lists.infradead.org; Sun, 03 Oct 2004 03:11:23 +0200
Date: Sun, 3 Oct 2004 03:11:22 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: linux-mtd@lists.infradead.org
Message-Id: <20041003031122.14051e0a.nipo@ssji.net>
In-Reply-To: <1096749729.21297.54.camel@thomas>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
	<20041002155505.083d8440.nipo@ssji.net>
	<1096749729.21297.54.camel@thomas>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Sun__3_Oct_2004_03_11_23_+0200_+OOSUb8pC3nRH3bP"
Subject: Re: Patch !
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Sun__3_Oct_2004_03_11_23_+0200_+OOSUb8pC3nRH3bP
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Sat, 02 Oct 2004 22:42:09 +0200]
Thomas Gleixner <tglx@linutronix.de> eut le bonheur d'=E9crire:

> You should have tried 2.6.8.1 !!

I have.
2.6.8.1 kernel from hh.org just crashes on my device, (MTD in or not),
and I have no time to investigate this issue, so I keep to 2.6.7 (no
interesting changes in 2.6.8.1 to me anyway)

> Did you notice the DEPRECATED NOTE in Kconfig ????
[..]
> "Please use the new diskonchip driver under the NAND subsystem.\n");

Indeed, and the other one is marked experimental ;)

> Please follow this advise. The docxx stuff in mtd/devices will be
> removed in the near future and INFTL with the old drivers was missing
> some functionality anyway, AFAIK.

Yes, sure, I will switch to new drivers ASAP, but we (project people)
have taken 2.6.7 as reference, so we'll use this patch for a few
more weeks.

I've tried to update to newer MTD kernel part, keeping the rest in 2.6.7
state, but some of the API seems to have changed.

> The chip ID part of your patch is giving me a bit more headache. The
> ID 0xA5 is a valid ID for NAND 2GiB 1,8V 8-bit.

Whoops, didn't pay attention to this :(

[...]
> Please figure out the DoC
> partnumber and let M-Sys confirm this. If they confirm that some moron
> started to break the ID rules, then we have to figure out a way to
> make this work. Putting this line without any further modifications
> into the code would break other drivers.

Is there some means to determine chip type by software ?
Things I can read on the chip (hoping i'm correct, it is not very
readable) are:
"M-Systems
Disc-on-chip
MD333-D64-V3-X
Japan 033-----" (dunno what's under "----")

--=20
Nipo <nipo@ssji.net>
Gnu-PGP: 1024D/1DBF658F
http://nipo.ssji.net/nipo.asc


--Signature=_Sun__3_Oct_2004_03_11_23_+0200_+OOSUb8pC3nRH3bP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBX1G7Lh2qAR2/ZY8RAsE2AKCMYu7PeOmi1OYzq/NiD9MCScuCQQCdFzCH
0tZZlMHmvr5oUVdFYBC9DA0=
=wV5t
-----END PGP SIGNATURE-----

--Signature=_Sun__3_Oct_2004_03_11_23_+0200_+OOSUb8pC3nRH3bP--
