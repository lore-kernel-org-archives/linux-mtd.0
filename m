Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjqS9-000429-Jr
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 11:30:35 +0000
Message-ID: <1340796875.29342.60.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/2] UBI(FS): fixing IS_ENABLED() usage + backport trees
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 27 Jun 2012 14:34:35 +0300
In-Reply-To: <1340062283-11421-1-git-send-email-computersforpeace@gmail.com>
References: <1340062283-11421-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6BBtH9ITlPG0mvlAHSbb"
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


--=-6BBtH9ITlPG0mvlAHSbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 16:31 -0700, Brian Norris wrote:
> Hi Artem,
>=20
> It looks like your ubifs-v3.3.git tree does not compile successfully. I
> think there are two issues:
>=20
>  1) IS_ENABLED() should be used with the CONFIG_ prefix. i.e.,
>  IS_ENABLED(CONFIG_DEBUG_FS) instead of IS_ENABLED(DEBUG_FS)

Thanks, I've pushed this to linux-ubifs.git. I'll let is sit there for
few days and get exposed to linux-next and then send a pull request to
Linus.

>=20
>  2) IS_ENABLED() has changed some between v3.3 and when this commit was
>  originally integrated in mainline, so it masks a compile error in the
>  mainline version

Not sure what you mean. It was introduced in 3.1
(2a11c8ea20bf850b3a2c60db8c2e7497d28aba99), so I have to back-port it
older ubifs backport trees.

> This patch series addresses issue 1. I suggest that this be backported to
> the appropriate UBIFS tree to solve some build failures. But I think issu=
e
> 2 may still be a problem, so perhaps the mainline IS_ENABLED() fix should
> be backported as well?

I guess you are talking about commit
69349c2dc01c489eccaa4c472542c08e370c6d7e ? I'll port it too, thanks.

> BTW, there may be more than one backport tree that fails; I just tested
> v3.3.

I'll check.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-6BBtH9ITlPG0mvlAHSbb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6u/MAAoJECmIfjd9wqK0bD8QAIDZc1dZ5FHzpfDhjnLxwCbf
NIZ/6G7ON0wCniwlwGcu5krZwKs1T1u8DX/NAejGa47xIwBqaP7i7Jl/8mras9au
qW2WYrU8cHHOOktiWiwT320+Gg58F7If9Xq2mwUbwpItX9l1jeNv9zqI2sRCvdpb
0Y2fHACM/DyM7sp+UeCyygE3qhB8OgwZASm53XO3cHgXNqnXUwoZDifOhUpBoXCe
D5VWnx6KQO1vDLj3bhbymAjxH9RX2IanEL83jJ+VnCNGEasfqML9scBHNdeEc8kG
Gnms0KtIu/loLQVRS3WRgNTK0xTQ99Q4oBGPIBRucdgbPb7JxeyEoiltriplNg0R
3Tpp+2QLBNvVII6/+/GtJPWy5HP5DLcu7sRgLUE1X/j7oZRTFMIsTZvkPAaPoNA5
1KotFUaGbW6DWxYs0QgQ8I5UG/brjVBixWdSzOkjal/uanE0+DQW0x5R4iA0qm52
2+B5513VEetP+MC7WmRxQ5SLWhuZFL6LP42bJFXqIug10HQLlIwEUpmxiJDPv58V
k/w+X6U5VGQBA4IT5qVaAJb96O3r9dzuyRok1GdZFN1Db4dBySeHHoXc8VIn3s7A
diD3YHoJx90/090K2enAG9YrqI6H/ZeGiMrvSmiIEZwtn+qlVLQT4dzbYT0eKLfy
jwaYxUPtfT1hQkTfbWkD
=erbn
-----END PGP SIGNATURE-----

--=-6BBtH9ITlPG0mvlAHSbb--
