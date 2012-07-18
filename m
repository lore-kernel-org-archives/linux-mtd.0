Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrShV-0005KG-Bb
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 11:45:54 +0000
Received: by lbbgg6 with SMTP id gg6so2078429lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 04:45:51 -0700 (PDT)
Message-ID: <1342611620.7530.18.camel@brekeke>
Subject: Re: [PATCH 2/5] ubi: Limit amount of reserved eraseblocks for bad
 PEB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 18 Jul 2012 14:40:20 +0300
In-Reply-To: <1341389164-24409-3-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-3-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Ef4bKrX3RLb+LvNvgDBK"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Ef4bKrX3RLb+LvNvgDBK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-04 at 11:06 +0300, Shmulik Ladkani wrote:
> The existing mechanism of reserving PEBs for bad PEB handling has two
> flaws:
> - It is calculated as a percentage of good PEBs instead of total PEBs.
> - There's no limit on the amount of PEBs UBI reserves for future bad
>   eraseblock handling.

OK, I've modified this patch a lot, did not test, and sent what I have
in the beb branch to you - please, take a look.

--=20
Best Regards,
Artem Bityutskiy

--=-Ef4bKrX3RLb+LvNvgDBK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBqCkAAoJECmIfjd9wqK01JMQAL4PchrlyOyNvCjPCSQuSLbf
6dr2XpFQ97yqdhmGlIkddOonYs7fvva17saJIvCh/ihkYaS/y7L29JODXTWikELr
Uv2nxKe2mLWWzcsj1MD+WHUkfn0MJ7qzoJOwES2Nrr4HtNWwp3gxClHiSB8g8PbY
Q9mRjBudQzNTCo+M6K+OhI09U8UoyNJKhRZjw7zIU8HUyOqWqzEL/E2Vz+17ufgj
2nZXsATMid5F4B27pOye9U8hnA5iYDMzOVtutIG3lT8FRchfngcCiNGQBogK6PiX
1HRKDLluLKOh7nvGakvGK+UQrteY2s+6eIo/tvJZUZpyDWRS3M7PefRjdibUHIKQ
qNa+O5u87Yn1Z5roKYaDoj+h8wWfYRRr0lfLbxB6lZCeJ4aM0lGrd8t1WleiV8TS
AU9X7OALEZK1UmSkWqTLYiEC7ooopBXSJD69JVup5R9tKx+c7HbgzbChaKeDacXR
m6IrEOBpCcY3k4k4D8EC5u2eRCbOzMHyGHfsu5s+Hcc9F8uh7TiOMXEWm2oZ7ubc
nPtep+rUCjPoNMqIm/1byvApiIHI4a+Z2b25x2BTh/6bZVLro3ISqoeX2DR2YPcn
BQCQX/r3kOkoKs0ETudMwUwnGImQEE7l4CzNC6JsFzvSLlihEx82QCx2spZ9Jk7X
G4CoFeUTWEMKSl+wN17t
=Gxsj
-----END PGP SIGNATURE-----

--=-Ef4bKrX3RLb+LvNvgDBK--
