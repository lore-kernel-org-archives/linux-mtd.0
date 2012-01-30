Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RrpcK-0001xc-2w
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 11:41:49 +0000
Date: Mon, 30 Jan 2012 12:41:31 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd/gpmi : add BBT support
Message-ID: <20120130114131.GC15596@pengutronix.de>
References: <1327898174-13656-1-git-send-email-b32955@freescale.com>
 <20120130094610.GA15596@pengutronix.de>
 <4F2671C3.6000809@freescale.com>
 <20120130104428.GB15596@pengutronix.de>
 <4F267F21.1030204@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline
In-Reply-To: <4F267F21.1030204@freescale.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, artem.bityutskiy@intel.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

CCing Marek, he can say more about the U-Boot side probably...

> > Bootloaders may also need to write to NAND. So, they need to share the
> Do you mean the uboot may write something to the NAND?
> Could you show me some more detail cases?

U-Boot has NAND support in mainline, for barebox it is work-in-progress.
Both can and do write to NAND (kernel, rootfs), because both have
established procedures to do so (and maybe don't want to rely on
third-party tools like kobs-ng).

> > share the same information then. To be on the safe side regardings
> The kobs-ng which burns the bootloader to the NAND will also burn the
> whole BBT
> to the NAND too.

Did it always do that? Or is a newer version needed?

> But if the bootloader can make some block bad, the BBT information
> becomes different.
> Does the bootloader have the feature to make some block bad?

Sure. If you are able to write NAND, you should be able to mark blocks
bad, too :)

Thanks,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk8mgesACgkQD27XaX1/VRugaACeNhsDlvB4XhlcB9AjO+so5UCM
T/8An1/GOgVoCysb0Tc6pacqN2V5v1zo
=v+dF
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
