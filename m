Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm4Zn-0002ub-PX
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 14:27:24 +0000
Received: by iakl21 with SMTP id l21so6998730iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 14 Jan 2012 06:27:21 -0800 (PST)
Message-ID: <1326551341.19039.73.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] pmc551: fix signedness bug in init_pmc551()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xi Wang <xi.wang@gmail.com>
Date: Sat, 14 Jan 2012 16:29:01 +0200
In-Reply-To: <4F0B6301.3020405@gmail.com>
References: <1325019256-5171-1-git-send-email-xi.wang@gmail.com>
 <4F0B6301.3020405@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kcZ2ERWBKt+IqJKUeNC8"
Mime-Version: 1.0
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kcZ2ERWBKt+IqJKUeNC8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-09 at 16:58 -0500, Xi Wang wrote:
> Since "length" is a u32, the error handling below didn't work when
> fixup_pmc551() returns -ENODEV.
>=20
> 	if ((length =3D fixup_pmc551(PCI_Device)) <=3D 0)
>=20
> This patch changes both the type of "length" and the return type of
> fixup_pmc551() to int.

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-kcZ2ERWBKt+IqJKUeNC8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEZEtAAoJECmIfjd9wqK0ZP4P/2iRYNj0KTjdi0EuPVzIS1Tw
dNJPCNcdNg6Qx5O5k2ko1DunpC0W9kZbMz6gKpM5b4T6wdx9F5YyJ0QJWP6kH/Qj
A1/GwMApomLImKZQuQGnXsNWGCwA9Kef119Sm+ezU16GCmpLnVv9ldVAlvhEvx5P
9J1lUVKw7XKG794Wt17sxqrmCZ/k0kOrCaXOm1nN+65bHwchks1MXfokjXaLtiSq
A5S1LWNLscMsJQmzAb50/x3UHi9EI2UNx+UDg/7uoWEfcsXpEoRsIZ56fsoI6X7e
G5BALcMOQbZgkxgbt0GWS7+ZBcq1W6EeVlrfdIZNNvIf8PHX59r85mazgbAFxiGb
u0gb8ayBa8SbBy+hYUir0IM5QJ7y88BD7L+WjjaVZGeFB0wEcnwwhjvCzH5lqURi
FfxK3wHtyR/aoH2l7+0UB8DkIv4Cjvp8qDA4hOuAiNP0Toe/l8q9rg0+xQeTkMpI
mX+Z2fz7bYAkAjGZPDmVpKFdCthYzL2Izinxr5ltLzmPIqNfnSnsbdnVK7FsmP/Z
rnyfUQp0tG8h7crSlvi6FqwgoD7vL+Jk+HOGQpflAyVnE1ntr47150M2KjYHMX9i
TTwJEXzvQSBXcV33vAJbZAAujpfKUIPAdPVA2FebQamMHnKd0l3JA7jbR/En/I1g
4A2kXHC417paLMj1o/0O
=93SU
-----END PGP SIGNATURE-----

--=-kcZ2ERWBKt+IqJKUeNC8--
