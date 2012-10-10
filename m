Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLsci-0002if-VC
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 09:30:41 +0000
Message-ID: <1349861452.20594.12.camel@sauron.fi.intel.com>
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Date: Wed, 10 Oct 2012 12:30:52 +0300
In-Reply-To: <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
 <1349851661.20594.6.camel@sauron.fi.intel.com>
 <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6oP6g+aFvTN0OBvqHKzC"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6oP6g+aFvTN0OBvqHKzC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-10 at 11:04 +0200, Marcus Prebble wrote:
> Apologies for the long-winded explanation - but the output file really
> isn't in the the root directory, even though apparently the inodes are
> the same.=20

Well, ok, this is a bug. But I think the solution for this should _not_
be a separate "--band-aid" type of option. We should kill 'in_path()'
and implement a 'is_contained(file, dir)' function, which would return
true if 'dir' contains 'file' and false otherwise.

--=20
Best Regards,
Artem Bityutskiy

--=-6oP6g+aFvTN0OBvqHKzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdUBMAAoJECmIfjd9wqK0ObEP/jiB9lGOdk/LKRKpharvvYUm
KDqHRZk799KML4OKrnU5DMpGSii2sW9BZjl2l8Fc9CQeTaZRSc/4zy194VZE77h6
tBSKnmu0rG/zNiBev+3Ej0s7q0ZWGzz15pkE4YOyLx8J6LofJknZe7Hck5ebzg3E
p0uKCAZK4XW+/tDK/dhFoWqjFHJhDglaxveWVBqO4PqSnsmuZogxvlhIzzwVw2eX
HNXPcGzobVXl/ehZbY6zuw84upTRAKdqIrohg8X/BREKycRc0KjdJNfNAAu02nXb
BS1HRUSXvNb5uYtAfehnBVKStasK1CTvmukvUlLxAvuie5l/JN3dHwRTFfQz2k5Q
DWM/xLpj1XEszYoB8sO+ibWX4VFf+mx4oWSGLwlYGhvlJB07A2AwGQXoeDVcBn6y
nbsrdJeCCNJlQeWp1CB94ySbqPmTJSsWQbnnZvVL+dtwDHEuQreuzl7w0pK4bjKY
WQrkd9gEbF6swHvM6JnHjbrpp+/1dCY+lUfNRKbMNI0WDHnSdlBIWmTtFmuhIMsJ
8+J19e4KIXazluAKdIbgfnzCy9TxjmNvaM5wZfnbGPK5OHFr37yGn25+qXrl2Xmc
Myg1ly7w3SjYqYIDuBbgt3RWrQpeWUKONniBVS1/+/8T1rZ9ygILx9dVDWCYsjbh
I0SrrIqQvcMt0iO9Jqfy
=Oz1o
-----END PGP SIGNATURE-----

--=-6oP6g+aFvTN0OBvqHKzC--
