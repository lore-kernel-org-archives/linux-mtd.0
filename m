Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19c3RM-0004T0-Nq
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 14:32:28 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Dmytro Bablinyuk <dmytro.bablinyuk@tait.co.nz>
In-Reply-To: <3F120F4A.7080507@tait.co.nz>
References: <3F120F4A.7080507@tait.co.nz>
Message-Id: <1058189517.1251.8664.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 14 Jul 2003 07:31:57 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-UpMVng+x5SZys/TCatep"
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem with finding flash device AM29F040B
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UpMVng+x5SZys/TCatep
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2003-07-13 at 20:02, Dmytro Bablinyuk wrote:
> I have a MPC866ADS out of the box board and I got linux running from=20
> ramdisk.
> But I could not get flash (AM29F040B) working with 2.4.21 kernel.
> I tried to specify phys map but I still have:

I haven't ever used phys map - it may work.  You may need to probe the
chip before it can be used by phys map.

>=20
> physmap flash device: 200000 at 2800000
> CFI: Found no Physically mapped flash device at location zero
> kmod: failed to exec /sbin/modprobe -s -k jedec_probe, errno =3D 2
> kmod: failed to exec /sbin/modprobe -s -k map_rom, errno =3D 2

Aren't these obvious errors WRT the config options you list below?

> Could somebody please give me a clue about this.
> Thank you in advance for any help.
>=20
> Some details of my kernel config:
>=20
> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_START=3D2800000
> CONFIG_MTD_PHYSMAP_LEN=3D200000
> CONFIG_MTD_PHYSMAP_BUSWIDTH=3D2
> # CONFIG_MTD_TQM8XXL is not set
> # CONFIG_MTD_RPXLITE is not set
> # CONFIG_MTD_MBX860 is not set
> # CONFIG_MTD_DBOX2 is not set
> # CONFIG_MTD_CFI_FLAGADM is not set
> # CONFIG_MTD_REDWOOD is not set
> # CONFIG_MTD_PCI is not set
> # CONFIG_MTD_PCMCIA is not set
>=20
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> # CONFIG_MTD_JEDECPROBE is not set

I suggest turning this on.

> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> # CONFIG_MTD_CFI_INTELEXT is not set
> # CONFIG_MTD_CFI_AMDSTD is not set
> # CONFIG_MTD_CFI_STAA is not set
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_ABSENT is not set
> CONFIG_MTD_OBSOLETE_CHIPS=3Dy
> CONFIG_MTD_AMDSTD=3Dy
>=20
> #
> # Memory Technology Devices (MTD)
> #
> CONFIG_MTD=3Dy
> # CONFIG_MTD_DEBUG is not set

CONFIG_MTD_DEBUG is also helpful - turni it on and set
CONFIG_MTD_DEBUG_VERBOSE to 3.  The kernel output might be useful to
figure out where things are failing (this can be turned off once
everything is working).

> CONFIG_MTD_PARTITIONS=3Dy
> # CONFIG_MTD_CONCAT is not set
> # CONFIG_MTD_REDBOOT_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_CHAR=3Dy
> CONFIG_MTD_BLOCK=3Dy
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set

--=20
Thayne Harbaugh
Linux Networx

--=-UpMVng+x5SZys/TCatep
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/ErDMfsBPTKE6HMkRAhKSAJ9hTN2fCiEZBEBXpaAztAS0VtVERwCeOgLU
ZG3SFBEGP3NlCAM+sOwV7ag=
=Aj1v
-----END PGP SIGNATURE-----

--=-UpMVng+x5SZys/TCatep--
