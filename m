Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOmHE-0007tS-0v
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 09:20:28 +0000
Message-ID: <1350552046.5769.302.camel@sauron.fi.intel.com>
Subject: Re: [RESEND PATCH 0/9] mtd_tests cleanup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Date: Thu, 18 Oct 2012 12:20:46 +0300
In-Reply-To: <5075B105.4080701@gmail.com>
References: <5075B105.4080701@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-asqFNlXQDt85tSaQlErb"
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-asqFNlXQDt85tSaQlErb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-10 at 23:01 +0530, Vikram Narayanan wrote:
> This patch series removes the usage of PRINT_PREF and printk's and
> replaces it with pr_{info,err,crit} whichever is applicable.
>=20
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>

Pushed the series to l2-mtd.git, thanks!

You can send the erase helper patch as well. I think you can put this
helper to mtdcore.c. And I think UBI and JFFS2 and may be mtdswap and
other drivers may reuse it - you can take a look.

--=20
Best Regards,
Artem Bityutskiy

--=-asqFNlXQDt85tSaQlErb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQf8nuAAoJECmIfjd9wqK0AW8QAK69+r7htjjfpsNZew956HYG
vQLYCMhmhJ4YTjOgAF4g454r+gYRnNTS/1GJtI+/wC8vrf7o7Jx7/cTBqob0OQuW
gOMJbLU/NNu775NZw4KFJz9cnwtkqinJxHTt4gWZ9fgmTBZEgqTneUPCnIPHGzK4
th/2F1zkyDQpw1cLSHlq0tMOGaJrG2F1QRRZo3LJLaYN5Le5PJBMKpk3KDYER0gd
uJECeZ16n8uinMXrnUIBbbfN68cxgayc9v7pNLWYnQcjK4OVbbHDe9eFR8dnOQM8
++O6xlrjfX6uOI7y/yH0UDx/2m1gqVsyggxK7l7MA3fHBHIFNGenPiKDqV3Ox7CB
uHN2kI6Q55EyO7Rx43N8JWSpmmOlLzGNt70mw4+iJu0mhEAGgYhkZC1UbkBG+9xV
Jzgn13ejtsplmLQDNV5xl2LzrChBFNodeHAZh/xNl24APcfy+lUL5JqFFJ326YfG
+BhMGao6/Dc5y/3diNzV3Rc8K5RDxMtE/nx0QYRtZJn/cuq2zuw/FfdG+zurAzYv
BRHtFLJWG0o91LRKeljtNPz1FYiehUtgU8r23TLPjzK7vFNPswS+7ExW6TQnOiHK
8BGo9/c6Y/OsCMd5WhnT+u+fvLBRsG7+2RHjkmgyrH2cM6AyCSU4f0zC/sYaA3W0
zB46nw+WxK1ndvQlMW6X
=h7ke
-----END PGP SIGNATURE-----

--=-asqFNlXQDt85tSaQlErb--
