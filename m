Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AAcVu-0001GX-28
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 22:52:02 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Fillod Stephane <stephane.fillod@thomson.net>
In-Reply-To: <2C1BAF8F8E1DD611862B0002A5D4C3FC01BC05FE@renexch3.rennes.thmulti.com>
References: 
	<2C1BAF8F8E1DD611862B0002A5D4C3FC01BC05FE@renexch3.rennes.thmulti.com>
Message-Id: <1066427159.6281.23.camel@tubarao>
Mime-Version: 1.0
Date: 17 Oct 2003 15:46:00 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-wmM2z0sXZ4srrw9s6sWh"
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi_cmdset_0002.c support for buffered mode
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wmM2z0sXZ4srrw9s6sWh
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-08-21 at 11:07, Fillod Stephane wrote:
> Dave,
>=20
> Here is the patch for buffered mode write on Amd chips.
> I've Cc'd Thayne if anyone of you cares to commit to cvs.

I just committed your patch for buffered writes - its cfi_cmdset_0002.c
v1.89.  Please test it and let me know if it still works.

Thanks!

--=20
Thayne Harbaugh
Linux Networx

--=-wmM2z0sXZ4srrw9s6sWh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/kGMXfsBPTKE6HMkRAhIrAJ9NPqfC6cRJG1/MEPjsSEnzJT6bjgCfVnYP
0b6qiqw0HnMYsqdvApjpa3s=
=nUz7
-----END PGP SIGNATURE-----

--=-wmM2z0sXZ4srrw9s6sWh--
