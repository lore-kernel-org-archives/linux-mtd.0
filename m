Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CECoS-0002DD-N3
	for linux-mtd@lists.infradead.org; Sun, 03 Oct 2004 16:18:34 -0400
Date: Sun, 3 Oct 2004 22:18:27 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: tglx@linutronix.de
Message-Id: <20041003221827.7bea56fc.nipo@ssji.net>
In-Reply-To: <1096768161.21297.129.camel@thomas>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
	<20041002155505.083d8440.nipo@ssji.net>
	<1096749729.21297.54.camel@thomas>
	<20041003030653.2e0452a7.nipo@ssji.net>
	<1096768161.21297.129.camel@thomas>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Sun__3_Oct_2004_22_18_27_+0200_8nJYQ9zR21vsG=rQ"
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch !
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Sun__3_Oct_2004_22_18_27_+0200_8nJYQ9zR21vsG=rQ
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Sun, 03 Oct 2004 03:49:21 +0200]
Thomas Gleixner <tglx@linutronix.de> eut le bonheur d'=E9crire:

>  It's quite stable now. The experimental will go away soon.

;)

> I see. But you will not be able to use the chip really, as the code in
> mtd/devices and the old inftl driver are missing functionality (e.g.
> write support).

Short term I dont care about write support, as I wont have two chances
to rewrite the DoC, if I screw things up, the only thing I will be able
to do is get the device back to service (and they wont want to repair
it, I opened it...)

Unless... Is there some means to access DoC through JTAG ?
I've seens some pages saying it works, but I'm not too sure it actually
was speaking of the case I have : A PXA and a M-Sys DoC.

> The new code supports the usage of NAND aware
> filesystems like JFFS2 too. So you don't even need the INFTL stuff, if
> you must not provide compability with the M-Sys stuff.

Mh, what is "compatibility with M-Sys stuff" ?

> The MTD CVS patch (use patches/patchin.sh) should work with 2.6.7.
> Hmm, the __iomem related changes are not in 2.6.7. Thats just a simple
> #define. The code runs on 2.4 too. See compatmac.h

I'll have a look at it ;)

> > Things I can read on the chip (hoping i'm correct, it is not very
> > readable) are:
> > "M-Systems
> > Disc-on-chip
> > MD333-D64-V3-X
> > Japan 033-----" (dunno what's under "----")
>=20
> MD3331-D64-V3-T 64MB/512Mb FBGA 3.3V

64MB, 3.3V, BGA, yes ;)
Picture here, to confirm (I actually forgot the 1 after "333"):
http://a620.zwischenstand.de/Photos/DoC/dscn2499.jpg
(photos I have without the sticker are bad)

> That's the only one I found on the M-Sys webpage which has a similar
> type code.

This is it. Is chip ID 0xa5 ?

Cheers !

--=20
Nipo <nipo@ssji.net>
Gnu-PGP: 1024D/1DBF658F
http://nipo.ssji.net/nipo.asc

--Signature=_Sun__3_Oct_2004_22_18_27_+0200_8nJYQ9zR21vsG=rQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBYF6TLh2qAR2/ZY8RAl9oAJ92Jczs5PwJd8nNbjMFsqpfuhHFBQCdGhQ9
mZgQCdGu9/DJ7oYwlT6asVE=
=HrmC
-----END PGP SIGNATURE-----

--Signature=_Sun__3_Oct_2004_22_18_27_+0200_8nJYQ9zR21vsG=rQ--
