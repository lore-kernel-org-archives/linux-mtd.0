Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGVcF-0007bO-KI
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 13:56:00 +0000
Message-ID: <1348581363.24309.2.camel@sauron.fi.intel.com>
Subject: Re: UBI : Pairing up PEB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: VenuGopaL A <hivenu1@gmail.com>
Date: Tue, 25 Sep 2012 16:56:03 +0300
In-Reply-To: <CACVe6y2vgiypjvzMYdjBf+SBu9qiWcJrDst-UKe-jS3b=m8GVg@mail.gmail.com>
References: <CACVe6y2vgiypjvzMYdjBf+SBu9qiWcJrDst-UKe-jS3b=m8GVg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-AzUZQUwGLuy13l3IBnFC"
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


--=-AzUZQUwGLuy13l3IBnFC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 13:44 +0530, VenuGopaL A wrote:
> Hi All,
>=20
> I am trying to speed up UBI. In FAQ section, they have mentioned about
> merging two or more PEB's and treating them as one composite PEB .
> I am not able to find any documentation over the net.
>=20
> I tried changing the PEB size and LEB size during ubinizing the image
> but the file system did not mount and the target crashed.
>=20
> Please put some light on the pairing up of PEBs.
> Target has 512MB OneNAND chip.

Hi, I meant pairing on the driver level, not in UBI. The driver would
need to report 2x larger PEB size to UBI.

--=20
Best Regards,
Artem Bityutskiy

--=-AzUZQUwGLuy13l3IBnFC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYbfzAAoJECmIfjd9wqK0J2kP/i8MSYK0YIiirYW3jwcJVcKQ
htG6nW59fX3FPwio3Oeriwdp8fxKCLpNZlXw+EBIAyztO95gRyYnAqi0SZO9vlNL
8KdMfO2BTdpWfayGVagnDoowpTG9x9+KifaQP7/PuNrs0umc7LAmBP/HTtwtg9yn
hhaO37fpqHv5eElwhWX5hdD1yF5flmqWmAeRpNBC74uY6O65mWxisnSCWMm2uyJU
zsGHGSCCn7Ray1qZ4XfrhfzHYR9/3KPMNx9B9LFAH+zNe85AyScEdriXrIsPlOMo
6HUclow7lIb4smzaVIAXlvQ7gZnBpwCoeBl9nsZDpBk7CSQIuWLJhE17Wa5pGioz
rLY66EL4Ju933DGAdpRf3CYkI3X6wlkc1DOKyVYY3COF5Ia99RtUUItDHPkFq2pt
jrJdO76l9zTqciNv4lQGKgzsfL6cQ8/TqQ/UdZRGmdN0Rm/jSHhuD/UZqcG8K7u4
Qape4H+VQdlcH2NO54uEmz2p1TFO9hgv5kukcf7G68rT93bbi66LCnhewFPklDSs
KdUn/KIset5R1Ym2XUWBc8DI9vmbtCKeMMa6RJWbvtMekKFACfRkEBmZw2CcpM0W
r93TZm/TbrUmgJXPuDxh8kdsCSnXVB0PiQnlparNuvHRKHynmgxT/xUpzMdkw73F
Hi+rTlOfI5R0MHcLXRVk
=YphN
-----END PGP SIGNATURE-----

--=-AzUZQUwGLuy13l3IBnFC--
