Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AAA0n-0006Ey-6K
	for <linux-mtd@lists.infradead.org>; Thu, 16 Oct 2003 16:26:01 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <000a01c39376$a5cb6460$d203b60f@duckduck>
References: <000a01c39376$a5cb6460$d203b60f@duckduck>
Message-Id: <1066317608.4331.3.camel@tubarao>
Mime-Version: 1.0
Date: 16 Oct 2003 09:20:08 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-y3eHk/Ez504KlpJb/uhn"
Subject: RE: Mount of jffs2 partition fails
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-y3eHk/Ez504KlpJb/uhn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-10-15 at 17:47, Christopher Hoover wrote:
> > 3. when I try to use=20
> > the alternate Jedec probe method, I get a compile=20
> > error in jedec_probe.c of:
> > jedec_probe.c:1756: error: parse error before "jedec_probe_init"
> > jedec_probe.c:1757: warning: return type defaults to `int'
> > [...]
>=20
> Add #include <linux/init.h>.

Fixed - thanks.

--=-y3eHk/Ez504KlpJb/uhn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/jrcnfsBPTKE6HMkRAqlaAJ4wE/5JU0yQ43YmnYq6+Yfl4V1lvgCfUImW
fLnH7L4FgSjeNdwOsuZvdfU=
=xiv+
-----END PGP SIGNATURE-----

--=-y3eHk/Ez504KlpJb/uhn--
