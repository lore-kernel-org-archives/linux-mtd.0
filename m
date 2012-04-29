Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOWIt-0006R5-Vz
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 15:44:52 +0000
Received: by lagy4 with SMTP id y4so1724253lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 08:44:49 -0700 (PDT)
Message-ID: <1335714286.1942.14.camel@koala>
Subject: Re: [PATCH] [JFFS2] load_xattr_datum need to return a positive
 number in case of unrecoverable error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Sun, 29 Apr 2012 18:44:46 +0300
In-Reply-To: <4F99B9A0.10605@tribudubois.net>
References: <1334177689-19732-1-git-send-email-jcd@tribudubois.net>
 <1335100568.28267.12.camel@brekeke> <4F944165.4010400@tribudubois.net>
 <1335362381.5114.17.camel@koala> <4F99B9A0.10605@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-OMXTTeJ4hs6QnlObqwL8"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OMXTTeJ4hs6QnlObqwL8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-04-26 at 23:09 +0200, Jean-Christophe DUBOIS wrote:
> Is this convincing enough?

Sure, thanks.

> You might think that the attibute corruption I am showing here is very=
=20
> artificial but I can assure you that it does happen in the wild when you=
=20
> get a power cut on your equipment while the GC was moving an attribute=
=20
> node for example.

This issue is for sure worth fixing. Just make sure xattr corruption is
handled the same way as data node corruption is handled. I do not
remember a lot of details anymore, but I wrote you the main idea in the
previous e-mail.

--=20
Best Regards,
Artem Bityutskiy

--=-OMXTTeJ4hs6QnlObqwL8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPnWHuAAoJECmIfjd9wqK0w8gQANCeM2l23CIiVFJTT2pI4ANh
nnfIuHiYo3c6wGtLE+vtBQ5dDYAFRtQyIHDHKfw90Be6rpMhTGjDmxnoAQo8P9IE
uo28ikWD9iB2WwysCDuOzThex9I7l4lRlSR6rwoqnz5olq7YrGzhcvtNz6nXElvA
TcppU9WjmP91A8kUtw4whA4cSV3RzeDZ+WYHXvFhpKc/hoFoF9qYmcT5EYr6QTGN
CdGS/IBKtIt//YsR1QYzFCxIw1+Nxcy0clf/iY3mnsj4y0Jz6ZmwhOwVDBW2Cs9Z
sXsZHSkQEK1Jwu9lVRSZIIp0er75+kRf0upQunSAbbygPkrp6Zu6vJAzXUjfVeY+
iVfKwWug3PYwd2QxKgKfnwooV8N/EGRpQz1oDxu5OWYtOo1IJIbLOWhjMt1aH7dt
jMYK1ohYYRKwPrlWv/csUFpBdQ1MCtDdLTv/l7x6R8avgBBEvlJMfWvcOi/iokKd
mhmOoAzK6586H8WSYJj68Hv+CDlW6OYd//2vOgfz3cNCiKCAAUnyzp7+/S8E8l21
0bn5aVxTNZOGa4XoIaVizd1s6E2acT645rLz8tJa7v03Tr6HzsI9DU09v/jOZW1K
bmWSZP6lDMtWx0j5RAKI6baKSWrB/EGUi7qplrVtWeN1R98CeZessm6YiHFGYa7k
TO8COG+rVKVtYDlykHS3
=YH2n
-----END PGP SIGNATURE-----

--=-OMXTTeJ4hs6QnlObqwL8--
