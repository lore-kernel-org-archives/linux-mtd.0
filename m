Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P76e5-0002JU-R2
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 13:17:59 +0000
Date: Sat, 16 Oct 2010 15:17:52 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: yidong zhang <zhangyd6@gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
Message-ID: <20101016131752.GA2676@pengutronix.de>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Guillaume LECERF <glecerf@gmail.com>,
	taliaferro62@gmail.com, David.Woodhouse@intel.com,
	yegorslists@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2010 at 08:25:44PM +0800, yidong zhang wrote:
> Hi
>   Thanks for your reply. In the cfi_nopri_fixup_table, i added the
> below code as you did.
> { CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B

OK, please just use C-style comments (I just sent another patch
converting the others). Also, would be nice if you could check the
datasheet for other IDs mentioned there and add them, too.

> And the flash can get detected. But i still have one confusion.
> According to the  data sheets Table 6, in the 6th bus write cycle.
> 39VF6401B uses 0x50 and 39VF6401 uses 0x30. If 39VF6401B uses 0x30 in

Ouch! Is this true for the other 39VF*-non-B and B-versions, too?

Adding Guillaume to CC...

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAky5pgAACgkQD27XaX1/VRuEjQCeNCz+zi5WcYZkPqs2e5qPHn2C
4dYAn20dlxN5m+SdRDqtaspFiEFR0KAY
=q/e2
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
