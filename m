Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rsrn1-0000Ns-Ba
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 08:13:08 +0000
Content-Type: multipart/mixed; boundary="===============1832522818=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: nand: write BBM to OOB even with
 flash-based BBT
Date: Thu, 2 Feb 2012 08:12:04 +0000
Message-ID: <1328170449.28171.119.camel@sauron.fi.intel.com>
References: <1327120684-7066-1-git-send-email-computersforpeace@gmail.com>
 <1327120684-7066-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1327120684-7066-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Cc: Angus CLARK <angus.clark@st.com>, Dan Carpenter <error27@gmail.com>,
 Barry Song <21cnbao@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, "Hunter,
 Adrian" <adrian.hunter@intel.com>, Gabor Juhos <juhosg@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 "Woodhouse, David" <david.woodhouse@intel.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Kulikov Vasiliy <segooon@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, Andres Salomon <dilinger@queued.net>,
 Axel Lin <axel.lin@gmail.com>, Anatolij Gustschin <agust@denx.de>,
 Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>,
 Lei Wen <leiwen@marvell.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Florian Fainelli <florian@openwrt.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Peter Wippich <pewi@gw-instruments.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Wolfram Sang <w.sang@pengutronix.de>, "Dong,
 Chuanxiao" <chuanxiao.dong@intel.com>, Joe Perches <joe@perches.com>,
 Guillaume LECERF <glecerf@gmail.com>,
 Roman Tereshonkov <roman.tereshonkov@nokia.com>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============1832522818==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-rI9s0XHiHXf+g7tY6Uvp"

--=-rI9s0XHiHXf+g7tY6Uvp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-20 at 20:38 -0800, Brian Norris wrote:
> Currently, the flash-based BBT implementation writes bad block data only
> to its flash-based table and not to the OOB marker area. Then, as new bad
> blocks are marked over time, the OOB markers become out of date and the
> flash-based table becomes the only source of current bad block
> information.

I think the comment could be corrected: OOB markers become incomplete,
not out-of-date?


>   * This is the default implementation, which can be overridden by a hard=
ware
> - * specific driver.
> + * specific driver. We try operations in the following order, according =
to our
> + * bbt_options (NAND_BBT_NO_OOB_BBM and NAND_BBT_USE_FLASH):
> + *  (1) erase the affected block, to allow OOB marker to be written clea=
nly
> + *  (2) update in-memory BBT
> + *  (3) write bad block marker to OOB area of affected block
> + *  (4) update flash-based BBT
> + * Note that we retain the first error encountered in (3) or (4), finish=
 the
> + * procedures, and dump the error in the end.
>  */
>  static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
>  {
>  	struct nand_chip *chip =3D mtd->priv;
>  	uint8_t buf[2] =3D { 0, 0 };
> -	int block, ret, i =3D 0;
> +	int block, res, ret =3D 0, i =3D 0;
> +	int write_oob =3D !(chip->bbt_options & NAND_BBT_NO_OOB_BBM);
> =20
> -	if (!(chip->bbt_options & NAND_BBT_USE_FLASH)) {
> +	BUG_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
> +			!(chip->bbt_options & NAND_BBT_USE_FLASH));

If get the chip options wrong then this will be noticed only in the
field when a block gets bad? Probably we better put all the validation
of chip options to the NAND scan function so that incorrect combinations
are noticed immediately. Probably with a comment why.

Otherwise looks OK and I guess we could merge it.

--=20
Best Regards,
Artem Bityutskiy

--=-rI9s0XHiHXf+g7tY6Uvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPKkXRAAoJECmIfjd9wqK0xKkQAKShHFcAPzubTHznEOVbQ4MW
+Ru3tb/DLB2xA661qzeZEac+AssSjID/SyeBn2kCegsDKU/PVssaqWWlAi2e7q2v
4qiOp+QJCHPXFX/bO/4WDcYL5yBKKg0er3mxoEYnjW7vyExlKxAq0zHu4s/xQDWw
CDqOpWhEJy1c8wq7watD6SdRkOaJqUTXHzHtCZbufZtTNbteYKHAqIJlQWKipCD2
0eRrDgTH1fgEzoe1jNqyGfzzJvmlV5/syvSLkOJsoFWcSB6f3e9x9Fd96K+7gRCN
7ODUgHtex7YjHPmgHT5yHiman55365eVQWyAqcXketbL5IEIym644SEHMFF/0ld8
oPrtH5YjdLIUVwNdJk8ikvnRSpG8rjael0iCAitBqzHruFugpvNQcfK5kXSUcgM9
Afm23rpgt7LGVaz09xVvBs1CzaDaegaybBdNlt50Lx4H51gkZpxqSDKzW8Kt32as
2yYEsCp+6QS3HAYQjUL3P/f90s5HP/WdiPPkcxlK2rjmjQ9u7AdjbSQF6dmc2o1D
0YkKYvvz5tcfrXMS7fY7uD+d14EoQFz1kC5oW0YZnDmNd1ckuKqKDjkl9N2KWdgW
ZxZlp3Ca/qSFDEwgZIrABnmbJCb6nDduXxfdihUe8O6b/ebjm9k5+lGdbGSLgdA3
H9aQL/xpDpwqehtyqpa5
=Ne+1
-----END PGP SIGNATURE-----

--=-rI9s0XHiHXf+g7tY6Uvp--

--===============1832522818==
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

--===============1832522818==--
