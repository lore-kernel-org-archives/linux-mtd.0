Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgZwq-0006BE-Dx
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 11:16:45 +0000
Message-ID: <1340018436.2420.30.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: change | to & in assertion
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Jun 2012 14:20:36 +0300
In-Reply-To: <20120609090823.GA877@elgon.mountain>
References: <20120609090823.GA877@elgon.mountain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fGpb/Sk/+dA+NFcp2DrS"
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


--=-fGpb/Sk/+dA+NFcp2DrS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-06-09 at 12:08 +0300, Dan Carpenter wrote:
> The asserts here never check anything because it uses '|' instead of
> '&'.  Now if the flags are not set it prints a warning a a stack trace.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to linux-ubifs.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-fGpb/Sk/+dA+NFcp2DrS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP3w8EAAoJECmIfjd9wqK0FXYP/R4uMMdvhglAznQLefHiv96I
YjAVJXKbMI8xeJlTSr7Si0ADkwVapEVRZpPWTy/DmKAIxOmP9KrqTQqc/szn2IZj
KoVMgjxUYrP0An/UL2vyuba3qR3NAoLvwWQbTWDoUUg+umQrxqT9i2UNzKVENAmC
3kaEsJwrn52nfPu3uO5g8U9Y67jmBrf5aVZVoKpDtqMf/edXSE9+MBo6ur0kolUs
mZmk3r08k7v6fUF9685EnRRpixmkawSWAfrXEy8QC3GulLMS8MdcAHPkBMAoPiMY
fK+zyX0laDmX5MQ5grCUXxgEG6mbTaujhTkQCeOBOaZf880bbtuxAkjpt+zR2zOp
kRFM6iQat/1643PhsamFp2DJ+qIeNbtmJ01Vv1jMS36/4AsuekWt81OrtyKlq732
NUWzp7Zq8Xr5zLEYr+TYBCnBdk6My6h94osZbjf4HZV0Me2HbLQC3hiqhwzVUvLU
8b5COePaM4jbT5P3YAJ+A7azsIikKLdh83frTbMKE0Irhkc6z75b0lYC+vr7wvCP
DsTK5s0U+qdiIVge8wXrPUQ7vYFJx7G8LIN/4Y1ZCRBhGR9DZbqNjHnXxca0Mh94
6ner2bQAYNOuQcFksUTteENJXqKOXGDuufLwJF8i4lZ8fpaqJeF00/z2VMm5Jfrv
NsnOBOryyB++svHH7A+Q
=YMdv
-----END PGP SIGNATURE-----

--=-fGpb/Sk/+dA+NFcp2DrS--
