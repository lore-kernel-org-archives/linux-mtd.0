Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLxrB-0001Nt-86
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 14:33:41 +0000
Received: by lbol5 with SMTP id l5so3629835lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 07:33:39 -0700 (PDT)
Message-ID: <1335105064.28267.18.camel@brekeke>
Subject: Re: UBIFS mount failure upon power off
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mark <xiaoming1981.zhang@gmail.com>
Date: Sun, 22 Apr 2012 17:31:04 +0300
In-Reply-To: <1335104592.28267.13.camel@brekeke>
References: <4F85764C.7070408@gmail.com> <1335100532.28267.9.camel@brekeke>
 <4F940D08.3080101@gmail.com> <1335104592.28267.13.camel@brekeke>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VmeyFRfQyRSh1qUi8G9U"
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


--=-VmeyFRfQyRSh1qUi8G9U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-22 at 17:23 +0300, Artem Bityutskiy wrote:
> > 3. I fixed this problem, in most situations the ubifs can recover=20
> > successfully,
> >     but I still get this error (though difficult to reproduce):
> >=20
> >         UBI error: ubi_io_read: error -77 while reading 126976 bytes=
=20
> > from PEB 2:4096, read 126976 bytes
> >         UBIFS error (pid 481): insert_node: duplicate sqnum in replay
> >         mount: mounting ubi13_0 on /usr/local/hmt/appdata failed:=20
> > Invalid argument
> >=20
> >     What could be the reason?
>=20
> Difficult to say, enable UBI debugging - it will print more information
> (not all the debugging messages, just debugging).
>=20

It is particularly interesting where in UBI code this is hit - do you
have stack trace? I thought all UBI code handles -EBADMSG.

--=20
Best Regards,
Artem Bityutskiy

--=-VmeyFRfQyRSh1qUi8G9U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlBYoAAoJECmIfjd9wqK0PhQQAK8x3k0yjyghmbbZreWT+AXD
fOGAFoBhPpn7jlGy55ohM6GSkTrmgh4mPWxaMIsnH87QSDmcgN7lXiZCrVZmvSju
8+M5YO89NgkAWpV2jcEzAw0DZnneJP44rbGL1eaGqVgh2w9wirXHhFLiZaf1La0W
MNoBZv7UrjcrRcMBjyc6PU85TjsTgPrYNPl9y933W2zU2U9/jlUzR0N1fJhSUb18
Atj1vm4qWpTphSxy3vrpwm81clTn8SQ51/fjzqdIcyMfVExj3ArTs/XxVxdNF2Cs
3+Oc+1PHX6vplSaGdxSTJGR/emJxXJrgEqSieSXbB0jT33KNFT/qm/Cc5pJs0mM0
5jWTYhNNXw0KJkUln3L1t6gL/w/117lnsrKak4DoCthlWg9zlJy/iR1DqP3sv092
p9NKOcgJWEHGs0exsYCTTVvWg8CJ6Cgiyd9THxTjLrvQFBk2RxOhKWjEJgsE0+mq
t6KqRgLJNMXPbqKuT6M5h7yC4tLqgmG6sr0euxrE/xjitPk8ydvNmCw8dsutKbHs
qh82fV59MPgnoLExy0mUUpWbY8QmFCSSerqBq0GRcCLd/1V85LMmOpt9GyYPGzYY
x2Vz+LMYV3SLpQOPp4rcpPorE7UnR7U5jD/HbiGOXDUsVCWS2S2B1elwrMTyydVk
61XbLpFgTd5fL70SbIl6
=Uu0c
-----END PGP SIGNATURE-----

--=-VmeyFRfQyRSh1qUi8G9U--
