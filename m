Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TinrQ-00031o-Oh
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 15:04:38 +0000
Message-ID: <1355324722.3400.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/3] mtd: nand/docg4: set of fixes and enhancements
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 12 Dec 2012 17:05:22 +0200
In-Reply-To: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0HgShI1GKsBFdc7Y4QWr"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0HgShI1GKsBFdc7Y4QWr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-12-07 at 12:07 -0800, Mike Dunn wrote:
> Hi, this is a short set of minor fixes and enhancements to the docg4, tes=
ted on
> my Palm Treo 680.
>=20
> Mike Dunn (3):
>   mtd: nand/docg4: add support for writing in reliable mode
>   mtd: nand/docg4: reserve bb marker area in ecclayout
>   mtd: nand/docg4: fix and improve read of factory bbt

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-0HgShI1GKsBFdc7Y4QWr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQyJ0yAAoJECmIfjd9wqK0wegP/iQeDXY6tOPkRH6m5781JVU0
kS7mjNjOU8Fr/DNMXEEyIl6/VWCPqP+YMuaqvNBUIVmB9XQk20j3Jk5hy9HQ0rKQ
B/sThXWtZIxT46w9gAq7bj8uMU/1s1ZGZ9ZhN37UZP4n5GoNbp17ypO1GGw3/EIu
Wkr4X4v0ZQqlk/Ic/LG8Q8ebiDMoODneWuPMCWFJdTiQaiWuz7K8+fH5/S4RnNBg
3xJxOhgILiAkE3vFlWqm2K7JThldE7lrZY4TPGOSrDGRt7V44sPTzasKqIQ3invS
EHTrzxf7naMBBVHA+Vb1sDpFBS/XFziZMFPtYWygP53zPHSY8Oc2gpva7LzmDhFS
VQRgTgfjtwD9BfftrLWgiYzUXubNiaH58D3dVFj45KpH357dW25pYYOikEdkueHC
S/YsoOFhBH7URXMLXFlZyXbhGcDQAnDkOvA7hWpX6mHx1eyMt+lvrToWvRwwFdjc
6/0nUMyloBm/2X+gw2t29bbYF3g347V7oOG5rQiMuhJYcMLERNU+r0hVFInwwTgN
vkdvZC+CIh8czEXwB6RUohbNdJBESLqDszdbpDaDebhu7Qoq55TlVGHgyNU8tgy3
Rc56S3iIHhIX/AP7mDgdncGPgcJ3n2jBcy3O00D0zOpJm/oxhV1myXnuMNc8orxy
OTqwDn/iLReccM+8bwQy
=LFDS
-----END PGP SIGNATURE-----

--=-0HgShI1GKsBFdc7Y4QWr--
