Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLvlC-0006ZQ-MY
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 12:19:23 +0000
Message-ID: <1335097157.4879.3.camel@golum>
Subject: Re: [PATCH] JFFS2: Add parameter to reserve disk space for root
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Date: Sun, 22 Apr 2012 15:19:17 +0300
In-Reply-To: <20120410212235.951079D401E@zog.reactivated.net>
References: <20120410212235.951079D401E@zog.reactivated.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pFmtFYLDsjFN6SqDzWFH"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dilinger@queued.net
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pFmtFYLDsjFN6SqDzWFH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-10 at 22:22 +0100, Daniel Drake wrote:
> Add a new rp_size=3D parameter which creates a "reserved pool" of disk
> space which can only be used by root. Other users are not permitted
> to write to disk when the available space is less than the pool size.
>=20
> Based on original code by Artem Bityutskiy in
> https://dev.laptop.org/ticket/5317
>=20
> Signed-off-by: Daniel Drake <dsd@laptop.org>

I think it is ok to merge this patch because JFFS2 is slowly dying and
adding new features like superblock would be too intrusive. Pushed to
l2-mtd.git, thanks.

--=20
Best Regards,
Artem Bityutskiy

--=-pFmtFYLDsjFN6SqDzWFH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPk/dFAAoJECmIfjd9wqK0Y+IQAJzcTlty8RZ4mUCLhh/jv0Oc
aAEzzoknBVA1JyeVF5FYvZPFl54Ta9yWbd0i/k4Y8vdLZNm0Gfeg3b5WRA3ZtpKO
dpJh3m/3cWmKajIJHw5rUX/vCBZkHMq/hHWej3OxXWPjNvhGIxFgcdEN/F/DsRmZ
gs0qcvyZWra1Fs+KcFgPxv2dJF0moRd8lQBT+HxiIz4y8OuAFO7MitlkeYOPWC99
P+AxryORTT7KfG0s+jZWCIPWgd0O5nk6E34OgUM9OlLLMca+W7JLMxuzW4wkZVbE
JhX9AGSP3M07NTwmJ12/iJOsC/kWxjXtwEC2w7sc2XikfdtEVcJOhb3KoVDAoUMN
Iy5uh+gOZxNX2x+6b2GaeBSSSrPwmUkZWuBxWuv75gGpKUH0hbn+TqhMVAAfGfHI
cI14N8zrU3zjcWoLKxs0WW+lXIGS5lz2MNUMWm1CXcvQOuhBzRgDBSFo1Hjl2H4w
WeK6XZ2b6JVes289nf5XwfLodmUkH7CPlrjcc5ZWm1mKXa7L6CsMFP8PxTS2w9Om
mu4YjSnrBswiIvPKqxZljhI1VIetK+jvVEOolzT1RQQMeppYKuvW8kv2zz6jdH+X
Yeijnw0jsNx4NPqKArMhK3HUD8zP0MfeAqPgLExN+9WbnwJOHZhfPDy6MzYA4UU2
yDs2JKYq/9TggFZX/TuG
=+tnL
-----END PGP SIGNATURE-----

--=-pFmtFYLDsjFN6SqDzWFH--
