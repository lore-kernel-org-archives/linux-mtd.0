Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19IUQV-0003sy-Nx
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 15:18:43 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Gordon J Milne <gordon@bluewatersys.com>
In-Reply-To: <3ECB640C.5040305@bluewatersys.com>
References: <1028064443.23642.52.camel@mahi190.austin.ibm.com>
	 <14660.1028067926@redhat.com>  <3ECB640C.5040305@bluewatersys.com>
Message-Id: <1053526720.1070.10.camel@tubarao>
Mime-Version: 1.0
Date: 21 May 2003 08:18:40 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-CB0rfLREf8hRAT5nFvum"
cc: linux-mtd@lists.infradead.org
Subject: Re: "Read-only file system" error while writing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CB0rfLREf8hRAT5nFvum
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-05-21 at 05:33, Gordon J Milne wrote:

> The device (1f:03) is the root device and it has been remounted rw. I=20
> verified this by checking /proc/mounts - everything was rw, as expected. =
My=20
> system successfully boots and I can execute commands. It is just the=20
> filesystem writes that are not working for me.

This is the symptom if you have the incorrect unlock addresses for an
LPC flash chip: everything is readable, but nothing can be erased or
written.

The ST M28W320CB is a CFI part and so I can't guarantee that it's the
same thing, but it may be a similar problem.


--=20
Thayne Harbaugh
Linux Networx

--=-CB0rfLREf8hRAT5nFvum
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+y4rAfsBPTKE6HMkRAsI+AJ9K73FUvAS/gKyib3Zkdy+31Y9lsQCeIyOF
HSxG+s34IYtGWaBUHT6xHgk=
=mSPg
-----END PGP SIGNATURE-----

--=-CB0rfLREf8hRAT5nFvum--
