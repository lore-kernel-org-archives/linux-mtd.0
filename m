Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rnnq0-0001xF-1Y
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2012 08:59:16 +0000
Date: Thu, 19 Jan 2012 09:58:56 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 01/10] MXS-DMA : move the mxs-dma.h to a more common place
Message-ID: <20120119085856.GA2630@pengutronix.de>
References: <1326953767-24155-1-git-send-email-b32955@freescale.com>
 <1326953767-24155-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <1326953767-24155-2-git-send-email-b32955@freescale.com>
Cc: alsa-devel@alsa-project.org, artem.bityutskiy@intel.com,
 vinod.koul@intel.com, b29396@freescale.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 shawn.guo@linaro.org, shijie8@gmail.com, linux-arm-kernel@lists.infradead.org,
 LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2012 at 02:15:58PM +0800, Huang Shijie wrote:
> Move the header to a more common place.
> The DMA engine is not only used in mx23/mx28, but also used
> in mx50/mx6q.
> It will also be used in the future chips.
>=20
> Rename it to mxs-dma.h
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  arch/arm/mach-mxs/include/mach/dma.h |   28 ----------------------------
>  include/linux/mxs-dma.h              |   28 ++++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+), 28 deletions(-)
>  delete mode 100644 arch/arm/mach-mxs/include/mach/dma.h
>  create mode 100644 include/linux/mxs-dma.h

Please use -M with git format-patch, so we can better see that it is a
pure rename.

I'd also suggest to squash patches up to 05/10 into this one,
(collecting all the proper acks from maintainers) since the changes are
trivial and it will reduce dependencies and temporary build-failures.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8X21AACgkQD27XaX1/VRsIbACgnuVCSNKUZmE6HcC0XqTK/eyL
wJYAn0szFKcf/BehDhzQimc88/A28S5+
=xo8Y
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
