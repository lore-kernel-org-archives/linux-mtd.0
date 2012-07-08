Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Snqmw-0003Xm-0N
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2012 12:40:36 +0000
Received: by wibhm11 with SMTP id hm11so1632378wib.0
 for <linux-mtd@lists.infradead.org>; Sun, 08 Jul 2012 05:40:27 -0700 (PDT)
Message-ID: <1341751213.2104.7.camel@koala>
Subject: Re: question about fs/ubifs/orphan.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 08 Jul 2012 15:40:13 +0300
In-Reply-To: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
References: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-p4+R61DgtelOmLvVOdwd"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-p4+R61DgtelOmLvVOdwd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-07-08 at 11:21 +0200, Julia Lawall wrote:
> The function ubifs_orphan_start_commit contains the code:
>=20
>          list_for_each_entry(orphan, &c->orph_new, new_list) {
>                  ubifs_assert(orphan->new);
>                  orphan->new =3D 0;
>                  *last =3D orphan;
>                  last =3D &orphan->cnext;
>          }
>          *last =3D orphan->cnext;
>=20
> After list_for_each_entry, orphan is just an address at an offset from th=
e=20
> list head, not a pointer to a real structure.  So it does not seem correc=
t=20
> to access its cnext field.

Looks like you've spotted a but - we write some irrelevant address to an
area within the 'struct ubifs_info'.

I think what the code meant to do is to write NULL there:

- *last =3D orphan->cnext;
+ *last =3D NULL;

I wonder if this could be a reason for some of strange bugs we have seen
reports for.

Well-spotted Julia, thanks! How did you do this - writing another cocci
script for the kernel?

--=20
Best Regards,
Artem Bityutskiy

--=-p4+R61DgtelOmLvVOdwd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP+X+tAAoJECmIfjd9wqK0RBIP/RwzRJ5XCWAe4g8x7tOAf7MG
/QD5HeE3KoxqAajMYlRxhvPn9SJVC+v8bm/jiyB+JZANMeDEEPPkOZwlefL6XXN0
gp0Y3TyaVSD0mdWSYVR+kYTUg4sTX8/PSABr10eYZ3GpqxxGdYzWCoiB3gnJ4Wk1
AcYifNEQscKTDbiI/hD+5wW7ijQyy26cZ+J7XkUDpeOlBr43Z7WepIAvJ+Ra/gGH
xTq49J/bDRceYuI5+4fRJS6WJz6HyXdY3N+2yJxH+PeW9Rr0qr7Y2/JqmSRfaijy
5yq0wdHDAC6Ip5WV5X8Mf3Ng+zFprlr4wNcqPghZsCkWJEreepYpulCTzwUOWFEG
4vlvzOHFWYJHW2Cg2m9Xrq+ZbaUpEn3luPjfffoM8vJ2TjOYi4e/eEu/xBomO7oz
+TBsXeiCm47eVqJanmRfM8CmMFAIcw05v6dPqyW5GzRB+EgZ0N7pWlZgEHitS5+x
XQ1BwK/n1HNjppn/EMlZt3qrbFCllKFYw+yU775zYLIyCRYUHWK8udXRp7Or2Xjm
0VMCT2VLE1aqvNZaIpteybn9YO8Yb42qcAtYWPzz7ykFdFk56E8JwTeUYL+dTseU
HEQaWXHIhl5YRl2n8gZoWsPDf+K5oatyp4Jf6JBlE/yI38OkJyTxirbrkePn7wLT
CY+CHFkrhChII9Zw6zHY
=ks6H
-----END PGP SIGNATURE-----

--=-p4+R61DgtelOmLvVOdwd--
