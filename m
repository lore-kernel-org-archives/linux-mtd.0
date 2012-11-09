Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWqDj-0005ZJ-H0
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 15:10:13 +0000
Message-ID: <1352473841.1814.35.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpmi: remove unneccessary header
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Fri, 09 Nov 2012 17:10:41 +0200
In-Reply-To: <508B4586.4090600@freescale.com>
References: <1350147809-19616-1-git-send-email-shijie8@gmail.com>
 <1351258892.1823.20.camel@sauron.fi.intel.com>
 <508B4586.4090600@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WYpBHUCrzl7YdTg67Y8r"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WYpBHUCrzl7YdTg67Y8r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-10-27 at 10:23 +0800, Huang Shijie wrote:
> =E4=BA=8E 2012=E5=B9=B410=E6=9C=8826=E6=97=A5 21:41, Artem Bityutskiy =E5=
=86=99=E9=81=93:=20
> > On Sat, 2012-10-13 at 13:03 -0400, Huang Shijie wrote:
> > > The whole gpmi-nand driver has turned to pure devicetree supported.
> > > So the linux/mtd/gpmi-nand.h is not neccessary now. Just remove it,
> > > and move some macros to the gpmi-nand driver itself.
> > >=20
> > > Signed-off-by: Huang Shijie <shijie8@gmail.com>
> > I cannot compile-test it because the MXS configuration file I always
> I tested this patch in mxs and mx6q with the linux-next-20121026.
> I do not meet such compiler errors.
>=20
> I think the l2-mtd tree is lack of some patches in other people's
> tree.
> In the current l2-mtd tree, even i DISABLE the gpmi driver, the kernel
> still
> meets the compiler errors.

It is based on v3.7-rc4. Once the patches you refer are in Linus's tree,
let me know. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-WYpBHUCrzl7YdTg67Y8r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQnRzxAAoJECmIfjd9wqK0Bm0P/RbBnqyO69W/ZXKXxyyCuwLM
fw/HiNUXM3QrgE2SYaZ0IBoXKbkdZ0ZtJl5r6ZRVKRfHA/NSQgmXEIcMdbTz0Zbq
+YjPjQ4bw4bRb/pdGcd0EcELvxA+/xgbvt3bjTWYbHknDlPQchcpaY8GCIhtDT0o
hvyMuuekERZi9f/fCkEZeQ/iHdr7SXfQnOe8R6+CZUSWvPBJz+Gf1T6HJkijKQeR
Yiufix/hpaMwaxEgxhLgTpDmg31FzlB29S6QQ2FbCtDYkSDpEj2ZARdaMGMh98v4
b0gxhKb+fIiuvYqBmSMnJij1nXdmQqtesq/AyFdF79P6cDvjxpzIUXG7TiuKNkFZ
Tz4V0IHbdj8RhM5D3N5wUkkb4yhoPJ8umJmIHCWnYGZ8tR/kHe0ZIdPRmb12RNs8
KexM6sVREe+okJawE4zqjfD5Qk/RlhJQ2RykZq14jUMSf7rYFpnXDsUu4psas4kY
+JoRX/cMMgnLl/FQihiVo/MJBvlSFkRPVroNmKnIIhoLijY/O5jISGJ6ve+YnNEC
hKKOlGpmkh7unuEZXjms6V6SXA1Z9hqayeo7wXg0nCbUtKtOEFIKoz08KM9AQUDz
GLZLlMTpI8ABnmR0jyBb3h1xFMPSVV2ds9QAYsV3sJPovlXK9LtxGQRYjUv3sm7S
p4hef9YHEexlmqZlOa26
=OJI7
-----END PGP SIGNATURE-----

--=-WYpBHUCrzl7YdTg67Y8r--
