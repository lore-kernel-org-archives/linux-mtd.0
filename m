Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190dow-0001gI-Lq
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:42:12 +0100
Received: from ash.lnxi.com ([207.88.130.242])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 1908mr-0008FY-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 00:33:57 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Jones <david@embeddedminds.com>
In-Reply-To: <3E88BC6F.6080109@embeddedminds.com>
References: <3E88BC6F.6080109@embeddedminds.com>
Message-Id: <1049153625.25992.20.camel@tubarao>
Mime-Version: 1.0
Date: 31 Mar 2003 16:33:45 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-/sItM2EwHEBHOQu4Tq8n"
cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel hangs when trying to probe AM29LV160DB flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/sItM2EwHEBHOQu4Tq8n
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

You don't mention which kernel + patches you are using.  Lately I have
"fixed" some device probing which is in the CVS tree - although I don't
think this is related to the problem you are seeing.

On Mon, 2003-03-31 at 15:08, David Jones wrote:
> Hi,
>    I am trying to get an AM29LV160DB flash device to work with the MTD=20
> drivers under uClinux.  The device is connected in a 16-bit bus
> fashion to a Motorola MC68VZ328.
>=20
> The AM29LV160DB is supported by mtd/chips/jedec_probe.c
>=20
> In my map file I have:
> mymtd =3D do_map_probe("jedec_probe", &em1vz328_map);
>=20
> The do_map_probe function calls get_mtd_chip_driver in mtd/mtd/chipreg.c
> and that is where things seem to hang.  The get_mtd_chip_driver function
> never returns and hangs the kernel.
>=20
> Here is a snippet of the boot messages:
> ---------------------------------------------------------
> .
> .
> EMDG em1-vz328 mapping:size 200000 at 2000000
> EMDG: MTD Debug: Calling the do_map_probe function...
> EMDG: MTD Debug: Calling get_mtd_chip_driver function...
>=20
> ---------------------------------------------------------
>=20
> I looked through the archives and I noticed someone else had a similar
> problem with this flash device under uClinux, but I could not find what
> the solution was.
>=20
> If anyone has any ideas I would be grateful.
>=20
> Thanks,
> David
>=20
>=20
> Kernel config:
> #
> # Memory Technology Devices (MTD)
> #
> CONFIG_MTD=3Dy
> CONFIG_MTD_DEBUG=3Dy
> CONFIG_MTD_DEBUG_VERBOSE=3D3
> CONFIG_MTD_PARTITIONS=3Dy
> # CONFIG_MTD_CONCAT is not set
> # CONFIG_MTD_REDBOOT_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
>=20
> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_CHAR=3Dy
> # CONFIG_MTD_BLOCK is not set
> CONFIG_MTD_BLOCK_RO=3Dy
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
>=20
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> CONFIG_MTD_CFI_NOSWAP=3Dy
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_GEOMETRY=3Dy
> # CONFIG_MTD_CFI_B1 is not set
> CONFIG_MTD_CFI_B2=3Dy
> # CONFIG_MTD_CFI_B4 is not set
> CONFIG_MTD_CFI_I1=3Dy
> # CONFIG_MTD_CFI_I2 is not set
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_INTELEXT is not set
> # CONFIG_MTD_CFI_AMDSTD is not set
> CONFIG_MTD_RAM=3Dy
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_ABSENT is not set
> # CONFIG_MTD_OBSOLETE_CHIPS is not set
--=20
Thayne Harbaugh
Linux Networx

--=-/sItM2EwHEBHOQu4Tq8n
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+iNBZfsBPTKE6HMkRAg/BAJ9PuYwFAaDhGx4qLOIZH7GSyp5XrwCfZXXf
BMKuHWF+qNGI8jroKzBGGiw=
=M1p0
-----END PGP SIGNATURE-----

--=-/sItM2EwHEBHOQu4Tq8n--
