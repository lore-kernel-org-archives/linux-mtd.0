Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6y3i-0001h4-Pr
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:16:55 +0000
Message-ID: <1346307696.2848.524.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: missing comment in nand.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Thu, 30 Aug 2012 09:21:36 +0300
In-Reply-To: <1346137063-20903-1-git-send-email-blogic@openwrt.org>
References: <1346137063-20903-1-git-send-email-blogic@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mTbSWylb9ypzada5bECf"
Mime-Version: 1.0
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mTbSWylb9ypzada5bECf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-28 at 08:57 +0200, John Crispin wrote:
> Robert reported the following error when generating kernel doc.
> > Warning(/home/rpjday/k/git//include/linux/mtd/nand.h:659): No  descript=
ion found for parameter 'read_byte'
>=20
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: Robert P. J. Day <rpjday@crashcourse.ca>

Already have a fix for this in my l2-mtd.git tree:

commit 94476fdcef8902ad168b8618c3055e181a4740f6
Author: Randy Dunlap <rdunlap@xenotime.net>
Date:   Sat Aug 18 17:41:35 2012 -0700

    mtd: fix kernel-doc warning in include/linux/mtd/nand.h
   =20
    Fix kernel-doc warning in <linux/mtd/nand.h>:
   =20
    Warning(include/linux/mtd/nand.h:659): No description found for paramet=
er 'read_byte'
   =20
    Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
    Acked-by: Brian Norris <computersforpeace@gmail.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy

--=-mTbSWylb9ypzada5bECf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPwZwAAoJECmIfjd9wqK0I40P/01AGiw3llMnlUs2KyU/lQEL
MNF+pvGbwhOZn7EhhzvVwNX2tBYyFbwsNSEQP7ONYdOXxsAFqJLYDOZlhbPk/t20
4MfI9gZamsDUeUdHaXbV+hz1Hiq8NbphpT0hjaW+pXMQh63J+nVFz2a9VuIrY4UW
chJ6NkDea4WGLdBpl/63OrL3r3YODdUKrdof4K2qPyPK00olBl2czZi1J1ReVubA
zmZAocRtL27OsJWCijhEeXihZlwrxlsl3hD1oxVf9ynsOdfw5blcNoDiomiV156F
F1P9psMQjdDvvtzUE2BcvRfhS7vnALNp1CTWC32yaadDtOst/6ufT4phj3ZwK6Eq
KVaQWIx6H5RFVDN67mp/zoIlFCAqsHX19LLHkLifV4BBevs9Kj6X1Gcw6VY0/Tor
XmsEMdvqFIbA122nDfGAmxcGm4i/Kiev7djv64cuhU47Jt/vDq1Xbx1upxVOYqRx
lhx+ZKYsxhObvboq83J+yopQRJpNihyz7w2OR7VgFR1X/grbkz7xr/WlTCT5W1ru
feguev/jc2N/lUmdP7YxzSOn6Ldli6Lgf+jHfEVXT3u0cKeG0EnOUUS5aAOgiRaY
5UAitRtGh9mXDqel4EW9eBhlso3plgZziPoEtQGtUVhTFkrgAJnbRlGLxMBAvJ6/
jQYb0DE0BZw03vvCV4Jn
=YQ3e
-----END PGP SIGNATURE-----

--=-mTbSWylb9ypzada5bECf--
