Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19X5lh-0006Ah-FW
	for <linux-mtd@lists.infradead.org>; Mon, 30 Jun 2003 22:00:57 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Guido Classen <guido@clagi.de>
In-Reply-To: <3F009D87.2090401@clagi.de>
References: <3F009D87.2090401@clagi.de>
Message-Id: <1057006841.1135.8472.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 30 Jun 2003 15:00:41 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-4yPWXjoFFtMVS9WDD7/P"
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] some additional ST M29Fxxx 8bit JEDEC chips for 2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4yPWXjoFFtMVS9WDD7/P
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-06-30 at 14:28, Guido Classen wrote:
> Hallo,
>=20
> I've add some 8bit chips from ST to the chip table in jedec_probe.c
> from kernel 2.4.21. I've testet the M29F040B and it seems to work
> pretty well with MTD and jffs2.

Wonderful.  It will take me a bit to wedge your patch in - the MTD CVS
tree has significantly diverged from what is in 2.4.21.  I'll be doing
some significant work on MTD jedec_probe.c in the next few weeks and
I'll put it in then.  If you _really_ want the patch to go in now then
check out the latest jedec_probe.c and diff against that.

Once again, thanks for the contribution.

--=20
Thayne Harbaugh
Linux Networx

--=-4yPWXjoFFtMVS9WDD7/P
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/AKT5fsBPTKE6HMkRAjuIAJ419phb+GKNXzcc8zrhUBQ/IlV1WgCeIxRb
mzeV2d8QaID3TQQPXX3Y40A=
=4VyQ
-----END PGP SIGNATURE-----

--=-4yPWXjoFFtMVS9WDD7/P--
