Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rh16H-0000LM-IS
 for linux-mtd@lists.infradead.org; Sat, 31 Dec 2011 15:44:03 +0000
Date: Sat, 31 Dec 2011 16:43:38 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2] MTD/GPMI bugfix : reset the BCH module when it is not
 MX23
Message-ID: <20111231154338.GA27544@pengutronix.de>
References: <1325233646-3343-1-git-send-email-b32955@freescale.com>
 <20111230143658.GA9141@pengutronix.de>
 <4EFE7236.10609@freescale.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <4EFE7236.10609@freescale.com>
Cc: baruch@tkos.co.il, koen.beel.barco@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Artem.Bityutskiy@intel.com, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 31, 2011 at 10:23:50AM +0800, Huang Shijie wrote:

> > On Fri, Dec 30, 2011 at 04:27:26PM +0800, Huang Shijie wrote:
> >> In MX28, if we do not reset the BCH module. The BCH module may
> >> becomes unstable when the board reboots for several thousands times.
> > Do you have more details when and why this happens? What happens on MX2=
3 then?
> In one customer's 3G router which uses the MX28:
> [0] NAND boot mode, mount the UBIFS in the NAND partition.
> [1] We used the gpmi_reset_block(r->bch_regs, true) to init the BCH modul=
e.
> [2] The board will automatically reboot again after it booted by NAND
> boot mode.
> [3] After reboot more then thousands times(cost nearly one day), the BCH
> mode became UNSTABLE,
> the data read out was not right, so the system could not mount the UBIFS.
>=20
> After we use gpmi_reset_block(r->bch_regs, false) to init the BCH
> module, the bug never happens.

Yes, I undestood that. I was curious _why_ this happens, for example, becau=
se
of a bug in the rom-code or such. This would then lead to the question if t=
his
can be fixed by some other means. Because currently it looks like this to m=
e:
If you would do the above scenario of booting 10000 times on a MX23, then B=
CH
could enter the same unstable state (can it?). Since we cannot reset BCH du=
e to
bug 2847, we have a serious problem, because NAND won't work until the next
power-cycle? I am curious if my assumptions are true and we have a serious
problem on the MX23.

> Yes, this is the bug 2847 from the mx23's errata.

OK, thanks.

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk7/LaoACgkQD27XaX1/VRv1EgCgifG2wvvE50DoUTofTmXaR4Lf
rCEAoMpbkFCzHYI6dnDuErjdpvvzh6dx
=qkru
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
