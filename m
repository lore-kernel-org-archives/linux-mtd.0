Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AAbiW-000179-1U
	for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2003 22:01:00 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Stefano Babic <stefano.babic@siemens.com>
In-Reply-To: <1060078328.1717.233.camel@mhw42463>
References: <1060078328.1717.233.camel@mhw42463>
Message-Id: <1066424098.6281.15.camel@tubarao>
Mime-Version: 1.0
Date: 17 Oct 2003 14:54:58 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-0kSLqYBYDZ47lrlTGeBa"
cc: linux-mtd@lists.infradead.org
Subject: Re: Concurrency erase/write on the same AMD chip with not aligned
	words
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0kSLqYBYDZ47lrlTGeBa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-08-05 at 04:12, Stefano Babic wrote:
> Hi all,
>=20
> I have seen a problem when I am writing not-aligned words on AMD chips
> while on the same chip another process starts an erase procedure for
> other sectors or a different MTD device.=20

Stefano,

The fix for this is in cfi_cmdset_0002.c v1.87.  I had to pick through
your patch a bit, but I think all the relevant pieces are there.  Will
you test it please?

Thanks for your help and the patch.

--=20
Thayne Harbaugh
Linux Networx

--=-0kSLqYBYDZ47lrlTGeBa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/kFcifsBPTKE6HMkRAsvuAJ9DWW7W0AKnANH2E2syKl7QMdmfLACfZB57
H+K5b6KYQauw8LVa0sbczBA=
=BVPG
-----END PGP SIGNATURE-----

--=-0kSLqYBYDZ47lrlTGeBa--
