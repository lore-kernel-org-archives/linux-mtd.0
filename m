Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O3dvK-00049u-Gy
	for linux-mtd@lists.infradead.org; Sun, 18 Apr 2010 23:29:12 +0000
Date: Mon, 19 Apr 2010 01:29:06 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
Message-ID: <20100418232906.GB16563@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133513.20107.72328.stgit@shiryu.yomgui.biz>
	<20100408091215.GD21805@pengutronix.de>
	<20100412022458.GB3274@pengutronix.de>
	<h2ub8e9195f1004160317y9018618ax2b2df9f3d7ee3f98@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <h2ub8e9195f1004160317y9018618ax2b2df9f3d7ee3f98@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guillaume,

> > Okay, my remark was rubbish, yet the comment in the source was a bit co=
nfusing,
> > too. It is correct, though maybe the term 'region' is a bit overloaded.=
 What
> > about replacing both comments with something a bit simpler like this:
> >
> > /*
> > =A0* These flashes report two seperate eraseblock regions based on the
> > =A0* sector_erase-size and block_erase-size, although they both operate=
 on the
> > =A0* same memory. This is not allowed according to CFI, so we just pick=
 the
> > =A0* sector_erase-size.
> > =A0*/
> >

Any opinion about this change?

> > This is according to the datasheets. You pick the block-data size here
> > (ususally using command 0x50). Why is that? I tried sector_size on a
> > SST39WF1601 and it works fine so far, testing with mtd_stresstest. (Sid=
enote: I
> > have to use JEDEC-probing though, as my flashes don't report 0x701 but =
0x002
> > (AMD standard) as their primary command set. But they still need their =
custom
> > unlock address :( )
>=20
> The 39VF3201 chip I use is on a brcm63xx board, running OpenWRT. It
> reports 2 erase regions (as indicated in the datasheet):
>=20
> Number of Erase Block Regions: 2
>   Erase Region #0: BlockSize 0x1000 bytes, 1024 blocks
>   Erase Region #1: BlockSize 0x10000 bytes, 64 blocks

Yes, same here.

> But the function parse_cfe_partitions() in
> drivers/mtd/maps/bcm963xx-flash.c [1] tries to read the partition
> table at $(master->erasesize) (cf. line 67).
> If I use the sector_erase-size, parse_cfe_partitions() tries to read
> at 0x1000, and fails because the partition table is actually at
> 0x10000 on my flash.

I see the problem, but think it should be fixed differently (in the driver?=
).
cfi_cmdset_0002.c uses CMD 0x30 for erasing (line 1604 in mtd/master). The =
SST
datasheet now tells that the chip then expects the sector address (table 6 =
or
figure 11). Given that I wonder if erasing truly works unless I missed
something (at least it fails with mtd_stresstest for me if I change my
jedec_probe to use 0x10000 instead of 0x1000).

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvLlcIACgkQD27XaX1/VRuy9wCgnwu9q9hG38rgsjDFPbH7//4S
QuYAn1p7qyP9ESlSIeG8gyiNtLzrhem+
=Qyam
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
