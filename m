Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWmk9-0004L3-8C
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 10:55:10 +0000
Message-ID: <1337684323.2483.157.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 22 May 2012 13:58:43 +0300
In-Reply-To: <4FBA4448.20509@nod.at>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
 <1337173272.24809.52.camel@sauron.fi.intel.com> <4FBA4448.20509@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tMvuhLYMtWHxGHbcMWWl"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tMvuhLYMtWHxGHbcMWWl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 15:34 +0200, Richard Weinberger wrote:
> >       fm_start =3D ubi_find_fastmap(ubi);
> >       if (fm_start<  0)
> > +             /* TODO: instead, return 1 which means that fall-back
> to
> > +              * scanning is needed */
>=20
> fm_start is the PEB number of the fastmap super block.
> It will return 1 if the super block was found at PEB 1.
> That's why it returns a negative values in case of an error=20

OK, if 1 does not work - use 2, introduce your own constant. Using
-EINVAL is simply incorrect. Check what happens if the MTD driver
returns -EINVAL when you call 'ubi_io_read_vid_hdr()'.
--=20
Best Regards,
Artem Bityutskiy

--=-tMvuhLYMtWHxGHbcMWWl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu3FjAAoJECmIfjd9wqK0jXMP+wQjp0cIoMZJ3aP9YvElOSWl
Mkki3XStf/XV/IGwKIz5M/4z5xP4jdUaMI0tMzzrGoXhJJ5ww00l1dxH7dmjgDku
ODD7HW3usVgqfsbTrWJ9Ps1iYL4L1hnb7A36c6Xsan/b1yANLDDX9/5rvfZQ61q8
Sb9lNSzDVvIa8u96MhBPsiBQW8BXaR3PbotrNxo2PJT+Hk1DHSXNLNn+uXYMqaJz
Z/9MkoAxe4eUsJvISvqg4OvtkdBdJ1OZy4FhZGW5HC7pFfLRT47gbaRYRYFlkaaF
0EXLGNTOOgf+o5kZnpYY+tlBH1G4Omw3YYLetNnpdjCCI+p7I2YH2ybp1oYQ6qYo
7JSXYeKLi0/KiuvmHhrqdi7hcDcn0RhIAjuoEFHuO3hHu5KK+K08HwDjUTfv9Hco
LsENpp3D0O7m3tObGHEXLvhatiDEWrf0SlETmTndZFc7cRD9tWmcaDoikl2RkJO/
TUhUouhv7qXN2DMRpzlZdgyH4Miz476WNmvQyxO0V00AURw6kIwPZhb1/KMzpB0G
aOxefyU3XYX/CpSJf/Pr+K6WSEOaLzM00iSJHoq7YdscTCjEwWD0BM110eiz3yem
+YKRRky6DT6EDx2bAQF2Hh6zSpMPHkEc72SisBUdY15bmxnC2V0xyBI5LzeJyEzz
cjG+p4bzrByW1Xo1hfZE
=861+
-----END PGP SIGNATURE-----

--=-tMvuhLYMtWHxGHbcMWWl--
