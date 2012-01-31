Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsAmd-0001Ot-MP
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 10:17:53 +0000
Date: Tue, 31 Jan 2012 11:17:34 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Barry Song <Barry.Song@csr.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and
 mapping helper
Message-ID: <20120131101734.GE2471@pengutronix.de>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline
In-Reply-To: <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org,
 workgroup.linux@csr.com, Erik Gilling <konkers@google.com>,
 Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Atsushi Nemoto <anemo@mba.ocn.ne.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 06:00:00PM +0800, Barry Song wrote:
> From: Barry Song <Baohua.Song@csr.com>
>=20
> this patch helps to move the common pattern from
>=20
> "
> res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> if (!res) {
> 	ret =3D -ENODEV;
> 	goto err;
> }

You don't need to do the error checking for 'res'. You can simply do

res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
base =3D devm_request_and_ioremap(&dev->dev, res);

devm_request_and_ioremap() will check res. Given that, I don't think
we can save a lot with another wrapper.

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8nv74ACgkQD27XaX1/VRuQggCdHAespvwk6e/7522qKFDAMN7W
udkAn13V9tMmxDyZ1ldeBIG0U8eQ3Igk
=akgm
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
