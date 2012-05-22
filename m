Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWiuO-0001NZ-1v
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 06:49:28 +0000
Message-ID: <1337669583.2483.88.camel@sauron.fi.intel.com>
Subject: Re: Resizing of an existing UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Homann <homann@bury.com>
Date: Tue, 22 May 2012 09:53:03 +0300
In-Reply-To: <4FBB3506.3020904@bury.com>
References: <4FBB3506.3020904@bury.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-m8rGc1hNn6xXzKt4fZTv"
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


--=-m8rGc1hNn6xXzKt4fZTv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 08:41 +0200, Robert Homann wrote:
> Hi,
>=20
> I have a short question: Is it possible to expand the size of a UBIFS
> without creating a new image file or reformatting from scratch?
>=20
> Suppose you have a UBIFS whose --max-leb-cnt has been set so to limit
> its size to 100 MiB. Now suppose this UBIFS lives in a dynamic UBI
> volume which gets expanded to a size of the whole partition, say,
> 150 MiB. Being limited by the --max-leb-cnt parameter, the contained
> UBIFS is expanded to only 100 MiB, and the rest of the space in the
> volume is wasted. Is it possible to resize the UBIFS so that it can make
> use of the now wasted space?

Unfortunately there are not tools for this :-( You could write one,
though :-)

--=20
Best Regards,
Artem Bityutskiy

--=-m8rGc1hNn6xXzKt4fZTv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPuzfPAAoJECmIfjd9wqK0URAP/00Ik6ouF8MPbcVz59jnQN6G
QHJjbMK69Y40nfHcMgttjKw9Y69AM7wQDV5QdBDZHvC2PLi0Hp7FgJnUYUkZgDM0
agkinAZNhyosW33LGQaCvHbYAdRf8rITVU09v1dVl0z/TI+IdgDUVhkPy7oNxkUV
2xIBtlLJfxnzB+eYrdsFOlcQiGI/vGBfLXSySaVcSImTc2zvqc6iY6U/JagVXWkg
qqymgkFWKmWokz0NNpUhchN95Ej6BGegahrBm+uyNieZrPRkSPPGRuVRUdysC06Z
rPD+y6JFMs1xNUfrALrTYRexq340fTRHNoZMue/oMa+TCuqpqzeWJY2TF3sCMGKl
imInIiF9MfiMJqdfJkZYqdkUTYkR6EaJ6xzUlHBOxd0H1sUaVJui6eiC695MNZ+F
vNTB0sZdMlELHHAGSVXgF1oWfLnPKRdCsvnHEPvMLmfKqsLmJGyQnLRPZe+r7twI
i1OfjBg3Z5oHP+oZ/q+GYlWT3yOsby7EQKB6a7/dGdnagii0EipInIcbcUNMUn4H
CIm/KtQ9QhiHuGxEXojZEcgqL2SOlP9F+6SYVbWfCtW0AfPMY2h9ssauP5MUIB6r
L+5ylRGkBO5/LjGZKyXMQpinW/tzxshiylyJLVT39IQf4+4Ac0rE18aS9bUkfS3l
r6RMHu+4cnuyMkpuTQR+
=7o8m
-----END PGP SIGNATURE-----

--=-m8rGc1hNn6xXzKt4fZTv--
