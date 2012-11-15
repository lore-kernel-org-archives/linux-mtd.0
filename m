Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYz5y-0006D9-3S
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 13:03:03 +0000
Message-ID: <1352984619.2221.40.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtdoops : don't erase flash at each boot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Thu, 15 Nov 2012 15:03:39 +0200
In-Reply-To: <50A21959.5050505@parrot.com>
References: <1350660573-6631-1-git-send-email-matthieu.castet@parrot.com>
 <1352735412.2262.15.camel@sauron.fi.intel.com>
 <50A21959.5050505@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-c+A9PJgyX4V6rH7rIVWN"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-c+A9PJgyX4V6rH7rIVWN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-13 at 10:56 +0100, Matthieu CASTET wr
> Is the following changelog ok ?

Better, thanks. I've pushed this patch to l2-mtd.git.

--=20
Best Regards,
Artem Bityutskiy

--=-c+A9PJgyX4V6rH7rIVWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpOgrAAoJECmIfjd9wqK0Rr0QAIGQA73kHko6hn53G1CrEMDN
SdjaSBXvKs5T+8FWwlRS5gHwdBfbrm1IKtMF3oRjEl2zmoxysm3+t/JfPyQlalzj
fiQoh3Z8rKoAKjDVZJlvYblSNhEblMqjz1L7AjaHZPCRVQLjp7iQ7LmdufXVBbsJ
yqKR3MW7dZS3UkNYrDbNEjebglZb0jLsSzM6J3zuHx0ZDIUqhAiRyYCrTjuWC8ir
GoZnKFWATz6nzYQqiofPL6INBJeByt17W/8UB8oS3i/hM86obGmiBweA6xvVPl4D
eCuag1n1lKSoTSUp8vicirI/z87chG/fKzbZqkNZNiApv7DtVeWCAgC4gxc8IR3r
W0+EriF7s1r+1tJKfx9Djd+teRz8eoB2BQjERruNj5SBKdRYdmBAfDxZNcskYu3s
cWHVie0SoC2wnvmxaHsWTen1EOgkeNIE6fVfEPKUfSwm2GVQL1kzvgO8BS19No4C
lHkKFBV06BbqR5+0ffDFk5VCpLxETCbvQa7xd+0zNkUgJJnUPqSU+RC3UYPWd3dw
bB3ExkzK3bGjC8O+UYPj90bIUBmvCR5SbNvE54+Mk5GdzKu4keSxwDlhyoJ113z6
WQS9UJSKbtj8rShFitZVaRxb6PenOmfkdKycSIu4xpFq2EewIQi/e7cPiBAScM9D
kgjTB2bqHy5S+rrQDjj4
=U74J
-----END PGP SIGNATURE-----

--=-c+A9PJgyX4V6rH7rIVWN--
