Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SST2U-0003ja-Vw
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 13:04:20 +0000
Message-ID: <1336655257.2625.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3] ARM: OMAP3: gpmc: add BCH ecc api and modes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tony Lindgren <tony@atomide.com>, Ivan Djelic <ivan.djelic@parrot.com>
Date: Thu, 10 May 2012 16:07:37 +0300
In-Reply-To: <20120509153141.GI5088@atomide.com>
References: <1335442669-13474-1-git-send-email-ivan.djelic@parrot.com>
 <20120509002927.GF5088@atomide.com> <20120509081047.GC17333@parrot.com>
 <20120509153141.GI5088@atomide.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-yrD52XDRsdRVQC5fRukn"
Mime-Version: 1.0
Cc: afzal@ti.com, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-yrD52XDRsdRVQC5fRukn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 08:31 -0700, Tony Lindgren wrote:
> > Note that I could prepare a new MTD patch with BCH ecc code included,
> > allowing to drop the GPMC BCH ecc api.
>=20
> OK, let's do that then. I'll drop this patch and you can coordinate
> your patch with Afzal.

Ivan, so are you going to send new patches early enough to make them hit
3.5? Can you please then re-send all the dependent patches again and
again describe what depends on what, because I am getting lost :-)

--=20
Best Regards,
Artem Bityutskiy

--=-yrD52XDRsdRVQC5fRukn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPq72ZAAoJECmIfjd9wqK013cQAK4GUh+MUpRv1B6H0miTcAL8
+aaUBkV1Mu5NzqCmf42wzU5YeZTxRkrMU6rX0/lcsKtU+Ve6cYCXhP6LnSGUVaX4
A5+JQvuT86kewLsZHdG/RZBgRULWHFWE6kQal1nz1KCdwIInEJwOBU7W2wmhKkDK
4RE1e2/LaHMklONO95dlXqMYxijuvTM7ScCGRWoe6y3FBOLcebrMqYUAsptw/yko
qXa+h8C6LT7ernOGvJvWhAGLEzO3dmisFFmjatmHFUIHwzj96fX4uHQuy9ch23up
2qo29CPtLpFxjLj4F946hOS3kqjMJ1c+vOz0PIWNmsm7NBTcReOO69MuMkJ1o7TD
M10exeTC9QDR1qIr86kYyzG1ay4KjQtj93qsSvp6Kw5fXIVdGP+FOqNVynTgKEn9
VdkR2eBL74+XFhf1lER/r9RM6W9IV39V+qYb2lDWTRu2II8FzJyH2/nmmzcxZKic
5NhcPiyOVlwMBq3JwFjpfkP+5Wm4pgHDgqNqSuj2Tv08YX9AykS1X6rIJ4WfocBI
iWtOOi6N/UhEtQHjQ7vL62JWulnq0V6xYMgE2BOc/vJlV/TQEblgEOddBkluT4/7
E5T3zFXB8WPtGui/qSXZBNR3WquUgMeqbHEN8N6rWO/4I+Pnqos0I40SyoGV4Zdd
uqRVJhRkF8KogP0BhRXM
=Df5E
-----END PGP SIGNATURE-----

--=-yrD52XDRsdRVQC5fRukn--
