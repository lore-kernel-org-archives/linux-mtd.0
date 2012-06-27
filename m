Message-ID: <1340800392.1799.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7] MTD: LPC32xx SLC NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Wed, 27 Jun 2012 15:33:12 +0300
In-Reply-To: <4FEAF90B.5030809@antcom.de>
References: <1339064536-20553-1-git-send-email-stigge@antcom.de>
 <1340794007.29342.50.camel@sauron.fi.intel.com>
 <4FEAF90B.5030809@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-oqvf5mSleOX1IBuVKUVG"
Mime-Version: 1.0
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux@arm.linux.org.uk,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-oqvf5mSleOX1IBuVKUVG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 14:14 +0200, Roland Stigge wrote:
> Thanks for the note! I'm sending an incremental patch. There was
> actually only one place in the two functions that could fail (return
> code of lpc32xx_xfer()).

Could you please check the MCL patch as well and re-send it against the
l2 tree?

I've squashed your change into the driver and pushed out, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-oqvf5mSleOX1IBuVKUVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6v2IAAoJECmIfjd9wqK0n70QAL5Sls7HIG0WTZbOpXb+tB6N
zUgy+7ysX+ey/dvYFgXdjkcvEm7q5hlmnHF3QySwQFLgzqGwwTmWGebmxbWtXMhG
wQz7U8f2FUSA85Q8x3/Qk7Oa3E+11UARCb94zzcoWnTira+rWpEKx1Iiw+V5wQcx
OXxH1JX3GHOW5jyZlzWbchrdbm3BTUsZb0M1xBnRfKTb7T3INxNGHliCFOSvo7Ea
MvKynEDoKj3X3vQdHbKXpj6s3tSHSME5/lNN+sC7VXU9xboQ5WG7tNHFrsUdcULH
3b5fXB+SZ1Ew6GSb354qt1x/DL+bbjKpRwBqKBY5LwYCeye6ihk8ffIu+sq8sh/g
fqTKtqkBuGxK8dWIFYTMkwXqS7FxJsxCk7ZnKU9efsg3RMdmTZgU7tnGW9zjNpf8
YPeHkeJNiA0EeDYvh2rilkLIeJNfGpyl8wOCC1VOP6T5ViB0/Sqv7L1/KgF27RL8
RHF7Z6b4XnKmxaJ9iBFgRos59h8bVQ9167mRFIf5N4AuQkdzRxzyUjwumgqwJgHt
ufdWIcolSkLi93u2LBS51J1igc89HwxcJBo7+hxvcN3VfACASzE+SvGBBUPgk1C2
IQMo+COkmmxLyVfk15I1xLYhl+KjalTgqx54+zErXw/jYmr6TFLCiPiWG731F0aL
YVkspinXRSbPUcDn4ZLt
=v4bj
-----END PGP SIGNATURE-----

--=-oqvf5mSleOX1IBuVKUVG--
