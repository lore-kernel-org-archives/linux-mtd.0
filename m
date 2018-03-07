Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1etOKz-0007jS-T2
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2018 01:57:53 +0000
Subject: Re: [PATCH] ubi: Reject MLC NAND
Cc: Pavel Machek <pavel@ucw.cz>, Richard Weinberger <richard@nod.at>,
 boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 tharvey@gateworks.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
References: <20180303104554.5958-1-richard@nod.at> <20180306231805.GA28183@amd>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Message-ID: <a95e4eaa-8890-a5a6-1512-c9800ee2a37c@sigma-star.at>
Date: Wed, 7 Mar 2018 02:57:20 +0100
MIME-Version: 1.0
In-Reply-To: <20180306231805.GA28183@amd>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VJf6WKdm3rDswI30wYXg6zdsyWkB3QgH2"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VJf6WKdm3rDswI30wYXg6zdsyWkB3QgH2
Content-Type: multipart/mixed; boundary="fQ0ClPwfwkUs8jTBCVa8trd4qWVAOb8vp";
 protected-headers="v1"
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Pavel Machek <pavel@ucw.cz>, Richard Weinberger <richard@nod.at>,
 boris.brezillon@free-electrons.com, dedekind1@gmail.com,
 tharvey@gateworks.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
Message-ID: <a95e4eaa-8890-a5a6-1512-c9800ee2a37c@sigma-star.at>
Subject: Re: [PATCH] ubi: Reject MLC NAND
References: <20180303104554.5958-1-richard@nod.at>
 <20180306231805.GA28183@amd>
In-Reply-To: <20180306231805.GA28183@amd>

--fQ0ClPwfwkUs8jTBCVa8trd4qWVAOb8vp
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03/07/2018 12:18 AM, Pavel Machek wrote:
> Now... Yes, handling flash is hard, MLC NAND is worst of the
> bunch. But...
>=20
MLC is not just more flimsy than SLC NAND.

The real problem is that on MLC NAND, pages come in pairs.

Multiple voltage levels inside a single, physical memory cell are used to=

encode more than one bit. Instead of just having pages that are twice as =
big,
the flash exposes them as *two different pages*. Those pages are usually =
not
ordered sequentially either, but according to a vendor/device specific
pairing scheme.


> Read disturb is not unique to MLC, right? Happens to all the flashes,
> its just that MLC has tighter margins for error.
>=20
You don't just have more read disturb on a single page. Reading one page
will also affect the paired page as well.[0]

In addition to that, you also have program disturb. Even *writing success=
fully*
to the upper page of a pair also causes bit flips on the lower one, affec=
ting
completely different data.[0]

This could be addressed using the experimental ubihealthd that crawls the=
 flash
from time to time (at UBI level), making UBI notice and fix bit flips.[0]=



> Power-cut. UBIFS is just not power-cut safe, right? My notes say that
> power-cut during erase could result in flash that contains all 1s, but
> will start showing errors very quickly. Again, not MLC specific. Can
> be solved with battery...
>=20
> (And yes, there are some problems specific to MLC, where parts of page
> need to be written in specific order. Not sure how it affects
> ubifs. But it was not listed as a reason for the patch.)
>=20

Both UBI and UBIFS were designed to be power cut tolerant.[1]

On MLC however, if you interrupt a write access to the upper page of a pa=
ir,
you will also corrupt the lower one, i.e. *data that was already written*=
,
which is a serious issue.[0]


Richard and Boris did spend a lot of time working on a solution for that =
at
UBI level which would currently still require a lot of testing and fine
tuning, but sadly we ran out of budget.

The proposed patch tries to prevent further bad surprises for people who =
try
to use UBI and UBIFS on top of MLC by making sure that UBI _refuses_ to r=
un
on MLC (at least for now).


Regards,

David

[0] http://linux-mtd.infradead.org/doc/ubifs.html#L_ubifs_mlc
[1] http://linux-mtd.infradead.org/doc/ubifs.html#L_powercut


--fQ0ClPwfwkUs8jTBCVa8trd4qWVAOb8vp--

--VJf6WKdm3rDswI30wYXg6zdsyWkB3QgH2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAlqfRwYACgkQvOXcPHQa
AtGUnAf/akx6/qBxZYbO6ODBoH4M7ULAPQVd2k2esYpHRWjjroJJTiD7TEd6phTD
Y4Bubdf1FaqRI8kSGDYLFdSMhBUjtWYJucPJmjImBnvjubS++SybjO7lSi4y6HMw
ndzaHb1OwbuBAASwBrNuwqYsuIbLWHxNOWtxzJHo8iv46Gd3MPY0xBocerbR8n+A
qjXN55CWa1huLiHNg7pp4zPpTW24eiEnJBLhqa/AWCM8lUXfXRnqF69rNr7mc6Y5
ZQxWi5TqZrNqKipQFS1KJ11gslQc4bJ8QYmeaAE9NBC3vMxggSTUveJQXMO3d5sE
W/EFXCjgPdzjZRX1WkODjmtKOevyxg==
=JTRb
-----END PGP SIGNATURE-----

--VJf6WKdm3rDswI30wYXg6zdsyWkB3QgH2--
