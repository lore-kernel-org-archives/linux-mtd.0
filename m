Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P73g8-0006vs-G7
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 10:07:53 +0000
Date: Sat, 16 Oct 2010 12:07:44 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: yidong zhang <zhangyd6@gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
Message-ID: <20101016100744.GA10815@pengutronix.de>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, taliaferro62@gmail.com,
	David.Woodhouse@intel.com, yegorslists@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 16, 2010 at 03:08:46PM +0800, yidong zhang wrote:
> hi
>=20
> >Just to apply the patch and see what happens. The most important part
> >of this patch is:
> >
> >Please refer to the data sheets Table 6:
> >39VF6401B data sheet http://www.sst.com/downloads/datasheet/S71288.pdf
> >39VF6401 data sheet http://www.sst.com/downloads/datasheet/S71223-03.pdf
> >
> >The difference in the 6th bus write cycle. 39VF6401B uses 0x50 and
> >39VF6401 uses 0x30.
> >
> >Without this even if the chip gets detected you cannot write to it.
> >
> >I haven't look at this since my try to submit this patch, so I don't
> >know how to fix the stuff for cfi_probe.
>=20
>  Recently, i use the 39VF6401B flash, and i apply your patch. The chip
> can be get detected. But when i erase one sector, it use 0x30 to erase
> one block. The size of a block is much bigger than a sector as we
> know.So i use the JEDEC probe to detect the flash. And i make the
> erase size to one block-erase size. And it works fine. So i think
> the  chip(39VF6401B)  should not be CFI compliant, maybe the  JEDEC
> mode is better.

Please have a look at cfi_cmdset_0002.c, especially the table
cfi_nopri_fixup_table. Without verifying the details, I assume you just hav=
e to
add the IDs there and then you can have CFI.

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAky5eXAACgkQD27XaX1/VRs0SwCfe5vFN1rR5mJ+c6agYoJPRYw2
OksAoJy1j0EZTRN0FYHyfWRONIbaOSZj
=Mipu
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
