Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TEg32-0005Ko-FU
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 12:40:05 +0000
Message-ID: <1348145107.2388.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: just use memcpy_fromio for reading
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 20 Sep 2012 15:45:07 +0300
In-Reply-To: <1348131625-24349-1-git-send-email-zajec5@gmail.com>
References: <1348131625-24349-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-d+fdqqDWuRWY8XDOFT1g"
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


--=-d+fdqqDWuRWY8XDOFT1g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-20 at 11:00 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Squashed this one to the previous one. Fixed up the following aiaiai
complaint:

Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-",=
 results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/devices/bcm47xxsflash.c:22:29: warning: incorrect type in argu=
ment 2 (different address spaces) [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:22:29:    expected void const volatile=
 [noderef] <asn:2>*src [sparse]
+drivers/mtd/devices/bcm47xxsflash.c:22:29:    got void *<noident> [sparse]

--=20
Best Regards,
Artem Bityutskiy

--=-d+fdqqDWuRWY8XDOFT1g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQWw/TAAoJECmIfjd9wqK0QYgP/0nBq8ykboijK3JsicHJPV5M
z4kOhxOMZjBfUua4To+AFk8C4J2/IiCeMZVdKSLK+SkGhnZekIZSTygqQrJnek9k
YE7Kg6N3y2MGFFQg0vnurUx8Njz4w8VC3Mq8UzxZqja4NcBJgjl7OFNYst7MSAYO
fh5PyQ5jOFnbHm6fPewFbJmtl/o4RHEdW+gX7fNHgz0sIo7lR48Y+1tmBVn9OMxc
EGNjB636G3pEFmHu33qGgWjLSTYDkuCsl9MngBrjgLLhvUg8NnoWN0aUlm5UD1ev
tFcV8zslui4vCHypt+IxnGI9U2t1QsfXYDHS1qlFSMOazV9v/2MIiDIWxnBcank/
sZrL47MkaoBi1o+M0Ij+G3s7BR3hWneiBxdZVgkEgDDMi6cPEkx8meo1474QOENA
fZ+hfIa57YyFtWP+X+g60nJWp0Amac1JOdVDR9xgungCz0kbg582J9PHXZeH6vzQ
aL3ROKT5i5gJA8PKToPZ31T+Bm3/7+jNxvGW3D0R1qLdbCb4rQynhMzsbIewJcxi
svgZGh4gILUtO5d78v7cQZWDKX6LISnp+7CSGKWMgU9CoorGg+2otGF617H6MLId
PPI3+Xs6d33rK7CO24VWJX0u8oz2uqxyFphX+OQR7lBA4XhSRnNuOnEV8n4WvmRc
7KUjvoHK6ic8dr7P5s8o
=tKvl
-----END PGP SIGNATURE-----

--=-d+fdqqDWuRWY8XDOFT1g--
