Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbUsR-0005Ou-AK
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 11:23:27 +0000
Message-ID: <1353583450.2701.44.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2012 13:24:10 +0200
In-Reply-To: <20121122111411.GJ6186@mwanda>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-COHpPXJiTj/Jvi8CKYGj"
Mime-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-COHpPXJiTj/Jvi8CKYGj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 14:14 +0300, Dan Carpenter wrote:
> On Thu, Nov 22, 2012 at 12:31:37PM +0200, Artem Bityutskiy wrote:
> > On Sat, 2012-11-17 at 18:11 +0300, Dan Carpenter wrote:
> > >  	out_len =3D le32_to_cpu(dn->size);
> > > -	buf =3D kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
> > > +	buf =3D kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
> > >  	if (!buf)
> > >  		return -ENOMEM;
> >=20
> > I think this makes the code unreadable, because we really allocate a
> > buffer, not an array.
>=20
> The problem with the original code is that the multiply looks very
> suspect.  Everyone who reads it has to backtrack to find where
> dn->size is capped.
>=20
> I guess in one sense we never allocate an array, we always declare
> it on the stack.  We debated the naming and there really isn't a
> good name.  kmalloc_safe() isn't right either.  But anyway, the
> intent is that eventually someone will right a coccinelle script
> which replaces all these allocations with kmalloc_array().
>=20
> When I look at this code more, I still don't see a place where
> dn->size is capped.  So I think we *need* the integer overflow
> check as an integer overflow fix and not just as a cleanup.

It is validated in fs/ubifs/io.c in 'ubifs_check_node()'.

'dn' stands for 'direntry node'. We read it from the media and validate
it immediately after we've read it, including 'dn->len'.

The entire code is written with the following assumption that whatever
is read from the flash media is validated.

--=20
Best Regards,
Artem Bityutskiy

--=-COHpPXJiTj/Jvi8CKYGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrgtbAAoJECmIfjd9wqK0FlwP/2/lyutEr5UObfNZJVXzT2eG
JSVNeKxnT8hnZPnGjIyGufyvk+yL0FEp/hgPXdjxHpL+SX983sRc0JzXxk9dSPOf
5lVKMAgN+Hk0EXfpopXGn45kJB+3oKUyB+7quI46dYSiSxRdhmUt2dXv7Atxxszl
cvTqGBdc0UXHdgoe8QSQps8YNum13d7J1hht0roHl/MyCorCDBDMo3L0YjzA7fB2
/rEPS5ULVHVAjN+ClWM+z8X1wINB2cGCM98x0egdty6rDmbB/8w28tG7UzGy+oxm
+uTdZT+QiFFTZtalEaHaarE3TGHxnda22dIrvfZUurOq8YuAb1VT99out76Otg2L
3dInoqvgg9isUwwy1mDSsDHFlcpfZcEoyPW/hhNnnwBpR7SHsmyNAZGgdX2WAggP
oGrur+VFuMN0XSjP7QkWgRO1wKFs6hx1mgdvhmqVYvSauLU4YOVqifNgPMYuG5r4
5it+LpEgcdav/9N1Whb+H604SWkeIU5Lm6xHA4CcBBtCOES/zVswGPNDbjAxy2u/
LyFxJjjfqZtxyGplDttQoK9hQAh49gaDatF0fjk4VTwYB+ByA7de2tmMI9VBQmYe
fLQzv2X3itzDDMbnWYPcOb5TRv9RjPu95K3bUccV8fDqtgcPJbZXMqLvKde+aRc0
IG3J/vMLBfkisUqQnSrA
=PiDu
-----END PGP SIGNATURE-----

--=-COHpPXJiTj/Jvi8CKYGj--
