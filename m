Content-Type: multipart/mixed; boundary="===============1496034800=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : fix compiler warning
Date: Wed, 29 Feb 2012 07:58:20 +0000
Message-ID: <1330502452.3545.81.camel@sauron.fi.intel.com>
References: <1329189724-26100-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1329189724-26100-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "w.sang@pengutronix.de" <w.sang@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============1496034800==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-KmRm/8vYLaFjTf/Xn3kM"

--=-KmRm/8vYLaFjTf/Xn3kM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-02-14 at 11:22 +0800, Huang Shijie wrote:
> The gpmi driver selects the MTD_CMDLINE_PARTS directly.
> But we should not select a visible symbol.
>=20
> Just remove the select.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-KmRm/8vYLaFjTf/Xn3kM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPTds0AAoJECmIfjd9wqK0LwUP/R1/p82+xii1wA0xaYtuhBy5
LUbHTz28rjcpye1W3RnCXcYDgET3Vi98cBHAISR6nXC3kzkxuo5zK+HouFdXcDOU
OrYeA/yVLu1OMhfZBLQfbtsw/KwjgdaW2b93y4i4GXa+AfffIgU3/92S246llE8W
v0nmFjVxHfgIsjwVbNF7BF4FN54EbszaT9qwxmZWnFrDdkoriQ8vUtvb///dJhqI
eq/XHCxgRuWB17ax7dqHgg0FdA0EYzAX9VvkoSOGSpsjXzONArWfZztAwtegtMYf
s9nWHrYwP3VYXCGbot93ME35ZZSexGjBxmxB/tBKwO1bIPgaRA1C+yhiOT9ZZfz1
ksHWJJuCJYoKegeXDyejsD9dcfilSubhq8u8/WoPcx3rag7NMgPJAl6XyqNwEiYp
oZplVcVUx6oeLLVHBGCGNyurZFjMXwpy2rOMA7ZRQvxHA82TrnvRORGhW0vmbG1r
dtsRHJbMCEXZUE70hupwtXIth1KzP/LqF0mVXFKvYKxDl3xhfGdDiWttDjQp+dJl
GFldw2zFHvOFd31tQzkzrNNsYSqDScgiackM5UP6OgcVk3f0Fj/9uuh2i1+06veS
LkjDYiIma97dxLKEwRTeBS9dAdW6ohGEwQaJ9pKFisDhNky49fm847ubPzV9ZqQF
QVC8TTMX4lxIJ8nFdrYQ
=2pmT
-----END PGP SIGNATURE-----

--=-KmRm/8vYLaFjTf/Xn3kM--

--===============1496034800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============1496034800==--
