Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfTbi-0004le-4G
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 09:46:06 +0000
Received: by iadk27 with SMTP id k27so22267460iad.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 01:46:05 -0800 (PST)
Message-ID: <1324979273.1165.69.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 03/28] mtd: introduce mtd_erase interface
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 27 Dec 2011 11:47:53 +0200
In-Reply-To: <1324978636.1165.66.camel@sauron.fi.intel.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
 <1324663880-22477-4-git-send-email-dedekind1@gmail.com>
 <CAMjpGUeh+V0Oe8RgDjKM+WyukWJcRn4X0kh3=CPVohGAycb+qA@mail.gmail.com>
 <1324978636.1165.66.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UT3n9Ehw0/yisH7/1M3f"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UT3n9Ehw0/yisH7/1M3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-27 at 11:37 +0200, Artem Bityutskiy wrote:
> On Tue, 2011-12-27 at 04:22 -0500, Mike Frysinger wrote:
> > On Fri, Dec 23, 2011 at 13:10, Artem Bityutskiy wrote:
> > >  static inline struct mtd_info *dev_to_mtd(struct device *dev)
> > >  {
> > >        return dev ? dev_get_drvdata(dev) : NULL;
> >=20
> > on an unrelated note, this NULL check is unnecessary.  the core func
> > already takes care of checking the pointer.
>=20
> Sure, I can cook a separate patch for this, thanks!

Which will probably kill entire 'dev_to_mtd()', but not for
this merge window.

--=20
Best Regards,
Artem Bityutskiy

--=-UT3n9Ehw0/yisH7/1M3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO+ZRJAAoJECmIfjd9wqK0XNMQALR0zDz+KOOMeWt9qcQ6Hf8y
Kf6Yrg4Ji11AXcZ8uBoMCAXSQOxNhUWmQAs8cJwDxgqrXLSf1XDDJVmc4mE+hhyO
kUZok/FHUChsad2VrVJ7um6F0zgcsfRbwW5PolzaChburRXTldEnVVE7rpCGOvxH
cPTQbkglEfL2ucreZxM0lthAqW3Tzvm++u2FmP4ZlucbJxbLkTdYofuS/KHZCqwZ
fOku43AoFzSA6m3An6VglGqCcbXxYfkBSOvwJfFZlHmJLrTl3XD231MQ2bLYKOB9
IYDQKXmVfrNWXvzEgDCGd+gKl43NNl41DfBQ/xNqNzYcUkdiMMM5CUbXEEouZlPk
4ckkS+f+oU1NskEvj/Q6B9NTwAmu77XSoVDiiDgGijCDXgUinx77qe4YLmEvkUG3
j02cjv9BmINyYRv/VKpCqHWOabtVgoGOcK2ITg3FsfgKZIpFT31nDeArXx4Ps43v
DMkin5Ff338xO4YvIqQLLVJy7cuDmQNHA3w8o3TRA7da87Up8LXfhxwuBv51NupN
b8TZHK/fx52l/tXnd5CxruJBSX8Q+nQ7kNjKEUV1Ye8VNcmhDCR1jglh0cYoebkM
EX0XGCBr5whXW/VIqQeFXUJy92lATFvZk55XYKJxz+jjAakjP39TtCuwIQLTFB/B
g3HIR55lG63VgEJcaxnv
=j+qS
-----END PGP SIGNATURE-----

--=-UT3n9Ehw0/yisH7/1M3f--
