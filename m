Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2FzB-0001O6-Mv
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 06:57:02 +0000
Message-ID: <1359961124.13791.1.camel@sauron.fi.intel.com>
Subject: Re: question about mtd_torturetest.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Mon, 04 Feb 2013 08:58:44 +0200
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E995A7B@DBDE01.ent.ti.com>
References: <50F9023D.5040408@freescale.com> <50F93F65.90805@parrot.com>
 <50FCB75D.1000200@freescale.com> <50FD02EA.5050209@parrot.com>
 <50FD0554.8030108@freescale.com> <50FD073C.8050209@parrot.com>
 <50FD0981.8050507@freescale.com> <50FD0B3D.2070803@parrot.com>
 <50FD0BE9.3020506@freescale.com> <50FF9068.1030709@freescale.com>
 <1359737889.2942.17.camel@sauron.fi.intel.com>
 <20980858CB6D3A4BAE95CA194937D5E73E995A7B@DBDE01.ent.ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DWbSArhPK/BidL9McPG8"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>, Lin Wei-B34918 <B34918@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DWbSArhPK/BidL9McPG8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-02-04 at 05:19 +0000, Gupta, Pekon wrote:
> > On Wed, 2013-01-23 at 15:25 +0800, Huang Shijie wrote:
> > > Hi all:
> > >
> > >     The mtd_torturetest.c uses the 55/AA patterns to torture the nand
> > block.
> > > Are the 55/AA patterns more tougher then the random data?
> >=20
> > Probably not, please, improve the test.
> >=20
>=20
> (0x55/0xAA/0x55) pattern ensures that _all_ bits in the byte transition f=
rom 0-> 1, and 1->0,
> Whereas, a random pattern may miss a bit-cell or miss transition sequence=
, of an bad bit-cell.
> Exercising each bit both ways is important so as to differentiate a bad b=
it-cell (permanent error) from read-disturb errors (temporary error).
>=20
> For read-disturb: http://download.micron.com/pdf/presentations/events/fla=
sh_mem_summit_jcooke_inconvenient_truths_nand.pdf

Sure, I did not mean remove those, I meant that random data test can
also be added and that would be an improvement.

--=20
Best Regards,
Artem Bityutskiy

--=-DWbSArhPK/BidL9McPG8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD1wkAAoJECmIfjd9wqK0iVIQALJtyGCNjJJHE5Uq9z6wR2AK
J9DOlGDvTDdQZHmOFmlnuW4+GAFFI4cuFEGAcswibjN1uTThMq8clX0aVkYu82DZ
26xdpl8Y4IzxGiOFotCAiqB/YwgDfWg7ZMunf7rV/8AiftJ/nyZohGmAm+69sI6v
9Ivy8mEiTv/p85n74w1VVd8SHf3d8ChSnZzwKYzYlORRgLXaQXB7Gg/uP9O2LU1W
ptbMnwtkPirmpsu/IhmPtEZqQQqz3qTjW9nHZQQrfxtWkNiD7CiHy4RTlwT7/AF2
KoU1Z4sVGeKt656+Vkw40QUEbNXTK1/M76SxxZOE+YZK8ksKsssEhqLebPXeCEbx
bc68CN7kRkYoQXcMp6Gsb5hF6/2zvO6TAOYP4iKWzEkO1ieLcWhigAD37PsgM6y0
ZGsde2YVLj5A2ebQopWEbBA/uvTrgYjYB4Vnl+Tp0vnTm9ZummvxN68vnYqRm/Pg
9bie7qEnndiRNkNUfuC9f5isXBLoqfZujEvfzPvzM687PdmhfcfZG96XwY0vckTa
BU/NTs7y/bTH9f5gYw/XTXaNAicbLCZ5OKK5s52GqCjK9CUp2/g9ci6e6iryQ6V/
TP/C8DHggxbSjq3AeRAGDLsYqM34b3wXV7P1wZRNKXMEEOJg8vZdgYJp89U/0wf2
TwPStsjvUeXnbrTH3kk1
=jg9+
-----END PGP SIGNATURE-----

--=-DWbSArhPK/BidL9McPG8--
