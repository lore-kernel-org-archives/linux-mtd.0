Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbUuv-0005kZ-8E
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 11:26:01 +0000
Message-ID: <1353583603.2701.45.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2012 13:26:43 +0200
In-Reply-To: <20121122111411.GJ6186@mwanda>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NbfXp+APIYqk7a3zkI2s"
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


--=-NbfXp+APIYqk7a3zkI2s
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

Did you consider kcalloc() ? Just like malloc() / calloc() libc
functions?

--=20
Best Regards,
Artem Bityutskiy

--=-NbfXp+APIYqk7a3zkI2s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrgvzAAoJECmIfjd9wqK0xtQQALE1ajjLjBzAxH+77s4QtdmK
SQ6IB8b81EP3g1DOcQWNCVVRwVt9V0V+vjMbhy8iCGJNRC8Z8lLIDESiVrRWs1kx
E6OC1yFwJtxr3DO80oW4SyF25M5A7JEHLR85IiNa7dwlFGuUsDg8SGhac+5gLZ7B
dbbifqIEAyZUXt/n7BlmmkSzWFXiNGEeAuoxthZG1vodOEGoNQiGeflDNbDvAMAm
JmT70FsI1uLoAoNWhCQWW2h+pvhXlG9ECDYSuMTsln8NE8ryVg71+IpsBkx+JZkb
86mQl0rpVP1C9EpfB1Dz6bWOKRdfN+DMceUv2sAFe7IBVdqKPItGwlNxJNJeghY4
0QoBXzlvdSsO/Zifa0iBr0r6e7Yxp4gTNvRJmlueNpZr1/+VTPWG/bzECBVnjp0T
QDXXbwGm/Woi74IsDxiOQ1GxM4nBW1TGiytFK/L1pQzV6HmDDl18PArQiLbTzqSr
XkpGVr2RqtQ37lIKTqFlCKbUnUXQ2uW+1vFkpI2jGdRE7Q4KERAgqKE2zaaegeir
Fqse0FPEPYGp1l8cH+zW5bYTlFGdyoK4L9gF/y8dW6qwvcgdrtiKkpzPdRPVSU2I
Jt2TKLrEvUO2A/s8DbhGgCncYRMj6OjZne0egzyjoE57Id4y7cMDUZelNFUuLVBC
v5afhaMfz+mZxpiegOgR
=nIaL
-----END PGP SIGNATURE-----

--=-NbfXp+APIYqk7a3zkI2s--
