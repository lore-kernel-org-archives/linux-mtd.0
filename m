Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CDkM1-0007Er-59
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2004 09:55:18 -0400
Received: from yagoo.io.ssji.net ([2001:7a8:3030:0:240:5ff:fe35:fead]
	helo=yagoo) by zorglub.ssji.net with smtp (Exim 4.24)
	id 1CDkLt-0002Vy-Oa
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2004 15:55:09 +0200
Date: Sat, 2 Oct 2004 15:55:05 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: linux-mtd@lists.infradead.org
Message-Id: <20041002155505.083d8440.nipo@ssji.net>
In-Reply-To: <20041001162705.5873dc7c.nipo@ssji.net>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Sat__2_Oct_2004_15_55_06_+0200_VA_QyXKc_Az1sjUQ"
Subject: Patch !
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Signature=_Sat__2_Oct_2004_15_55_06_+0200_VA_QyXKc_Az1sjUQ
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Fri, 1 Oct 2004 16:27:05 +0200]
Nicolas Pouillon <nipo@ssji.net> eut le bonheur d'=E9crire:

> I'll submit a patch for these.

Here it is, but I dont like changing 0 to -1 for undefined.
Maybe adding (another) config option could be better (like "force null
address probing")... thoughts ?

I made two patches, for different handleds.org kernel dates (fall July,
(the one I'm working on): 2.6.7, and now: 2.6.8.1)

http://nipo.ssji.net/mtd/patches/
(I've not tried 2.6.8.1 version)

--=20
Nipo <nipo@ssji.net>
Gnu-PGP: 1024D/1DBF658F
http://nipo.ssji.net/nipo.asc

--Signature=_Sat__2_Oct_2004_15_55_06_+0200_VA_QyXKc_Az1sjUQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBXrM9Lh2qAR2/ZY8RApnPAJ0YLl0D8CI7GiXHswqmlU8m65B/XwCfZSVl
L2zSQz4S1JXZelRYAu+tKHk=
=QNSG
-----END PGP SIGNATURE-----

--Signature=_Sat__2_Oct_2004_15_55_06_+0200_VA_QyXKc_Az1sjUQ--
