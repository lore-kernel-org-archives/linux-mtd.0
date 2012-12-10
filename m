Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti3Oo-0007M5-SW
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 13:27:59 +0000
Message-ID: <1355146138.2657.29.camel@sauron.fi.intel.com>
Subject: Re: [patch] mtg: docg3: potential divide by zero in doc_write_oob()
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Dec 2012 15:28:58 +0200
In-Reply-To: <20121129141651.GA12199@elgon.mountain>
References: <20121129141651.GA12199@elgon.mountain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DsWlkbLouT5zh4UFmN1Z"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, David Woodhouse <dwmw2@infradead.org>,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DsWlkbLouT5zh4UFmN1Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-29 at 17:16 +0300, Dan Carpenter wrote:
> If we set oobdelta to zero then we will either return -EINVAL or hit
> a divide (modulus) by zero on the next line when we check
> "(ooblen % oobdelta)".  It's better to just return -EINVAL here instead.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-DsWlkbLouT5zh4UFmN1Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxeOaAAoJECmIfjd9wqK0uDQQAJGiCVB4ALc3pkFZEMi7hJE9
yE6Ebu56YU6SzMlPpReKyJbFF1YH24vd9BQDryV4Ms9xd+VBaGItw4G4UZ6JhrbA
z9dWf0GVGSEjyi8KLg/InoPhvOaz52O3SThyBWACDxAvkrt7asC0NeJUOEuk/y7h
udfu4QGHk5j4Luh3uqtyWgD9b4cgQO7eu+y5Mlxvr3zZnmocYrU8KLAeP9fexfHQ
JwlVPzEgXWOparxjdyofiK4uQStaJYeD83wkSpIXjhFzf/jOsM7/dqTNMg7DmA/M
LJSQZXfctCw4FXNXnTx1tgBw8xzzMSSDXBHo8M8Cn/Pyejkd0MDwVjJHcEBHF+w1
Bdz7b08CM2Dat2VkOInSOpIyMapzYxCHtQPrhVU0PtK24e2nDO3s2hl3gh8RI8XK
bDSbREyf+xU6Lt7qu4NR2l+nJZICHtsj2/WVmAw9ZolW+PjAPG8XWnNxu1ffM419
HcBa4fLVZBSiwWcf1pXtobIdiaMB985dW1AhycO0IGde3FzncW+5kaVlcICWt/VX
jrgHE4UEW5PtzqOBZp1JyPLDXZQhdiFyQoscv/JaGKg+y1akcYQy1DAfrJwEpmrk
3MxWl/gTontdA+eFJJxQfSL8FQjqi0Lt/YS8itOYBHETkEUnrBGFKf/094kYpwW7
gtPuF01mNdE1YEEBbfnY
=BM0c
-----END PGP SIGNATURE-----

--=-DsWlkbLouT5zh4UFmN1Z--
