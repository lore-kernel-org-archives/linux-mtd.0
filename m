Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSnzx-0006g2-4K
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 10:54:49 +0000
Received: by ghbf1 with SMTP id f1so13809ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 02:54:43 -0800 (PST)
Subject: Re: [PATCH] UBIFS: Use kmemdup rather than duplicating its
 implementation
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Meyer <thomas@m3y3r.de>
Date: Tue, 22 Nov 2011 12:55:18 +0200
In-Reply-To: <1321570852.1624.312.camel@localhost.localdomain>
References: <1321570852.1624.312.camel@localhost.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rRlB0AxtFrp01fem53H+"
Message-ID: <1321959323.24797.150.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rRlB0AxtFrp01fem53H+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-11-18 at 00:00 +0100, Thomas Meyer wrote:
> The semantic patch that makes this change is available
> in scripts/coccinelle/api/memdup.cocci.
>=20
> Signed-off-by: Thomas Meyer <thomas@m3y3r.de>

Pushed to the UBIFS git tree, thank you!

--=20
Best Regards,
Artem Bityutskiy

--=-rRlB0AxtFrp01fem53H+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJOy3+WAAoJECmIfjd9wqK0kfUQAKN45LnYb9g/+DkiUMncar8w
F/qwKeIb82hxo/vafhuptm709TqdksRdUIPllbMp1X4g5euvneAigo1e1OTcq67j
Cu89lmJZ5UvSleKuouCxBbo/sgrboTir7q8kRkEGmBsuQyqTW6I4tievGGlQsRJU
djDcmXaQvcjV/uzQPS9J51ZWo4Z8msnF4oM9ziRfnu5Ch6uBM7u+o24UKdxzf4dD
4XMSQnQE+4erS/Ebwbr9MNr/pIAp1Qa+RtuTOfoNt26ID8urIEI5OZBZOaU9pDFU
yLBS3zEU39OtnwS9rCU5SL7MKNURMskxzAO8L41OFA2hCbXtK6LBmt2uIGHahhFK
FUn5Ks41H/6z8F3UfBimxo+tBz8sYkTsqQzxO8F0uZOT3WJfZV7sVdWLA6oPxHdt
f7KolL9x1PGareMgduGWD5CKczdbhIUuyQcohd4Z7b0vyichaTcvDAiM64vnNd5k
Ph7pef8w3WRXqFnLL6CK4tGgBRipixrftKj71gYFMwBoLiFM9eyF03/R5L4pg1Ew
2KnnY6Xy4FPKWKXsn+7hElMbHPENcT7K6Qsi7hpEc95ke8KFgbRDZ/qXJg6ITHtg
6jrUWjkGffanrYgFGH/EoXLlXgeEyGEqfwRRlb+aOf65c1LcX3mNf614onRAf9Js
dTKhWIPQyMsjP7wUdOZP
=L0G/
-----END PGP SIGNATURE-----

--=-rRlB0AxtFrp01fem53H+--
