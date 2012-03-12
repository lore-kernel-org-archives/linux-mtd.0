Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S702b-0002hi-SA
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2012 07:51:38 +0000
Date: Mon, 12 Mar 2012 08:51:07 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : fix the wrong DMA command.
Message-ID: <20120312075107.GB3928@pengutronix.de>
References: <1331518938-24047-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <1331518938-24047-1-git-send-email-b32955@freescale.com>
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 12, 2012 at 10:22:18AM +0800, Huang Shijie wrote:
> The last DMA command of ECC read page is used to disable the BCH module.
> But the original code missed to set the pio[2] which is used to set the
> GPMI_HW_GPMI_ECCCTRL register. fix it now.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Thanks! What does happen because of this bug? Additional checksum errors? I
haven't seen many on MX28 IIRC, so I wonder.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9dqusACgkQD27XaX1/VRtAjwCgjRfc600KcvEGonIcAmrU319M
yi8An0qaLAPUQ8jqFXPz4cnBM0ZSmJ5s
=RfSN
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
