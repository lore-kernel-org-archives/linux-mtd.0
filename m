Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nNpA-0004vO-9w
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 20:31:52 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Stefano Babic <stefano.babic@siemens.com>
In-Reply-To: <1060324952.24780.115.camel@mhw42463>
References: <1060252618.25209.31.camel@passion.cambridge.redhat.com>
	 <1060324952.24780.115.camel@mhw42463>
Message-Id: <1060889458.23754.247.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 14 Aug 2003 13:30:58 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-6s7KjogBMCFQn7Cfl4dz"
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Concurrency erase/write on the same AMD chip with not aligned
	words
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6s7KjogBMCFQn7Cfl4dz
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-08-08 at 00:42, Stefano Babic wrote:
> On Thu, 2003-08-07 at 12:36, David Woodhouse wrote:
> >=20
> > I haven't seen it personally, but it definitely looks like you're right=
.
> > Please could you send a patch?
>=20
> Hi David,
>=20
> I send you the patch file for the cfi_cmdset_0002.c .
>=20
> stefano

I looked through the patch and it might cause problems with AMD
compatible chips that do not support suspend/resume concurrent writes.

There needs to be a mechanism for dealing with supported/unsupported
features in cfi_cmdset_0002.  One of these days I'll finish my current
ECC project and I'll be able to put time back into this.  (let's hope
it's real soon).


--=20
Thayne Harbaugh
Linux Networx

--=-6s7KjogBMCFQn7Cfl4dz
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/O+NyfsBPTKE6HMkRAvDSAJ4xspgxQbKj8B6aoE1UngldT72lmgCfR5UI
HOxfaQhRH3wZZJMhX3Hdq9g=
=5x4+
-----END PGP SIGNATURE-----

--=-6s7KjogBMCFQn7Cfl4dz--
