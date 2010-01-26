Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NZkLb-0003ec-8k
	for linux-mtd@lists.infradead.org; Tue, 26 Jan 2010 12:16:43 +0000
Date: Tue, 26 Jan 2010 13:16:21 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 0/11] Update support for MPC512x
Message-ID: <20100126121621.GA4431@pengutronix.de>
References: <1263932653-3634-1-git-send-email-agust@denx.de>
	<20100120112232.GD5041@pengutronix.de>
	<20100126090633.74257b1a@wker>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <20100126090633.74257b1a@wker>
Cc: John Rigby <jcrigby@gmail.com>, rtc-linux@googlegroups.com, dzu@denx.de,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	linux-i2c@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> No, I don't have a git tree for this now, sorry.

No problem, I set one up at:

	git://git.pengutronix.de/git/wsa/linux-2.6.git

It is based on 2.6.33-rc5 and contains the newest patches for FEC and I2C. =
(I
will pick up the patches as they show up on the lists, so this tree will be
rebased!)

This tree includes all MPC5121-patches and the two USB-patches from Anton. I
haven't actually tested them yet, but they all applied cleanly, at least.
Testing will come soon...

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkte3RUACgkQD27XaX1/VRueqACgzELpbWZLj3PaSUx0F9SZp7FX
PbQAnjyi1ZRptgosw9GUBZlgJzczKcNh
=/8WQ
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
