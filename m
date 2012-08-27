Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T5viV-0000AT-SG
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 09:34:44 +0000
Message-ID: <1346060377.2848.345.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS v2 3/4] ubiattach: introduce max_beb_per1024
 in UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 27 Aug 2012 12:39:37 +0300
In-Reply-To: <CACQ1gAi4uJkiYyfUsnv-k9M8Me1ROzCbe6msoLV=4qn=gL0tTA@mail.gmail.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
 <1345651477-5301-4-git-send-email-richard.genoud@gmail.com>
 <1345714184.2848.220.camel@sauron.fi.intel.com>
 <CACQ1gAi4uJkiYyfUsnv-k9M8Me1ROzCbe6msoLV=4qn=gL0tTA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vWYVGwKydio/CzTK1cqi"
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


--=-vWYVGwKydio/CzTK1cqi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-27 at 09:23 +0200, Richard Genoud wrote:
> Could you push your git to mtd-utils so that I can test the final
> version, please ?

It is pushed, the latest commit is:

commit 9d8751b3f5c6358b6167c38899f1e41498d24a45
Author: Richard Genoud <richard.genoud@gmail.com>
Date:   Wed Aug 22 18:04:37 2012 +0200

    ubiattach: fail if kernel ignores max_beb_per1024
   =20
    If the kernel doesn't know the max_beb_per1024 parameter in the attach
    ioctl, but the call still succeeded ubi_attach and ubi_attach_mtd will
    return 1 instead of 0.
   =20
    In this case, the ubiattach command will detach the device and fail wit=
h
    an error message.
   =20
    Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>


--=20
Best Regards,
Artem Bityutskiy

--=-vWYVGwKydio/CzTK1cqi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQO0BZAAoJECmIfjd9wqK0mMgQALp1BTItbZZxc06HPqcY3QCL
jQLldXkJ1jVeain/BrRZnfrS7O9q1/NT93EdGM0n6ayy3xluE0gwGNcBjfIrzHad
oT+tsFP62aWR8V7pShXIJAOhLiClWgvChTaYnEsiuAY2zKMHx9c9BHFuuObqWIQB
JkQyO8JqPkVdKtYRRGr83fSH4JhIlNr9pb00n0u9kyBA47NtjhqQGW/Sa9uZn1TN
jnT9+kDzoG7+ST+sYmZxLTVOc6veMrssXkN5BJRaNjscHhAeX0AFl6waGY6vzPPM
OPYEXALvcrAfcfQ2HS0tpEFHsYddLc8f2wLYG9wWzSUIB5F5Mun58XoYucky5zIv
1whpEQCXFSXpSVA9v/QcsZMjpy8HPyKzkmveuW2gZPoIqbgw9UzgMn7O+dY07ywn
e96Z8bzKFRUagrakXUvXjKnPFwMzkyRrq0UQzQaMd6p4vdEOxDwcFa5LOy44dQoB
xks8uJmgiDelIgfnNXcFIrjZH0PHKFWGRbO3kOQQ1SPHLHPDUstdO06OAG4gj3fv
dtRakkPtKMHAu6qRRFa7TfC64uRmFmNRTeUPPns4b4gJFMf5i5u1el39yI8xR0sJ
uQuNNJWk8dww7x3pTghrSKnmt+dJf4boPIsNSFacYsjOcz0PCfT/OFYdLhd6E6hd
wvPu6bLOAUtt+uxniK7w
=jzfY
-----END PGP SIGNATURE-----

--=-vWYVGwKydio/CzTK1cqi--
