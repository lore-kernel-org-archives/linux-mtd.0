Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1STusE-0002CL-75
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 12:59:38 +0000
Message-ID: <1337000583.2528.51.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in
 uclinux.c map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Greg Ungerer <gerg@snapgear.com>
Date: Mon, 14 May 2012 16:03:03 +0300
In-Reply-To: <4FB1015E.5000008@snapgear.com>
References: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
 <1336997124.2528.22.camel@sauron.fi.intel.com>
 <4FB1015E.5000008@snapgear.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Kbp1TmrG3dPFgWR6RKde"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Kbp1TmrG3dPFgWR6RKde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-14 at 22:58 +1000, Greg Ungerer wrote:
> > drivers/mtd/maps/uclinux.c:27:17: warning: symbol 'uclinux_ram_map' was=
 not declared. Should it be static? [sparse]
> > drivers/mtd/maps/uclinux.c:49:15: warning: incorrect type in assignment=
 (different address spaces) [sparse]
> > drivers/mtd/maps/uclinux.c:49:15:    expected void *<noident>  [sparse]
> > drivers/mtd/maps/uclinux.c:49:15:    got void [noderef]<asn:2>* [sparse=
]
> > drivers/mtd/maps/uclinux.c:71:20: warning: incorrect type in assignment=
 (different address spaces) [sparse]
> > drivers/mtd/maps/uclinux.c:71:20:    expected void [noderef]<asn:2>*vir=
t [sparse]
> > drivers/mtd/maps/uclinux.c:71:20:    got void * [sparse]
> > drivers/mtd/maps/uclinux.c:73:27: warning: Using plain integer as NULL =
pointer [sparse]
> > drivers/mtd/maps/uclinux.c:106:40: warning: Using plain integer as NULL=
 pointer [sparse]
>=20
> Sure thing, I can clean all those up. Are you happy to take a single
> cleanup patch on top of the ioremap_nocache fix patch?

Yes, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Kbp1TmrG3dPFgWR6RKde
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPsQKHAAoJECmIfjd9wqK0wvYP/3YMv/7+Wwm6mnkZL3e6XgOA
PDuC0klwrOpH6+Czv5OKQIAYxCmotndrLuCYB4t73ieP8BBmTUfX5B0H6Em3XSu0
lFdbBrQSfiOugzEU+O5e/3MeE1PQ0Na8tI31+QReU5EGQoHK2ng5YOB30hcIMHiL
XgoZS8AFGwUniAdRLgBLI5x+rDxHQnmZbBkfDL6wqRFdA0GFFoue8OYReuCBD4KP
dMsImK7q1c2WinUBbRMPE2/omxEX4bSn3HUeEJ1uEWczc7tTvC9bDUv49FsReIeG
amItILPVKNYDYiMR6BpU6pGQHUQUPXXgBAkK3WL9rQ1mt6Grl/N6XCkJt+ju3xz4
xX5tzM81LPHtqXzh93B56vP2InMZu7slx9Nh8onNsekrbZZ0WnbGQitJC0xNJ3q3
dTUzZQQRABJnuoaMdBPBm7I79zDlWLlPIY8uf/ZO7lXYQNNyUUV1rYViEdaO7u3V
m9WsbffVPoz9ylAGn6YQSGrHTWBvftQqKuApTrgENp39L9T5zjXWLjRWptRGt6o7
htgX8ai80D8vyTP2EuIXPOq7W9uwPTX4utI4Ld4NTWMFb/7so9ZJ2KgrEDtvN0nv
ExVqy3Cwj4Pu9iaHRNfnXL63gvg1mVb5FGFzqIj7XPgOqyFsa2NiE6vIZmw/gLoY
eOtd3nD5ciLzZkbPx906
=CDW5
-----END PGP SIGNATURE-----

--=-Kbp1TmrG3dPFgWR6RKde--
